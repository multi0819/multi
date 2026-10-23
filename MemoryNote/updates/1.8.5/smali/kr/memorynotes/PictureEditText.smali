.class public Lkr/memorynotes/PictureEditText;
.super Landroid/widget/EditText;
.source "PictureEditText.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkr/memorynotes/PictureEditText$Receiver;
    }
.end annotation


# instance fields
.field receiver:Lkr/memorynotes/PictureEditText$Receiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 7
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic lambda$0()V
    .registers 0

    .line 9
    return-void
.end method


# virtual methods
.method image(Landroid/net/Uri;)Z
    .registers 5

    .line 8
    const/4 v0, 0x0

    if-eqz p1, :cond_2a

    const-string v1, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    goto :goto_2a

    :cond_10
    :try_start_10
    invoke-virtual {p0}, Lkr/memorynotes/PictureEditText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_28

    const-string v1, "image/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_24} :catch_29

    if-eqz p1, :cond_28

    const/4 p1, 0x1

    return p1

    :cond_28
    return v0

    :catch_29
    move-exception p1

    :cond_2a
    :goto_2a
    return v0
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 4

    .line 11
    invoke-super {p0, p1}, Landroid/widget/EditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/PictureEditText;->receiver:Lkr/memorynotes/PictureEditText$Receiver;

    if-eqz v1, :cond_10

    const-string v1, "image/*"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Landroid/view/inputmethod/EditorInfo;->contentMimeTypes:[Ljava/lang/String;

    :cond_10
    if-nez v0, :cond_14

    const/4 p1, 0x0

    return-object p1

    :cond_14
    new-instance p1, Lkr/memorynotes/PictureEditText$1;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v0, v1}, Lkr/memorynotes/PictureEditText$1;-><init>(Lkr/memorynotes/PictureEditText;Landroid/view/inputmethod/InputConnection;Z)V

    return-object p1
.end method

.method public onTextContextMenuItem(I)Z
    .registers 3

    .line 10
    const v0, 0x1020022

    if-eq p1, v0, :cond_a

    const v0, 0x1020031

    if-ne p1, v0, :cond_12

    :cond_a
    invoke-virtual {p0}, Lkr/memorynotes/PictureEditText;->pastePicture()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 p1, 0x1

    return p1

    :cond_12
    invoke-super {p0, p1}, Landroid/widget/EditText;->onTextContextMenuItem(I)Z

    move-result p1

    return p1
.end method

.method pastePicture()Z
    .registers 8

    .line 9
    invoke-virtual {p0}, Lkr/memorynotes/PictureEditText;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    invoke-virtual {v0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_65

    iget-object v2, p0, Lkr/memorynotes/PictureEditText;->receiver:Lkr/memorynotes/PictureEditText$Receiver;

    if-nez v2, :cond_18

    goto :goto_65

    :cond_18
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move v3, v1

    :goto_1e
    invoke-virtual {v0}, Landroid/content/ClipData;->getItemCount()I

    move-result v4

    if-lt v3, v4, :cond_37

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2b

    return v1

    :cond_2b
    iget-object v0, p0, Lkr/memorynotes/PictureEditText;->receiver:Lkr/memorynotes/PictureEditText$Receiver;

    new-instance v1, Lkr/memorynotes/PictureEditText$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lkr/memorynotes/PictureEditText$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v0, v2, v1}, Lkr/memorynotes/PictureEditText$Receiver;->receive(Ljava/util/List;Ljava/lang/Runnable;)V

    const/4 v0, 0x1

    return v0

    :cond_37
    invoke-virtual {v0, v3}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4}, Lkr/memorynotes/PictureEditText;->image(Landroid/net/Uri;)Z

    move-result v5

    if-nez v5, :cond_5f

    if-eqz v4, :cond_62

    const-string v5, "content"

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_62

    invoke-virtual {v0}, Landroid/content/ClipData;->getDescription()Landroid/content/ClipDescription;

    move-result-object v5

    const-string v6, "image/*"

    invoke-virtual {v5, v6}, Landroid/content/ClipDescription;->hasMimeType(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_62

    :cond_5f
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_62
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    :cond_65
    :goto_65
    return v1
.end method
