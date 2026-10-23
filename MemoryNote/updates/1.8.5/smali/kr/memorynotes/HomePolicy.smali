.class public final Lkr/memorynotes/HomePolicy;
.super Ljava/lang/Object;
.source "HomePolicy.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compare(ZLjava/lang/String;JZLjava/lang/String;JI)I
    .registers 10

    .line 6
    const/4 v0, 0x1

    if-eq p0, p4, :cond_7

    if-eqz p0, :cond_6

    const/4 v0, -0x1

    :cond_6
    return v0

    .line 7
    :cond_7
    if-ne p8, v0, :cond_10

    invoke-virtual {p1, p5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    if-eqz p0, :cond_10

    return p0

    .line 8
    :cond_10
    invoke-static {p6, p7, p2, p3}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method public static preview(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 3
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_19

    :cond_5
    const-string v0, "\u3014\uc0ac\uc9c4:[^\u3015]+\u3015"

    const-string v1, "[\uc0ac\uc9c4]"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\s+"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_19
    return-object p0
.end method

.method public static progress(II)I
    .registers 3

    .line 4
    add-int/2addr p1, p0

    if-nez p1, :cond_5

    const/4 p0, 0x0

    goto :goto_f

    :cond_5
    const/high16 v0, 0x42c80000    # 100.0f

    int-to-float p0, p0

    mul-float/2addr p0, v0

    int-to-float p1, p1

    div-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    :goto_f
    return p0
.end method
