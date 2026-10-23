.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda42;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic f$0:Ljava/util/Map$Entry;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map$Entry;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda42;->f$0:Ljava/util/Map$Entry;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .registers 3

    .line 0
    iget-object v0, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda42;->f$0:Ljava/util/Map$Entry;

    check-cast p1, Lkr/memorynotes/Note;

    invoke-static {v0, p1}, Lkr/memorynotes/MainActivity;->lambda$47(Ljava/util/Map$Entry;Lkr/memorynotes/Note;)Z

    move-result p1

    return p1
.end method
