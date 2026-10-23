package kr.pdfmemorynotes;
import android.graphics.*;import android.graphics.pdf.PdfRenderer;import android.os.ParcelFileDescriptor;import java.io.*;
final class PdfPages {
 static Bitmap render(File file,int number,int width)throws Exception{try(ParcelFileDescriptor fd=ParcelFileDescriptor.open(file,ParcelFileDescriptor.MODE_READ_ONLY);PdfRenderer pdf=new PdfRenderer(fd);PdfRenderer.Page page=pdf.openPage(number)){int[] s=PagePolicy.size(page.getWidth(),page.getHeight(),width);Bitmap bitmap=Bitmap.createBitmap(s[0],s[1],Bitmap.Config.ARGB_8888);bitmap.eraseColor(Color.WHITE);try{page.render(bitmap,null,null,PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY);return bitmap;}catch(Throwable e){bitmap.recycle();throw e;}}}
 static int count(File file)throws Exception{try(ParcelFileDescriptor fd=ParcelFileDescriptor.open(file,ParcelFileDescriptor.MODE_READ_ONLY);PdfRenderer p=new PdfRenderer(fd)){return p.getPageCount();}}
 static boolean blue(Bitmap b,android.graphics.Rect rect){int x0=Math.max(0,rect.left-5),y0=Math.max(0,rect.top-4),x1=Math.min(b.getWidth(),rect.left+Math.max(30,Math.min(rect.width(),b.getWidth()/8))),y1=Math.min(b.getHeight(),rect.bottom+4);int n=0;for(int y=y0;y<y1;y+=2)for(int x=x0;x<x1;x+=2){int c=b.getPixel(x,y);if(Color.blue(c)>Color.red(c)+15&&Color.green(c)>Color.red(c)+10&&Color.blue(c)>120)n++;}return n>=3;}
}
