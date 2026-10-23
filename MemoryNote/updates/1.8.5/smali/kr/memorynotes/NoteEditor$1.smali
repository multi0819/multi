.class Lkr/memorynotes/NoteEditor$1;
.super Ljava/lang/Object;
.source "NoteEditor.java"

# interfaces
.implements Landroid/view/ActionMode$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/NoteEditor;->addStudyControls(Landroid/widget/LinearLayout;Landroid/widget/EditText;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/NoteEditor;

.field private final synthetic val$target:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lkr/memorynotes/NoteEditor;Landroid/widget/EditText;)V
    .registers 3

    .line 63
    iput-object p1, p0, Lkr/memorynotes/NoteEditor$1;->this$0:Lkr/memorynotes/NoteEditor;

    iput-object p2, p0, Lkr/memorynotes/NoteEditor$1;->val$target:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .registers 8

    .line 66
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0x387

    const/4 v2, 0x1

    if-ne v0, v1, :cond_23

    iget-object p2, p0, Lkr/memorynotes/NoteEditor$1;->this$0:Lkr/memorynotes/NoteEditor;

    iget-object p2, p2, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor$1;->this$0:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor$1;->val$target:Landroid/widget/EditText;

    iget-object v3, p0, Lkr/memorynotes/NoteEditor$1;->this$0:Lkr/memorynotes/NoteEditor;

    new-instance v4, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;

    invoke-direct {v4, v3}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;-><init>(Lkr/memorynotes/NoteEditor;)V

    const-string v3, "body"

    invoke-static {p2, v0, v3, v1, v4}, Lkr/memorynotes/ColorText;->choose(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;Ljava/lang/Runnable;)V

    :goto_1f
    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    return v2

    :cond_23
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0x385

    if-ne v0, v1, :cond_33

    iget-object p2, p0, Lkr/memorynotes/NoteEditor$1;->this$0:Lkr/memorynotes/NoteEditor;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor$1;->val$target:Landroid/widget/EditText;

    invoke-virtual {p2, v0}, Lkr/memorynotes/NoteEditor;->markAnswer(Landroid/widget/EditText;)V

    goto :goto_1f

    :cond_33
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    const/16 v0, 0x386

    if-ne p2, v0, :cond_4a

    new-instance p2, Lkr/memorynotes/PhraseSelectionDialog;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor$1;->this$0:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor$1;->val$target:Landroid/widget/EditText;

    invoke-direct {p2, v0, v1}, Lkr/memorynotes/PhraseSelectionDialog;-><init>(Lkr/memorynotes/MainActivity;Landroid/widget/EditText;)V

    invoke-virtual {p2}, Lkr/memorynotes/PhraseSelectionDialog;->show()V

    goto :goto_1f

    :cond_4a
    const/4 p1, 0x0

    return p1
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 7

    .line 64
    const/16 p1, 0x385

    const-string v0, "\ub2f5 \uc9c0\uc815"

    const/4 v1, 0x0

    invoke-interface {p2, v1, p1, v1, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    const-string p1, "\uac00\ub9bc \uc124\uc815"

    const/16 v0, 0x386

    const/4 v2, 0x1

    invoke-interface {p2, v1, v0, v2, p1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    const/4 p1, 0x2

    const-string v0, "\uae00\uc790\uc0c9"

    const/16 v3, 0x387

    invoke-interface {p2, v1, v3, p1, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    return v2
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .registers 2

    .line 67
    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 3

    .line 65
    const/4 p1, 0x0

    return p1
.end method
