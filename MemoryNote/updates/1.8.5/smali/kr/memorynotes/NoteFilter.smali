.class public final Lkr/memorynotes/NoteFilter;
.super Ljava/lang/Object;
.source "NoteFilter.java"


# instance fields
.field public chapter:Ljava/lang/String;

.field public dueOnly:Z

.field public favoriteOnly:Z

.field public rating:I

.field public subject:Ljava/lang/String;

.field public type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-string v0, ""

    iput-object v0, p0, Lkr/memorynotes/NoteFilter;->subject:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/NoteFilter;->chapter:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/NoteFilter;->type:Ljava/lang/String;

    const/4 v0, -0x2

    iput v0, p0, Lkr/memorynotes/NoteFilter;->rating:I

    .line 4
    return-void
.end method

.method public static isDue(Lkr/memorynotes/Note;Ljava/lang/String;)Z
    .registers 3

    .line 6
    iget-object v0, p0, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_12

    iget-object p0, p0, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    if-lez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public select(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lkr/memorynotes/Note;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;"
        }
    .end annotation

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_9
    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_10

    .line 12
    return-object v0

    .line 7
    :cond_10
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkr/memorynotes/Note;

    .line 8
    iget-object v2, p0, Lkr/memorynotes/NoteFilter;->subject:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_29

    iget-object v2, p0, Lkr/memorynotes/NoteFilter;->subject:Ljava/lang/String;

    iget-object v3, v1, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_29

    goto :goto_9

    .line 9
    :cond_29
    const-string v2, "__without_chapter__"

    iget-object v3, p0, Lkr/memorynotes/NoteFilter;->chapter:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3c

    iget-object v2, v1, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4f

    :goto_3b
    goto :goto_9

    :cond_3c
    iget-object v2, p0, Lkr/memorynotes/NoteFilter;->chapter:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4f

    iget-object v2, p0, Lkr/memorynotes/NoteFilter;->chapter:Ljava/lang/String;

    iget-object v3, v1, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4f

    goto :goto_3b

    .line 10
    :cond_4f
    iget-object v2, p0, Lkr/memorynotes/NoteFilter;->type:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_62

    iget-object v2, p0, Lkr/memorynotes/NoteFilter;->type:Ljava/lang/String;

    iget-object v3, v1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_62

    :goto_61
    goto :goto_9

    :cond_62
    iget v2, p0, Lkr/memorynotes/NoteFilter;->rating:I

    const/4 v3, -0x2

    if-eq v2, v3, :cond_6e

    iget v2, p0, Lkr/memorynotes/NoteFilter;->rating:I

    iget v3, v1, Lkr/memorynotes/Note;->rating:I

    if-eq v2, v3, :cond_6e

    goto :goto_61

    .line 11
    :cond_6e
    iget-boolean v2, p0, Lkr/memorynotes/NoteFilter;->dueOnly:Z

    if-eqz v2, :cond_78

    invoke-static {v1, p2}, Lkr/memorynotes/NoteFilter;->isDue(Lkr/memorynotes/Note;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_78
    iget-boolean v2, p0, Lkr/memorynotes/NoteFilter;->favoriteOnly:Z

    if-eqz v2, :cond_81

    iget-boolean v2, v1, Lkr/memorynotes/Note;->favorite:Z

    if-nez v2, :cond_81

    goto :goto_9

    :cond_81
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9
.end method
