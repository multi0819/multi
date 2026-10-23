.class public final Lkr/memorynotes/SwipePager;
.super Landroid/widget/FrameLayout;
.source "SwipePager.java"


# instance fields
.field private final a:Lkr/memorynotes/MainActivity;

.field private final body:Landroid/view/View;

.field private discard:Z

.field private dragging:Z

.field private final gesture:Lkr/memorynotes/SwipeGesture;

.field private final nav:Lkr/memorynotes/NoteSwipe;


# direct methods
.method public constructor <init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/NoteSwipe;Landroid/view/View;)V
    .registers 6

    .line 6
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lkr/memorynotes/SwipePager;->a:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/SwipePager;->nav:Lkr/memorynotes/NoteSwipe;

    iput-object p3, p0, Lkr/memorynotes/SwipePager;->body:Landroid/view/View;

    invoke-virtual {p1}, Lkr/memorynotes/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    new-instance v0, Lkr/memorynotes/SwipeGesture;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    int-to-float p1, p1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr p1, v1

    const/high16 v1, 0x42a00000    # 80.0f

    mul-float/2addr p2, v1

    invoke-direct {v0, p1, p2}, Lkr/memorynotes/SwipeGesture;-><init>(FF)V

    iput-object v0, p0, Lkr/memorynotes/SwipePager;->gesture:Lkr/memorynotes/SwipeGesture;

    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 p2, -0x1

    invoke-direct {p1, p2, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p3, p1}, Lkr/memorynotes/SwipePager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private blocked(Landroid/view/View;FF)Z
    .registers 9

    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return v1

    :cond_8
    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    aget v2, v0, v1

    int-to-float v2, v2

    cmpg-float v2, p2, v2

    if-ltz v2, :cond_93

    const/4 v2, 0x1

    aget v3, v0, v2

    int-to-float v3, v3

    cmpg-float v3, p3, v3

    if-ltz v3, :cond_93

    aget v3, v0, v1

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v4

    add-int/2addr v3, v4

    int-to-float v3, v3

    cmpl-float v3, p2, v3

    if-gez v3, :cond_93

    aget v0, v0, v2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int/2addr v0, v3

    int-to-float v0, v0

    cmpl-float v0, p3, v0

    if-ltz v0, :cond_36

    goto :goto_93

    .line 9
    :cond_36
    instance-of v0, p1, Landroid/widget/Button;

    if-nez v0, :cond_92

    instance-of v0, p1, Landroid/widget/EditText;

    if-nez v0, :cond_92

    instance-of v0, p1, Landroid/widget/Spinner;

    if-nez v0, :cond_92

    instance-of v0, p1, Landroid/widget/SeekBar;

    if-nez v0, :cond_92

    instance-of v0, p1, Landroid/widget/HorizontalScrollView;

    if-eqz v0, :cond_4b

    goto :goto_92

    .line 10
    :cond_4b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v3, "ImageMaskView"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_75

    :try_start_5b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "zoom"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v0
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_6c} :catch_73

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v3

    if-lez v0, :cond_75

    return v2

    :catch_73
    move-exception p1

    return v2

    .line 11
    :cond_75
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_91

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_80
    if-gez v0, :cond_83

    goto :goto_91

    :cond_83
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {p0, v3, p2, p3}, Lkr/memorynotes/SwipePager;->blocked(Landroid/view/View;FF)Z

    move-result v3

    if-eqz v3, :cond_8e

    return v2

    :cond_8e
    add-int/lit8 v0, v0, -0x1

    goto :goto_80

    :cond_91
    :goto_91
    return v1

    .line 9
    :cond_92
    :goto_92
    return v2

    .line 8
    :cond_93
    :goto_93
    return v1
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 12

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 15
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_5b

    .line 16
    iget-object v0, p0, Lkr/memorynotes/SwipePager;->body:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iget-object v0, p0, Lkr/memorynotes/SwipePager;->body:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    iput-boolean v2, p0, Lkr/memorynotes/SwipePager;->dragging:Z

    iput-boolean v2, p0, Lkr/memorynotes/SwipePager;->discard:Z

    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ne v0, v3, :cond_39

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v0

    if-ne v0, v3, :cond_39

    iget-object v0, p0, Lkr/memorynotes/SwipePager;->body:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v4

    invoke-direct {p0, v0, v1, v4}, Lkr/memorynotes/SwipePager;->blocked(Landroid/view/View;FF)Z

    move-result v0

    if-nez v0, :cond_39

    move v0, v3

    goto :goto_3a

    :cond_39
    move v0, v2

    .line 18
    :goto_3a
    iget-object v4, p0, Lkr/memorynotes/SwipePager;->gesture:Lkr/memorynotes/SwipeGesture;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v8

    xor-int/lit8 v9, v0, 0x1

    invoke-virtual/range {v4 .. v9}, Lkr/memorynotes/SwipeGesture;->begin(FFIIZ)V

    .line 20
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-nez p1, :cond_5a

    if-nez v0, :cond_5a

    return v2

    :cond_5a
    return v3

    .line 22
    :cond_5b
    iget-boolean v4, p0, Lkr/memorynotes/SwipePager;->dragging:Z

    if-nez v4, :cond_70

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    if-ne v4, v3, :cond_6b

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v4

    if-eq v4, v3, :cond_70

    :cond_6b
    iget-object v4, p0, Lkr/memorynotes/SwipePager;->gesture:Lkr/memorynotes/SwipeGesture;

    invoke-virtual {v4}, Lkr/memorynotes/SwipeGesture;->cancel()V

    .line 23
    :cond_70
    iget-boolean v4, p0, Lkr/memorynotes/SwipePager;->dragging:Z

    const/4 v5, 0x3

    if-nez v4, :cond_ad

    const/4 v4, 0x2

    if-ne v0, v4, :cond_ad

    iget-object v4, p0, Lkr/memorynotes/SwipePager;->gesture:Lkr/memorynotes/SwipeGesture;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v9

    invoke-virtual {v4, v6, v7, v8, v9}, Lkr/memorynotes/SwipeGesture;->move(FFII)Z

    move-result v4

    if-eqz v4, :cond_ad

    .line 25
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->setAction(I)V

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 26
    iput-boolean v3, p0, Lkr/memorynotes/SwipePager;->dragging:Z

    invoke-virtual {p0}, Lkr/memorynotes/SwipePager;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_ac

    invoke-virtual {p0}, Lkr/memorynotes/SwipePager;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_ac
    return v3

    .line 28
    :cond_ad
    iget-boolean v4, p0, Lkr/memorynotes/SwipePager;->dragging:Z

    if-eqz v4, :cond_113

    .line 29
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    if-ne v4, v3, :cond_bd

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v4

    if-eq v4, v3, :cond_c4

    :cond_bd
    iput-boolean v3, p0, Lkr/memorynotes/SwipePager;->discard:Z

    iget-object v4, p0, Lkr/memorynotes/SwipePager;->gesture:Lkr/memorynotes/SwipeGesture;

    invoke-virtual {v4}, Lkr/memorynotes/SwipeGesture;->cancel()V

    .line 30
    :cond_c4
    if-eq v0, v3, :cond_c8

    if-ne v0, v5, :cond_112

    .line 31
    :cond_c8
    if-ne v0, v3, :cond_dd

    iget-boolean v0, p0, Lkr/memorynotes/SwipePager;->discard:Z

    if-nez v0, :cond_dd

    iget-object v0, p0, Lkr/memorynotes/SwipePager;->gesture:Lkr/memorynotes/SwipeGesture;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v4, p1}, Lkr/memorynotes/SwipeGesture;->finish(FF)I

    move-result p1

    goto :goto_de

    :cond_dd
    move p1, v2

    :goto_de
    iget-object v0, p0, Lkr/memorynotes/SwipePager;->gesture:Lkr/memorynotes/SwipeGesture;

    invoke-virtual {v0}, Lkr/memorynotes/SwipeGesture;->cancel()V

    iput-boolean v2, p0, Lkr/memorynotes/SwipePager;->dragging:Z

    .line 32
    invoke-virtual {p0}, Lkr/memorynotes/SwipePager;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_f2

    invoke-virtual {p0}, Lkr/memorynotes/SwipePager;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 33
    :cond_f2
    if-eqz p1, :cond_ff

    iget-object v0, p0, Lkr/memorynotes/SwipePager;->nav:Lkr/memorynotes/NoteSwipe;

    iget-object v2, p0, Lkr/memorynotes/SwipePager;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v0, v2, p1}, Lkr/memorynotes/NoteSwipe;->go(Lkr/memorynotes/MainActivity;I)Z

    move-result p1

    if-eqz p1, :cond_ff

    return v3

    :cond_ff
    iget-object p1, p0, Lkr/memorynotes/SwipePager;->body:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0x8c

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 35
    :cond_112
    return v3

    .line 37
    :cond_113
    if-eq v0, v3, :cond_117

    if-ne v0, v5, :cond_11c

    :cond_117
    iget-object v0, p0, Lkr/memorynotes/SwipePager;->gesture:Lkr/memorynotes/SwipeGesture;

    invoke-virtual {v0}, Lkr/memorynotes/SwipeGesture;->cancel()V

    .line 38
    :cond_11c
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
