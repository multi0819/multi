.class public final Lkr/memorynotes/StudyText;
.super Ljava/lang/Object;
.source "StudyText.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkr/memorynotes/StudyText$Part;
    }
.end annotation


# static fields
.field public static final ANSWER:I = 0x1

.field public static final CLOZE:I = 0x2

.field public static final NORMAL:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static parse(Ljava/lang/String;IIZILjava/util/List;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IIZI",
            "Ljava/util/List<",
            "Lkr/memorynotes/StudyText$Part;",
            ">;)V"
        }
    .end annotation

    .line 21
    nop

    .line 22
    move v0, p1

    :goto_2
    if-lt p1, p2, :cond_13

    .line 33
    if-ge v0, p2, :cond_12

    new-instance p1, Lkr/memorynotes/StudyText$Part;

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0, p4, v0, p2}, Lkr/memorynotes/StudyText$Part;-><init>(Ljava/lang/String;III)V

    invoke-interface {p5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    :cond_12
    return-void

    .line 23
    :cond_13
    const-string v1, "[["

    invoke-virtual {p0, v1, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v1

    const-string v2, "{{"

    invoke-virtual {p0, v2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v2

    .line 24
    if-eqz v1, :cond_24

    const-string v1, "]]"

    goto :goto_2a

    :cond_24
    if-eqz v2, :cond_29

    const-string v1, "}}"

    goto :goto_2a

    :cond_29
    const/4 v1, 0x0

    .line 25
    :goto_2a
    if-nez v1, :cond_2e

    const/4 v1, -0x1

    goto :goto_34

    :cond_2e
    add-int/lit8 v3, p1, 0x2

    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    :goto_34
    move v5, v1

    .line 26
    if-ltz v5, :cond_6f

    add-int/lit8 v1, v5, 0x2

    if-gt v1, p2, :cond_6f

    .line 27
    if-ge v0, p1, :cond_49

    new-instance v3, Lkr/memorynotes/StudyText$Part;

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, p4, v0, p1}, Lkr/memorynotes/StudyText$Part;-><init>(Ljava/lang/String;III)V

    invoke-interface {p5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    :cond_49
    if-eqz v2, :cond_62

    new-instance v0, Lkr/memorynotes/StudyText$Part;

    if-eqz p3, :cond_52

    const-string v2, "[\u2022\u2022\u2022]"

    goto :goto_58

    :cond_52
    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :goto_58
    add-int/lit8 p1, p1, 0x2

    const/4 v3, 0x2

    invoke-direct {v0, v2, v3, p1, v5}, Lkr/memorynotes/StudyText$Part;-><init>(Ljava/lang/String;III)V

    invoke-interface {p5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6b

    .line 29
    :cond_62
    add-int/lit8 v4, p1, 0x2

    const/4 v7, 0x1

    move-object v3, p0

    move v6, p3

    move-object v8, p5

    invoke-static/range {v3 .. v8}, Lkr/memorynotes/StudyText;->parse(Ljava/lang/String;IIZILjava/util/List;)V

    .line 30
    :goto_6b
    nop

    .line 31
    move p1, v1

    move v0, p1

    goto :goto_2

    :cond_6f
    add-int/lit8 p1, p1, 0x1

    goto :goto_2
.end method

.method public static parts(Ljava/lang/String;ZZ)Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZZ)",
            "Ljava/util/List<",
            "Lkr/memorynotes/StudyText$Part;",
            ">;"
        }
    .end annotation

    .line 14
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 16
    const-string v0, "[["

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    const-string v1, "]]"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-ltz v0, :cond_1f

    move v0, v2

    goto :goto_20

    :cond_1f
    move v0, v3

    .line 17
    :goto_20
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz p2, :cond_2a

    if-nez v0, :cond_2a

    move p2, v2

    goto :goto_2b

    :cond_2a
    move p2, v3

    :goto_2b
    const/4 v1, 0x0

    move-object v0, p0

    move v2, v4

    move v3, p1

    move v4, p2

    move-object v5, v6

    invoke-static/range {v0 .. v5}, Lkr/memorynotes/StudyText;->parse(Ljava/lang/String;IIZILjava/util/List;)V

    .line 18
    return-object v6
.end method

.method public static plain(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 4

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-static {p0, p1, v1}, Lkr/memorynotes/StudyText;->parts(Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_19

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkr/memorynotes/StudyText$Part;

    iget-object p1, p1, Lkr/memorynotes/StudyText$Part;->text:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_e
.end method
