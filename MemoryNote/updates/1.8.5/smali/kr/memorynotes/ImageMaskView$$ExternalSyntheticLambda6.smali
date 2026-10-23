.class public final synthetic Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda6;->f$0:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 3

    .line 0
    iget-object v0, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda6;->f$0:Ljava/lang/Runnable;

    invoke-static {v0, p1}, Lkr/memorynotes/ImageMaskView;->lambda$6(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V

    return-void
.end method
