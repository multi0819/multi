.class public final Lkr/memorynotes/ReviewFlow;
.super Ljava/lang/Object;
.source "ReviewFlow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkr/memorynotes/ReviewFlow$State;
    }
.end annotation


# static fields
.field private static final states:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lkr/memorynotes/ReviewScreen;",
            "Lkr/memorynotes/ReviewFlow$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lkr/memorynotes/ReviewFlow;->states:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasPhrases(Ljava/lang/String;)Z
    .registers 2

    .line 8
    if-eqz p0, :cond_14

    const-string v0, "\\{\\{[\\s\\S]+?\\}\\}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public static masked(Lkr/memorynotes/ReviewScreen;)Z
    .registers 4

    .line 6
    sget-object v0, Lkr/memorynotes/ReviewFlow;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/ReviewFlow$State;

    if-eqz v0, :cond_14

    iget v1, v0, Lkr/memorynotes/ReviewFlow$State;->index:I

    iget v2, p0, Lkr/memorynotes/ReviewScreen;->index:I

    if-ne v1, v2, :cond_14

    iget-boolean v1, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    if-nez v1, :cond_20

    :cond_14
    new-instance v0, Lkr/memorynotes/ReviewFlow$State;

    iget v1, p0, Lkr/memorynotes/ReviewScreen;->index:I

    invoke-direct {v0, v1}, Lkr/memorynotes/ReviewFlow$State;-><init>(I)V

    sget-object v1, Lkr/memorynotes/ReviewFlow;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_20
    iget-boolean p0, v0, Lkr/memorynotes/ReviewFlow$State;->opened:Z

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public static revealPhrases(Lkr/memorynotes/ReviewScreen;)V
    .registers 2

    .line 7
    invoke-static {p0}, Lkr/memorynotes/ReviewFlow;->masked(Lkr/memorynotes/ReviewScreen;)Z

    iget-boolean v0, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    if-eqz v0, :cond_12

    sget-object v0, Lkr/memorynotes/ReviewFlow;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkr/memorynotes/ReviewFlow$State;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lkr/memorynotes/ReviewFlow$State;->opened:Z

    :cond_12
    return-void
.end method
