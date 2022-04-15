#if RCT_NEW_ARCH_ENABLED
#import <React/RCTViewComponentView.h>

@interface ScrollIntoView : RCTViewComponentView

- (void)scrollIntoView:(BOOL)animated;

@end
#else
#import <React/RCTView.h>

@interface ScrollIntoView : RCTView

- (void)scrollIntoView:(BOOL)animated;

@end
#endif
