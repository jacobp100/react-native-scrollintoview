#import "UIView+ScrollIntoView.h"

@implementation UIView (ScrollIntoView)

+ (void)scrollIntoView:(UIView *)target
              insetTop:(CGFloat)top
             insetLeft:(CGFloat)left
           insetBottom:(CGFloat)bottom
            insetRight:(CGFloat)right
              animated:(BOOL)animated
{
  UIEdgeInsets insets = UIEdgeInsetsMake(-top, -left, -bottom, -right);

  UIView *current = target.superview;
  while (current != nil) {
    if ([current isKindOfClass:UIScrollView.class]) {
      UIScrollView *scrollview = (UIScrollView *)current;
      CGRect rect = [target convertRect:target.bounds toView:scrollview];
      rect = UIEdgeInsetsInsetRect(rect, insets);
      [scrollview scrollRectToVisible:rect animated:animated];

      target = scrollview;
    }

    current = current.superview;
  }
}

@end
