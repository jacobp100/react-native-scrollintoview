# react-native-scrollintoview

Scolls a parent ScrollView to ensure the view is visible

## Installation

```sh
npm install react-native-scrollintoview
```

## Usage

```js
import ScrollIntoView from 'react-native-scrollintoview';

const Example = () => {
  const ref = useRef();

  const scrollIntoView = () => {
    ref.current.scrollIntoView({
      behavior: 'smooth', // set to auto to disable animation
      inset: {
        top: 20,
        right: 20,
        bottom: 20,
        left: 20,
      }, // Add a margin around view when scrolling
    });
  };

  return (
    <ScrollView>
      <ScrollIntoView ref={ref} />
    </ScrollView>
  );
};
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
