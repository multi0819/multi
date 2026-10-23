.class Lkr/memorynotes/SpeechService$1;
.super Landroid/media/session/MediaSession$Callback;
.source "SpeechService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/SpeechService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/SpeechService;


# direct methods
.method constructor <init>(Lkr/memorynotes/SpeechService;)V
    .registers 2

    .line 7
    iput-object p1, p0, Lkr/memorynotes/SpeechService$1;->this$0:Lkr/memorynotes/SpeechService;

    invoke-direct {p0}, Landroid/media/session/MediaSession$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onPause()V
    .registers 2

    .line 7
    iget-object v0, p0, Lkr/memorynotes/SpeechService$1;->this$0:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lkr/memorynotes/SpeechService$1;->this$0:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lkr/memorynotes/SpeechService$1;->this$0:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->toggle()V

    :cond_17
    return-void
.end method

.method public onPlay()V
    .registers 2

    .line 7
    iget-object v0, p0, Lkr/memorynotes/SpeechService$1;->this$0:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lkr/memorynotes/SpeechService$1;->this$0:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_17

    iget-object v0, p0, Lkr/memorynotes/SpeechService$1;->this$0:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->toggle()V

    :cond_17
    return-void
.end method

.method public onSkipToNext()V
    .registers 2

    .line 7
    iget-object v0, p0, Lkr/memorynotes/SpeechService$1;->this$0:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lkr/memorynotes/SpeechService$1;->this$0:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->next()V

    :cond_d
    return-void
.end method

.method public onStop()V
    .registers 2

    .line 7
    iget-object v0, p0, Lkr/memorynotes/SpeechService$1;->this$0:Lkr/memorynotes/SpeechService;

    # invokes: Lkr/memorynotes/SpeechService;->endSession()V
    invoke-static {v0}, Lkr/memorynotes/SpeechService;->access$0(Lkr/memorynotes/SpeechService;)V

    return-void
.end method
