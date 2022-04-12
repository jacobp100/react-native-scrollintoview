/**
 * @flow strict-local
 */

import type { TurboModule } from 'react-native/Libraries/TurboModule/RCTExport';
import * as TurboModuleRegistry from 'react-native/Libraries/TurboModule/TurboModuleRegistry';

export interface Spec extends TurboModule {
  scrolToView: (
    view: number,
    scrollviews?: Array<number>,
    animated: boolean,
  ) => void;
  scrolToRect: (
    view: { x: number, y: number, width: number, height: number },
    scrollviews: Array<number>,
    animated: boolean,
  ) => void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('ScrollIntoView');
