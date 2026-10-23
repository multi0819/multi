.class Lkr/memorynotes/Dashboard$SymbolDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "Dashboard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/Dashboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SymbolDrawable"
.end annotation


# instance fields
.field final key:Ljava/lang/String;

.field final p:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Lkr/memorynotes/Ui;Ljava/lang/String;I)V
    .registers 5

    .line 54
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    iput-object p2, p0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    iget-object p1, p0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const p2, 0x3fe66666    # 1.8f

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object p1, p0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 17

    .line 54
    move-object v0, p0

    move-object/from16 v10, p1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard$SymbolDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard$SymbolDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {v10, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard$SymbolDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41c00000    # 24.0f

    div-float/2addr v1, v2

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard$SymbolDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    invoke-virtual {v10, v1, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 55
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v2, "search"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v2, 0x40c00000    # 6.0f

    const/high16 v3, 0x41200000    # 10.0f

    if-eqz v1, :cond_54

    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    invoke-virtual {v10, v3, v3, v2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41a80000    # 21.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41700000    # 15.0f

    const/high16 v3, 0x41700000    # 15.0f

    const/high16 v4, 0x41a80000    # 21.0f

    :goto_4d
    move-object/from16 v1, p1

    :goto_4f
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_2ab

    :cond_54
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v4, "plus"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_78

    const/high16 v5, 0x41a00000    # 20.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x40800000    # 4.0f

    const/high16 v4, 0x41400000    # 12.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41a00000    # 20.0f

    goto :goto_4f

    :cond_78
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v4, "home"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v7, 0x41300000    # 11.0f

    const/high16 v8, 0x41400000    # 12.0f

    if-eqz v1, :cond_ad

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const/high16 v4, 0x40400000    # 3.0f

    invoke-virtual {v1, v4, v7}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v1, v8, v4}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v4, 0x41a80000    # 21.0f

    invoke-virtual {v1, v4, v7}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41900000    # 18.0f

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_a6
    iget-object v2, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    invoke-virtual {v10, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_2ab

    :cond_ad
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v2, "star"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-wide v11, 0x400921fb54442d18L    # Math.PI

    const/4 v2, 0x0

    if-eqz v1, :cond_f7

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    :goto_c2
    const/16 v4, 0xa

    if-lt v2, v4, :cond_ca

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    goto :goto_a6

    :cond_ca
    int-to-double v4, v2

    mul-double/2addr v4, v11

    const-wide/high16 v6, 0x4014000000000000L    # 5.0

    div-double/2addr v4, v6

    const-wide v6, -0x4006de04abbbd2e8L    # -1.5707963267948966

    add-double/2addr v4, v6

    rem-int/lit8 v6, v2, 0x2

    if-nez v6, :cond_db

    move v6, v3

    goto :goto_dd

    :cond_db
    const/high16 v6, 0x40900000    # 4.5f

    :goto_dd
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v13

    double-to-float v7, v13

    mul-float/2addr v7, v6

    add-float/2addr v7, v8

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float/2addr v4, v6

    add-float/2addr v4, v8

    if-nez v2, :cond_f1

    invoke-virtual {v1, v7, v4}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_f4

    :cond_f1
    invoke-virtual {v1, v7, v4}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_f4
    add-int/lit8 v2, v2, 0x1

    goto :goto_c2

    :cond_f7
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v3, "book"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_132

    const/high16 v7, 0x40000000    # 2.0f

    iget-object v8, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x41a00000    # 20.0f

    const/high16 v5, 0x41a80000    # 21.0f

    const/high16 v6, 0x40000000    # 2.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v4, 0x41000000    # 8.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41000000    # 8.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41300000    # 11.0f

    const/high16 v3, 0x41000000    # 8.0f

    const/high16 v4, 0x41880000    # 17.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v3, 0x41400000    # 12.0f

    goto/16 :goto_4f

    :cond_132
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v3, "audio"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16c

    const/4 v8, 0x0

    iget-object v9, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x41a00000    # 20.0f

    const/high16 v5, 0x41980000    # 19.0f

    const/high16 v6, 0x43340000    # 180.0f

    const/high16 v7, 0x43340000    # 180.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v9}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    const/high16 v7, 0x40000000    # 2.0f

    iget-object v8, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41200000    # 10.0f

    const/high16 v4, 0x40e00000    # 7.0f

    const/high16 v5, 0x41a00000    # 20.0f

    const/high16 v6, 0x40000000    # 2.0f

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v8, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41880000    # 17.0f

    const/high16 v4, 0x41a80000    # 21.0f

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    goto/16 :goto_2ab

    :cond_16c
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v3, "error"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19e

    const/high16 v7, 0x40000000    # 2.0f

    iget-object v8, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x41980000    # 19.0f

    const/high16 v5, 0x41a80000    # 21.0f

    const/high16 v6, 0x40000000    # 2.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41600000    # 14.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41100000    # 9.0f

    const/high16 v3, 0x41000000    # 8.0f

    const/high16 v4, 0x41700000    # 15.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41700000    # 15.0f

    const/high16 v4, 0x41100000    # 9.0f

    goto/16 :goto_4f

    :cond_19e
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v3, "pen"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1ea

    const/high16 v5, 0x40c00000    # 6.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x41980000    # 19.0f

    const/high16 v4, 0x41900000    # 18.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41000000    # 8.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x41a80000    # 21.0f

    const/high16 v4, 0x41a80000    # 21.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41b00000    # 22.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x41980000    # 19.0f

    const/high16 v4, 0x40800000    # 4.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41a80000    # 21.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x41b00000    # 22.0f

    const/high16 v4, 0x41000000    # 8.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41000000    # 8.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41900000    # 18.0f

    const/high16 v3, 0x40c00000    # 6.0f

    const/high16 v4, 0x41a80000    # 21.0f

    goto/16 :goto_4f

    :cond_1ea
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v3, "erase"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21d

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    const/high16 v1, -0x3de00000    # -40.0f

    invoke-virtual {v10, v1, v8, v8}, Landroid/graphics/Canvas;->rotate(FFF)V

    const/high16 v7, 0x40000000    # 2.0f

    iget-object v8, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40c00000    # 6.0f

    const/high16 v3, 0x40800000    # 4.0f

    const/high16 v4, 0x41900000    # 18.0f

    const/high16 v5, 0x41a00000    # 20.0f

    const/high16 v6, 0x40000000    # 2.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41500000    # 13.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    goto/16 :goto_2ab

    :cond_21d
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v3, "undo"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_250

    const/4 v8, 0x0

    iget-object v9, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x40e00000    # 7.0f

    const/high16 v4, 0x41a80000    # 21.0f

    const/high16 v5, 0x41b80000    # 23.0f

    const/high16 v6, 0x434d0000    # 205.0f

    const/high16 v7, 0x433e0000    # 190.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v9}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    const/high16 v5, 0x40a00000    # 5.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x40800000    # 4.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v4, 0x41300000    # 11.0f

    goto/16 :goto_4f

    :cond_250
    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->key:Ljava/lang/String;

    const-string v3, "settings"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29f

    const/high16 v1, 0x40800000    # 4.0f

    iget-object v3, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    invoke-virtual {v10, v8, v8, v1, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v1, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v9, 0x41100000    # 9.0f

    invoke-virtual {v10, v8, v8, v9, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    move v13, v2

    :goto_269
    const/16 v1, 0x8

    if-lt v13, v1, :cond_26e

    goto :goto_2ab

    :cond_26e
    int-to-double v1, v13

    mul-double/2addr v1, v11

    const-wide/high16 v3, 0x4010000000000000L    # 4.0

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float/2addr v3, v9

    add-float/2addr v3, v8

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float/2addr v4, v9

    add-float/2addr v4, v8

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float/2addr v5, v7

    add-float/2addr v5, v8

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v1

    double-to-float v1, v1

    mul-float/2addr v1, v7

    add-float v6, v1, v8

    iget-object v14, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move-object v6, v14

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v13, v13, 0x1

    goto :goto_269

    :cond_29f
    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41980000    # 19.0f

    goto/16 :goto_4d

    :goto_2ab
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 56
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 56
    iget-object v0, p0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 56
    iget-object v0, p0, Lkr/memorynotes/Dashboard$SymbolDrawable;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
