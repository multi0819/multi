.class public final Lkr/memorynotes/Cloze;
.super Ljava/lang/Object;
.source "Cloze.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static mask(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 3
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lkr/memorynotes/StudyText;->plain(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static reveal(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 4
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lkr/memorynotes/StudyText;->plain(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
