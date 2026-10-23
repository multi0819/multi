package kr.memorynotes;
import android.app.Activity;
import android.os.Build;
import android.graphics.drawable.ColorDrawable;
import android.view.*;
/** Apply app theme to window controls and hide only the bottom system navigation. */
public final class WindowChrome {
 static int legacyFlags(boolean dark){return View.SYSTEM_UI_FLAG_HIDE_NAVIGATION|View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY|(dark?0:View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR|View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);}
 static int appearance(boolean dark,int sdk){return (dark?0:24)|(sdk>=35?128|(dark?0:256):0);}
 public static void apply(MainActivity a){
  if(a.u==null)return;
  boolean dark=a.getPreferences(0).getBoolean("dark",false);
  Window w=a.getWindow();View decor=w.getDecorView();
  w.setBackgroundDrawable(new ColorDrawable(a.u.bg));
  decor.setSystemUiVisibility(legacyFlags(dark));
  if(Build.VERSION.SDK_INT>=29)w.setNavigationBarContrastEnforced(false);
  if(Build.VERSION.SDK_INT>=30){WindowInsetsController c=w.getInsetsController();if(c!=null){
   c.setSystemBarsAppearance(appearance(dark,Build.VERSION.SDK_INT),24|(Build.VERSION.SDK_INT>=35?384:0));
   c.setSystemBarsBehavior(WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
   c.hide(WindowInsets.Type.navigationBars());
  }}
 }
}
