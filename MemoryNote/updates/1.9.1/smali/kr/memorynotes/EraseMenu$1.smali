.class Lkr/memorynotes/EraseMenu$1;
.super Ljava/lang/Object;
.source "EraseMenu.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/EraseMenu;->show(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Lkr/memorynotes/MainActivity;

.field final synthetic val$ink:Lkr/memorynotes/InkPage;

.field final synthetic val$refresh:[Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;Lkr/memorynotes/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 7
    iput-object p1, p0, Lkr/memorynotes/EraseMenu$1;->val$ink:Lkr/memorynotes/InkPage;

    iput-object p2, p0, Lkr/memorynotes/EraseMenu$1;->val$refresh:[Ljava/lang/Runnable;

    iput-object p3, p0, Lkr/memorynotes/EraseMenu$1;->val$a:Lkr/memorynotes/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 9
    const/4 p1, 0x1

    if-nez p2, :cond_0

    iget-object p2, p0, Lkr/memorynotes/EraseMenu$1;->val$ink:Lkr/memorynotes/InkPage;

    iput-boolean p1, p2, Lkr/memorynotes/InkPage;->enabled:Z

    iget-object p2, p0, Lkr/memorynotes/EraseMenu$1;->val$ink:Lkr/memorynotes/InkPage;

    iput-boolean p1, p2, Lkr/memorynotes/InkPage;->eraser:Z

    iget-object p1, p0, Lkr/memorynotes/EraseMenu$1;->val$refresh:[Ljava/lang/Runnable;

    const/4 p2, 0x0

    aget-object p1, p1, p2

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 10
    :cond_0
    if-ne p2, p1, :cond_1

    iget-object p1, p0, Lkr/memorynotes/EraseMenu$1;->val$a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance p2, Lkr/memorynotes/EraseMenu$1$1;

    invoke-direct {p2, p0}, Lkr/memorynotes/EraseMenu$1$1;-><init>(Lkr/memorynotes/EraseMenu$1;)V

    const-string v0, "\ud544\uae30 \uc804\uccb4 \uc9c0\uc6b0\uae30"

    const-string v1, "\ud604\uc7ac \ub178\ud2b8\uc758 \ud544\uae30\ub97c \ubaa8\ub450 \uc9c0\uc6b8\uae4c\uc694? \uae00\uacfc \uc0ac\uc9c4\uc740 \uc720\uc9c0\ub429\ub2c8\ub2e4. \uc2e4\ud589 \ucde8\uc18c\ub85c \ub418\ub3cc\ub9b4 \uc218 \uc788\uc2b5\ub2c8\ub2e4."

    invoke-virtual {p1, v0, v1, p2}, Lkr/memorynotes/Ui;->confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 11
    :cond_1
    :goto_0
    return-void
.end method
