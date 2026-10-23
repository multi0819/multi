.class public final Lkr/memorynotes/InkGeometry;
.super Ljava/lang/Object;
.source "InkGeometry.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static nearSegment(FFFFFFF)Z
    .registers 11

    .line 3
    sub-float/2addr p4, p2

    sub-float/2addr p5, p3

    mul-float v0, p4, p4

    mul-float v1, p5, p5

    add-float/2addr v0, v1

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-nez v2, :cond_d

    goto :goto_1f

    :cond_d
    sub-float v2, p0, p2

    mul-float/2addr v2, p4

    sub-float v3, p1, p3

    mul-float/2addr v3, p5

    add-float/2addr v2, v3

    div-float/2addr v2, v0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v1

    :goto_1f
    mul-float/2addr p4, v1

    add-float/2addr p2, p4

    sub-float/2addr p0, p2

    mul-float/2addr v1, p5

    add-float/2addr p3, v1

    sub-float/2addr p1, p3

    mul-float/2addr p0, p0

    mul-float/2addr p1, p1

    add-float/2addr p0, p1

    mul-float/2addr p6, p6

    cmpg-float p0, p0, p6

    if-gtz p0, :cond_2f

    const/4 p0, 0x1

    return p0

    :cond_2f
    const/4 p0, 0x0

    return p0
.end method
