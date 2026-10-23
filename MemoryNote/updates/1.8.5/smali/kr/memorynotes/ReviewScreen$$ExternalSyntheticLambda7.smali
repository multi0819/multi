.class public final synthetic Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/ReviewScreen;

.field public final synthetic f$1:Lkr/memorynotes/Note;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/ReviewScreen;Lkr/memorynotes/Note;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda7;->f$0:Lkr/memorynotes/ReviewScreen;

    iput-object p2, p0, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda7;->f$1:Lkr/memorynotes/Note;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda7;->f$0:Lkr/memorynotes/ReviewScreen;

    iget-object v1, p0, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda7;->f$1:Lkr/memorynotes/Note;

    invoke-virtual {v0, v1}, Lkr/memorynotes/ReviewScreen;->lambda$7$kr-memorynotes-ReviewScreen(Lkr/memorynotes/Note;)V

    return-void
.end method
