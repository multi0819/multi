.class public final synthetic Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/InkPage;

.field public final synthetic f$1:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda2;->f$0:Lkr/memorynotes/InkPage;

    iput-object p2, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda2;->f$1:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda2;->f$0:Lkr/memorynotes/InkPage;

    iget-object v1, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda2;->f$1:[Ljava/lang/Runnable;

    invoke-static {v0, v1}, Lkr/memorynotes/InkToolbar;->lambda$1(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V

    return-void
.end method
