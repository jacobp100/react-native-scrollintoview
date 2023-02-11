#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import <React/RCTBridge.h>

#ifndef RCT_NEW_ARCH_ENABLED
#import <React/RCTView.h>
#import "UIView+ScrollIntoView.h"
#endif

@interface ScrollintoviewViewManager : RCTViewManager
@end

@implementation ScrollintoviewViewManager

RCT_EXPORT_MODULE(ScrollintoviewView)

#ifndef RCT_NEW_ARCH_ENABLED
- (UIView *)view
{
  return [[RCTView alloc] init];
}

RCT_EXPORT_METHOD(scrollIntoView:(nonnull NSNumber *)reactTag
                  insetTop:(CGFloat)insetTop
                  insetLeft:(CGFloat)insetLeft
                  insetBottom:(CGFloat)insetBottom
                  insetRight:(CGFloat)insetRight
                  animated:(BOOL)animated)
{
  [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
    UIView *view = viewRegistry[reactTag];
      [UIView scrollIntoView:view
                    insetTop:insetTop
                   insetLeft:insetLeft
                 insetBottom:insetBottom
                  insetRight:insetRight
                    animated:animated];
  }];
}
#endif

@end
