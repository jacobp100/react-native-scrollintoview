import React from 'react';
import { Button, SafeAreaView, ScrollView, StyleSheet } from 'react-native';
import ScrollIntoView from 'react-native-scrollintoview';

const ScrollIntoViewButton = (props) => {
  const ref = React.useRef();

  return (
    <ScrollIntoView ref={ref} style={{ paddingVertical: 16, borderWidth: 1 }}>
      <Button
        {...props}
        onPress={(e) => {
          ref.current.scrollIntoView({ animated: true });
          props.onPress?.(e);
        }}
      />
    </ScrollIntoView>
  );
};

export default () => (
  <SafeAreaView style={styles.container}>
    <ScrollView>
      {Array.from({ length: 100 }, (_, i) => (
        <ScrollIntoViewButton key={i} title="Scroll Into View" />
      ))}
    </ScrollView>
  </SafeAreaView>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  contentContainer: {
    padding: 20,
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    marginTop: 10,
    marginBottom: 20,
  },
  messages: {
    fontSize: 14,
    fontWeight: '600',
    marginTop: 20,
    marginBottom: 3,
  },
  message: {
    fontSize: 11,
    fontVariant: ['tabular-nums'],
  },
});
