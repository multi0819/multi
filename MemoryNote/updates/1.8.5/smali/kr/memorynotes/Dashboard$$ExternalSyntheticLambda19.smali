.class public final synthetic Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda19;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/Dashboard;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/Dashboard;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda19;->f$0:Lkr/memorynotes/Dashboard;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda19;->f$0:Lkr/memorynotes/Dashboard;

    check-cast p1, Lkr/memorynotes/Note;

    check-cast p2, Lkr/memorynotes/Note;

    invoke-virtual {v0, p1, p2}, Lkr/memorynotes/Dashboard;->lambda$15$kr-memorynotes-Dashboard(Lkr/memorynotes/Note;Lkr/memorynotes/Note;)I

    move-result p1

    return p1
.end method
