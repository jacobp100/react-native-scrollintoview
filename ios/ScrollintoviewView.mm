#ifdef RCT_NEW_ARCH_ENABLED
#import "ScrollintoviewView.h"

#import <react/renderer/components/RNScrollintoviewViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNScrollintoviewViewSpec/EventEmitters.h>
#import <react/renderer/components/RNScrollintoviewViewSpec/Props.h>
#import <react/renderer/components/RNScrollintoviewViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "UIView+ScrollIntoView.h"

using namespace facebook::react;

@interface ScrollintoviewView () <RCTScrollintoviewViewViewProtocol>

@end

@implementation ScrollintoviewView

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<ScrollintoviewViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const ScrollintoviewViewProps>();
    _props = defaultProps;
  }

  return self;
}

#pragma mark - Native Commands

- (void)handleCommand:(const NSString *)commandName
                 args:(const NSArray *)args
{
  RCTScrollintoviewViewHandleCommand(self, commandName, args);
}

- (void)scrollIntoView:(double)insetTop
             insetLeft:(double)insetLeft
           insetBottom:(double)insetBottom
            insetRight:(double)insetRight
              animated:(BOOL)animated
{
  [UIView scrollIntoView:self
                insetTop:insetTop
               insetLeft:insetLeft
             insetBottom:insetBottom
              insetRight:insetRight
                animated:animated];
}

Class<RCTComponentViewProtocol> ScrollintoviewViewCls(void)
{
  return ScrollintoviewView.class;
}

@end
#endif
