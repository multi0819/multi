.class Lkr/memorynotes/ThicknessControl$1;
.super Ljava/lang/Object;
.source "ThicknessControl.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/ThicknessControl;->attach(Lkr/memorynotes/InkPage;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Lkr/memorynotes/MainActivity;

.field final synthetic val$ink:Lkr/memorynotes/InkPage;

.field final synthetic val$value:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lkr/memorynotes/InkPage;Landroid/widget/TextView;Lkr/memorynotes/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 25
    iput-object p1, p0, Lkr/memorynotes/ThicknessControl$1;->val$ink:Lkr/memorynotes/InkPage;

    iput-object p2, p0, Lkr/memorynotes/ThicknessControl$1;->val$value:Landroid/widget/TextView;

    iput-object p3, p0, Lkr/memorynotes/ThicknessControl$1;->val$a:Lkr/memorynotes/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    .line 25
    iget-object p3, p0, Lkr/memorynotes/ThicknessControl$1;->val$ink:Lkr/memorynotes/InkPage;

    invoke-static {p2}, Lkr/memorynotes/WidthPolicy;->width(I)F

    move-result v0

    iput v0, p3, Lkr/memorynotes/InkPage;->thickness:F

    iget-object p3, p0, Lkr/memorynotes/ThicknessControl$1;->val$value:Landroid/widget/TextView;

    invoke-static {p2}, Lkr/memorynotes/WidthPolicy;->label(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\ud39c \uad75\uae30 "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-static {p2}, Lkr/memorynotes/WidthPolicy;->label(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lkr/memorynotes/ThicknessControl$1;->val$a:Lkr/memorynotes/MainActivity;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object p2, p0, Lkr/memorynotes/ThicknessControl$1;->val$ink:Lkr/memorynotes/InkPage;

    iget p2, p2, Lkr/memorynotes/InkPage;->thickness:F

    const-string p3, "ink_thickness"

    invoke-interface {p1, p3, p2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 25
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 25
    return-void
.end method
