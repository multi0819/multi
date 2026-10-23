.class public final synthetic Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/InkPage;

.field public final synthetic f$1:I

.field public final synthetic f$2:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/InkPage;I[Ljava/lang/Runnable;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda4;->f$0:Lkr/memorynotes/InkPage;

    iput p2, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda4;->f$1:I

    iput-object p3, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda4;->f$2:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda4;->f$0:Lkr/memorynotes/InkPage;

    iget v1, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda4;->f$1:I

    iget-object v2, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda4;->f$2:[Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, p1}, Lkr/memorynotes/InkToolbar;->lambda$3(Lkr/memorynotes/InkPage;I[Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
