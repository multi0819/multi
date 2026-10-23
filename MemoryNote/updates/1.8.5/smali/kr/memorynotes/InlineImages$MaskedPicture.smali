.class Lkr/memorynotes/InlineImages$MaskedPicture;
.super Landroid/graphics/drawable/Drawable;
.source "InlineImages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/InlineImages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MaskedPicture"
.end annotation


# instance fields
.field final bitmap:Landroid/graphics/Bitmap;

.field final hidden:Z

.field final masks:Lorg/json/JSONArray;

.field final paint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;Lorg/json/JSONArray;Z)V
    .registers 6

    .line 27
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 26
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->paint:Landroid/graphics/Paint;

    .line 27
    iput-object p1, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->bitmap:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->masks:Lorg/json/JSONArray;

    iput-boolean p3, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->hidden:Z

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 14

    .line 28
    invoke-virtual {p0}, Lkr/memorynotes/InlineImages$MaskedPicture;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->bitmap:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    iget-object v3, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    iget-boolean v1, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->hidden:Z

    if-eqz v1, :cond_7c

    iget-object v1, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->masks:Lorg/json/JSONArray;

    if-eqz v1, :cond_7c

    iget-object v1, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->paint:Landroid/graphics/Paint;

    const v2, -0xdfc4ce

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v1, 0x0

    move v2, v1

    :goto_1e
    iget-object v3, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->masks:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v2, v3, :cond_27

    goto :goto_7c

    :cond_27
    iget-object v3, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->masks:Lorg/json/JSONArray;

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object v3

    if-nez v3, :cond_30

    goto :goto_79

    :cond_30
    iget v4, v0, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v5

    double-to-float v5, v5

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    add-float v7, v4, v5

    iget v4, v0, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v5

    double-to-float v5, v5

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    add-float v8, v4, v5

    iget v4, v0, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v5

    double-to-float v5, v5

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    add-float v9, v4, v5

    iget v4, v0, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    const/4 v5, 0x3

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v5

    double-to-float v3, v5

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v3, v5

    add-float v10, v4, v3

    iget-object v11, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->paint:Landroid/graphics/Paint;

    move-object v6, p1

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :goto_79
    add-int/lit8 v2, v2, 0x1

    goto :goto_1e

    :cond_7c
    :goto_7c
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 29
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 29
    iget-object v0, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 29
    iget-object v0, p0, Lkr/memorynotes/InlineImages$MaskedPicture;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
