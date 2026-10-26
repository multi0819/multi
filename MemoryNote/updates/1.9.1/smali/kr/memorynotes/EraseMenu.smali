.class public final Lkr/memorynotes/EraseMenu;
.super Ljava/lang/Object;
.source "EraseMenu.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static show(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V
    .locals 4

    .line 6
    iget-object v0, p0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    .line 7
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\ud544\uae30 \uc9c0\uc6b0\uae30"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\uc9c0\uc6b0\uac1c\ub85c \uc9c0\uc6b0\uae30"

    const-string v3, "\ud544\uae30 \uc804\uccb4 \uc9c0\uc6b0\uae30"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lkr/memorynotes/EraseMenu$1;

    invoke-direct {v3, p0, p1, v0}, Lkr/memorynotes/EraseMenu$1;-><init>(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;Lkr/memorynotes/MainActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 13
    return-void
.end method
