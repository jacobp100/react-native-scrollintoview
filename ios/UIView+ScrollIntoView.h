#import <UIKit/UIKit.h>


@interface UIView (ScrollIntoView)

+ (void)scrollIntoView:(UIView *)target
              insetTop:(CGFloat)top
             insetLeft:(CGFloat)left
           insetBottom:(CGFloat)bottom
            insetRight:(CGFloat)right
              animated:(BOOL)animated;

@end
