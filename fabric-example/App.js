import React from 'react';
import { View, Button, SafeAreaView, StyleSheet } from 'react-native';
import { scrollIntoView } from 'react-native-scrollintoview';

const ScrollIntoViewButton = (props) => {
  const ref = React.useRef();

  return (
    <View ref={ref}>
      <Button
        {...props}
        onPress={(e) => {
          scrollIntoView(ref.current);
          props.onPress?.(e);
        }}
      />
    </View>
  );
};

export default () => (
  <SafeAreaView style={styles.container}>
    {Array.from({ length: 100 }, (_, i) => (
      <ScrollIntoViewButton key={i} title="Scroll Into View" />
    ))}
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
