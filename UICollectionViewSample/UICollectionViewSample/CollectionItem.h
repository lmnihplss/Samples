#import <Foundation/Foundation.h>

@interface CollectionItem : NSObject
- (id)initWithId:(NSInteger)itemId caption:(NSString *)caption;

// アイテムの ID
@property (nonatomic) NSInteger itemId;
// キャプション
@property (strong, nonatomic)NSString *cap;

@end
