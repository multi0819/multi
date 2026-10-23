.class public final synthetic Lkr/memorynotes/InkPage$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/InkPage;

.field public final synthetic f$1:Landroid/widget/Button;

.field public final synthetic f$2:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/InkPage;Landroid/widget/Button;Landroid/widget/TextView;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/InkPage$$ExternalSyntheticLambda1;->f$0:Lkr/memorynotes/InkPage;

    iput-object p2, p0, Lkr/memorynotes/InkPage$$ExternalSyntheticLambda1;->f$1:Landroid/widget/Button;

    iput-object p3, p0, Lkr/memorynotes/InkPage$$ExternalSyntheticLambda1;->f$2:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Lkr/memorynotes/InkPage$$ExternalSyntheticLambda1;->f$0:Lkr/memorynotes/InkPage;

    iget-object v1, p0, Lkr/memorynotes/InkPage$$ExternalSyntheticLambda1;->f$1:Landroid/widget/Button;

    iget-object v2, p0, Lkr/memorynotes/InkPage$$ExternalSyntheticLambda1;->f$2:Landroid/widget/TextView;

    invoke-static {v0, v1, v2, p1}, Lkr/memorynotes/InkPage;->lambda$1(Lkr/memorynotes/InkPage;Landroid/widget/Button;Landroid/widget/TextView;Landroid/view/View;)V

    return-void
.end method
