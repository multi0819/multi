import kr.memorynotes.*;import java.util.*;
public class NoteFilterTest {
 static int checks;static void check(boolean ok,String m){checks++;if(!ok)throw new AssertionError(m);}
 public static void main(String[] args){
  String today="2026-10-18";ArrayList<Note> notes=new ArrayList<>();for(int i=0;i<7;i++){Note n=new Note();n.title="노트 "+i;n.subject=i<4?"hvac":"other";n.chapter=i==6?"":i<4?"a":"b";n.type=i%2==0?"일반 노트":"문답 카드";n.rating=i%4-1;n.favorite=i==2;n.due=i<5?(i==0?"":"2026-10-18"):"2026-10-19";notes.add(n);}
  NoteFilter f=new NoteFilter();check(f.select(notes,today).size()==7,"all seven notes retained");f.dueOnly=true;check(f.select(notes,today).size()==5,"five due is distinct from seven total");f.dueOnly=false;f.subject="other";check(f.select(notes,today).size()==3,"subject selection");f.chapter="b";check(f.select(notes,today).size()==2,"subject and chapter");f.subject="";f.chapter=ChapterChoices.NONE;check(f.select(notes,today).size()==1,"notes without chapters");f.chapter="a";f.type="문답 카드";check(f.select(notes,today).size()==2,"chapter and type intersection");f.type="";f.rating=1;check(f.select(notes,today).size()==1,"rating filter");f.rating=-2;f.favoriteOnly=true;check(f.select(notes,today).size()==1,"favorite filter");f.subject="other";check(f.select(notes,today).isEmpty(),"no cross-subject leakage");
  LinkedHashMap<String,String> subjects=new LinkedHashMap<>();subjects.put("hvac","공조냉동");subjects.put("other","다른 과목");Map<String,Map<String,String>> groups=new LinkedHashMap<>();groups.put("hvac",Map.of("a","기초"));groups.put("other",Map.of("b","기초"));
  ChapterChoices all=new ChapterChoices(subjects,groups,"");check(all.ids.containsAll(List.of("a","b",ChapterChoices.NONE)),"all subjects expose every chapter and unchaptered option");check(all.labels.contains("공조냉동 · 기초")&&all.labels.contains("다른 과목 · 기초"),"duplicate chapter names are qualified");ChapterChoices one=new ChapterChoices(subjects,groups,"hvac");check(one.ids.contains("a")&&!one.ids.contains("b"),"chapter options limited to selected subject");check(one.labels.get(0).equals("모든 단원"),"all chapter option retained");
  System.out.println("PASS "+checks+" note selection assertions");
 }
}
