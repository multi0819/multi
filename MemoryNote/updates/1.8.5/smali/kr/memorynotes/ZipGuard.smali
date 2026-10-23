.class public final Lkr/memorynotes/ZipGuard;
.super Ljava/lang/Object;
.source "ZipGuard.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkName(Ljava/lang/String;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 5
    const-string v0, "notes.json"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 6
    :cond_9
    const-string v0, "images/[A-Za-z0-9_-]+\\.img"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_12

    .line 7
    return-void

    .line 6
    :cond_12
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\ubc31\uc5c5\uc5d0 \ud5c8\uc6a9\ub418\uc9c0 \uc54a\ub294 \ud30c\uc77c \uacbd\ub85c\uac00 \uc788\uc2b5\ub2c8\ub2e4"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
