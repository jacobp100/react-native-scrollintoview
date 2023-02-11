import * as React from 'react';
import {
  Button,
  ButtonProps,
  SafeAreaView,
  ScrollView,
  StyleSheet,
} from 'react-native';
import ScrollIntoView, { Ref } from 'react-native-scrollintoview';

const ScrollIntoViewButton = (props: ButtonProps) => {
  const ref = React.useRef<Ref>();

  const button = (
    <Button
      {...props}
      onPress={(e) => {
        ref.current?.scrollIntoView({
          behavior: 'smooth',
          insets: { top: 12, right: 12, bottom: 12, left: 12 },
        });
        props.onPress?.(e);
      }}
    />
  );

  return (
    <ScrollIntoView ref={ref} style={styles.buttonContainer}>
      {button}
      {button}
    </ScrollIntoView>
  );
};

export default function App() {
  return (
    <SafeAreaView style={styles.container}>
      <ScrollView contentContainerStyle={styles.contentContainer}>
        {Array.from({ length: 20 }, (_, i) => (
          <ScrollIntoViewButton key={i} title="Scroll Into View" />
        ))}
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  contentContainer: {
    padding: 12,
    gap: 12,
  },
  buttonContainer: {
    justifyContent: 'space-between',
    minHeight: 128,
    backgroundColor: '#eee',
    borderRadius: 12,
  },
});
