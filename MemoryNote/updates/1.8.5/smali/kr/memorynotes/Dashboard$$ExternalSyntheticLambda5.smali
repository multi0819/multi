.class public final synthetic Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/Dashboard;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/Dashboard;I)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda5;->f$0:Lkr/memorynotes/Dashboard;

    iput p2, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda5;->f$1:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda5;->f$0:Lkr/memorynotes/Dashboard;

    iget v1, p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda5;->f$1:I

    invoke-virtual {v0, v1}, Lkr/memorynotes/Dashboard;->lambda$1$kr-memorynotes-Dashboard(I)V

    return-void
.end method
