.class Lkr/memorynotes/EditorLayout$5$1;
.super Ljava/lang/Object;
.source "EditorLayout.java"

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/EditorLayout$5;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lkr/memorynotes/EditorLayout$5;


# direct methods
.method constructor <init>(Lkr/memorynotes/EditorLayout$5;)V
    .locals 0

    .line 118
    iput-object p1, p0, Lkr/memorynotes/EditorLayout$5$1;->this$1:Lkr/memorynotes/EditorLayout$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 3

    .line 119
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lkr/memorynotes/EditorLayout$5$1;->this$1:Lkr/memorynotes/EditorLayout$5;

    iget-object v0, v0, Lkr/memorynotes/EditorLayout$5;->val$paste:Landroid/widget/Button;

    if-eqz v0, :cond_0

    iget-object p1, p0, Lkr/memorynotes/EditorLayout$5$1;->this$1:Lkr/memorynotes/EditorLayout$5;

    iget-object p1, p1, Lkr/memorynotes/EditorLayout$5;->val$paste:Landroid/widget/Button;

    :goto_0
    invoke-virtual {p1}, Landroid/widget/Button;->performClick()Z

    goto :goto_1

    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    iget-object p1, p0, Lkr/memorynotes/EditorLayout$5$1;->this$1:Lkr/memorynotes/EditorLayout$5;

    iget-object p1, p1, Lkr/memorynotes/EditorLayout$5;->this$0:Lkr/memorynotes/EditorLayout;

    invoke-static {p1}, Lkr/memorynotes/EditorLayout;->access$000(Lkr/memorynotes/EditorLayout;)Lkr/memorynotes/NoteEditor;

    move-result-object p1

    iget-object p1, p1, Lkr/memorynotes/NoteEditor;->images:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of p1, p1, Landroid/view/View;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lkr/memorynotes/EditorLayout$5$1;->this$1:Lkr/memorynotes/EditorLayout$5;

    iget-object p1, p1, Lkr/memorynotes/EditorLayout$5;->this$0:Lkr/memorynotes/EditorLayout;

    invoke-static {p1}, Lkr/memorynotes/EditorLayout;->access$000(Lkr/memorynotes/EditorLayout;)Lkr/memorynotes/NoteEditor;

    move-result-object p1

    iget-object p1, p1, Lkr/memorynotes/NoteEditor;->images:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    iget-object p1, p0, Lkr/memorynotes/EditorLayout$5$1;->this$1:Lkr/memorynotes/EditorLayout$5;

    iget-object p1, p1, Lkr/memorynotes/EditorLayout$5;->this$0:Lkr/memorynotes/EditorLayout;

    invoke-static {p1}, Lkr/memorynotes/EditorLayout;->access$200(Lkr/memorynotes/EditorLayout;)Lkr/memorynotes/MainActivity;

    move-result-object p1

    invoke-virtual {p1}, Lkr/memorynotes/MainActivity;->chooseImages()V

    goto :goto_1

    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_3

    iget-object p1, p0, Lkr/memorynotes/EditorLayout$5$1;->this$1:Lkr/memorynotes/EditorLayout$5;

    iget-object p1, p1, Lkr/memorynotes/EditorLayout$5;->val$manage:Landroid/widget/Button;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lkr/memorynotes/EditorLayout$5$1;->this$1:Lkr/memorynotes/EditorLayout$5;

    iget-object p1, p1, Lkr/memorynotes/EditorLayout$5;->val$manage:Landroid/widget/Button;

    goto :goto_0

    :cond_3
    :goto_1
    return v1
.end method
