import React from 'react';
import type { ViewProps } from 'react-native';
import ScrollIntoViewNativeComponent, {
  Commands,
  // @ts-ignore
} from './ScrollIntoViewNativeComponent';

export interface Ref {
  scrollIntoView: (options?: { animated?: boolean }) => void;
}

export interface Props extends ViewProps {
  ref?: React.Ref<Ref>;
}

export default React.forwardRef((props, ref) => {
  const nativeComponent = React.useRef();
  React.useImperativeHandle(
    ref,
    (): Ref => ({
      scrollIntoView({ animated = true } = {}) {
        Commands.scrollIntoView(nativeComponent.current, animated);
      },
    }),
    [],
  );

  return <ScrollIntoViewNativeComponent ref={nativeComponent} {...props} />;
});
