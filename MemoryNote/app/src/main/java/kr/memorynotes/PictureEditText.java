package kr.memorynotes;
import android.content.*;import android.net.Uri;import android.os.Bundle;import android.view.inputmethod.*;import android.widget.EditText;import java.util.*;
/** Receive clipboard pictures and images committed by the keyboard. */
public class PictureEditText extends EditText {
 interface Receiver{void receive(List<Uri> uris,Runnable release);}
 Receiver receiver;
 public PictureEditText(Context c){super(c);}
 boolean image(Uri uri){if(uri==null||!"content".equals(uri.getScheme()))return false;try{String mime=getContext().getContentResolver().getType(uri);return mime!=null&&mime.startsWith("image/");}catch(Exception e){return false;}}
 boolean pastePicture(){ClipboardManager manager=(ClipboardManager)getContext().getSystemService(Context.CLIPBOARD_SERVICE);ClipData clip=manager.getPrimaryClip();if(clip==null||receiver==null)return false;ArrayList<Uri> images=new ArrayList<>();for(int i=0;i<clip.getItemCount();i++){Uri uri=clip.getItemAt(i).getUri();if(image(uri)||(uri!=null&&"content".equals(uri.getScheme())&&clip.getDescription().hasMimeType("image/*")))images.add(uri);}if(images.isEmpty())return false;receiver.receive(images,()->{});return true;}
 @Override public boolean onTextContextMenuItem(int id){if((id==android.R.id.paste||id==android.R.id.pasteAsPlainText)&&pastePicture())return true;return super.onTextContextMenuItem(id);}
 @Override public InputConnection onCreateInputConnection(EditorInfo info){InputConnection base=super.onCreateInputConnection(info);if(receiver!=null)info.contentMimeTypes=new String[]{"image/*"};if(base==null)return null;return new InputConnectionWrapper(base,false){@Override public boolean commitContent(InputContentInfo content,int flags,Bundle opts){if(content==null||receiver==null||!content.getDescription().hasMimeType("image/*"))return false;boolean grant=(flags&InputConnection.INPUT_CONTENT_GRANT_READ_URI_PERMISSION)!=0;try{if(grant)content.requestPermission();receiver.receive(Collections.singletonList(content.getContentUri()),()->{if(grant)content.releasePermission();});return true;}catch(Exception e){if(grant)try{content.releasePermission();}catch(Exception ignored){}return false;}}};}
}
