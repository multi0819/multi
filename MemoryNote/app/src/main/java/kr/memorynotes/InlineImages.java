package kr.memorynotes;
import android.graphics.*;import android.graphics.drawable.*;import android.text.*;import android.text.style.*;import android.widget.*;import android.util.LruCache;import org.json.*;import android.view.View;import android.text.method.LinkMovementMethod;import java.io.*;import java.util.regex.*;
final class InlineImages {
 static final LruCache<String,Bitmap> cache=new LruCache<String,Bitmap>(8*1024*1024){protected int sizeOf(String key,Bitmap value){return value.getByteCount();}};
 static Bitmap load(Ui u,String file){File f=new File(new File(u.a.getFilesDir(),"images"),file);String key=f.getAbsolutePath();Bitmap b=cache.get(key);if(b!=null)return b;BitmapFactory.Options o=new BitmapFactory.Options();o.inJustDecodeBounds=true;BitmapFactory.decodeFile(key,o);int sample=1;while(o.outWidth/sample>1024||o.outHeight/sample>1024)sample*=2;o.inSampleSize=sample;o.inJustDecodeBounds=false;b=BitmapFactory.decodeFile(key,o);if(b!=null)cache.put(key,b);return b;}
 static void apply(Ui u,TextView view,Spannable text,boolean masked){
  for(Picture span:text.getSpans(0,text.length(),Picture.class))text.removeSpan(span);
  for(OpenPicture span:text.getSpans(0,text.length(),OpenPicture.class))text.removeSpan(span);
  int available=view.getWidth()-view.getPaddingLeft()-view.getPaddingRight();if(available<=0)available=u.a.getResources().getDisplayMetrics().widthPixels-u.dp(100);available=Math.max(u.dp(80),available);
  Matcher m=InlineImageText.PATTERN.matcher(text);
  while(m.find()){
   JSONObject image=null;for(int i=0;i<u.pictures.length();i++){JSONObject im=u.pictures.optJSONObject(i);if(im!=null&&m.group(1).equals(im.optString("file"))){image=im;break;}}
   if(image==null){image=new JSONObject();try{image.put("file",m.group(1));image.put("masks",new JSONArray());}catch(JSONException ignored){}}
   final JSONObject selected=image;
   Bitmap b=load(u,m.group(1));if(b==null)continue;// Fit the content width consistently, including portrait pictures and saved notes.
   int w=available,h=Math.max(1,(int)Math.round((double)b.getHeight()*available/b.getWidth()));
   Drawable d=new MaskedPicture(b,image.optJSONArray("masks"),masked);d.setBounds(0,0,w,h);text.setSpan(new Picture(d),m.start(),m.end(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
   if(!(view instanceof EditText)&&u.a instanceof MainActivity){text.setSpan(new OpenPicture(()->ImageMaskView.dialog((MainActivity)u.a,selected,false,()->{},masked)),m.start(),m.end(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);view.setMovementMethod(LinkMovementMethod.getInstance());}
  }
 }
 static void bind(Ui u,TextView view,boolean masked){
  view.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->{if(r-l!=or-ol&&view.getText() instanceof Spannable){apply(u,view,(Spannable)view.getText(),masked);view.invalidate();}});
 }
 static class OpenPicture extends ClickableSpan {final Runnable action;OpenPicture(Runnable action){this.action=action;}public void onClick(View view){action.run();}public void updateDrawState(TextPaint p){p.setUnderlineText(false);}}
 static class MaskedPicture extends Drawable {
  final Bitmap bitmap;final JSONArray masks;final boolean hidden;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
  MaskedPicture(Bitmap bitmap,JSONArray masks,boolean hidden){this.bitmap=bitmap;this.masks=masks;this.hidden=hidden;}
  public void draw(Canvas canvas){Rect bounds=getBounds();canvas.drawBitmap(bitmap,null,bounds,paint);if(hidden&&masks!=null){paint.setColor(0xFF203B32);for(int i=0;i<masks.length();i++){JSONArray m=masks.optJSONArray(i);if(m==null)continue;canvas.drawRect(bounds.left+(float)m.optDouble(0)*bounds.width(),bounds.top+(float)m.optDouble(1)*bounds.height(),bounds.left+(float)m.optDouble(2)*bounds.width(),bounds.top+(float)m.optDouble(3)*bounds.height(),paint);}}}
  public void setAlpha(int value){paint.setAlpha(value);}public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
 }
 static class Picture extends ImageSpan {Picture(Drawable d){super(d,ALIGN_BOTTOM);}}
}
