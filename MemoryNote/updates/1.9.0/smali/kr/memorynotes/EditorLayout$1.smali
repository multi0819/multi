.class Lkr/memorynotes/EditorLayout$1;
.super Ljava/lang/Object;
.source "EditorLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/EditorLayout;->build()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/EditorLayout;


# direct methods
.method constructor <init>(Lkr/memorynotes/EditorLayout;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lkr/memorynotes/EditorLayout$1;->this$0:Lkr/memorynotes/EditorLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 49
    iget-object v0, p0, Lkr/memorynotes/EditorLayout$1;->this$0:Lkr/memorynotes/EditorLayout;

    invoke-static {v0}, Lkr/memorynotes/EditorLayout;->access$000(Lkr/memorynotes/EditorLayout;)Lkr/memorynotes/NoteEditor;

    move-result-object v0

    invoke-virtual {v0}, Lkr/memorynotes/NoteEditor;->leave()V

    return-void
.end method
