.class Lkr/memorynotes/Dashboard$Thumbnail;
.super Landroid/view/View;
.source "Dashboard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/Dashboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Thumbnail"
.end annotation


# instance fields
.field final b:Landroid/graphics/Bitmap;

.field final image:Lorg/json/JSONObject;

.field final p:Landroid/graphics/Paint;

.field final u:Lkr/memorynotes/Ui;


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;Lkr/memorynotes/Ui;)V
    .registers 7

    .line 51
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lkr/memorynotes/Dashboard$Thumbnail;->p:Landroid/graphics/Paint;

    iput-object p2, p0, Lkr/memorynotes/Dashboard$Thumbnail;->image:Lorg/json/JSONObject;

    iput-object p3, p0, Lkr/memorynotes/Dashboard$Thumbnail;->u:Lkr/memorynotes/Ui;

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Lkr/memorynotes/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object p1

    const-string v2, "images"

    invoke-direct {v1, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string p1, "file"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    :goto_34
    iput v0, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iget v0, p2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v1, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v0, v1

    const/16 v1, 0xa0

    if-gt v0, v1, :cond_60

    iget v0, p2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v2, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v0, v2

    if-gt v0, v1, :cond_60

    const/4 v0, 0x0

    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lkr/memorynotes/Dashboard$Thumbnail;->b:Landroid/graphics/Bitmap;

    const-string p1, "\ucca8\ubd80 \uc0ac\uc9c4 \ubbf8\ub9ac\ubcf4\uae30"

    invoke-virtual {p0, p1}, Lkr/memorynotes/Dashboard$Thumbnail;->setContentDescription(Ljava/lang/CharSequence;)V

    iget p1, p3, Lkr/memorynotes/Ui;->bg:I

    const/16 p2, 0xa

    invoke-virtual {p3, p1, p2}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/Dashboard$Thumbnail;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_60
    iget v0, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    mul-int/lit8 v0, v0, 0x2

    goto :goto_34
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 18

    .line 51
    move-object/from16 v0, p0

    iget-object v1, v0, Lkr/memorynotes/Dashboard$Thumbnail;->b:Landroid/graphics/Bitmap;

    if-nez v1, :cond_7

    return-void

    :cond_7
    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/Dashboard$Thumbnail;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, v0, Lkr/memorynotes/Dashboard$Thumbnail;->b:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/Dashboard$Thumbnail;->getHeight()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, v0, Lkr/memorynotes/Dashboard$Thumbnail;->b:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, v0, Lkr/memorynotes/Dashboard$Thumbnail;->b:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v1

    iget-object v3, v0, Lkr/memorynotes/Dashboard$Thumbnail;->b:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v1

    new-instance v1, Landroid/graphics/RectF;

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/Dashboard$Thumbnail;->getWidth()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v2

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/Dashboard$Thumbnail;->getHeight()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v6, v3

    div-float/2addr v6, v5

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/Dashboard$Thumbnail;->getWidth()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v7, v2

    div-float/2addr v7, v5

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/Dashboard$Thumbnail;->getHeight()I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v8, v3

    div-float/2addr v8, v5

    invoke-direct {v1, v4, v6, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object v4, v0, Lkr/memorynotes/Dashboard$Thumbnail;->p:Landroid/graphics/Paint;

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v4, v0, Lkr/memorynotes/Dashboard$Thumbnail;->b:Landroid/graphics/Bitmap;

    const/4 v5, 0x0

    iget-object v6, v0, Lkr/memorynotes/Dashboard$Thumbnail;->p:Landroid/graphics/Paint;

    move-object/from16 v13, p1

    invoke-virtual {v13, v4, v5, v1, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    iget-object v4, v0, Lkr/memorynotes/Dashboard$Thumbnail;->image:Lorg/json/JSONObject;

    const-string v5, "masks"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    if-eqz v4, :cond_bb

    const/4 v5, 0x0

    move v6, v5

    :goto_74
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lt v6, v7, :cond_7b

    goto :goto_bb

    :cond_7b
    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object v7

    if-eqz v7, :cond_b8

    iget-object v8, v0, Lkr/memorynotes/Dashboard$Thumbnail;->p:Landroid/graphics/Paint;

    iget-object v9, v0, Lkr/memorynotes/Dashboard$Thumbnail;->u:Lkr/memorynotes/Ui;

    iget v9, v9, Lkr/memorynotes/Ui;->ink:I

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    iget v8, v1, Landroid/graphics/RectF;->left:F

    invoke-virtual {v7, v5}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v9

    double-to-float v9, v9

    mul-float/2addr v9, v2

    add-float/2addr v8, v9

    iget v9, v1, Landroid/graphics/RectF;->top:F

    const/4 v10, 0x1

    invoke-virtual {v7, v10}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v10

    double-to-float v10, v10

    mul-float/2addr v10, v3

    add-float/2addr v9, v10

    iget v10, v1, Landroid/graphics/RectF;->left:F

    const/4 v11, 0x2

    invoke-virtual {v7, v11}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v11

    double-to-float v11, v11

    mul-float/2addr v11, v2

    add-float/2addr v10, v11

    iget v11, v1, Landroid/graphics/RectF;->top:F

    const/4 v12, 0x3

    invoke-virtual {v7, v12}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v14

    double-to-float v7, v14

    mul-float/2addr v7, v3

    add-float/2addr v11, v7

    iget-object v12, v0, Lkr/memorynotes/Dashboard$Thumbnail;->p:Landroid/graphics/Paint;

    move-object/from16 v7, p1

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_b8
    add-int/lit8 v6, v6, 0x1

    goto :goto_74

    :cond_bb
    :goto_bb
    return-void
.end method
