.class public final synthetic Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/MainActivity;

.field public final synthetic f$1:Lkr/memorynotes/Note;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda16;->f$0:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda16;->f$1:Lkr/memorynotes/Note;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda16;->f$0:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda16;->f$1:Lkr/memorynotes/Note;

    invoke-static {v0, v1, p1}, Lkr/memorynotes/Dashboard;->lambda$17(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Landroid/view/View;)V

    return-void
.end method
