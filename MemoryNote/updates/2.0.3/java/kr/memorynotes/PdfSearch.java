package kr.memorynotes;
import android.app.*;import android.content.*;import android.graphics.RectF;import android.graphics.pdf.PdfRenderer;import android.os.ParcelFileDescriptor;import android.view.*;import android.widget.*;
import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;
/** Cancellable, page-at-a-time native PDF text search. No PDF upload or image OCR. */
public final class PdfSearch {
 final PdfStudy s;final ExecutorService worker=Executors.newSingleThreadExecutor();
 volatile int generation;boolean disposed,navigating;Future<?> task;LinearLayout panel;EditText input;TextView status;String query="",hitDoc="";int hitPage=-1,hitIndex;ArrayList<ArrayList<RectF>> hits=new ArrayList<ArrayList<RectF>>();
 PdfSearch(PdfStudy study){s=study;}
 static boolean supported(){try{PdfRenderer.Page.class.getMethod("searchText",String.class);return true;}catch(Exception e){return false;}}
 void show(){if(!supported()){s.message("문서 내 찾기는 Android 15 이상에서 사용할 수 있습니다.");return;}if(panel!=null&&panel.getParent()!=null){panel.setVisibility(View.VISIBLE);input.requestFocus();return;}
  panel=s.a.u.col();LinearLayout row=s.row();input=new EditText(s.a);input.setSingleLine(true);input.setTextColor(s.a.u.ink);input.setHintTextColor(s.a.u.muted);input.setText(query);input.setHint("PDF에서 찾을 단어");input.setTextSize(14*s.a.u.scale);input.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);row.addView(input,new LinearLayout.LayoutParams(0,-2,1));
  row.addView(s.button("찾기",2,new Runnable(){public void run(){find(1,true);}}));row.addView(s.button("이전",0,new Runnable(){public void run(){find(-1,false);}}));row.addView(s.button("다음",0,new Runnable(){public void run(){find(1,false);}}));row.addView(s.button("×",0,new Runnable(){public void run(){cancel();clearHits();panel.setVisibility(View.GONE);hideKeyboard();}}));panel.addView(row);
  status=s.a.u.text("단어 입력 후 찾기 · 스캔 이미지의 글자는 검색되지 않습니다.",11,s.a.u.muted);status.setPadding(s.a.u.dp(12),0,s.a.u.dp(8),s.a.u.dp(4));panel.addView(status);s.screen.addView(panel,Math.min(2,s.screen.getChildCount()));
  input.setOnEditorActionListener(new TextView.OnEditorActionListener(){public boolean onEditorAction(TextView v,int action,KeyEvent event){if(action==android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH){find(1,true);return true;}return false;}});input.requestFocus();
 }
 void hideKeyboard(){android.view.inputmethod.InputMethodManager im=(android.view.inputmethod.InputMethodManager)s.a.getSystemService(Context.INPUT_METHOD_SERVICE);if(im!=null&&input!=null)im.hideSoftInputFromWindow(input.getWindowToken(),0);}
 void cancel(){generation++;if(task!=null){task.cancel(true);task=null;}}
 void dispose(){cancel();disposed=true;worker.shutdownNow();}
 void detachPanel(){cancel();clearHits();panel=null;input=null;status=null;}
 void clearHits(){hitPage=-1;hits.clear();if(s.canvas!=null)s.canvas.setSearchHighlights(Collections.<RectF>emptyList(),null);}
 void navigation(){if(navigating)return;cancel();clearHits();if(status!=null)status.setText(query.isEmpty()?"단어를 입력해 주세요.":"‘"+query+"’ · 현재 페이지에서 다시 찾을 수 있습니다.");}
 void rendered(){if(hitPage!=s.page||!hitDoc.equals(s.doc.optString("id")))return;ArrayList<RectF> flat=new ArrayList<RectF>();for(ArrayList<RectF> h:hits)flat.addAll(h);RectF target=null;if(hitIndex>=0&&hitIndex<hits.size()&&!hits.get(hitIndex).isEmpty())target=hits.get(hitIndex).get(0);s.canvas.setSearchHighlights(flat,target);}
 boolean live(int token,String doc){return !disposed&&generation==token&&s.screen==s.a.root&&s.doc!=null&&doc.equals(s.doc.optString("id"));}
 void find(final int direction,boolean restart){if(disposed||s.loading||s.a.busy)return;final String wanted=input.getText().toString().trim();if(wanted.isEmpty()){input.setError("검색어를 입력해 주세요.");return;}if(!s.remember())return;hideKeyboard();boolean same=wanted.equals(query)&&hitPage==s.page&&hitDoc.equals(s.doc.optString("id"))&&!hits.isEmpty();cancel();query=wanted;
  if(!restart&&same&&hitIndex+direction>=0&&hitIndex+direction<hits.size()){hitIndex+=direction;rendered();showStatus();return;}
  final boolean include=restart||!same;final int token=generation,start=s.page,total=s.count;final String id=s.doc.optString("id");clearHits();status.setText("찾는 중… · 취소하려면 ×");
  task=worker.submit(new Runnable(){public void run(){try{Method search=PdfRenderer.Page.class.getMethod("searchText",String.class);try(ParcelFileDescriptor fd=ParcelFileDescriptor.open(new File(s.folder,id+".pdf"),ParcelFileDescriptor.MODE_READ_ONLY);PdfRenderer pdf=new PdfRenderer(fd)){
    for(int step=0;step<total;step++){if(Thread.currentThread().isInterrupted()||generation!=token)return;final int number=PdfNavigation.candidate(start,direction,step,include,total);final int checked=step+1;if(step%5==0)s.a.runOnUiThread(new Runnable(){public void run(){if(live(token,id)&&status!=null)status.setText("찾는 중 · "+checked+" / "+total+"쪽 확인 · × 취소");}});
     final ArrayList<ArrayList<RectF>> found;try(PdfRenderer.Page page=pdf.openPage(number)){Object value=search.invoke(page,wanted);found=normalize(value,page.getWidth(),page.getHeight());}
     if(!found.isEmpty()){s.a.runOnUiThread(new Runnable(){public void run(){if(!live(token,id))return;hitDoc=id;hitPage=number;hits=found;hitIndex=direction>0?0:found.size()-1;navigating=true;try{if(number!=s.page)s.go(number);else rendered();}finally{navigating=false;}showStatus();}});return;}
    }
   }s.a.runOnUiThread(new Runnable(){public void run(){if(live(token,id)&&status!=null)status.setText("‘"+wanted+"’ 결과 없음 · 스캔 이미지에는 검색할 글자 정보가 없을 수 있습니다.");}});
  }catch(final Exception e){s.a.runOnUiThread(new Runnable(){public void run(){if(live(token,id)&&status!=null){status.setText("검색하지 못했습니다. 다시 시도해 주세요.");s.a.error(new IOException("PDF 찾기 실패",e));}}});}}});
 }
 void showStatus(){if(status!=null)status.setText("‘"+query+"’ · "+(hitPage+1)+"쪽 · 이 페이지 "+(hitIndex+1)+" / "+hits.size()+"번째 결과");}
 static ArrayList<ArrayList<RectF>> normalize(Object value,int width,int height)throws Exception{ArrayList<ArrayList<RectF>> result=new ArrayList<ArrayList<RectF>>();if(width<1||height<1||!(value instanceof List))return result;for(Object match:(List<?>)value){Object raw=match.getClass().getMethod("getBounds").invoke(match);ArrayList<RectF> rects=new ArrayList<RectF>();if(raw instanceof List)for(Object b:(List<?>)raw){if(!(b instanceof RectF))continue;RectF r=(RectF)b;if(Float.isNaN(r.left)||Float.isNaN(r.top)||Float.isNaN(r.right)||Float.isNaN(r.bottom))continue;RectF n=new RectF(Math.max(0,r.left/width),Math.max(0,r.top/height),Math.min(1,r.right/width),Math.min(1,r.bottom/height));if(n.width()>0&&n.height()>0)rects.add(n);}if(!rects.isEmpty())result.add(rects);}return result;}
}
