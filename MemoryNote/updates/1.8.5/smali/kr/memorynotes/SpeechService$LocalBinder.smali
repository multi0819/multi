.class public final Lkr/memorynotes/SpeechService$LocalBinder;
.super Landroid/os/Binder;
.source "SpeechService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/SpeechService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "LocalBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/SpeechService;


# direct methods
.method public constructor <init>(Lkr/memorynotes/SpeechService;)V
    .registers 2

    .line 5
    iput-object p1, p0, Lkr/memorynotes/SpeechService$LocalBinder;->this$0:Lkr/memorynotes/SpeechService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method service()Lkr/memorynotes/SpeechService;
    .registers 2

    .line 5
    iget-object v0, p0, Lkr/memorynotes/SpeechService$LocalBinder;->this$0:Lkr/memorynotes/SpeechService;

    return-object v0
.end method
