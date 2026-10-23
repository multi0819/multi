.class public final Lkr/memorynotes/EditorPolicy;
.super Ljava/lang/Object;
.source "EditorPolicy.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isGeneral(Ljava/lang/String;)Z
    .registers 2

    .line 5
    const-string v0, "\uc77c\ubc18 \ub178\ud2b8"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static prepareSwitch(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 12
    invoke-static {p1}, Lkr/memorynotes/EditorPolicy;->isGeneral(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-static {p2}, Lkr/memorynotes/EditorPolicy;->isGeneral(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2d

    .line 13
    iget-object p1, p0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1c

    iget-object p1, p0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    iput-object p1, p0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    .line 14
    :cond_1c
    iget-object p1, p0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_61

    iget-object p1, p0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    iput-object p1, p0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    goto :goto_60

    .line 15
    :cond_2d
    invoke-static {p1}, Lkr/memorynotes/EditorPolicy;->isGeneral(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_60

    invoke-static {p2}, Lkr/memorynotes/EditorPolicy;->isGeneral(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_60

    .line 16
    iget-object p2, p0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_4f

    const-string p2, ""

    iget-object v0, p0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Lkr/memorynotes/EditorPolicy;->titleFor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    .line 17
    :cond_4f
    iget-object p1, p0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_61

    iget-object p1, p0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    iput-object p1, p0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    goto :goto_61

    .line 15
    :cond_60
    :goto_60
    nop

    .line 19
    :cond_61
    :goto_61
    return-void
.end method

.method public static titleFor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 7
    invoke-static {p0}, Lkr/memorynotes/EditorPolicy;->isGeneral(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 8
    :cond_b
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string p1, "\\R"

    const/4 p2, 0x2

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    aget-object p0, p0, p1

    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->codePointCount(II)I

    move-result p2

    const/16 v0, 0x50

    if-le p2, v0, :cond_2d

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->offsetByCodePoints(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_2d
    return-object p0
.end method
