package com.scrollintoview;

import android.graphics.Color;

import androidx.annotation.Nullable;

import com.facebook.react.module.annotations.ReactModule;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

@ReactModule(name = ScrollintoviewViewManager.NAME)
public class ScrollintoviewViewManager extends ScrollintoviewViewManagerSpec<ScrollintoviewView> {

  public static final String NAME = "ScrollintoviewView";

  @Override
  public String getName() {
    return NAME;
  }

  @Override
  public ScrollintoviewView createViewInstance(ThemedReactContext context) {
    return new ScrollintoviewView(context);
  }

  @Override
  @ReactProp(name = "color")
  public void setColor(ScrollintoviewView view, @Nullable String color) {
    view.setBackgroundColor(Color.parseColor(color));
  }
}
