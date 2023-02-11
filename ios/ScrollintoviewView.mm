#ifdef RCT_NEW_ARCH_ENABLED
#import "ScrollintoviewView.h"

#import <react/renderer/components/RNScrollintoviewViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNScrollintoviewViewSpec/EventEmitters.h>
#import <react/renderer/components/RNScrollintoviewViewSpec/Props.h>
#import <react/renderer/components/RNScrollintoviewViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface ScrollintoviewView () <RCTScrollintoviewViewViewProtocol>

@end

@implementation ScrollintoviewView {
    UIView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<ScrollintoviewViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const ScrollintoviewViewProps>();
    _props = defaultProps;

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<ScrollintoviewViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<ScrollintoviewViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> ScrollintoviewViewCls(void)
{
    return ScrollintoviewView.class;
}

@end
#endif
