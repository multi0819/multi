.class public final Lkr/memorynotes/CardEditorControls;
.super Ljava/lang/Object;
.source "CardEditorControls.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static add(Lkr/memorynotes/NoteEditor;Landroid/widget/EditText;Ljava/lang/String;)V
    .registers 6

    .line 4
    invoke-virtual {p1}, Landroid/widget/EditText;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/CardEditorControls$1;

    invoke-direct {v2, p0, p1}, Lkr/memorynotes/CardEditorControls$1;-><init>(Lkr/memorynotes/NoteEditor;Landroid/widget/EditText;)V

    invoke-virtual {v1, p2, v2}, Lkr/memorynotes/Ui;->clozeButton(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    return-void
.end method

.method public static attach(Lkr/memorynotes/NoteEditor;)V
    .registers 3

    .line 5
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->question:Landroid/widget/EditText;

    const-string v1, "\ubb38\uc81c\uc758 \uac00\ub9b4 \ub2e8\uc5b4 \uc120\ud0dd"

    invoke-static {p0, v0, v1}, Lkr/memorynotes/CardEditorControls;->add(Lkr/memorynotes/NoteEditor;Landroid/widget/EditText;Ljava/lang/String;)V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    const-string v1, "\uc815\ub2f5\uc758 \uac00\ub9b4 \ub2e8\uc5b4 \uc120\ud0dd"

    invoke-static {p0, v0, v1}, Lkr/memorynotes/CardEditorControls;->add(Lkr/memorynotes/NoteEditor;Landroid/widget/EditText;Ljava/lang/String;)V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object p0, p0, Lkr/memorynotes/NoteEditor;->question:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lkr/memorynotes/Ui;->studyEditor(Landroid/widget/EditText;Z)V

    return-void
.end method
