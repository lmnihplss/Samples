#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    self.selectedBackgroundView = [[UIView alloc]initWithFrame:self.bounds];
    self.selectedBackgroundView.backgroundColor = [UIColor redColor];
}

@end
