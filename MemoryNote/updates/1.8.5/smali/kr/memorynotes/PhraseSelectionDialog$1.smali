.class Lkr/memorynotes/PhraseSelectionDialog$1;
.super Ljava/lang/Object;
.source "PhraseSelectionDialog.java"

# interfaces
.implements Landroid/view/ActionMode$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/PhraseSelectionDialog;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/PhraseSelectionDialog;


# direct methods
.method constructor <init>(Lkr/memorynotes/PhraseSelectionDialog;)V
    .registers 2

    .line 20
    iput-object p1, p0, Lkr/memorynotes/PhraseSelectionDialog$1;->this$0:Lkr/memorynotes/PhraseSelectionDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .registers 4

    .line 23
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    const/16 v0, 0x387

    if-ne p2, v0, :cond_12

    iget-object p2, p0, Lkr/memorynotes/PhraseSelectionDialog$1;->this$0:Lkr/memorynotes/PhraseSelectionDialog;

    # invokes: Lkr/memorynotes/PhraseSelectionDialog;->addSelected()V
    invoke-static {p2}, Lkr/memorynotes/PhraseSelectionDialog;->access$0(Lkr/memorynotes/PhraseSelectionDialog;)V

    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    const/4 p1, 0x1

    return p1

    :cond_12
    const/4 p1, 0x0

    return p1
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 5

    .line 21
    const/16 p1, 0x387

    const-string v0, "\uac00\ub9bc\uc5d0 \ucd94\uac00"

    const/4 v1, 0x0

    invoke-interface {p2, v1, p1, v1, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    const/4 p1, 0x1

    return p1
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .registers 2

    .line 24
    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 3

    .line 22
    const/4 p1, 0x0

    return p1
.end method
