import { self } from 'react-native-scrollintoview';

self.onmessage = ({ data }) => {
  self.postMessage(`Message from worker: "${data}"!`);
};
