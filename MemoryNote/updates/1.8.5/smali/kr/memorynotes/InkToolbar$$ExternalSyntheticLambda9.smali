.class public final synthetic Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/InkPage;

.field public final synthetic f$1:Lkr/memorynotes/Ui;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/InkPage;Lkr/memorynotes/Ui;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda9;->f$0:Lkr/memorynotes/InkPage;

    iput-object p2, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda9;->f$1:Lkr/memorynotes/Ui;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda9;->f$0:Lkr/memorynotes/InkPage;

    iget-object v1, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda9;->f$1:Lkr/memorynotes/Ui;

    invoke-static {v0, v1, p1, p2}, Lkr/memorynotes/InkToolbar;->lambda$7(Lkr/memorynotes/InkPage;Lkr/memorynotes/Ui;Landroid/content/DialogInterface;I)V

    return-void
.end method
