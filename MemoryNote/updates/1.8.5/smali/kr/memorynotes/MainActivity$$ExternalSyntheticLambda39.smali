.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda39;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/MainActivity;

.field public final synthetic f$1:Landroid/widget/Spinner;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/MainActivity;Landroid/widget/Spinner;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda39;->f$0:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda39;->f$1:Landroid/widget/Spinner;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda39;->f$0:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda39;->f$1:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->lambda$43$kr-memorynotes-MainActivity(Landroid/widget/Spinner;)V

    return-void
.end method
