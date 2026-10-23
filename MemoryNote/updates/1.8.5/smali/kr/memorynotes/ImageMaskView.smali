.class public Lkr/memorynotes/ImageMaskView;
.super Landroid/view/View;
.source "ImageMaskView.java"


# instance fields
.field final bitmap:Landroid/graphics/Bitmap;

.field dragging:Z

.field editing:Z

.field endX:F

.field endY:F

.field final fit:Landroid/graphics/RectF;

.field fitContentWidth:Z

.field hidden:Z

.field final image:Lorg/json/JSONObject;

.field lastX:F

.field lastY:F

.field final p:Landroid/graphics/Paint;

.field panX:F

.field panY:F

.field scale:Landroid/view/ScaleGestureDetector;

.field startX:F

.field startY:F

.field zoom:F


# direct methods
.method constructor <init>(Landroid/content/Context;Lorg/json/JSONObject;ZZ)V
    .registers 9

    .line 5
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 4
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lkr/memorynotes/ImageMaskView;->p:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lkr/memorynotes/ImageMaskView;->zoom:F

    const/4 v0, 0x0

    iput v0, p0, Lkr/memorynotes/ImageMaskView;->panX:F

    iput v0, p0, Lkr/memorynotes/ImageMaskView;->panY:F

    .line 5
    iput-object p2, p0, Lkr/memorynotes/ImageMaskView;->image:Lorg/json/JSONObject;

    iput-boolean p3, p0, Lkr/memorynotes/ImageMaskView;->hidden:Z

    iput-boolean p4, p0, Lkr/memorynotes/ImageMaskView;->editing:Z

    new-instance p3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "images"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v2, "file"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x1

    iput-boolean v0, p3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {p2, p3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    :goto_46
    iget v1, p3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v1, v0

    const/16 v2, 0x800

    if-gt v1, v2, :cond_74

    iget v1, p3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr v1, v0

    if-gt v1, v2, :cond_74

    iput v0, p3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/4 v0, 0x0

    iput-boolean v0, p3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {p2, p3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p2

    iput-object p2, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz p4, :cond_62

    const-string p2, "\uc0ac\uc9c4. \ub4dc\ub798\uadf8\ud558\uc5ec \uac00\ub9bc \uc601\uc5ed \uc9c0\uc815"

    goto :goto_64

    :cond_62
    const-string p2, "\ucca8\ubd80 \uc0ac\uc9c4. \ud655\ub300 \ud654\uba74\uc5d0\uc11c \ub450 \uc190\uac00\ub77d\uc73c\ub85c \ud655\ub300"

    :goto_64
    invoke-virtual {p0, p2}, Lkr/memorynotes/ImageMaskView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance p2, Landroid/view/ScaleGestureDetector;

    new-instance p3, Lkr/memorynotes/ImageMaskView$1;

    invoke-direct {p3, p0}, Lkr/memorynotes/ImageMaskView$1;-><init>(Lkr/memorynotes/ImageMaskView;)V

    invoke-direct {p2, p1, p3}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object p2, p0, Lkr/memorynotes/ImageMaskView;->scale:Landroid/view/ScaleGestureDetector;

    return-void

    :cond_74
    mul-int/lit8 v0, v0, 0x2

    goto :goto_46
.end method

.method static appendImages(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Lkr/memorynotes/Note;ZZ)V
    .registers 11

    .line 12
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p2, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_a

    return-void

    :cond_a
    iget-object v1, p2, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-nez v1, :cond_13

    :goto_12
    goto :goto_67

    :cond_13
    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p2, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lkr/memorynotes/InlineImageText;->files(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    const-string v3, "file"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3f

    goto :goto_12

    :cond_3f
    new-instance v2, Lkr/memorynotes/ImageMaskView;

    invoke-direct {v2, p0, v1, p3, p4}, Lkr/memorynotes/ImageMaskView;-><init>(Landroid/content/Context;Lorg/json/JSONObject;ZZ)V

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ink:image:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lkr/memorynotes/ImageMaskView;->setTag(Ljava/lang/Object;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x1

    iput-boolean v4, v2, Lkr/memorynotes/ImageMaskView;->fitContentWidth:Z

    const/4 v4, -0x2

    const/4 v5, -0x1

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_67
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1
.end method

.method static dialog(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;ZLjava/lang/Runnable;)V
    .registers 5

    .line 13
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lkr/memorynotes/ImageMaskView;->dialog(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;ZLjava/lang/Runnable;Z)V

    return-void
.end method

.method static dialog(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;ZLjava/lang/Runnable;Z)V
    .registers 11

    .line 14
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v4, 0x41000000    # 8.0f

    invoke-virtual {v3, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v1, Lkr/memorynotes/ImageMaskView;

    invoke-direct {v1, p0, p1, p4, p2}, Lkr/memorynotes/ImageMaskView;-><init>(Landroid/content/Context;Lorg/json/JSONObject;ZZ)V

    iget-object p4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    if-eqz p2, :cond_31

    const-string v2, "\uac00\ub9b4 \uacf3\uc744 \uc190\uac00\ub77d\uc73c\ub85c \ub4dc\ub798\uadf8\ud558\uc138\uc694."

    goto :goto_33

    :cond_31
    const-string v2, "\ub450 \uc190\uac00\ub77d\uc73c\ub85c \ud655\ub300 \u00b7 \ud55c \uc190\uac00\ub77d\uc73c\ub85c \uc774\ub3d9"

    :goto_33
    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v3, v3, Lkr/memorynotes/Ui;->muted:I

    const/16 v4, 0xe

    invoke-virtual {p4, v2, v4, v3}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p4

    invoke-virtual {v0, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p4, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v3, 0x43be0000    # 380.0f

    invoke-virtual {v2, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    const/4 v3, -0x1

    invoke-direct {p4, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    if-eqz p2, :cond_73

    iget-object p4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda3;

    invoke-direct {v2, p1, v1}, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda3;-><init>(Lorg/json/JSONObject;Lkr/memorynotes/ImageMaskView;)V

    const-string v3, "\ub9c8\uc9c0\ub9c9 \uac00\ub9bc \uc9c0\uc6b0\uae30"

    invoke-virtual {p4, v3, v2}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p4

    invoke-virtual {v0, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, p1, v1}, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda4;-><init>(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;Lkr/memorynotes/ImageMaskView;)V

    const-string p1, "\ubaa8\ub4e0 \uac00\ub9bc \uc9c0\uc6b0\uae30"

    invoke-virtual {p4, p1, v2}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_73
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-eqz p2, :cond_7d

    const-string p0, "\uc0ac\uc9c4 \uac00\ub9bc \uc124\uc815"

    goto :goto_7f

    :cond_7d
    const-string p0, "\uc0ac\uc9c4 \ud655\ub300"

    :goto_7f
    invoke-virtual {p1, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance p1, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda5;

    invoke-direct {p1, p3}, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda5;-><init>(Ljava/lang/Runnable;)V

    const-string p2, "\uc644\ub8cc"

    invoke-virtual {p0, p2, p1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    new-instance p1, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda6;

    invoke-direct {p1, p3}, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda6;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method static hasSeparateImages(Lkr/memorynotes/Note;)Z
    .registers 6

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkr/memorynotes/InlineImageText;->files(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_21
    iget-object v3, p0, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v2, v3, :cond_2a

    return v1

    :cond_2a
    iget-object v3, p0, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_40

    const-string v4, "file"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_40

    const/4 p0, 0x1

    return p0

    :cond_40
    add-int/lit8 v2, v2, 0x1

    goto :goto_21
.end method

.method static importImage(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "images"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_20

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-eqz v1, :cond_18

    goto :goto_20

    :cond_18
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\uc0ac\uc9c4 \uc800\uc7a5 \uacf5\uac04\uc744 \ub9cc\ub4e4 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_20
    :goto_20
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".img"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v3, 0x0

    :try_start_3e
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_46
    .catchall {:try_start_3e .. :try_end_46} :catchall_ba

    :try_start_46
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_4b
    .catchall {:try_start_46 .. :try_end_4b} :catchall_aa

    if-eqz p0, :cond_9e

    const v4, 0x8000

    :try_start_50
    new-array v4, v4, [B

    const-wide/16 v5, 0x0

    :goto_54
    invoke-virtual {p0, v4}, Ljava/io/InputStream;->read([B)I

    move-result v7
    :try_end_58
    .catchall {:try_start_50 .. :try_end_58} :catchall_9b

    const/4 v8, -0x1

    if-ne v7, v8, :cond_86

    const/4 v0, 0x1

    :try_start_5c
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_5f
    .catchall {:try_start_5c .. :try_end_5f} :catchall_aa

    if-eqz p0, :cond_64

    :try_start_61
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_64
    .catchall {:try_start_61 .. :try_end_64} :catchall_ba

    :cond_64
    new-instance p0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-boolean v0, p0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget p1, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez p1, :cond_7b

    iget p0, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez p0, :cond_7b

    return-object v1

    :cond_7b
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    new-instance p0, Ljava/io/IOException;

    const-string p1, "\uc9c0\uc6d0\ud558\uc9c0 \uc54a\ub294 \uc0ac\uc9c4 \ud615\uc2dd\uc785\ub2c8\ub2e4"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_86
    int-to-long v8, v7

    add-long/2addr v5, v8

    const-wide/32 v8, 0x1900000

    cmp-long v8, v5, v8

    if-gtz v8, :cond_93

    :try_start_8f
    invoke-virtual {p1, v4, v0, v7}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_54

    :cond_93
    new-instance v1, Ljava/io/IOException;

    const-string v3, "\uc0ac\uc9c4\uc740 \ud55c \uc7a5\ub2f9 25MB\uae4c\uc9c0 \ucca8\ubd80\ud560 \uc218 \uc788\uc2b5\ub2c8\ub2e4"

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_9a
    throw v1

    :catchall_9b
    move-exception v1

    move-object v3, v1

    goto :goto_a6

    :cond_9e
    new-instance v1, Ljava/io/IOException;

    const-string v3, "\uc0ac\uc9c4\uc744 \uc5f4 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4"

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_a5
    .catchall {:try_start_8f .. :try_end_a5} :catchall_9b

    goto :goto_9a

    :goto_a6
    :try_start_a6
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    throw v3
    :try_end_aa
    .catchall {:try_start_a6 .. :try_end_aa} :catchall_aa

    :catchall_aa
    move-exception p1

    if-nez v3, :cond_af

    move-object v3, p1

    goto :goto_b4

    :cond_af
    if-eq v3, p1, :cond_b4

    :try_start_b1
    invoke-virtual {v3, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_b4
    :goto_b4
    if-eqz p0, :cond_b9

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_b9
    throw v3
    :try_end_ba
    .catchall {:try_start_b1 .. :try_end_ba} :catchall_ba

    :catchall_ba
    move-exception p0

    if-eqz v3, :cond_c3

    if-eq v3, p0, :cond_c2

    :try_start_bf
    invoke-virtual {v3, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_c2
    move-object p0, v3

    :cond_c3
    throw p0
    :try_end_c4
    .catchall {:try_start_bf .. :try_end_c4} :catchall_c4

    :catchall_c4
    move-exception p0

    if-nez v0, :cond_ca

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    :cond_ca
    throw p0
.end method

.method static synthetic lambda$0(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;Z)V
    .registers 5

    .line 12
    new-instance v0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda0;-><init>()V

    const/4 v1, 0x0

    invoke-static {p0, p1, v1, v0, p2}, Lkr/memorynotes/ImageMaskView;->dialog(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;ZLjava/lang/Runnable;Z)V

    return-void
.end method

.method static synthetic lambda$1()V
    .registers 0

    .line 12
    return-void
.end method

.method static synthetic lambda$2(Lorg/json/JSONObject;Lkr/memorynotes/ImageMaskView;)V
    .registers 3

    .line 14
    const-string v0, "masks"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-eqz p0, :cond_17

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_17

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    :cond_17
    invoke-virtual {p1}, Lkr/memorynotes/ImageMaskView;->invalidate()V

    return-void
.end method

.method static synthetic lambda$3(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;Lkr/memorynotes/ImageMaskView;)V
    .registers 5

    .line 14
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v1, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1, p2, p0}, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda1;-><init>(Lorg/json/JSONObject;Lkr/memorynotes/ImageMaskView;Lkr/memorynotes/MainActivity;)V

    const-string p0, "\uac00\ub9bc \uc9c0\uc6b0\uae30"

    const-string p1, "\uc774 \uc0ac\uc9c4\uc758 \ubaa8\ub4e0 \uac00\ub9bc \uc601\uc5ed\uc744 \uc9c0\uc6b8\uae4c\uc694?"

    invoke-virtual {v0, p0, p1, v1}, Lkr/memorynotes/Ui;->confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$4(Lorg/json/JSONObject;Lkr/memorynotes/ImageMaskView;Lkr/memorynotes/MainActivity;)V
    .registers 5

    .line 14
    :try_start_0
    const-string v0, "masks"

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {p1}, Lkr/memorynotes/ImageMaskView;->invalidate()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    goto :goto_12

    :catch_e
    move-exception p0

    invoke-virtual {p2, p0}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_12
    return-void
.end method

.method static synthetic lambda$5(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$6(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .registers 2

    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method


# virtual methods
.method clamp(FFF)F
    .registers 4

    .line 9
    invoke-static {p1, p3}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    return p1
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 10

    .line 7
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_22

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->p:Landroid/graphics/Paint;

    const v1, -0x777778

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x42000000    # 32.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    const/high16 v0, 0x42480000    # 50.0f

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->p:Landroid/graphics/Paint;

    const-string v2, "\uc0ac\uc9c4\uc744 \ubd88\ub7ec\uc62c \uc218 \uc5c6\uc2b5\ub2c8\ub2e4"

    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {p1, v2, v3, v0, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void

    :cond_22
    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v0

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v1

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->getHeight()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v2

    div-float/2addr v5, v4

    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->getWidth()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v6, v1

    div-float/2addr v6, v4

    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v1, v2

    div-float/2addr v1, v4

    invoke-virtual {v0, v3, v5, v6, v1}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-boolean v0, p0, Lkr/memorynotes/ImageMaskView;->editing:Z

    if-nez v0, :cond_94

    iget v0, p0, Lkr/memorynotes/ImageMaskView;->panX:F

    iget v1, p0, Lkr/memorynotes/ImageMaskView;->panY:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget v0, p0, Lkr/memorynotes/ImageMaskView;->zoom:F

    iget v1, p0, Lkr/memorynotes/ImageMaskView;->zoom:F

    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v4

    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v4

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_94
    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->p:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->image:Lorg/json/JSONObject;

    const-string v1, "masks"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_dd

    iget-boolean v1, p0, Lkr/memorynotes/ImageMaskView;->hidden:Z

    if-nez v1, :cond_b0

    iget-boolean v1, p0, Lkr/memorynotes/ImageMaskView;->editing:Z

    if-eqz v1, :cond_dd

    :cond_b0
    const/4 v1, 0x0

    :goto_b1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v1, v2, :cond_b8

    goto :goto_dd

    :cond_b8
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object v2

    if-nez v2, :cond_bf

    goto :goto_da

    :cond_bf
    iget-object v3, p0, Lkr/memorynotes/ImageMaskView;->p:Landroid/graphics/Paint;

    iget-boolean v4, p0, Lkr/memorynotes/ImageMaskView;->editing:Z

    if-eqz v4, :cond_c9

    const v4, -0x66da8699

    goto :goto_cc

    :cond_c9
    const v4, -0xdfc4ce

    :goto_cc
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0, v2}, Lkr/memorynotes/ImageMaskView;->rect(Lorg/json/JSONArray;)Landroid/graphics/RectF;

    move-result-object v2

    iget-object v3, p0, Lkr/memorynotes/ImageMaskView;->p:Landroid/graphics/Paint;

    const/high16 v4, 0x40e00000    # 7.0f

    invoke-virtual {p1, v2, v4, v4, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :goto_da
    add-int/lit8 v1, v1, 0x1

    goto :goto_b1

    :cond_dd
    :goto_dd
    iget-boolean v0, p0, Lkr/memorynotes/ImageMaskView;->dragging:Z

    if-eqz v0, :cond_10f

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->p:Landroid/graphics/Paint;

    const v1, -0x55da8699

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget v0, p0, Lkr/memorynotes/ImageMaskView;->startX:F

    iget v1, p0, Lkr/memorynotes/ImageMaskView;->endX:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iget v0, p0, Lkr/memorynotes/ImageMaskView;->startY:F

    iget v1, p0, Lkr/memorynotes/ImageMaskView;->endY:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v4

    iget v0, p0, Lkr/memorynotes/ImageMaskView;->startX:F

    iget v1, p0, Lkr/memorynotes/ImageMaskView;->endX:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v5

    iget v0, p0, Lkr/memorynotes/ImageMaskView;->startY:F

    iget v1, p0, Lkr/memorynotes/ImageMaskView;->endY:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iget-object v7, p0, Lkr/memorynotes/ImageMaskView;->p:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_10f
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method protected onMeasure(II)V
    .registers 7

    .line 6
    iget-boolean v0, p0, Lkr/memorynotes/ImageMaskView;->fitContentWidth:Z

    if-eqz v0, :cond_35

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_35

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-eqz v0, :cond_35

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-double v0, v0

    int-to-double v2, p1

    mul-double/2addr v0, v2

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-double v2, v2

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v0, p2}, Lkr/memorynotes/ImageMaskView;->resolveSize(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lkr/memorynotes/ImageMaskView;->setMeasuredDimension(II)V

    goto :goto_38

    :cond_35
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    :goto_38
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    iget-boolean v0, p0, Lkr/memorynotes/ImageMaskView;->editing:Z

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 10
    :cond_6
    const-string v0, "masks"

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    if-nez v1, :cond_e

    return v2

    :cond_e
    iget-boolean v1, p0, Lkr/memorynotes/ImageMaskView;->editing:Z

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-nez v1, :cond_6a

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->scale:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_2c

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lkr/memorynotes/ImageMaskView;->lastX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lkr/memorynotes/ImageMaskView;->lastY:F

    return v4

    :cond_2c
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v3, :cond_69

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->scale:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v0

    if-nez v0, :cond_69

    iget v0, p0, Lkr/memorynotes/ImageMaskView;->zoom:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_5a

    iget v0, p0, Lkr/memorynotes/ImageMaskView;->panX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iget v2, p0, Lkr/memorynotes/ImageMaskView;->lastX:F

    sub-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lkr/memorynotes/ImageMaskView;->panX:F

    iget v0, p0, Lkr/memorynotes/ImageMaskView;->panY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget v2, p0, Lkr/memorynotes/ImageMaskView;->lastY:F

    sub-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lkr/memorynotes/ImageMaskView;->panY:F

    :cond_5a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lkr/memorynotes/ImageMaskView;->lastX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lkr/memorynotes/ImageMaskView;->lastY:F

    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->invalidate()V

    :cond_69
    return v4

    :cond_6a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_9b

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v0, v1, v3}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-nez v0, :cond_81

    return v2

    :cond_81
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lkr/memorynotes/ImageMaskView;->endX:F

    iput v0, p0, Lkr/memorynotes/ImageMaskView;->startX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lkr/memorynotes/ImageMaskView;->endY:F

    iput p1, p0, Lkr/memorynotes/ImageMaskView;->startY:F

    iput-boolean v4, p0, Lkr/memorynotes/ImageMaskView;->dragging:Z

    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return v4

    :cond_9b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-ne v1, v3, :cond_cd

    iget-boolean v1, p0, Lkr/memorynotes/ImageMaskView;->dragging:Z

    if-eqz v1, :cond_cd

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0, v0, v1, v2}, Lkr/memorynotes/ImageMaskView;->clamp(FFF)F

    move-result v0

    iput v0, p0, Lkr/memorynotes/ImageMaskView;->endX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget-object v0, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, p1, v0, v1}, Lkr/memorynotes/ImageMaskView;->clamp(FFF)F

    move-result p1

    iput p1, p0, Lkr/memorynotes/ImageMaskView;->endY:F

    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->invalidate()V

    return v4

    :cond_cd
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-eq v1, v4, :cond_da

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v3, 0x3

    if-ne v1, v3, :cond_18d

    :cond_da
    iget-boolean v1, p0, Lkr/memorynotes/ImageMaskView;->dragging:Z

    if-eqz v1, :cond_18d

    iput-boolean v2, p0, Lkr/memorynotes/ImageMaskView;->dragging:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne p1, v4, :cond_18a

    iget p1, p0, Lkr/memorynotes/ImageMaskView;->endX:F

    iget v1, p0, Lkr/memorynotes/ImageMaskView;->startX:F

    sub-float/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 v1, 0x41400000    # 12.0f

    cmpl-float p1, p1, v1

    if-lez p1, :cond_18a

    iget p1, p0, Lkr/memorynotes/ImageMaskView;->endY:F

    iget v2, p0, Lkr/memorynotes/ImageMaskView;->startY:F

    sub-float/2addr p1, v2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpl-float p1, p1, v1

    if-lez p1, :cond_18a

    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    :try_start_107
    iget v1, p0, Lkr/memorynotes/ImageMaskView;->startX:F

    iget v2, p0, Lkr/memorynotes/ImageMaskView;->endX:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v2

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v1, v2

    float-to-double v1, v1

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    iget v1, p0, Lkr/memorynotes/ImageMaskView;->startY:F

    iget v2, p0, Lkr/memorynotes/ImageMaskView;->endY:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v1, v2

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v1, v2

    float-to-double v1, v1

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    iget v1, p0, Lkr/memorynotes/ImageMaskView;->startX:F

    iget v2, p0, Lkr/memorynotes/ImageMaskView;->endX:F

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v2

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v1, v2

    float-to-double v1, v1

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    iget v1, p0, Lkr/memorynotes/ImageMaskView;->startY:F

    iget v2, p0, Lkr/memorynotes/ImageMaskView;->endY:F

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v1, v2

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v1, v2

    float-to-double v1, v1

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->image:Lorg/json/JSONObject;

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-nez v1, :cond_179

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->image:Lorg/json/JSONObject;

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_179
    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->image:Lorg/json/JSONObject;

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_182
    .catch Ljava/lang/Exception; {:try_start_107 .. :try_end_182} :catch_183

    goto :goto_18a

    :catch_183
    move-exception p1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_18a
    :goto_18a
    invoke-virtual {p0}, Lkr/memorynotes/ImageMaskView;->invalidate()V

    :cond_18d
    return v4
.end method

.method rect(Lorg/json/JSONArray;)Landroid/graphics/RectF;
    .registers 9

    .line 8
    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v2

    double-to-float v2, v2

    iget-object v3, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v3

    double-to-float v3, v3

    iget-object v4, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    iget-object v3, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v4

    double-to-float v4, v4

    iget-object v5, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    iget-object v4, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    const/4 v5, 0x3

    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v5

    double-to-float p1, v5

    iget-object v5, p0, Lkr/memorynotes/ImageMaskView;->fit:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    mul-float/2addr p1, v5

    add-float/2addr v4, p1

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method
