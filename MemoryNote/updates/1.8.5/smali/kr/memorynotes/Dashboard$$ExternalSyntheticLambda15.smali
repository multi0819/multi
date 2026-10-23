.class public final synthetic Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/Note;

.field public final synthetic f$1:Lkr/memorynotes/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/Note;Lkr/memorynotes/MainActivity;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda15;->f$0:Lkr/memorynotes/Note;

    iput-object p2, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda15;->f$1:Lkr/memorynotes/MainActivity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda15;->f$0:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda15;->f$1:Lkr/memorynotes/MainActivity;

    invoke-static {v0, v1}, Lkr/memorynotes/Dashboard;->lambda$16(Lkr/memorynotes/Note;Lkr/memorynotes/MainActivity;)V

    return-void
.end method
