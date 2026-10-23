.class public final Lkr/memorynotes/ReviewControls;
.super Ljava/lang/Object;
.source "ReviewControls.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addHide(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V
    .registers 4

    .line 3
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object p0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v1, Lkr/memorynotes/ReviewControls$1;

    invoke-direct {v1, p1}, Lkr/memorynotes/ReviewControls$1;-><init>(Lkr/memorynotes/ReviewScreen;)V

    const-string p1, "\ub2e4\uc2dc \uac00\ub9ac\uae30"

    invoke-virtual {p0, p1, v1}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method
