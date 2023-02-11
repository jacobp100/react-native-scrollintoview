package com.scrollintoview;

import android.view.View;

import androidx.annotation.Nullable;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ViewManagerDelegate;
import com.facebook.react.viewmanagers.ScrollintoviewViewManagerDelegate;
import com.facebook.react.viewmanagers.ScrollintoviewViewManagerInterface;

public abstract class ScrollintoviewViewManagerSpec<T extends View> extends SimpleViewManager<T> implements ScrollintoviewViewManagerInterface<T> {
  private final ViewManagerDelegate<T> mDelegate;

  public ScrollintoviewViewManagerSpec() {
    mDelegate = new ScrollintoviewViewManagerDelegate(this);
  }

  @Nullable
  @Override
  protected ViewManagerDelegate<T> getDelegate() {
    return mDelegate;
  }
}
