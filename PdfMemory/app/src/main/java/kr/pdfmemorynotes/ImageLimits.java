package kr.pdfmemorynotes;
final class ImageLimits {
 static int sample(int width,int height){if(width<=0||height<=0)return 1;int sample=1;while(width/(long)sample*(height/(long)sample)>1000000L||width/sample>1400)sample*=2;return sample;}
}
