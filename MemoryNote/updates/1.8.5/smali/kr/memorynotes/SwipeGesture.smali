.class public final Lkr/memorynotes/SwipeGesture;
.super Ljava/lang/Object;
.source "SwipeGesture.java"


# instance fields
.field private active:Z

.field private final commit:F

.field private dragging:Z

.field private final slop:F

.field private x:F

.field private y:F


# direct methods
.method public constructor <init>(FF)V
    .registers 3

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkr/memorynotes/SwipeGesture;->slop:F

    iput p2, p0, Lkr/memorynotes/SwipeGesture;->commit:F

    return-void
.end method


# virtual methods
.method public begin(FFIIZ)V
    .registers 6

    .line 5
    iput p1, p0, Lkr/memorynotes/SwipeGesture;->x:F

    iput p2, p0, Lkr/memorynotes/SwipeGesture;->y:F

    const/4 p1, 0x0

    const/4 p2, 0x1

    if-ne p3, p2, :cond_d

    if-ne p4, p2, :cond_d

    if-nez p5, :cond_d

    goto :goto_e

    :cond_d
    move p2, p1

    :goto_e
    iput-boolean p2, p0, Lkr/memorynotes/SwipeGesture;->active:Z

    iput-boolean p1, p0, Lkr/memorynotes/SwipeGesture;->dragging:Z

    return-void
.end method

.method public cancel()V
    .registers 2

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/SwipeGesture;->active:Z

    iput-boolean v0, p0, Lkr/memorynotes/SwipeGesture;->dragging:Z

    return-void
.end method

.method public delta(F)F
    .registers 3

    .line 15
    iget v0, p0, Lkr/memorynotes/SwipeGesture;->x:F

    sub-float/2addr p1, v0

    return p1
.end method

.method public finish(FF)I
    .registers 7

    .line 13
    iget v0, p0, Lkr/memorynotes/SwipeGesture;->x:F

    sub-float/2addr p1, v0

    iget v0, p0, Lkr/memorynotes/SwipeGesture;->y:F

    sub-float/2addr p2, v0

    iget-boolean v0, p0, Lkr/memorynotes/SwipeGesture;->active:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_2c

    iget-boolean v0, p0, Lkr/memorynotes/SwipeGesture;->dragging:Z

    if-eqz v0, :cond_2c

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v3, p0, Lkr/memorynotes/SwipeGesture;->commit:F

    cmpl-float v0, v0, v3

    if-ltz v0, :cond_2c

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    const v3, 0x3fa66666    # 1.3f

    mul-float/2addr p2, v3

    cmpl-float p2, v0, p2

    if-lez p2, :cond_2c

    move p2, v1

    goto :goto_2d

    :cond_2c
    move p2, v2

    :goto_2d
    invoke-virtual {p0}, Lkr/memorynotes/SwipeGesture;->cancel()V

    if-eqz p2, :cond_3a

    const/4 p2, 0x0

    cmpg-float p1, p1, p2

    if-gez p1, :cond_38

    goto :goto_3b

    :cond_38
    const/4 v1, -0x1

    goto :goto_3b

    :cond_3a
    move v1, v2

    :goto_3b
    return v1
.end method

.method public move(FFII)Z
    .registers 7

    .line 7
    iget-boolean v0, p0, Lkr/memorynotes/SwipeGesture;->active:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    const/4 v0, 0x1

    if-ne p3, v0, :cond_4f

    if-eq p4, v0, :cond_c

    goto :goto_4f

    .line 8
    :cond_c
    iget-boolean p3, p0, Lkr/memorynotes/SwipeGesture;->dragging:Z

    if-eqz p3, :cond_11

    return v0

    :cond_11
    iget p3, p0, Lkr/memorynotes/SwipeGesture;->x:F

    sub-float/2addr p1, p3

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget p3, p0, Lkr/memorynotes/SwipeGesture;->y:F

    sub-float/2addr p2, p3

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    .line 9
    iget p3, p0, Lkr/memorynotes/SwipeGesture;->slop:F

    cmpg-float p3, p1, p3

    if-gez p3, :cond_2c

    iget p3, p0, Lkr/memorynotes/SwipeGesture;->slop:F

    cmpg-float p3, p2, p3

    if-gez p3, :cond_2c

    return v1

    .line 10
    :cond_2c
    iget p3, p0, Lkr/memorynotes/SwipeGesture;->commit:F

    cmpl-float p3, p2, p3

    if-ltz p3, :cond_3c

    const/high16 p3, 0x3fc00000    # 1.5f

    mul-float/2addr p3, p1

    cmpl-float p3, p2, p3

    if-lez p3, :cond_3c

    iput-boolean v1, p0, Lkr/memorynotes/SwipeGesture;->active:Z

    return v1

    .line 11
    :cond_3c
    iget p3, p0, Lkr/memorynotes/SwipeGesture;->slop:F

    cmpl-float p3, p1, p3

    if-lez p3, :cond_4c

    const p3, 0x3fa66666    # 1.3f

    mul-float/2addr p2, p3

    cmpl-float p1, p1, p2

    if-lez p1, :cond_4c

    iput-boolean v0, p0, Lkr/memorynotes/SwipeGesture;->dragging:Z

    :cond_4c
    iget-boolean p1, p0, Lkr/memorynotes/SwipeGesture;->dragging:Z

    return p1

    .line 7
    :cond_4f
    :goto_4f
    invoke-virtual {p0}, Lkr/memorynotes/SwipeGesture;->cancel()V

    return v1
.end method
