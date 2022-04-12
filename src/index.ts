import { findNodeHandle, NativeModules } from 'react-native';

// @ts-expect-error
const isTurboModuleEnabled = global.__turboModuleProxy != null;

type ViewRef = number;

type Rect = { x: number; y: number; width: number; height: number };

interface ScrollIntoViewFunction {
  (
    rect: Rect,
    options: {
      scrollview: ViewRef | ViewRef[];
      animated?: boolean;
    },
  ): void;
  (
    view: ViewRef,
    options?: {
      scrollview?: ViewRef | ViewRef[];
      animated?: boolean;
    },
  ): void;
}

type NodeHandle = number | null;

interface Module {
  scrollToView: (
    view: NodeHandle,
    scrollviews: NodeHandle[],
    animated: boolean,
  ) => void;
  scrollToRect: (
    rect: Rect,
    scrollviews: NodeHandle[],
    animated: boolean,
  ) => void;
}

const module: Module = isTurboModuleEnabled
  ? require('./NativeScrollIntoView').default
  : NativeModules.ScrollIntoView;

export const scrollIntoView: ScrollIntoViewFunction = (view, options = {}) => {
  const { animated = true } = options;

  const optionsScrollview = options.scrollview;
  const scrollviews = Array.isArray(optionsScrollview)
    ? optionsScrollview.map(findNodeHandle)
    : optionsScrollview != null
    ? [findNodeHandle(optionsScrollview)]
    : null;

  if (
    typeof view === 'object' &&
    'x' in view &&
    'y' in view &&
    'width' in view &&
    'height' in view
  ) {
    if (scrollviews == null) {
      console.warn(
        'When scrolling to a rect, you must provide a scrollview in `options`',
      );
      return;
    }
    module.scrollToRect(view, scrollviews, animated);
  } else {
    console.log({ view: findNodeHandle(view) });
    module.scrollToView(findNodeHandle(view), scrollviews!, animated);
  }
};
