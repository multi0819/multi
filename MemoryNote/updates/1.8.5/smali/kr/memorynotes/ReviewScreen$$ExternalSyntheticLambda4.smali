.class public final synthetic Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/ReviewScreen;

.field public final synthetic f$1:Lkr/memorynotes/Note;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/ReviewScreen;Lkr/memorynotes/Note;I)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda4;->f$0:Lkr/memorynotes/ReviewScreen;

    iput-object p2, p0, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda4;->f$1:Lkr/memorynotes/Note;

    iput p3, p0, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda4;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda4;->f$0:Lkr/memorynotes/ReviewScreen;

    iget-object v1, p0, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda4;->f$1:Lkr/memorynotes/Note;

    iget v2, p0, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda4;->f$2:I

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/ReviewScreen;->lambda$4$kr-memorynotes-ReviewScreen(Lkr/memorynotes/Note;I)V

    return-void
.end method
