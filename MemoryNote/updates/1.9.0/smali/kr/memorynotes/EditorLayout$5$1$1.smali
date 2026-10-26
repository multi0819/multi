.class Lkr/memorynotes/EditorLayout$5$1$1;
.super Ljava/lang/Object;
.source "EditorLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/EditorLayout$5$1;->onMenuItemClick(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lkr/memorynotes/EditorLayout$5$1;


# direct methods
.method constructor <init>(Lkr/memorynotes/EditorLayout$5$1;)V
    .locals 0

    .line 118
    iput-object p1, p0, Lkr/memorynotes/EditorLayout$5$1$1;->this$2:Lkr/memorynotes/EditorLayout$5$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 118
    iget-object v0, p0, Lkr/memorynotes/EditorLayout$5$1$1;->this$2:Lkr/memorynotes/EditorLayout$5$1;

    iget-object v0, v0, Lkr/memorynotes/EditorLayout$5$1;->this$1:Lkr/memorynotes/EditorLayout$5;

    iget-object v0, v0, Lkr/memorynotes/EditorLayout$5;->this$0:Lkr/memorynotes/EditorLayout;

    invoke-static {v0}, Lkr/memorynotes/EditorLayout;->access$000(Lkr/memorynotes/EditorLayout;)Lkr/memorynotes/NoteEditor;

    move-result-object v0

    invoke-virtual {v0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    return-void
.end method
