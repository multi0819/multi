.class Lkr/memorynotes/ColorText$2;
.super Ljava/lang/Object;
.source "ColorText.java"

# interfaces
.implements Landroid/view/ActionMode$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/ColorText;->bind(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;Ljava/lang/Runnable;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$a:Lkr/memorynotes/MainActivity;

.field private final synthetic val$changed:Ljava/lang/Runnable;

.field private final synthetic val$field:Landroid/widget/EditText;

.field private final synthetic val$key:Ljava/lang/String;

.field private final synthetic val$n:Lkr/memorynotes/Note;


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;Ljava/lang/Runnable;)V
    .registers 6

    .line 11
    iput-object p1, p0, Lkr/memorynotes/ColorText$2;->val$a:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/ColorText$2;->val$n:Lkr/memorynotes/Note;

    iput-object p3, p0, Lkr/memorynotes/ColorText$2;->val$key:Ljava/lang/String;

    iput-object p4, p0, Lkr/memorynotes/ColorText$2;->val$field:Landroid/widget/EditText;

    iput-object p5, p0, Lkr/memorynotes/ColorText$2;->val$changed:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .registers 7

    .line 11
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    const/16 v0, 0x387

    if-eq p2, v0, :cond_a

    const/4 p1, 0x0

    return p1

    :cond_a
    iget-object p2, p0, Lkr/memorynotes/ColorText$2;->val$a:Lkr/memorynotes/MainActivity;

    iget-object v0, p0, Lkr/memorynotes/ColorText$2;->val$n:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/ColorText$2;->val$key:Ljava/lang/String;

    iget-object v2, p0, Lkr/memorynotes/ColorText$2;->val$field:Landroid/widget/EditText;

    iget-object v3, p0, Lkr/memorynotes/ColorText$2;->val$changed:Ljava/lang/Runnable;

    invoke-static {p2, v0, v1, v2, v3}, Lkr/memorynotes/ColorText;->choose(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    const/4 p1, 0x1

    return p1
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 6

    .line 11
    const/4 p1, 0x2

    const-string v0, "\uae00\uc790\uc0c9"

    const/4 v1, 0x0

    const/16 v2, 0x387

    invoke-interface {p2, v1, v2, p1, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    const/4 p1, 0x1

    return p1
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .registers 2

    .line 11
    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 3

    .line 11
    const/4 p1, 0x0

    return p1
.end method
