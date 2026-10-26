package kr.memorynotes;import android.widget.*;
public class ThicknessTest {public static void main(String[] args){for(boolean dark:new boolean[]{false,true}){
 MainActivity a=DetailTest.fixture(dark,true);LinearLayout toolbar=(LinearLayout)a.root.getChildAt(1);
 Button legacy=new Button(a);legacy.setContentDescription("펜 굵기와 추가 색상");toolbar.addView(legacy);Button more=new Button(a);more.setContentDescription("필기 추가 설정");toolbar.addView(more);
 InkPage ink=new InkPage();ink.a=a;ThicknessControl.attach(ink);if(legacy.getParent()!=null||more.getParent()!=null)throw new AssertionError("old buttons remain");
 SeekBar slider=(SeekBar)toolbar.findViewWithTag("ink:thickness");slider.setProgress(59);if(ink.thickness!=30)throw new AssertionError("slider not applied");DetailTest.find(toolbar,"−").performClick();if(ink.thickness!=29.5f)throw new AssertionError("minus");DetailTest.find(toolbar,"＋").performClick();if(ink.thickness!=30)throw new AssertionError("plus");
 int count=toolbar.getChildCount();ThicknessControl.attach(ink);if(toolbar.getChildCount()!=count)throw new AssertionError("duplicate toolbar");
 InkPage next=new InkPage();next.a=a;next.thickness=2.5f;a.root.removeView(toolbar);toolbar=new LinearLayout(a);a.root.addView(toolbar,1,new LinearLayout.LayoutParams(-1,-2));ThicknessControl.attach(next);if(next.thickness!=30)throw new AssertionError("width not restored across screens");
 }System.out.println("PASS: light/dark controls, remove legacy buttons, slider, minus/plus, no duplicates, restore width");}}
