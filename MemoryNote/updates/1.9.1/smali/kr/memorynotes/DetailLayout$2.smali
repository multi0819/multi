.class Lkr/memorynotes/DetailLayout$2;
.super Ljava/lang/Object;
.source "DetailLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$pen:Landroid/widget/Button;

.field final synthetic val$text:Landroid/widget/Button;

.field final synthetic val$toolbar:Landroid/view/View;


# direct methods
.method constructor <init>(Lkr/memorynotes/DetailLayout;Landroid/view/View;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 33
    iput-object p1, p0, Lkr/memorynotes/DetailLayout$2;->this$0:Lkr/memorynotes/DetailLayout;

    iput-object p2, p0, Lkr/memorynotes/DetailLayout$2;->val$toolbar:Landroid/view/View;

    iput-object p3, p0, Lkr/memorynotes/DetailLayout$2;->val$pen:Landroid/widget/Button;

    iput-object p4, p0, Lkr/memorynotes/DetailLayout$2;->val$text:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 33
    iget-object v0, p0, Lkr/memorynotes/DetailLayout$2;->val$toolbar:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iget-object v2, p0, Lkr/memorynotes/DetailLayout$2;->val$toolbar:Landroid/view/View;

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    if-eqz v0, :cond_2

    iget-object v1, p0, Lkr/memorynotes/DetailLayout$2;->val$pen:Landroid/widget/Button;

    if-eqz v1, :cond_2

    iget-object v0, p0, Lkr/memorynotes/DetailLayout$2;->val$pen:Landroid/widget/Button;

    :goto_2
    invoke-virtual {v0}, Landroid/widget/Button;->performClick()Z

    goto :goto_3

    :cond_2
    if-nez v0, :cond_3

    iget-object v0, p0, Lkr/memorynotes/DetailLayout$2;->val$text:Landroid/widget/Button;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lkr/memorynotes/DetailLayout$2;->val$text:Landroid/widget/Button;

    goto :goto_2

    :cond_3
    :goto_3
    return-void
.end method
