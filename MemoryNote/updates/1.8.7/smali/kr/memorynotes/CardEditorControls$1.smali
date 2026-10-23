.class Lkr/memorynotes/CardEditorControls$1;
.super Ljava/lang/Object;
.source "CardEditorControls.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/CardEditorControls;->add(Lkr/memorynotes/NoteEditor;Landroid/widget/EditText;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$e:Lkr/memorynotes/NoteEditor;

.field private final synthetic val$target:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lkr/memorynotes/NoteEditor;Landroid/widget/EditText;)V
    .registers 3

    .line 4
    iput-object p1, p0, Lkr/memorynotes/CardEditorControls$1;->val$e:Lkr/memorynotes/NoteEditor;

    iput-object p2, p0, Lkr/memorynotes/CardEditorControls$1;->val$target:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 4
    new-instance v0, Lkr/memorynotes/PhraseSelectionDialog;

    iget-object v1, p0, Lkr/memorynotes/CardEditorControls$1;->val$e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, p0, Lkr/memorynotes/CardEditorControls$1;->val$target:Landroid/widget/EditText;

    invoke-direct {v0, v1, v2}, Lkr/memorynotes/PhraseSelectionDialog;-><init>(Lkr/memorynotes/MainActivity;Landroid/widget/EditText;)V

    invoke-virtual {v0}, Lkr/memorynotes/PhraseSelectionDialog;->show()V

    return-void
.end method
