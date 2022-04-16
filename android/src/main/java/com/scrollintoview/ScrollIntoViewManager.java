package com.scrollintoview;

import androidx.annotation.Nullable;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.uimanager.ViewGroupManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.bridge.ReactApplicationContext;

public class ScrollIntoViewManager extends ViewGroupManager<ScrollIntoView> {

  ReactApplicationContext mCallerContext;

  public ScrollIntoViewManager(ReactApplicationContext reactContext) {
    mCallerContext = reactContext;
  }

  @Override
  public String getName() {
    return "ScrollIntoView";
  }

  @Override
  public ScrollIntoView createViewInstance(ThemedReactContext context) {
    return new ScrollIntoView(context);
  }

  @Override
  public void receiveCommand(ScrollIntoView view, String commandId, @Nullable ReadableArray args) {
    if (commandId.equals("scrollIntoView")) {
      view.scrollIntoView(args.getBoolean(0));
    } else {
      super.receiveCommand(view, commandId, args);
    }
  }

}
