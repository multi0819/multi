.class Lkr/memorynotes/DetailLayout$1;
.super Ljava/lang/Object;
.source "DetailLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/DetailLayout;->build(Lkr/memorynotes/Note;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/DetailLayout;


# direct methods
.method constructor <init>(Lkr/memorynotes/DetailLayout;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lkr/memorynotes/DetailLayout$1;->this$0:Lkr/memorynotes/DetailLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 31
    iget-object v0, p0, Lkr/memorynotes/DetailLayout$1;->this$0:Lkr/memorynotes/DetailLayout;

    iget-object v0, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lkr/memorynotes/DetailLayout$1;->this$0:Lkr/memorynotes/DetailLayout;

    iget-object v0, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method
