package com.scrollintoview;

import androidx.annotation.Nullable;
import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.HorizontalScrollView;
import android.widget.ScrollView;

public class ScrollIntoView extends ViewGroup {

  public ScrollIntoView(Context context) {
      super(context);
  }

  public ScrollIntoView(Context context, @Nullable AttributeSet attrs) {
      super(context, attrs);
  }

  public ScrollIntoView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
    super(context, attrs, defStyleAttr);
  }

  @Override
  protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
    // No-op since UIManagerModule handles actually laying out children.
  }

  void scrollIntoView(boolean animated) {
    ViewParent current = getParent();
    while (current != null) {
      if (current instanceof ScrollView) {
        Rect rect = new Rect();
        getDrawingRect(rect);
        scrollVertical((ScrollView)current, animated);
      } else if (current instanceof HorizontalScrollView) {
        Rect rect = new Rect();
        getDrawingRect(rect);
        scrollHorizontal((HorizontalScrollView)current, animated);
      }

      current = current.getParent();
    }
  }

  private void scrollVertical(ScrollView scrollview, boolean animated) {
    Rect rect = new Rect();
    getDrawingRect(rect);
    scrollview.offsetDescendantRectToMyCoords(this, rect);

    int scrollTop = scrollview.getScrollY();
    int scrollHeight =  scrollview.getHeight();
    int scrollY;
    if (rect.top < scrollTop) {
      scrollY = rect.top;
    } else if (rect.bottom > scrollTop + scrollHeight) {
      scrollY = rect.bottom - scrollHeight;
    } else {
      return;
    }

    if (animated) {
      scrollview.smoothScrollTo(0, scrollY);
    } else {
      scrollview.scrollTo(0, scrollY);
    }
  }

  private void scrollHorizontal(HorizontalScrollView scrollview, boolean animated) {
    Rect rect = new Rect();
    getDrawingRect(rect);
    scrollview.offsetDescendantRectToMyCoords(this, rect);

    int scrollLeft = scrollview.getScrollX();
    int scrollWidth = scrollview.getWidth();
    int scrollX;
    if (rect.left < scrollLeft) {
      scrollX = rect.left;
    } else if (rect.right > scrollLeft + scrollWidth) {
      scrollX = rect.right - scrollWidth;
    } else {
      return;
    }

    if (animated) {
      scrollview.smoothScrollTo(scrollX, 0);
    } else {
      scrollview.scrollTo(scrollX, 0);
    }
  }

}
