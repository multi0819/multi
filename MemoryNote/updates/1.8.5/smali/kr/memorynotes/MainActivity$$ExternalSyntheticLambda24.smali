.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda24;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/MainActivity;

.field public final synthetic f$1:Ljava/lang/Exception;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/MainActivity;Ljava/lang/Exception;I)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda24;->f$0:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda24;->f$1:Ljava/lang/Exception;

    iput p3, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda24;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda24;->f$0:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda24;->f$1:Ljava/lang/Exception;

    iget v2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda24;->f$2:I

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/MainActivity;->lambda$52$kr-memorynotes-MainActivity(Ljava/lang/Exception;I)V

    return-void
.end method
