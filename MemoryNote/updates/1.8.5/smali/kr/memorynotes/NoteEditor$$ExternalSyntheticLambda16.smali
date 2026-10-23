.class public final synthetic Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/NoteEditor;

.field public final synthetic f$1:Lkr/memorynotes/Ui;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/NoteEditor;Lkr/memorynotes/Ui;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda16;->f$0:Lkr/memorynotes/NoteEditor;

    iput-object p2, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda16;->f$1:Lkr/memorynotes/Ui;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda16;->f$0:Lkr/memorynotes/NoteEditor;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda16;->f$1:Lkr/memorynotes/Ui;

    invoke-virtual {v0, v1}, Lkr/memorynotes/NoteEditor;->lambda$1$kr-memorynotes-NoteEditor(Lkr/memorynotes/Ui;)V

    return-void
.end method
