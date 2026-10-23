.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda26;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    check-cast p1, Lkr/memorynotes/Note;

    invoke-static {p1}, Lkr/memorynotes/MainActivity;->lambda$41(Lkr/memorynotes/Note;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
