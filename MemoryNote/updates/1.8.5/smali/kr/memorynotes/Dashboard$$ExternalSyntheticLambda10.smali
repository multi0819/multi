.class public final synthetic Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/Dashboard;

.field public final synthetic f$1:Lkr/memorynotes/Note;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/Dashboard;Lkr/memorynotes/Note;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda10;->f$0:Lkr/memorynotes/Dashboard;

    iput-object p2, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda10;->f$1:Lkr/memorynotes/Note;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda10;->f$0:Lkr/memorynotes/Dashboard;

    iget-object v1, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda10;->f$1:Lkr/memorynotes/Note;

    invoke-virtual {v0, v1, p1}, Lkr/memorynotes/Dashboard;->lambda$6$kr-memorynotes-Dashboard(Lkr/memorynotes/Note;Landroid/view/View;)V

    return-void
.end method
