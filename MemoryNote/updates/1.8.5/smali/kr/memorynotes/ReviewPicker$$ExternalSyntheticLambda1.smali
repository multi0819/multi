.class public final synthetic Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/ReviewPicker;

.field public final synthetic f$1:Lkr/memorynotes/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/ReviewPicker;Lkr/memorynotes/MainActivity;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda1;->f$0:Lkr/memorynotes/ReviewPicker;

    iput-object p2, p0, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda1;->f$1:Lkr/memorynotes/MainActivity;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda1;->f$0:Lkr/memorynotes/ReviewPicker;

    iget-object v1, p0, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda1;->f$1:Lkr/memorynotes/MainActivity;

    invoke-virtual {v0, v1, p1}, Lkr/memorynotes/ReviewPicker;->lambda$0$kr-memorynotes-ReviewPicker(Lkr/memorynotes/MainActivity;Landroid/content/DialogInterface;)V

    return-void
.end method
