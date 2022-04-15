#import "ScrollIntoViewManager.h"
#import "ScrollIntoView.h"

@implementation ScrollIntoViewManager

- (UIView *)view
{
  return [ScrollIntoView new];
}

@end
