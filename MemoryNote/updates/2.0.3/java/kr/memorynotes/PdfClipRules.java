package kr.memorynotes;
public final class PdfClipRules {
 public static final int PROBLEM=0,STATEMENT=1,SOLUTION=2;
 public static String label(int role){if(role==0)return "문제";if(role==1)return "지문";if(role==2)return "풀이";throw new IllegalArgumentException("unknown clip role");}
 public static boolean startsNote(int role){label(role);return role==PROBLEM;}
 public static String block(int role,String marker){return "【"+label(role)+"】\n"+marker+"\n";}
 public static String append(String body,int role,String marker){return body+(body.isEmpty()||body.endsWith("\n")?"":"\n")+block(role,marker);}
 public static String move(String body,int before,int after,String marker){String old=block(before,marker);int at=body.lastIndexOf(old);if(at<0)throw new IllegalStateException("추가한 부분이 편집되어 위치를 자동 변경할 수 없습니다.");return body.substring(0,at)+block(after,marker)+body.substring(at+old.length());}
 public static String undo(String body,int role,String marker){String old=block(role,marker);int at=body.lastIndexOf(old);if(at<0)throw new IllegalStateException("추가한 부분이 편집되어 자동 취소할 수 없습니다.");return body.substring(0,at)+body.substring(at+old.length());}
 public static String moveText(String body,int before,int after,String text){String old=block(before,before==2?solutionText(text):text);int at=body.lastIndexOf(old);if(at<0)throw new IllegalStateException("추가 부분이 편집되어 위치를 바꿀 수 없습니다.");return body.substring(0,at)+block(after,after==2?solutionText(text):text)+body.substring(at+old.length());}
 public static String solutionText(String text){return "{{"+text.replace("}}","}\u200b}")+"}}";}
}
