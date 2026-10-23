.class public final synthetic Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/MainActivity;

.field public final synthetic f$1:Lkr/memorynotes/InkPage;

.field public final synthetic f$2:Lkr/memorynotes/Ui;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/InkPage;Lkr/memorynotes/Ui;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda7;->f$0:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda7;->f$1:Lkr/memorynotes/InkPage;

    iput-object p3, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda7;->f$2:Lkr/memorynotes/Ui;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda7;->f$0:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda7;->f$1:Lkr/memorynotes/InkPage;

    iget-object v2, p0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda7;->f$2:Lkr/memorynotes/Ui;

    invoke-static {v0, v1, v2}, Lkr/memorynotes/InkToolbar;->lambda$6(Lkr/memorynotes/MainActivity;Lkr/memorynotes/InkPage;Lkr/memorynotes/Ui;)V

    return-void
.end method
