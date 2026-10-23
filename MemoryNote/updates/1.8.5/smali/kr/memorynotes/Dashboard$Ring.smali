.class Lkr/memorynotes/Dashboard$Ring;
.super Landroid/view/View;
.source "Dashboard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/Dashboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Ring"
.end annotation


# instance fields
.field final p:Landroid/graphics/Paint;

.field final pct:I

.field final u:Lkr/memorynotes/Ui;


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Ui;I)V
    .registers 5

    .line 52
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    iput-object p2, p0, Lkr/memorynotes/Dashboard$Ring;->u:Lkr/memorynotes/Ui;

    iput p3, p0, Lkr/memorynotes/Dashboard$Ring;->pct:I

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "\uc624\ub298 \ubcf5\uc2b5 \uc9c4\ud589\ub960 "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\ud37c\uc13c\ud2b8"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/Dashboard$Ring;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 12

    .line 52
    invoke-virtual {p0}, Lkr/memorynotes/Dashboard$Ring;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard$Ring;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lkr/memorynotes/Dashboard$Ring;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    int-to-float v1, v1

    iget-object v3, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    iget-object v4, p0, Lkr/memorynotes/Dashboard$Ring;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v2, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    iget-object v3, p0, Lkr/memorynotes/Dashboard$Ring;->u:Lkr/memorynotes/Ui;

    iget v3, v3, Lkr/memorynotes/Ui;->line:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v2, Landroid/graphics/RectF;

    sub-float v3, v0, v1

    invoke-direct {v2, v1, v1, v3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v8, 0x0

    iget-object v9, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    const/4 v6, 0x0

    const/high16 v7, 0x43b40000    # 360.0f

    move-object v4, p1

    move-object v5, v2

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    iget-object v1, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    iget-object v3, p0, Lkr/memorynotes/Dashboard$Ring;->u:Lkr/memorynotes/Ui;

    iget v3, v3, Lkr/memorynotes/Ui;->green:I

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget v1, p0, Lkr/memorynotes/Dashboard$Ring;->pct:I

    int-to-float v1, v1

    const v3, 0x40666666    # 3.6f

    mul-float v7, v1, v3

    iget-object v9, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    const/high16 v6, -0x3d4c0000    # -90.0f

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    iget-object v1, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    iget-object v2, p0, Lkr/memorynotes/Dashboard$Ring;->u:Lkr/memorynotes/Ui;

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v2, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v1, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    iget-object v1, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    new-instance v1, Ljava/lang/StringBuilder;

    iget v2, p0, Lkr/memorynotes/Dashboard$Ring;->pct:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    iget-object v3, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->ascent()F

    move-result v3

    iget-object v4, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->descent()F

    move-result v4

    add-float/2addr v3, v4

    div-float/2addr v3, v2

    sub-float v2, v0, v3

    iget-object v3, p0, Lkr/memorynotes/Dashboard$Ring;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method
