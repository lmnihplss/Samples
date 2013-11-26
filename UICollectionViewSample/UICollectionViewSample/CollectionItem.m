#import "CollectionItem.h"

@implementation CollectionItem
- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithId:(NSInteger)itemId caption:(NSString *)caption {
    self = [super init];
    if (self) {
        self.itemId = itemId;
        self.cap = caption;
    }
    return self;
}

@end
