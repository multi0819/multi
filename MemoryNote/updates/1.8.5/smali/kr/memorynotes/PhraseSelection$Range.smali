.class public final Lkr/memorynotes/PhraseSelection$Range;
.super Ljava/lang/Object;
.source "PhraseSelection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/PhraseSelection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Range"
.end annotation


# instance fields
.field public final end:I

.field public final start:I


# direct methods
.method constructor <init>(II)V
    .registers 3

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkr/memorynotes/PhraseSelection$Range;->start:I

    iput p2, p0, Lkr/memorynotes/PhraseSelection$Range;->end:I

    return-void
.end method
