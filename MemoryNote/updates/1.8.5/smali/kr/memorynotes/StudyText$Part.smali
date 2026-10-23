.class public final Lkr/memorynotes/StudyText$Part;
.super Ljava/lang/Object;
.source "StudyText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/StudyText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Part"
.end annotation


# instance fields
.field public final kind:I

.field public final sourceEnd:I

.field public final sourceStart:I

.field public final text:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;III)V
    .registers 5

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/StudyText$Part;->text:Ljava/lang/String;

    iput p2, p0, Lkr/memorynotes/StudyText$Part;->kind:I

    iput p3, p0, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    iput p4, p0, Lkr/memorynotes/StudyText$Part;->sourceEnd:I

    return-void
.end method
