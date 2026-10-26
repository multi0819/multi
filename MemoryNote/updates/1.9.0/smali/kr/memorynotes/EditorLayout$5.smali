.class Lkr/memorynotes/EditorLayout$5;
.super Ljava/lang/Object;
.source "EditorLayout.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/EditorLayout;->setupGeneralTools()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/EditorLayout;

.field final synthetic val$manage:Landroid/widget/Button;

.field final synthetic val$paste:Landroid/widget/Button;

.field final synthetic val$picture:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lkr/memorynotes/EditorLayout;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 116
    iput-object p1, p0, Lkr/memorynotes/EditorLayout$5;->this$0:Lkr/memorynotes/EditorLayout;

    iput-object p2, p0, Lkr/memorynotes/EditorLayout$5;->val$picture:Landroid/widget/Button;

    iput-object p3, p0, Lkr/memorynotes/EditorLayout$5;->val$paste:Landroid/widget/Button;

    iput-object p4, p0, Lkr/memorynotes/EditorLayout$5;->val$manage:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 117
    new-instance p1, Landroid/widget/PopupMenu;

    iget-object v0, p0, Lkr/memorynotes/EditorLayout$5;->this$0:Lkr/memorynotes/EditorLayout;

    invoke-static {v0}, Lkr/memorynotes/EditorLayout;->access$200(Lkr/memorynotes/EditorLayout;)Lkr/memorynotes/MainActivity;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/EditorLayout$5;->val$picture:Landroid/widget/Button;

    invoke-direct {p1, v0, v1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v0

    const-string v1, "\ubcf5\uc0ac\ud55c \uadf8\ub9bc \ubd99\uc5ec\ub123\uae30"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    invoke-virtual {p1}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v0

    const-string v1, "\uac24\ub7ec\ub9ac\uc5d0\uc11c \uac00\uc838\uc624\uae30"

    const/4 v4, 0x2

    invoke-interface {v0, v2, v4, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    invoke-virtual {p1}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v0

    const/4 v1, 0x3

    const-string v3, "\ubcf8\ubb38 \uadf8\ub9bc \uac00\ub9bc \u00b7 \uc0ad\uc81c"

    invoke-interface {v0, v2, v1, v4, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 118
    new-instance v0, Lkr/memorynotes/EditorLayout$5$1;

    invoke-direct {v0, p0}, Lkr/memorynotes/EditorLayout$5$1;-><init>(Lkr/memorynotes/EditorLayout$5;)V

    invoke-virtual {p1, v0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 120
    invoke-virtual {p1}, Landroid/widget/PopupMenu;->show()V

    .line 121
    return-void
.end method
