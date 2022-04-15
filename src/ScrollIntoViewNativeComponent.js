// @flow

import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import codegenNativeCommands from 'react-native/Libraries/Utilities/codegenNativeCommands';
import type { ViewProps } from 'react-native/Libraries/Components/View/ViewPropTypes';
import type { HostComponent } from 'react-native/Libraries/Renderer/shims/ReactNativeTypes';

type NativeProps = $ReadOnly<{|
  ...ViewProps,
|}>;

type ComponentType = HostComponent<NativeProps>;

interface NativeCommands {
  +scrollIntoView: (
    viewRef: React.ElementRef<ComponentType>,
    animated?: boolean,
  ) => void;
}

export const Commands: NativeCommands = codegenNativeCommands<NativeCommands>({
  supportedCommands: ['scrollIntoView'],
});

export default (codegenNativeComponent<NativeProps>(
  'ScrollIntoView',
): HostComponent<NativeProps>);
