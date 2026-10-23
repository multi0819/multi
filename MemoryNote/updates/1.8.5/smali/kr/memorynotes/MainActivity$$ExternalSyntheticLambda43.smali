.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda43;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic f$0:I


# direct methods
.method public synthetic constructor <init>(I)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda43;->f$0:I

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .registers 3

    .line 0
    iget v0, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda43;->f$0:I

    check-cast p1, Lkr/memorynotes/Note;

    invoke-static {v0, p1}, Lkr/memorynotes/MainActivity;->lambda$48(ILkr/memorynotes/Note;)Z

    move-result p1

    return p1
.end method
