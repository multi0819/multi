.class Lkr/memorynotes/StudyTextRenderer$1;
.super Landroid/text/style/ClickableSpan;
.source "StudyTextRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/StudyTextRenderer;->format(Lkr/memorynotes/Ui;Ljava/lang/String;ZZLjava/util/Set;Ljava/lang/Runnable;Lorg/json/JSONArray;)Landroid/text/SpannableStringBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$opened:Ljava/util/Set;

.field private final synthetic val$part:Lkr/memorynotes/StudyText$Part;

.field private final synthetic val$refresh:Ljava/lang/Runnable;

.field private final synthetic val$u:Lkr/memorynotes/Ui;


# direct methods
.method constructor <init>(Ljava/util/Set;Lkr/memorynotes/StudyText$Part;Ljava/lang/Runnable;Lkr/memorynotes/Ui;)V
    .registers 5

    .line 32
    iput-object p1, p0, Lkr/memorynotes/StudyTextRenderer$1;->val$opened:Ljava/util/Set;

    iput-object p2, p0, Lkr/memorynotes/StudyTextRenderer$1;->val$part:Lkr/memorynotes/StudyText$Part;

    iput-object p3, p0, Lkr/memorynotes/StudyTextRenderer$1;->val$refresh:Ljava/lang/Runnable;

    iput-object p4, p0, Lkr/memorynotes/StudyTextRenderer$1;->val$u:Lkr/memorynotes/Ui;

    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 32
    iget-object p1, p0, Lkr/memorynotes/StudyTextRenderer$1;->val$opened:Ljava/util/Set;

    iget-object v0, p0, Lkr/memorynotes/StudyTextRenderer$1;->val$part:Lkr/memorynotes/StudyText$Part;

    iget v0, v0, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lkr/memorynotes/StudyTextRenderer$1;->val$refresh:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .registers 3

    .line 32
    iget-object v0, p0, Lkr/memorynotes/StudyTextRenderer$1;->val$u:Lkr/memorynotes/Ui;

    iget v0, v0, Lkr/memorynotes/Ui;->clozeColor:I

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    return-void
.end method
