.class public final synthetic Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/NoteEditor;

.field public final synthetic f$1:Ljava/lang/Exception;

.field public final synthetic f$2:Ljava/util/ArrayList;

.field public final synthetic f$3:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/NoteEditor;Ljava/lang/Exception;Ljava/util/ArrayList;Ljava/lang/Object;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;->f$0:Lkr/memorynotes/NoteEditor;

    iput-object p2, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;->f$1:Ljava/lang/Exception;

    iput-object p3, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;->f$2:Ljava/util/ArrayList;

    iput-object p4, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;->f$3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;->f$0:Lkr/memorynotes/NoteEditor;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;->f$1:Ljava/lang/Exception;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;->f$2:Ljava/util/ArrayList;

    iget-object v3, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;->f$3:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2, v3}, Lkr/memorynotes/NoteEditor;->lambda$23$kr-memorynotes-NoteEditor(Ljava/lang/Exception;Ljava/util/ArrayList;Ljava/lang/Object;)V

    return-void
.end method
