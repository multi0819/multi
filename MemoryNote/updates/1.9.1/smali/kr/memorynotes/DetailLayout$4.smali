.class Lkr/memorynotes/DetailLayout$4;
.super Ljava/lang/Object;
.source "DetailLayout.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/DetailLayout;->build(Lkr/memorynotes/Note;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/DetailLayout;

.field final synthetic val$extra:Landroid/widget/LinearLayout;

.field final synthetic val$more:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lkr/memorynotes/DetailLayout;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 38
    iput-object p1, p0, Lkr/memorynotes/DetailLayout$4;->this$0:Lkr/memorynotes/DetailLayout;

    iput-object p2, p0, Lkr/memorynotes/DetailLayout$4;->val$extra:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lkr/memorynotes/DetailLayout$4;->val$more:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 38
    iget-object p1, p0, Lkr/memorynotes/DetailLayout$4;->val$extra:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    iget-object v1, p0, Lkr/memorynotes/DetailLayout$4;->val$extra:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/16 v0, 0x8

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lkr/memorynotes/DetailLayout$4;->val$more:Landroid/widget/Button;

    if-eqz p1, :cond_2

    const-string p1, "\ub354 \ubcf4\uae30 \u25b4"

    goto :goto_2

    :cond_2
    const-string p1, "\ub354 \ubcf4\uae30 \u25be"

    :goto_2
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
