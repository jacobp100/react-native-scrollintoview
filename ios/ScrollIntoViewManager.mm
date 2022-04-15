#import "ScrollIntoViewManager.h"
#import "ScrollIntoView.h"

#if !RCT_NEW_ARCH_ENABLED
#import <React/RCTUIManager.h>
#import <React/RCTDefines.h>
#endif

@implementation ScrollIntoViewManager

RCT_EXPORT_MODULE(ScrollIntoView)

- (UIView *)view
{
  return [[ScrollIntoView alloc] init];
}

#if !RCT_NEW_ARCH_ENABLED
RCT_EXPORT_METHOD(scrollIntoView:(nonnull NSNumber *)reactTag
                  animated:(BOOL)animated)
{
  [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
    ScrollIntoView *view = (ScrollIntoView *)viewRegistry[reactTag];
    if (![view isKindOfClass:ScrollIntoView.class]) {
      RCTLogError(@"Invalid view returned from registry, expecting ScrollIntoView, got: %@", view);
    } else {
      [view scrollIntoView:animated];
    }
  }];
}
#endif

@end
