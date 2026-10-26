package kr.memorynotes;
public class PdfNavigationTest {
 public static void main(String[] args){int checks=0;for(int count:new int[]{1,2,3,977})for(int p:new int[]{0,count-1})for(int direction:new int[]{-1,1})for(boolean include:new boolean[]{true,false}){boolean[] seen=new boolean[count];for(int step=0;step<count;step++){int n=PdfNavigation.candidate(p,direction,step,include,count);if(n<0||n>=count||seen[n])throw new AssertionError("search must visit each page once");seen[n]=true;checks++;}if(include&&PdfNavigation.candidate(p,direction,0,true,count)!=p)throw new AssertionError();}
 if(PdfNavigation.page(" 977 ",977)!=976||PdfNavigation.page("1",977)!=0)throw new AssertionError();for(String bad:new String[]{"0","978","-1","","a","2147483648"}){try{PdfNavigation.page(bad,977);throw new AssertionError(bad);}catch(IllegalArgumentException expected){checks++;}}System.out.println("PASS "+checks+" PDF search ordering/page input checks");}
}
