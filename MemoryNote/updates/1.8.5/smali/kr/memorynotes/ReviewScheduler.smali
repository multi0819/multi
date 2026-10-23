.class public final Lkr/memorynotes/ReviewScheduler;
.super Ljava/lang/Object;
.source "ReviewScheduler.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static next(Ljava/time/LocalDate;II)Ljava/time/LocalDate;
    .registers 4

    .line 5
    if-ltz p1, :cond_1e

    const/4 v0, 0x2

    if-gt p1, v0, :cond_1e

    .line 6
    const/4 v0, 0x1

    if-nez p1, :cond_9

    goto :goto_18

    :cond_9
    if-ne p1, v0, :cond_d

    const/4 v0, 0x3

    goto :goto_18

    :cond_d
    if-nez p2, :cond_11

    const/4 v0, 0x7

    goto :goto_18

    :cond_11
    if-ne p2, v0, :cond_16

    const/16 v0, 0xe

    goto :goto_18

    :cond_16
    const/16 v0, 0x1e

    .line 7
    :goto_18
    int-to-long p1, v0

    invoke-virtual {p0, p1, p2}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object p0

    return-object p0

    .line 5
    :cond_1e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "rating"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static streak(II)I
    .registers 3

    .line 9
    const/4 v0, 0x2

    if-ne p0, v0, :cond_6

    add-int/lit8 p1, p1, 0x1

    goto :goto_7

    :cond_6
    const/4 p1, 0x0

    :goto_7
    return p1
.end method
