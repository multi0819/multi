.class final Lkr/memorynotes/ReviewLayout$Symbol;
.super Landroid/graphics/drawable/Drawable;
.source "ReviewLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/ReviewLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Symbol"
.end annotation


# instance fields
.field final color:I

.field final kind:Ljava/lang/String;

.field final p:Landroid/graphics/Paint;

.field final size:I


# direct methods
.method constructor <init>(Ljava/lang/String;II)V
    .registers 6

    .line 29
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    iput-object p1, p0, Lkr/memorynotes/ReviewLayout$Symbol;->kind:Ljava/lang/String;

    iput p2, p0, Lkr/memorynotes/ReviewLayout$Symbol;->color:I

    iput p3, p0, Lkr/memorynotes/ReviewLayout$Symbol;->size:I

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1, p3, p3}, Lkr/memorynotes/ReviewLayout$Symbol;->setBounds(IIII)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 17

    .line 30
    move-object v0, p0

    move-object/from16 v10, p1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Lkr/memorynotes/ReviewLayout$Symbol;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    invoke-virtual {p0}, Lkr/memorynotes/ReviewLayout$Symbol;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {v10, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p0}, Lkr/memorynotes/ReviewLayout$Symbol;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41c00000    # 24.0f

    div-float/2addr v1, v2

    invoke-virtual {p0}, Lkr/memorynotes/ReviewLayout$Symbol;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    invoke-virtual {v10, v1, v3}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    iget v2, v0, Lkr/memorynotes/ReviewLayout$Symbol;->color:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    const v2, 0x3fe66666    # 1.8f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v11, Landroid/graphics/Path;

    invoke-direct {v11}, Landroid/graphics/Path;-><init>()V

    .line 31
    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->kind:Ljava/lang/String;

    const-string v2, "check"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v7, 0x41880000    # 17.0f

    const/high16 v2, 0x41a00000    # 20.0f

    const/high16 v12, 0x41200000    # 10.0f

    const/high16 v3, 0x40a00000    # 5.0f

    const/high16 v13, 0x41400000    # 12.0f

    if-eqz v1, :cond_7a

    invoke-virtual {v11, v3, v13}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v12, v7}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x40e00000    # 7.0f

    invoke-virtual {v11, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_180

    .line 32
    :cond_7a
    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->kind:Ljava/lang/String;

    const-string v4, "back"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v4, 0x41980000    # 19.0f

    const/high16 v5, 0x41700000    # 15.0f

    if-eqz v1, :cond_95

    invoke-virtual {v11, v5, v3}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41000000    # 8.0f

    invoke-virtual {v11, v1, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v5, v4}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_180

    .line 33
    :cond_95
    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->kind:Ljava/lang/String;

    const-string v6, "edit"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v6, 0x41100000    # 9.0f

    const/high16 v14, 0x40800000    # 4.0f

    if-eqz v1, :cond_ca

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v11, v3, v1}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v2, v6}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v6, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x41a80000    # 21.0f

    invoke-virtual {v11, v14, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11}, Landroid/graphics/Path;->close()V

    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41500000    # 13.0f

    const/high16 v3, 0x41000000    # 8.0f

    const/high16 v4, 0x41880000    # 17.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_180

    .line 34
    :cond_ca
    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->kind:Ljava/lang/String;

    const-string v2, "skip"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f1

    invoke-virtual {v11, v3, v3}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v5, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11}, Landroid/graphics/Path;->close()V

    const/high16 v5, 0x41980000    # 19.0f

    iget-object v6, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41980000    # 19.0f

    const/high16 v3, 0x40a00000    # 5.0f

    const/high16 v4, 0x41980000    # 19.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_180

    .line 35
    :cond_f1
    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->kind:Ljava/lang/String;

    const-string v2, "retry"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11a

    const/4 v8, 0x0

    iget-object v9, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x40800000    # 4.0f

    const/high16 v4, 0x41a00000    # 20.0f

    const/high16 v5, 0x41a00000    # 20.0f

    const/high16 v6, 0x43570000    # 215.0f

    const v7, 0x438e8000    # 285.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v9}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    invoke-virtual {v11, v14, v14}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v14, v12}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v12, v12}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_180

    .line 36
    :cond_11a
    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->kind:Ljava/lang/String;

    const-string v2, "unsure"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13e

    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    invoke-virtual {v10, v13, v13, v6, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41500000    # 13.0f

    iget-object v6, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x40c00000    # 6.0f

    const/high16 v4, 0x41400000    # 12.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    invoke-virtual {v10, v13, v7, v1}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    goto :goto_180

    .line 37
    :cond_13e
    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v11, v1, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v8, 0x41b00000    # 22.0f

    const/high16 v9, 0x41400000    # 12.0f

    const/high16 v4, 0x40e00000    # 7.0f

    const/high16 v5, 0x40400000    # 3.0f

    const/high16 v6, 0x41880000    # 17.0f

    const/high16 v7, 0x40400000    # 3.0f

    move-object v3, v11

    invoke-virtual/range {v3 .. v9}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v8, 0x40000000    # 2.0f

    const/high16 v4, 0x41880000    # 17.0f

    const/high16 v5, 0x41a80000    # 21.0f

    const/high16 v6, 0x40e00000    # 7.0f

    const/high16 v7, 0x41a80000    # 21.0f

    invoke-virtual/range {v3 .. v9}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v1, 0x40400000    # 3.0f

    iget-object v2, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    invoke-virtual {v10, v13, v13, v1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->kind:Ljava/lang/String;

    const-string v2, "hide"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_180

    const/high16 v5, 0x41a80000    # 21.0f

    iget-object v6, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x41a80000    # 21.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 38
    :cond_180
    :goto_180
    iget-object v1, v0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    invoke-virtual {v10, v11, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 39
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 39
    iget-object v0, p0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 39
    iget-object v0, p0, Lkr/memorynotes/ReviewLayout$Symbol;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
