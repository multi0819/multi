.class Lkr/memorynotes/ReviewControls$1;
.super Ljava/lang/Object;
.source "ReviewControls.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/ReviewControls;->addHide(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$r:Lkr/memorynotes/ReviewScreen;


# direct methods
.method constructor <init>(Lkr/memorynotes/ReviewScreen;)V
    .registers 2

    .line 3
    iput-object p1, p0, Lkr/memorynotes/ReviewControls$1;->val$r:Lkr/memorynotes/ReviewScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 3
    iget-object v0, p0, Lkr/memorynotes/ReviewControls$1;->val$r:Lkr/memorynotes/ReviewScreen;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    iget-object v0, p0, Lkr/memorynotes/ReviewControls$1;->val$r:Lkr/memorynotes/ReviewScreen;

    invoke-virtual {v0}, Lkr/memorynotes/ReviewScreen;->show()V

    return-void
.end method
