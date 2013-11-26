#import "MainViewController.h"
#import "CollectionItem.h"
#import "CollectionViewCell.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        int itemCapacity = 50;
        self.items = [[NSMutableArray alloc]initWithCapacity:itemCapacity];
        for (int i = 0; i < itemCapacity; i++) {
            CollectionItem *item = [[CollectionItem alloc]initWithId:i + 1 caption:[NSString stringWithFormat:@"CP %d", i + 1]];
            [self.items addObject:item];
        }
    }
    return self;
}

# pragma mark - ++++++ LifeCycle ++++++
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - ++++++ Delegate ++++++
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    CollectionItem *item = [self.items objectAtIndex:indexPath.row];
    cell.idLabel.text = [NSString stringWithFormat:@"%d", item.itemId];
    cell.capLabel.text = item.cap;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionItem *item = [self.items objectAtIndex:indexPath.row];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil
                                                       message:[NSString stringWithFormat:@"ID : %d\nCA : %@\nselected.", item.itemId, item.cap]
                                                      delegate:nil
                                             cancelButtonTitle:nil
                                             otherButtonTitles:@"OK", nil];
    [alertView show];
}

@end
