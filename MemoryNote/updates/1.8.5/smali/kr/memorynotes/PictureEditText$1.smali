.class Lkr/memorynotes/PictureEditText$1;
.super Landroid/view/inputmethod/InputConnectionWrapper;
.source "PictureEditText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/PictureEditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/PictureEditText;


# direct methods
.method constructor <init>(Lkr/memorynotes/PictureEditText;Landroid/view/inputmethod/InputConnection;Z)V
    .registers 4

    .line 11
    iput-object p1, p0, Lkr/memorynotes/PictureEditText$1;->this$0:Lkr/memorynotes/PictureEditText;

    invoke-direct {p0, p2, p3}, Landroid/view/inputmethod/InputConnectionWrapper;-><init>(Landroid/view/inputmethod/InputConnection;Z)V

    return-void
.end method

.method static synthetic lambda$0(ZLandroid/view/inputmethod/InputContentInfo;)V
    .registers 2

    .line 11
    if-eqz p0, :cond_5

    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->releasePermission()V

    :cond_5
    return-void
.end method


# virtual methods
.method public commitContent(Landroid/view/inputmethod/InputContentInfo;ILandroid/os/Bundle;)Z
    .registers 8

    .line 11
    const/4 p3, 0x0

    if-eqz p1, :cond_3f

    iget-object v0, p0, Lkr/memorynotes/PictureEditText$1;->this$0:Lkr/memorynotes/PictureEditText;

    iget-object v0, v0, Lkr/memorynotes/PictureEditText;->receiver:Lkr/memorynotes/PictureEditText$Receiver;

    if-eqz v0, :cond_3f

    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->getDescription()Landroid/content/ClipDescription;

    move-result-object v0

    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/ClipDescription;->hasMimeType(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_16

    goto :goto_3f

    :cond_16
    const/4 v0, 0x1

    and-int/2addr p2, v0

    if-eqz p2, :cond_1c

    move p2, v0

    goto :goto_1d

    :cond_1c
    move p2, p3

    :goto_1d
    if-eqz p2, :cond_22

    :try_start_1f
    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->requestPermission()V

    :cond_22
    iget-object v1, p0, Lkr/memorynotes/PictureEditText$1;->this$0:Lkr/memorynotes/PictureEditText;

    iget-object v1, v1, Lkr/memorynotes/PictureEditText;->receiver:Lkr/memorynotes/PictureEditText$Receiver;

    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->getContentUri()Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    new-instance v3, Lkr/memorynotes/PictureEditText$1$$ExternalSyntheticLambda0;

    invoke-direct {v3, p2, p1}, Lkr/memorynotes/PictureEditText$1$$ExternalSyntheticLambda0;-><init>(ZLandroid/view/inputmethod/InputContentInfo;)V

    invoke-interface {v1, v2, v3}, Lkr/memorynotes/PictureEditText$Receiver;->receive(Ljava/util/List;Ljava/lang/Runnable;)V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_36} :catch_37

    return v0

    :catch_37
    move-exception v0

    if-eqz p2, :cond_3f

    :try_start_3a
    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->releasePermission()V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3d} :catch_3e

    goto :goto_3f

    :catch_3e
    move-exception p1

    :cond_3f
    :goto_3f
    return p3
.end method
