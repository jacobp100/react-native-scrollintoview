import type { Double } from 'react-native/Libraries/Types/CodegenTypes';
import codegenNativeComponent, {
  NativeComponentType,
} from 'react-native/Libraries/Utilities/codegenNativeComponent';
import codegenNativeCommands from 'react-native/Libraries/Utilities/codegenNativeCommands';
import type { ViewProps } from 'react-native';

export interface NativeProps extends ViewProps {}

type ComponentType = NativeComponentType<NativeProps>;

export interface NativeCommands {
  scrollIntoView: (
    viewRef: React.ElementRef<ComponentType>,
    insetTop: Double,
    insetLeft: Double,
    insetBottom: Double,
    insetRight: Double,
    animated: boolean
  ) => void;
}

export const Commands: NativeCommands = codegenNativeCommands<NativeCommands>({
  supportedCommands: ['scrollIntoView'],
});

export default codegenNativeComponent<NativeProps>('ScrollintoviewView');
