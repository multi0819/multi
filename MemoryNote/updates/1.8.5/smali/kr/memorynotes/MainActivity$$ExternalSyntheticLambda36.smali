.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda36;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/MainActivity;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Lkr/memorynotes/NoteEditor;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/MainActivity;Ljava/util/ArrayList;Lkr/memorynotes/NoteEditor;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda36;->f$0:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda36;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda36;->f$2:Lkr/memorynotes/NoteEditor;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda36;->f$0:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda36;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda36;->f$2:Lkr/memorynotes/NoteEditor;

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/MainActivity;->lambda$49$kr-memorynotes-MainActivity(Ljava/util/ArrayList;Lkr/memorynotes/NoteEditor;)V

    return-void
.end method
