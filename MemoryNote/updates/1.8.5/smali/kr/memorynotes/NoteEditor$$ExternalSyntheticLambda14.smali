.class public final synthetic Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/NoteEditor;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/NoteEditor;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;->f$0:Lkr/memorynotes/NoteEditor;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;->f$0:Lkr/memorynotes/NoteEditor;

    invoke-virtual {v0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    return-void
.end method
