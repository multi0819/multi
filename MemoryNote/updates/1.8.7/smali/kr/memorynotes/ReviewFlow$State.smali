.class Lkr/memorynotes/ReviewFlow$State;
.super Ljava/lang/Object;
.source "ReviewFlow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/ReviewFlow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "State"
.end annotation


# instance fields
.field index:I

.field opened:Z


# direct methods
.method constructor <init>(I)V
    .registers 2

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkr/memorynotes/ReviewFlow$State;->index:I

    return-void
.end method
