.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda37;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/MainActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/MainActivity;ILandroid/net/Uri;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda37;->f$0:Lkr/memorynotes/MainActivity;

    iput p2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda37;->f$1:I

    iput-object p3, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda37;->f$2:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda37;->f$0:Lkr/memorynotes/MainActivity;

    iget v1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda37;->f$1:I

    iget-object v2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda37;->f$2:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/MainActivity;->lambda$51$kr-memorynotes-MainActivity(ILandroid/net/Uri;)V

    return-void
.end method
