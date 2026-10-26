.class final Lkr/memorynotes/InkPage;
.super Landroid/widget/FrameLayout;
.source "InkPage.java"


# instance fields
.field final a:Lkr/memorynotes/MainActivity;

.field anchor:Landroid/view/View;

.field final changed:Ljava/lang/Runnable;

.field color:I

.field drawing:Z

.field enabled:Z

.field eraser:Z

.field gestureEraser:Z

.field key:Ljava/lang/String;

.field modified:Z

.field final note:Lkr/memorynotes/Note;

.field final paint:Landroid/graphics/Paint;

.field final scope:Ljava/lang/String;

.field stroke:Lorg/json/JSONObject;

.field thickness:F

.field final undo:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 2

    .line 7
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 5
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/InkPage;->undo:Ljava/util/ArrayDeque;

    .line 6
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lkr/memorynotes/InkPage;->paint:Landroid/graphics/Paint;

    iput-boolean v1, p0, Lkr/memorynotes/InkPage;->enabled:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/InkPage;->eraser:Z

    iput-boolean v0, p0, Lkr/memorynotes/InkPage;->drawing:Z

    iput-boolean v0, p0, Lkr/memorynotes/InkPage;->gestureEraser:Z

    sget-object v1, Lkr/memorynotes/ColorText;->COLORS:[I

    aget v1, v1, v0

    iput v1, p0, Lkr/memorynotes/InkPage;->color:I

    const/high16 v1, 0x40200000    # 2.5f

    iput v1, p0, Lkr/memorynotes/InkPage;->thickness:F

    .line 7
    iput-object p1, p0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "page:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lkr/memorynotes/InkPage;->scope:Ljava/lang/String;

    iput-object p4, p0, Lkr/memorynotes/InkPage;->changed:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lkr/memorynotes/InkPage;->setWillNotDraw(Z)V

    iget-object p1, p0, Lkr/memorynotes/InkPage;->paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object p1, p0, Lkr/memorynotes/InkPage;->paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    return-void
.end method

.method static attach(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lkr/memorynotes/InkToolbar;->attach(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$0()V
    .locals 0

    .line 11
    return-void
.end method

.method static synthetic lambda$1(Lkr/memorynotes/InkPage;Landroid/widget/Button;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 0

    .line 11
    iget-boolean p3, p0, Lkr/memorynotes/InkPage;->enabled:Z

    xor-int/lit8 p3, p3, 0x1

    iput-boolean p3, p0, Lkr/memorynotes/InkPage;->enabled:Z

    iget-boolean p3, p0, Lkr/memorynotes/InkPage;->enabled:Z

    if-eqz p3, :cond_0

    const-string p3, "\ud39c \u2713"

    goto :goto_0

    :cond_0
    const-string p3, "\ud39c \uaebc\uc9d0"

    :goto_0
    invoke-virtual {p1, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-boolean p0, p0, Lkr/memorynotes/InkPage;->enabled:Z

    if-eqz p0, :cond_1

    const-string p0, "S\ud39c \ud544\uae30 \u00b7 \uc190\uac00\ub77d \uc2a4\ud06c\ub864"

    goto :goto_1

    :cond_1
    const-string p0, "\ud39c \uaebc\uc9d0 \u00b7 \ud14d\uc2a4\ud2b8 \uc120\ud0dd/\uc785\ub825 \uac00\ub2a5"

    :goto_1
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$2()V
    .locals 0

    .line 12
    return-void
.end method

.method static synthetic lambda$3(Lkr/memorynotes/InkPage;Landroid/widget/Button;Landroid/view/View;)V
    .locals 0

    .line 12
    iget-boolean p2, p0, Lkr/memorynotes/InkPage;->eraser:Z

    xor-int/lit8 p2, p2, 0x1

    iput-boolean p2, p0, Lkr/memorynotes/InkPage;->eraser:Z

    iget-boolean p0, p0, Lkr/memorynotes/InkPage;->eraser:Z

    if-eqz p0, :cond_0

    const-string p0, "\uc9c0\uc6b0\uac1c \u2713"

    goto :goto_0

    :cond_0
    const-string p0, "\uc9c0\uc6b0\uac1c"

    :goto_0
    invoke-virtual {p1, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$4(Lkr/memorynotes/InkPage;)V
    .locals 0

    .line 13
    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->settings()V

    return-void
.end method

.method static synthetic lambda$6(Lkr/memorynotes/MainActivity;Lkr/memorynotes/InkPage;)V
    .locals 2

    .line 14
    iget-object p0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lkr/memorynotes/InkPage$$ExternalSyntheticLambda7;

    invoke-direct {v0, p1}, Lkr/memorynotes/InkPage$$ExternalSyntheticLambda7;-><init>(Lkr/memorynotes/InkPage;)V

    const-string p1, "\ud544\uae30 \uc9c0\uc6b0\uae30"

    const-string v1, "\uc774 \ub178\ud2b8\uc758 \ubaa8\ub4e0 \ud544\uae30\ub97c \uc9c0\uc6b8\uae4c\uc694? \uae00\uc790\uc640 \uc0ac\uc9c4\uc740 \uc720\uc9c0\ub429\ub2c8\ub2e4."

    invoke-virtual {p0, p1, v1, v0}, Lkr/memorynotes/Ui;->confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method bounds(Landroid/view/View;)Landroid/graphics/RectF;
    .locals 8

    .line 21
    const/4 v0, 0x2

    new-array v1, v0, [I

    new-array v0, v0, [I

    invoke-virtual {p0, v1}, Lkr/memorynotes/InkPage;->getLocationOnScreen([I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    new-instance v2, Landroid/graphics/RectF;

    const/4 v3, 0x0

    aget v4, v0, v3

    aget v5, v1, v3

    sub-int/2addr v4, v5

    int-to-float v4, v4

    const/4 v5, 0x1

    aget v6, v0, v5

    aget v7, v1, v5

    sub-int/2addr v6, v7

    int-to-float v6, v6

    aget v7, v0, v3

    aget v3, v1, v3

    sub-int/2addr v7, v3

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v7, v3

    int-to-float v3, v7

    aget v0, v0, v5

    aget v1, v1, v5

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    add-int/2addr v0, p1

    int-to-float p1, v0

    invoke-direct {v2, v4, v6, v3, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v2
.end method

.method checkpoint()V
    .locals 2

    .line 18
    iget-object v0, p0, Lkr/memorynotes/InkPage;->undo:Ljava/util/ArrayDeque;

    iget-object v1, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    :goto_0
    iget-object v0, p0, Lkr/memorynotes/InkPage;->undo:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I

    move-result v0

    const/16 v1, 0x28

    if-gt v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lkr/memorynotes/InkPage;->undo:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    goto :goto_0
.end method

.method clear()V
    .locals 2

    .line 20
    iget-object v0, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    iget-object v0, v0, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->checkpoint()V

    iget-object v0, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, v0, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    iget-object v0, p0, Lkr/memorynotes/InkPage;->changed:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->invalidate()V

    return-void
.end method

.method clipControls(Landroid/graphics/Canvas;Landroid/view/View;)V
    .locals 2

    .line 32
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p2}, Lkr/memorynotes/InkPage;->control(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p2}, Lkr/memorynotes/InkPage;->bounds(Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->clipOutRect(Landroid/graphics/RectF;)Z

    return-void

    :cond_1
    instance-of v0, p2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    check-cast p2, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lkr/memorynotes/InkPage;->clipControls(Landroid/graphics/Canvas;Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method

.method control(Landroid/view/View;)Z
    .locals 1

    .line 22
    instance-of v0, p1, Landroid/widget/Button;

    if-nez v0, :cond_0

    instance-of v0, p1, Landroid/widget/Spinner;

    if-nez v0, :cond_0

    instance-of v0, p1, Landroid/widget/CompoundButton;

    if-nez v0, :cond_0

    instance-of p1, p1, Landroid/widget/SeekBar;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 33
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkr/memorynotes/InkPage;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lkr/memorynotes/InkPage;->clipControls(Landroid/graphics/Canvas;Landroid/view/View;)V

    :goto_0
    iget-object v1, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, v0}, Lkr/memorynotes/InkPage;->drawStroke(Landroid/graphics/Canvas;Lorg/json/JSONObject;)V

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :cond_1
    iget-object v1, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lkr/memorynotes/InkPage;->drawStroke(Landroid/graphics/Canvas;Lorg/json/JSONObject;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 35
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v1

    const/4 v2, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x2

    if-eq v1, v5, :cond_0

    if-eq v1, v2, :cond_0

    move v6, v3

    goto :goto_0

    :cond_0
    move v6, v4

    .line 36
    :goto_0
    if-nez v0, :cond_6

    iget-boolean v7, p0, Lkr/memorynotes/InkPage;->enabled:Z

    if-eqz v7, :cond_5

    if-eqz v6, :cond_5

    invoke-virtual {p0, v3}, Lkr/memorynotes/InkPage;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    invoke-virtual {p0, v6, v7, v8, v4}, Lkr/memorynotes/InkPage;->hit(Landroid/view/View;FFZ)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_1

    goto/16 :goto_3

    :cond_1
    iput-boolean v4, p0, Lkr/memorynotes/InkPage;->drawing:Z

    iput-boolean v3, p0, Lkr/memorynotes/InkPage;->modified:Z

    iget-boolean v6, p0, Lkr/memorynotes/InkPage;->eraser:Z

    if-nez v6, :cond_2

    if-eq v1, v2, :cond_2

    move v1, v3

    goto :goto_1

    :cond_2
    move v1, v4

    :goto_1
    iput-boolean v1, p0, Lkr/memorynotes/InkPage;->gestureEraser:Z

    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->checkpoint()V

    invoke-virtual {p0, v3}, Lkr/memorynotes/InkPage;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-virtual {p0, v1, v6, v7, v3}, Lkr/memorynotes/InkPage;->hit(Landroid/view/View;FFZ)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lkr/memorynotes/InkPage;->anchor:Landroid/view/View;

    iget-object v1, p0, Lkr/memorynotes/InkPage;->anchor:Landroid/view/View;

    if-nez v1, :cond_3

    iget-object v1, p0, Lkr/memorynotes/InkPage;->scope:Ljava/lang/String;

    goto :goto_2

    :cond_3
    iget-object v1, p0, Lkr/memorynotes/InkPage;->anchor:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :goto_2
    iput-object v1, p0, Lkr/memorynotes/InkPage;->key:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    invoke-virtual {p0, v1, v6}, Lkr/memorynotes/InkPage;->imageAt(FF)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    iput-object v1, p0, Lkr/memorynotes/InkPage;->key:Ljava/lang/String;

    :cond_4
    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    iget-boolean v1, p0, Lkr/memorynotes/InkPage;->gestureEraser:Z

    if-nez v1, :cond_6

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    :try_start_0
    iget-object v1, p0, Lkr/memorynotes/InkPage;->key:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lkr/memorynotes/InkPage;->region(Ljava/lang/String;)Landroid/graphics/RectF;

    move-result-object v1

    iget-object v6, p0, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    const-string v7, "key"

    iget-object v8, p0, Lkr/memorynotes/InkPage;->key:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v6, p0, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    const-string v7, "color"

    iget v8, p0, Lkr/memorynotes/InkPage;->color:I

    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    iget-object v6, p0, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    const-string v7, "width"

    iget-object v8, p0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    iget-object v8, v8, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v9, p0, Lkr/memorynotes/InkPage;->thickness:F

    invoke-virtual {v8, v9}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-static {v9, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    div-float/2addr v8, v1

    float-to-double v8, v8

    invoke-virtual {v6, v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    iget-object v1, p0, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    const-string v6, "points"

    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v1

    iget-object v6, p0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v6, v1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    goto :goto_4

    :cond_5
    :goto_3
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    .line 37
    :cond_6
    :goto_4
    iget-boolean v1, p0, Lkr/memorynotes/InkPage;->drawing:Z

    if-nez v1, :cond_7

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    .line 38
    :cond_7
    if-eqz v0, :cond_8

    if-eq v0, v5, :cond_8

    if-ne v0, v4, :cond_d

    :cond_8
    move v1, v3

    :goto_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-lt v1, v6, :cond_9

    const/4 v1, -0x1

    goto :goto_6

    :cond_9
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v6

    if-eq v6, v5, :cond_b

    if-ne v6, v2, :cond_a

    goto :goto_6

    :cond_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_b
    :goto_6
    if-ltz v1, :cond_d

    move v2, v3

    :goto_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v5

    if-lt v2, v5, :cond_c

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    invoke-virtual {p0, v2, p1}, Lkr/memorynotes/InkPage;->point(FF)V

    goto :goto_8

    :cond_c
    invoke-virtual {p1, v1, v2}, Landroid/view/MotionEvent;->getHistoricalX(II)F

    move-result v5

    invoke-virtual {p1, v1, v2}, Landroid/view/MotionEvent;->getHistoricalY(II)F

    move-result v6

    invoke-virtual {p0, v5, v6}, Lkr/memorynotes/InkPage;->point(FF)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 39
    :cond_d
    :goto_8
    const/4 p1, 0x3

    if-eq v0, v4, :cond_e

    if-ne v0, p1, :cond_12

    :cond_e
    if-ne v0, p1, :cond_f

    :try_start_1
    iget-object v1, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    new-instance v2, Lorg/json/JSONArray;

    iget-object v5, p0, Lkr/memorynotes/InkPage;->undo:Ljava/util/ArrayDeque;

    invoke-virtual {v5}, Ljava/util/ArrayDeque;->getLast()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {v2, v5}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    iput-object v2, v1, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_9

    :catch_1
    move-exception v1

    iget-object v2, p0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v2, v1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_9
    iput-boolean v3, p0, Lkr/memorynotes/InkPage;->modified:Z

    :cond_f
    iget-object v1, p0, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    if-eqz v1, :cond_10

    if-eq v0, p1, :cond_10

    iget-object p1, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    iget-object p1, p1, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    iget-object v0, p0, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    iput-boolean v4, p0, Lkr/memorynotes/InkPage;->modified:Z

    :cond_10
    const/4 p1, 0x0

    iput-object p1, p0, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    iput-boolean v3, p0, Lkr/memorynotes/InkPage;->drawing:Z

    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    iget-boolean p1, p0, Lkr/memorynotes/InkPage;->modified:Z

    if-eqz p1, :cond_11

    iget-object p1, p0, Lkr/memorynotes/InkPage;->changed:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_a

    :cond_11
    iget-object p1, p0, Lkr/memorynotes/InkPage;->undo:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_12

    iget-object p1, p0, Lkr/memorynotes/InkPage;->undo:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    .line 40
    :cond_12
    :goto_a
    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->invalidate()V

    return v4
.end method

.method drawStroke(Landroid/graphics/Canvas;Lorg/json/JSONObject;)V
    .locals 10

    .line 34
    if-nez p2, :cond_0

    return-void

    :cond_0
    const-string v0, "key"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lkr/memorynotes/InkPage;->region(Ljava/lang/String;)Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_1

    goto/16 :goto_4

    :cond_1
    const-string v1, "points"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_7

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-nez v3, :cond_2

    goto/16 :goto_4

    :cond_2
    iget-object v3, p0, Lkr/memorynotes/InkPage;->paint:Landroid/graphics/Paint;

    const-string v4, "color"

    iget v5, p0, Lkr/memorynotes/InkPage;->color:I

    invoke-virtual {p2, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, p0, Lkr/memorynotes/InkPage;->paint:Landroid/graphics/Paint;

    const-string v4, "width"

    const-wide v5, 0x3f689374bc6a7efaL    # 0.003

    invoke-virtual {p2, v4, v5, v6}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v4

    double-to-float p2, v4

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v4

    mul-float/2addr p2, v4

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-virtual {v3, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p2, p0, Lkr/memorynotes/InkPage;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance p2, Landroid/graphics/Path;

    invoke-direct {p2}, Landroid/graphics/Path;-><init>()V

    const/4 v3, 0x0

    move v4, v2

    move v5, v3

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    const/4 v7, 0x1

    if-lt v5, v6, :cond_4

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ne v0, v7, :cond_3

    iget-object p2, p0, Lkr/memorynotes/InkPage;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v4, p2}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lkr/memorynotes/InkPage;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :goto_1
    return-void

    :cond_4
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object v6

    if-nez v6, :cond_5

    :goto_2
    goto :goto_3

    :cond_5
    iget v2, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {v6, v3}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v8

    double-to-float v4, v8

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v8

    mul-float/2addr v4, v8

    add-float/2addr v2, v4

    iget v4, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v6

    double-to-float v6, v6

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v7

    mul-float/2addr v6, v7

    add-float/2addr v4, v6

    if-nez v5, :cond_6

    invoke-virtual {p2, v2, v4}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_2

    :cond_6
    invoke-virtual {p2, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_2

    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_7
    :goto_4
    return-void
.end method

.method find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .locals 3

    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v0, v2, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lkr/memorynotes/InkPage;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_3

    return-object v2

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    return-object v1
.end method

.method hit(Landroid/view/View;FFZ)Landroid/view/View;
    .locals 4

    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_5

    invoke-virtual {p0, p1}, Lkr/memorynotes/InkPage;->bounds(Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    if-eqz p4, :cond_1

    invoke-virtual {p0, p1}, Lkr/memorynotes/InkPage;->control(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_0
    if-gez v2, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3, p2, p3, p4}, Lkr/memorynotes/InkPage;->hit(Landroid/view/View;FFZ)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_3

    return-object v3

    :cond_3
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_4
    :goto_1
    if-nez p4, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p2

    instance-of p2, p2, Ljava/lang/String;

    if-eqz p2, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    const-string p3, "ink:"

    invoke-virtual {p2, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_5

    return-object p1

    :cond_5
    :goto_2
    return-object v1
.end method

.method imageAt(FF)Ljava/lang/String;
    .locals 4

    .line 30
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v1, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "image:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "file"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lkr/memorynotes/InkPage;->region(Ljava/lang/String;)Landroid/graphics/RectF;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object v1

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method imageRect(Landroid/view/View;Ljava/lang/String;)Landroid/graphics/RectF;
    .locals 9

    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 27
    :cond_0
    instance-of v0, p1, Landroid/widget/EditText;

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLayout()Landroid/text/Layout;

    move-result-object v3

    if-eqz v3, :cond_4

    sget-object v4, Lkr/memorynotes/InlineImageText;->PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    :goto_0
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-nez v5, :cond_1

    goto/16 :goto_2

    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "image:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    :goto_1
    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v6

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    move-result v7

    const-class v8, Landroid/text/style/ImageSpan;

    invoke-interface {v5, v6, v7, v8}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Landroid/text/style/ImageSpan;

    array-length v6, v5

    if-nez v6, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {p0, v0}, Lkr/memorynotes/InkPage;->bounds(Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object p1

    aget-object p2, v5, v2

    invoke-virtual {p2}, Landroid/text/style/ImageSpan;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p2

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v1

    invoke-virtual {v3, v1}, Landroid/text/Layout;->getLineForOffset(I)I

    move-result v1

    iget v2, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {v0}, Landroid/widget/EditText;->getTotalPaddingLeft()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v2, v5

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v4

    add-float/2addr v2, v4

    invoke-virtual {v0}, Landroid/widget/EditText;->getScrollX()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v2, v4

    iget p1, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0}, Landroid/widget/EditText;->getTotalPaddingTop()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr p1, v4

    invoke-virtual {v3, v1}, Landroid/text/Layout;->getLineBottom(I)I

    move-result v1

    int-to-float v1, v1

    add-float/2addr p1, v1

    invoke-virtual {v0}, Landroid/widget/EditText;->getScrollY()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    sub-float v1, p1, v1

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result p2

    int-to-float p2, p2

    add-float/2addr p2, v2

    invoke-direct {v0, v2, v1, p2, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0

    .line 28
    :cond_4
    :goto_2
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_7

    check-cast p1, Landroid/view/ViewGroup;

    :goto_3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v2, v0, :cond_5

    goto :goto_4

    :cond_5
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lkr/memorynotes/InkPage;->imageRect(Landroid/view/View;Ljava/lang/String;)Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_6

    return-object v0

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_7
    :goto_4
    return-object v1
.end method

.method synthetic lambda$8$kr-memorynotes-InkPage(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 17
    const/4 p1, 0x0

    const/4 v0, 0x5

    if-ge p2, v0, :cond_0

    sget-object v0, Lkr/memorynotes/ColorText;->COLORS:[I

    aget p2, v0, p2

    :goto_0
    iput p2, p0, Lkr/memorynotes/InkPage;->color:I

    iput-boolean p1, p0, Lkr/memorynotes/InkPage;->eraser:Z

    goto :goto_1

    :cond_0
    if-ne p2, v0, :cond_1

    iget-object p2, p0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    iget-object p2, p2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget p2, p2, Lkr/memorynotes/Ui;->ink:I

    goto :goto_0

    :cond_1
    const/4 p1, 0x3

    new-array p1, p1, [F

    fill-array-data p1, :array_0

    add-int/lit8 p2, p2, -0x6

    aget p1, p1, p2

    iput p1, p0, Lkr/memorynotes/InkPage;->thickness:F

    :goto_1
    return-void

    nop

    :array_0
    .array-data 4
        0x3fc00000    # 1.5f
        0x40200000    # 2.5f
        0x40900000    # 4.5f
    .end array-data
.end method

.method point(FF)V
    .locals 21

    .line 42
    move-object/from16 v1, p0

    :try_start_0
    iget-boolean v0, v1, Lkr/memorynotes/InkPage;->gestureEraser:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "points"

    const/4 v3, 0x0

    if-eqz v0, :cond_9

    :try_start_1
    iget-object v0, v1, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    iget-object v0, v0, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/4 v4, 0x1

    sub-int/2addr v0, v4

    :goto_0
    if-gez v0, :cond_0

    goto/16 :goto_6

    :cond_0
    iget-object v5, v1, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    iget-object v5, v5, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    invoke-virtual {v5, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    if-nez v5, :cond_2

    :cond_1
    :goto_1
    goto/16 :goto_4

    :cond_2
    const-string v6, "key"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lkr/memorynotes/InkPage;->region(Ljava/lang/String;)Landroid/graphics/RectF;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v7

    cmpg-float v7, v7, v3

    if-gtz v7, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    if-nez v5, :cond_4

    goto :goto_1

    :cond_4
    const/4 v7, 0x0

    move v8, v7

    :goto_2
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-lt v8, v9, :cond_5

    goto :goto_1

    :cond_5
    invoke-virtual {v5, v8}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object v9

    add-int/lit8 v10, v8, -0x1

    invoke-static {v7, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    invoke-virtual {v5, v10}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object v10

    if-eqz v9, :cond_7

    if-nez v10, :cond_6

    move/from16 v20, v8

    goto :goto_3

    :cond_6
    iget-object v11, v1, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    iget-object v11, v11, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v12, 0x41400000    # 12.0f

    invoke-virtual {v11, v12}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v11

    int-to-float v11, v11

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v12

    div-float v19, v11, v12

    iget v11, v6, Landroid/graphics/RectF;->left:F

    sub-float v11, p1, v11

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v12

    div-float v13, v11, v12

    iget v11, v6, Landroid/graphics/RectF;->top:F

    sub-float v11, p2, v11

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v12

    div-float v14, v11, v12

    invoke-virtual {v10, v7}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v11

    double-to-float v15, v11

    invoke-virtual {v10, v4}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v10

    double-to-float v10, v10

    invoke-virtual {v9, v7}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v11

    double-to-float v11, v11

    move/from16 v20, v8

    invoke-virtual {v9, v4}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v7

    double-to-float v7, v7

    move/from16 v16, v10

    move/from16 v17, v11

    move/from16 v18, v7

    invoke-static/range {v13 .. v19}, Lkr/memorynotes/InkGeometry;->nearSegment(FFFFFFF)Z

    move-result v7

    if-eqz v7, :cond_8

    iget-object v5, v1, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    iget-object v5, v5, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    invoke-virtual {v5, v0}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    iput-boolean v4, v1, Lkr/memorynotes/InkPage;->modified:Z

    goto/16 :goto_1

    :cond_7
    move/from16 v20, v8

    :cond_8
    :goto_3
    add-int/lit8 v8, v20, 0x1

    const/4 v7, 0x0

    goto :goto_2

    :goto_4
    add-int/lit8 v0, v0, -0x1

    goto/16 :goto_0

    :cond_9
    iget-object v0, v1, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    if-eqz v0, :cond_c

    iget-object v0, v1, Lkr/memorynotes/InkPage;->key:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lkr/memorynotes/InkPage;->region(Ljava/lang/String;)Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v4

    cmpg-float v3, v4, v3

    if-gtz v3, :cond_a

    goto :goto_5

    :cond_a
    iget-object v3, v1, Lkr/memorynotes/InkPage;->stroke:Lorg/json/JSONObject;

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/16 v4, 0x7530

    if-ge v3, v4, :cond_c

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    iget v4, v0, Landroid/graphics/RectF;->left:F

    sub-float v4, p1, v4

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v5

    div-float/2addr v4, v5

    float-to-double v4, v4

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    move-result-object v3

    iget v4, v0, Landroid/graphics/RectF;->top:F

    sub-float v4, p2, v4

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr v4, v0

    float-to-double v4, v4

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_6

    :cond_b
    :goto_5
    return-void

    :catch_0
    move-exception v0

    iget-object v2, v1, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v2, v0}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :cond_c
    :goto_6
    return-void
.end method

.method region(Ljava/lang/String;)Landroid/graphics/RectF;
    .locals 5

    .line 31
    iget-object v0, p0, Lkr/memorynotes/InkPage;->scope:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p1, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-direct {p1, v2, v2, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object p1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ink:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p0, v0}, Lkr/memorynotes/InkPage;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_2

    const-string v0, "image:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p0, p1}, Lkr/memorynotes/InkPage;->imageRect(Landroid/view/View;Ljava/lang/String;)Landroid/graphics/RectF;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return-object p1

    :cond_2
    invoke-virtual {p0, v0}, Lkr/memorynotes/InkPage;->bounds(Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object p1

    instance-of v1, v0, Lkr/memorynotes/ImageMaskView;

    if-eqz v1, :cond_3

    move-object v1, v0

    check-cast v1, Lkr/memorynotes/ImageMaskView;

    iget-object v2, v1, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v2, v1, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v0, v2

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v2

    iget-object v3, v1, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iget-object v2, v1, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v0

    iget-object v1, v1, Lkr/memorynotes/ImageMaskView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    iget v0, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v3

    sub-float/2addr v3, v2

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-float/2addr v0, v3

    iget v3, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    sub-float/2addr p1, v1

    div-float/2addr p1, v4

    add-float/2addr v3, p1

    new-instance p1, Landroid/graphics/RectF;

    add-float/2addr v2, v0

    add-float/2addr v1, v3

    invoke-direct {p1, v0, v3, v2, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object p1

    :cond_3
    instance-of v1, v0, Landroid/widget/EditText;

    if-eqz v1, :cond_4

    iget v1, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    iput v1, p1, Landroid/graphics/RectF;->left:F

    iget v1, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    iput v1, p1, Landroid/graphics/RectF;->top:F

    iget v1, p1, Landroid/graphics/RectF;->right:F

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iput v1, p1, Landroid/graphics/RectF;->right:F

    iget v1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v1, v0

    iput v1, p1, Landroid/graphics/RectF;->bottom:F

    :cond_4
    return-object p1
.end method

.method settings()V
    .locals 0
    invoke-static {p0}, Lkr/memorynotes/ThicknessControl;->show(Lkr/memorynotes/InkPage;)V
    return-void
.end method

.method undo()V
    .locals 3

    .line 19
    iget-object v0, p0, Lkr/memorynotes/InkPage;->undo:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v1, "\ub418\ub3cc\ub9b4 \ud544\uae30\uac00 \uc5c6\uc2b5\ub2c8\ub2e4."

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lkr/memorynotes/InkPage;->note:Lkr/memorynotes/Note;

    new-instance v1, Lorg/json/JSONArray;

    iget-object v2, p0, Lkr/memorynotes/InkPage;->undo:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    iput-object v1, v0, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    iget-object v0, p0, Lkr/memorynotes/InkPage;->changed:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->invalidate()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v1, v0}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method
