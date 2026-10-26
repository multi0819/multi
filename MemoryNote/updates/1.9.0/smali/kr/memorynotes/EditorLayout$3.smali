.class Lkr/memorynotes/EditorLayout$3;
.super Ljava/lang/Object;
.source "EditorLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/EditorLayout;->compactMetadata()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/EditorLayout;

.field final synthetic val$selected:I

.field final synthetic val$tabs:[Landroid/widget/Button;

.field final synthetic val$values:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lkr/memorynotes/EditorLayout;I[Ljava/lang/String;[Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 97
    iput-object p1, p0, Lkr/memorynotes/EditorLayout$3;->this$0:Lkr/memorynotes/EditorLayout;

    iput p2, p0, Lkr/memorynotes/EditorLayout$3;->val$selected:I

    iput-object p3, p0, Lkr/memorynotes/EditorLayout$3;->val$values:[Ljava/lang/String;

    iput-object p4, p0, Lkr/memorynotes/EditorLayout$3;->val$tabs:[Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 98
    iget-object v0, p0, Lkr/memorynotes/EditorLayout$3;->this$0:Lkr/memorynotes/EditorLayout;

    invoke-static {v0}, Lkr/memorynotes/EditorLayout;->access$000(Lkr/memorynotes/EditorLayout;)Lkr/memorynotes/NoteEditor;

    move-result-object v0

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->type:Landroid/widget/Spinner;

    iget v1, p0, Lkr/memorynotes/EditorLayout$3;->val$selected:I

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 100
    iget-object v0, p0, Lkr/memorynotes/EditorLayout$3;->this$0:Lkr/memorynotes/EditorLayout;

    invoke-static {v0}, Lkr/memorynotes/EditorLayout;->access$000(Lkr/memorynotes/EditorLayout;)Lkr/memorynotes/NoteEditor;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/EditorLayout$3;->val$values:[Ljava/lang/String;

    iget v2, p0, Lkr/memorynotes/EditorLayout$3;->val$selected:I

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Lkr/memorynotes/NoteEditor;->switchType(Ljava/lang/String;)V

    .line 101
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lkr/memorynotes/EditorLayout$3;->val$tabs:[Landroid/widget/Button;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lkr/memorynotes/EditorLayout$3;->this$0:Lkr/memorynotes/EditorLayout;

    iget-object v3, p0, Lkr/memorynotes/EditorLayout$3;->val$tabs:[Landroid/widget/Button;

    aget-object v3, v3, v1

    iget v4, p0, Lkr/memorynotes/EditorLayout$3;->val$selected:I

    if-ne v1, v4, :cond_0

    const/4 v4, 0x2

    goto :goto_1

    :cond_0
    move v4, v0

    :goto_1
    invoke-static {v2, v3, v4}, Lkr/memorynotes/EditorLayout;->access$100(Lkr/memorynotes/EditorLayout;Landroid/widget/Button;I)Landroid/widget/Button;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 102
    :cond_1
    return-void
.end method
