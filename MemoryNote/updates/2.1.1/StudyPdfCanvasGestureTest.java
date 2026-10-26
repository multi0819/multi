import kr.memorynotes.StudyPdfCanvas;
public class StudyPdfCanvasGestureTest {
    private static int count;
    private static void check(boolean condition) {
        count++;
        if (!condition) throw new AssertionError("Case " + count);
    }
    public static void main(String[] args) {
        check(StudyPdfCanvas.isPageSwipe(80, 0, 80));
        check(StudyPdfCanvas.isPageSwipe(-80, 0, 80));
        check(!StudyPdfCanvas.isPageSwipe(79, 0, 80));
        check(StudyPdfCanvas.isPageSwipe(120, 80, 80));
        check(!StudyPdfCanvas.isPageSwipe(119, 80, 80));
        check(!StudyPdfCanvas.isPageSwipe(0, 300, 80));
        check(!StudyPdfCanvas.isPageSwipe(Float.NaN, 0, 80));
        check(!StudyPdfCanvas.isPageSwipe(Float.POSITIVE_INFINITY, 0, 80));
        check(!StudyPdfCanvas.isPageSwipe(100, Float.NaN, 80));
        check(!StudyPdfCanvas.isPageSwipe(100, 0, 0));
        check(!StudyPdfCanvas.isPageSwipe(159, 0, 160));
        check(StudyPdfCanvas.isPageSwipe(160, 0, 160));
        System.out.println(count + " gesture distance checks passed");
    }
}
