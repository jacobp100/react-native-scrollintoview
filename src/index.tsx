import React from 'react';
import { Animated } from 'react-native';
import ScrollIntoViewNativeComponent, {
  NativeProps,
  Commands,
} from './ScrollintoviewViewNativeComponent';

export type { NativeProps as Props } from './ScrollintoviewViewNativeComponent';

export type Insets = Readonly<{
  top?: number;
  right?: number;
  bottom?: number;
  left?: number;
}>;

export type ScrollIntoViewOptions = {
  behavior?: 'auto' | 'smooth';
  insets?: Insets;
};

export type Ref = {
  scrollIntoView: (options?: ScrollIntoViewOptions) => void;
};

const useNativeMethods = (ref: React.Ref<Ref | undefined>) => {
  const nativeComponent = React.useRef<any>();
  React.useImperativeHandle(
    ref,
    (): Ref => ({
      scrollIntoView({ behavior = 'smooth', insets = {} } = {}) {
        const { top = 0, left = 0, bottom = 0, right = 0 } = insets;
        const animated = behavior === 'smooth';
        Commands.scrollIntoView(
          nativeComponent.current,
          top,
          left,
          bottom,
          right,
          animated
        );
      },
    }),
    []
  );

  return nativeComponent;
};

export default React.forwardRef<Ref | undefined, NativeProps>((props, ref) => {
  const nativeComponent = useNativeMethods(ref);

  return <ScrollIntoViewNativeComponent ref={nativeComponent} {...props} />;
});

let AnimatedScrollIntoViewNativeComponent:
  | Animated.AnimatedComponent<typeof ScrollIntoViewNativeComponent>
  | undefined;

export const AnimatedComponent = React.forwardRef<
  Ref | undefined,
  Animated.AnimatedProps<NativeProps>
>((props, ref) => {
  const nativeComponent = useNativeMethods(ref);

  if (AnimatedScrollIntoViewNativeComponent == null) {
    AnimatedScrollIntoViewNativeComponent = Animated.createAnimatedComponent(
      ScrollIntoViewNativeComponent
    );
  }

  return (
    <AnimatedScrollIntoViewNativeComponent ref={nativeComponent} {...props} />
  );
});
