#import "ScrollIntoView.h"
#import <UIKit/UIKit.h>

#if RCT_NEW_ARCH_ENABLED
#include <stdlib.h>

#import <react/renderer/components/ScrollIntoView/ComponentDescriptors.h>
#import <react/renderer/components/ScrollIntoView/EventEmitters.h>
#import <react/renderer/components/ScrollIntoView/Props.h>
#import <react/renderer/components/ScrollIntoView/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface ScrollIntoView () <RCTScrollIntoViewViewProtocol>
@end
#endif

@implementation ScrollIntoView

#if RCT_NEW_ARCH_ENABLED
+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<ScrollIntoViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const ScrollIntoViewProps>();
    _props = defaultProps;
  }

  return self;
}
#endif

#pragma mark - Native Commands

#if RCT_NEW_ARCH_ENABLED
- (void)handleCommand:(const NSString *)commandName args:(const NSArray *)args
{
  RCTScrollIntoViewHandleCommand(self, commandName, args);
}
#endif

- (void)scrollIntoView:(BOOL)animated
{
  NSMutableArray<UIScrollView *> *scrollviews = [NSMutableArray new];
  UIView *current = self.superview;
  while (current != nil) {
    if ([current isKindOfClass:UIScrollView.class]) {
      [scrollviews addObject:(UIScrollView *)current];
    }
    current = current.superview;
  }

  for (UIScrollView *scrollview in scrollviews) {
    CGRect rect = [self convertRect:self.bounds toView:scrollview];
    [scrollview scrollRectToVisible:rect animated:animated];
  }
}

#if RCT_NEW_ARCH_ENABLED
Class<RCTComponentViewProtocol> ScrollIntoViewCls(void)
{
  return ScrollIntoView.class;
}
#endif

@end
