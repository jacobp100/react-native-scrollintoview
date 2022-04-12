#import "ScrollIntoView.h"

#include <stdlib.h>
#import <UIKit/UIKit.h>
#import <React/RCTUIManager.h>
#import <React/RCTScrollView.h>

#if RCT_NEW_ARCH_ENABLED
#import "NativeScrollIntoView.h"
#endif

@implementation ScrollIntoView

RCT_EXPORT_MODULE(ScrollIntoView);

@synthesize bridge = _bridge;

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

- (dispatch_queue_t)methodQueue {
  return _bridge.uiManager.methodQueue;
}

- (NSArray<UIScrollView *> *)parentScrollViewsOf:(UIView *)element
{
  NSMutableArray<UIScrollView *> *scrollviews = [NSMutableArray new];
  UIView *current = element.superview;
  while (current != nil) {
    if ([current isKindOfClass:UIScrollView.class]) {
      [scrollviews addObject:(UIScrollView *)current];
    }
    current = current.superview;
  }
  return scrollviews;
}

- (NSArray<UIScrollView *> *)scrollViews:(NSArray<NSNumber *> *)reactTags
                        fromViewRegistry:(NSDictionary<NSNumber *, UIView *> *)viewRegistry
{
  NSMutableArray<UIScrollView *> *scrollviews = [[NSMutableArray alloc]
                                                 initWithCapacity:reactTags.count];

  [(NSArray *)reactTags
   enumerateObjectsUsingBlock:^(NSNumber * reactTag, NSUInteger idx, BOOL * _Nonnull stop) {
    RCTScrollView *scrollview = (RCTScrollView *)viewRegistry[reactTag];

    if (![scrollview isKindOfClass:[RCTScrollView class]]) {
      RCTLogError(@"Invalid view returned from registry, expecting ScrollView, got: %@", scrollview);
    } else {
      [scrollviews addObject:scrollview.scrollView];
    }
  }];

  return scrollviews;
}

RCT_EXPORT_METHOD(scrollToView:(nonnull NSNumber *)reactTag
                  scrollviews:(NSArray *)scrollviewReactTags
                  animated:(BOOL)animated)
{
  [self.bridge.uiManager
   addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
    UIView *view = viewRegistry[reactTag];
    NSArray<UIScrollView *> *scrollviews = scrollviewReactTags != nil
      ? [self scrollViews:scrollviewReactTags fromViewRegistry:viewRegistry]
      : [self parentScrollViewsOf:view];
    [scrollviews
     enumerateObjectsUsingBlock:^(UIScrollView * _Nonnull scrollView, NSUInteger idx, BOOL * _Nonnull stop) {
      CGRect rect = [view convertRect:view.bounds toView:scrollView];
      [scrollView scrollRectToVisible:rect animated:animated];
    }];
  }];
}

RCT_EXPORT_METHOD(scrollToRect:(CGRect)rect
                  scrollviews:(NSArray *)scrollviewReactTags
                  animated:(BOOL)animated)
{
  [self.bridge.uiManager
   addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
    [[self scrollViews:scrollviewReactTags fromViewRegistry:viewRegistry]
     enumerateObjectsUsingBlock:^(UIScrollView * _Nonnull scrollView, NSUInteger idx, BOOL * _Nonnull stop) {
      [scrollView scrollRectToVisible:rect animated:animated];
    }];
  }];
}

#if RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeScrollIntoViewSpecJSI>(params);
}
#endif

@end
