.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda25;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ToIntFunction;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final applyAsInt(Ljava/lang/Object;)I
    .registers 2

    .line 0
    check-cast p1, Lkr/memorynotes/Note;

    invoke-static {p1}, Lkr/memorynotes/MainActivity;->lambda$40(Lkr/memorynotes/Note;)I

    move-result p1

    return p1
.end method
