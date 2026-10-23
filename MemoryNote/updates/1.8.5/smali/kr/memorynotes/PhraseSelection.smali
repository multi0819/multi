.class public final Lkr/memorynotes/PhraseSelection;
.super Ljava/lang/Object;
.source "PhraseSelection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkr/memorynotes/PhraseSelection$Range;
    }
.end annotation


# instance fields
.field private final selected:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/PhraseSelection$Range;",
            ">;"
        }
    .end annotation
.end field

.field public final source:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/PhraseSelection;->selected:Ljava/util/ArrayList;

    .line 11
    iput-object p1, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    return-void
.end method

.method static synthetic lambda$0(Lkr/memorynotes/PhraseSelection$Range;)I
    .registers 1

    .line 53
    iget p0, p0, Lkr/memorynotes/PhraseSelection$Range;->start:I

    return p0
.end method

.method public static markAnswer(Ljava/lang/String;II)Ljava/lang/String;
    .registers 11

    .line 57
    if-ltz p1, :cond_b3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt p2, v0, :cond_b3

    if-ge p1, p2, :cond_b3

    .line 58
    const-string v0, "(?s)\\[\\[(.*?)\\]\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 59
    nop

    :cond_15
    :goto_15
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    const/4 v2, 0x2

    if-nez v1, :cond_8e

    .line 63
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 64
    const-string v1, "[["

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_86

    const-string v3, "]]"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_86

    .line 65
    const/4 v4, 0x0

    invoke-static {p0, v4, v4}, Lkr/memorynotes/StudyText;->parts(Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_39
    :goto_39
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_65

    .line 66
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 65
    :cond_65
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkr/memorynotes/StudyText$Part;

    iget v7, v6, Lkr/memorynotes/StudyText$Part;->kind:I

    if-ne v7, v2, :cond_39

    iget v7, v6, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    sub-int/2addr v7, v2

    iget v6, v6, Lkr/memorynotes/StudyText$Part;->sourceEnd:I

    add-int/2addr v6, v2

    if-le p1, v7, :cond_79

    if-lt p1, v6, :cond_7e

    :cond_79
    if-le p2, v7, :cond_39

    if-lt p2, v6, :cond_7e

    goto :goto_39

    :cond_7e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\uac00\ub9bc \ubb38\uad6c \uc804\uccb4\ub97c \ud3ec\ud568\ud574 \uc120\ud0dd\ud558\uc138\uc694."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 64
    :cond_86
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\uc774\ubbf8 \ub2f5\uc73c\ub85c \uc9c0\uc815\ud55c \uc601\uc5ed\uc740 \uc81c\uc678\ud558\uace0 \uc120\ud0dd\ud558\uc138\uc694."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 60
    :cond_8e
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v1

    add-int/2addr v1, v2

    if-lt p1, v1, :cond_9d

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    sub-int/2addr v1, v2

    if-gt p2, v1, :cond_9d

    return-object p0

    .line 61
    :cond_9d
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    if-ge p1, v1, :cond_15

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v1

    if-gt p2, v1, :cond_ab

    goto/16 :goto_15

    :cond_ab
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\uc774\ubbf8 \ub2f5\uc73c\ub85c \uc9c0\uc815\ud55c \uc601\uc5ed\uacfc \uacb9\uce69\ub2c8\ub2e4. \ub2f5 \uc601\uc5ed \uc548\ucabd\ub9cc \uc120\ud0dd\ud558\uc138\uc694."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 57
    :cond_b3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\uba3c\uc800 \ub2f5\uc73c\ub85c \uc9c0\uc815\ud560 \ubd80\ubd84\uc744 \uc120\ud0dd\ud558\uc138\uc694."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public add(II)Z
    .registers 8

    .line 17
    const/4 v0, 0x0

    if-ltz p1, :cond_ad

    iget-object v1, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gt p2, v1, :cond_ad

    if-lt p1, p2, :cond_f

    goto/16 :goto_ad

    .line 18
    :cond_f
    :goto_f
    if-ge p1, p2, :cond_21

    iget-object v1, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_1e

    .line 19
    goto :goto_21

    .line 18
    :cond_1e
    add-int/lit8 p1, p1, 0x1

    goto :goto_f

    .line 19
    :cond_21
    :goto_21
    if-le p2, p1, :cond_35

    iget-object v1, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_32

    goto :goto_35

    :cond_32
    add-int/lit8 p2, p2, -0x1

    goto :goto_21

    .line 20
    :cond_35
    :goto_35
    if-ne p1, p2, :cond_38

    return v0

    .line 21
    :cond_38
    iget-object v1, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-virtual {v1, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 22
    const-string v2, "{{"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_ac

    const-string v2, "}}"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_ac

    const-string v2, "[["

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_ac

    const-string v2, "]]"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5f

    goto :goto_ac

    .line 23
    :cond_5f
    iget-object v1, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-static {v1, v0, v0}, Lkr/memorynotes/StudyText;->parts(Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_69
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_96

    .line 24
    iget-object v1, p0, Lkr/memorynotes/PhraseSelection;->selected:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_75
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_87

    .line 25
    iget-object v0, p0, Lkr/memorynotes/PhraseSelection;->selected:Ljava/util/ArrayList;

    new-instance v1, Lkr/memorynotes/PhraseSelection$Range;

    invoke-direct {v1, p1, p2}, Lkr/memorynotes/PhraseSelection$Range;-><init>(II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    return p1

    .line 24
    :cond_87
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkr/memorynotes/PhraseSelection$Range;

    iget v3, v1, Lkr/memorynotes/PhraseSelection$Range;->end:I

    if-ge p1, v3, :cond_75

    iget v1, v1, Lkr/memorynotes/PhraseSelection$Range;->start:I

    if-le p2, v1, :cond_75

    return v0

    .line 23
    :cond_96
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkr/memorynotes/StudyText$Part;

    iget v3, v2, Lkr/memorynotes/StudyText$Part;->kind:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_69

    iget v3, v2, Lkr/memorynotes/StudyText$Part;->sourceEnd:I

    add-int/2addr v3, v4

    if-ge p1, v3, :cond_69

    iget v2, v2, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    sub-int/2addr v2, v4

    if-le p2, v2, :cond_69

    return v0

    .line 22
    :cond_ac
    :goto_ac
    return v0

    .line 17
    :cond_ad
    :goto_ad
    return v0
.end method

.method public addVisible(II)Z
    .registers 10

    .line 28
    const/4 v0, 0x0

    if-ltz p1, :cond_46

    if-lt p1, p2, :cond_6

    goto :goto_46

    .line 29
    :cond_6
    nop

    .line 30
    iget-object v1, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-static {v1, v0, v0}, Lkr/memorynotes/StudyText;->parts(Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, -0x1

    move v4, v0

    move v3, v2

    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_27

    .line 36
    if-ltz v2, :cond_26

    if-ltz v3, :cond_26

    invoke-virtual {p0, v2, v3}, Lkr/memorynotes/PhraseSelection;->add(II)Z

    move-result p1

    if-eqz p1, :cond_26

    const/4 p1, 0x1

    return p1

    :cond_26
    return v0

    .line 30
    :cond_27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkr/memorynotes/StudyText$Part;

    .line 31
    iget-object v6, v5, Lkr/memorynotes/StudyText$Part;->text:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v4

    .line 32
    if-lt p1, v4, :cond_3c

    if-ge p1, v6, :cond_3c

    iget v2, v5, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    add-int/2addr v2, p1

    sub-int/2addr v2, v4

    .line 33
    :cond_3c
    if-le p2, v4, :cond_44

    if-gt p2, v6, :cond_44

    iget v3, v5, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    add-int/2addr v3, p2

    sub-int/2addr v3, v4

    .line 34
    :cond_44
    move v4, v6

    goto :goto_14

    .line 28
    :cond_46
    :goto_46
    return v0
.end method

.method public apply()Ljava/lang/String;
    .registers 6

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lkr/memorynotes/PhraseSelection;->selected:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Lkr/memorynotes/PhraseSelection$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lkr/memorynotes/PhraseSelection$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v1}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Comparator;->reversed()Ljava/util/Comparator;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_22
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2d

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2d
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkr/memorynotes/PhraseSelection$Range;

    iget v3, v2, Lkr/memorynotes/PhraseSelection$Range;->end:I

    const-string v4, "}}"

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v2, Lkr/memorynotes/PhraseSelection$Range;->start:I

    const-string v3, "{{"

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_22
.end method

.method public clear()V
    .registers 2

    .line 14
    iget-object v0, p0, Lkr/memorynotes/PhraseSelection;->selected:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public lines()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lkr/memorynotes/PhraseSelection$Range;",
            ">;"
        }
    .end annotation

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    const/4 v1, 0x0

    :goto_6
    iget-object v2, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_f

    .line 49
    return-object v0

    .line 41
    :cond_f
    iget-object v2, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    const/16 v3, 0xa

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    if-gez v2, :cond_1f

    iget-object v2, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    .line 42
    :cond_1f
    nop

    :goto_20
    if-ge v1, v2, :cond_32

    iget-object v3, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-nez v3, :cond_2f

    .line 43
    goto :goto_32

    .line 42
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 43
    :cond_32
    :goto_32
    move v3, v2

    :goto_33
    if-le v3, v1, :cond_47

    iget-object v4, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    add-int/lit8 v5, v3, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-nez v4, :cond_44

    goto :goto_47

    :cond_44
    add-int/lit8 v3, v3, -0x1

    goto :goto_33

    .line 44
    :cond_47
    :goto_47
    iget-object v4, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    const-string v5, "[["

    invoke-virtual {v4, v5, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_53

    add-int/lit8 v1, v1, 0x2

    .line 45
    :cond_53
    add-int/lit8 v4, v1, 0x2

    if-lt v3, v4, :cond_67

    iget-object v4, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-virtual {v4, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v5, "]]"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_67

    add-int/lit8 v3, v3, -0x2

    .line 46
    :cond_67
    if-ge v1, v3, :cond_7e

    new-instance v4, Lkr/memorynotes/PhraseSelection;

    iget-object v5, p0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-direct {v4, v5}, Lkr/memorynotes/PhraseSelection;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1, v3}, Lkr/memorynotes/PhraseSelection;->add(II)Z

    move-result v4

    if-eqz v4, :cond_7e

    new-instance v4, Lkr/memorynotes/PhraseSelection$Range;

    invoke-direct {v4, v1, v3}, Lkr/memorynotes/PhraseSelection$Range;-><init>(II)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    :cond_7e
    add-int/lit8 v1, v2, 0x1

    goto :goto_6
.end method

.method public ranges()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lkr/memorynotes/PhraseSelection$Range;",
            ">;"
        }
    .end annotation

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lkr/memorynotes/PhraseSelection;->selected:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public remove(I)V
    .registers 3

    .line 15
    iget-object v0, p0, Lkr/memorynotes/PhraseSelection;->selected:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method public selectLines()V
    .registers 4

    .line 51
    invoke-virtual {p0}, Lkr/memorynotes/PhraseSelection;->lines()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_f

    return-void

    :cond_f
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkr/memorynotes/PhraseSelection$Range;

    iget v2, v1, Lkr/memorynotes/PhraseSelection$Range;->start:I

    iget v1, v1, Lkr/memorynotes/PhraseSelection$Range;->end:I

    invoke-virtual {p0, v2, v1}, Lkr/memorynotes/PhraseSelection;->add(II)Z

    goto :goto_8
.end method

.method public size()I
    .registers 2

    .line 13
    iget-object v0, p0, Lkr/memorynotes/PhraseSelection;->selected:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
