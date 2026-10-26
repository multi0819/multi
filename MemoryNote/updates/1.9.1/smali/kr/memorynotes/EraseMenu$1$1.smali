.class Lkr/memorynotes/EraseMenu$1$1;
.super Ljava/lang/Object;
.source "EraseMenu.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/EraseMenu$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/EraseMenu$1;


# direct methods
.method constructor <init>(Lkr/memorynotes/EraseMenu$1;)V
    .locals 0

    .line 10
    iput-object p1, p0, Lkr/memorynotes/EraseMenu$1$1;->this$0:Lkr/memorynotes/EraseMenu$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 10
    iget-object v0, p0, Lkr/memorynotes/EraseMenu$1$1;->this$0:Lkr/memorynotes/EraseMenu$1;

    iget-object v0, v0, Lkr/memorynotes/EraseMenu$1;->val$ink:Lkr/memorynotes/InkPage;

    invoke-virtual {v0}, Lkr/memorynotes/InkPage;->clear()V

    return-void
.end method
