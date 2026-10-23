.class Lkr/memorynotes/SpeechReader$1;
.super Ljava/lang/Object;
.source "SpeechReader.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/SpeechReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/SpeechReader;


# direct methods
.method constructor <init>(Lkr/memorynotes/SpeechReader;)V
    .registers 2

    .line 7
    iput-object p1, p0, Lkr/memorynotes/SpeechReader$1;->this$0:Lkr/memorynotes/SpeechReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$0$kr-memorynotes-SpeechReader$1()V
    .registers 2

    .line 8
    iget-object v0, p0, Lkr/memorynotes/SpeechReader$1;->this$0:Lkr/memorynotes/SpeechReader;

    # invokes: Lkr/memorynotes/SpeechReader;->render()V
    invoke-static {v0}, Lkr/memorynotes/SpeechReader;->access$2(Lkr/memorynotes/SpeechReader;)V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 3

    .line 8
    iget-object p1, p0, Lkr/memorynotes/SpeechReader$1;->this$0:Lkr/memorynotes/SpeechReader;

    check-cast p2, Lkr/memorynotes/SpeechService$LocalBinder;

    invoke-virtual {p2}, Lkr/memorynotes/SpeechService$LocalBinder;->service()Lkr/memorynotes/SpeechService;

    move-result-object p2

    invoke-static {p1, p2}, Lkr/memorynotes/SpeechReader;->access$0(Lkr/memorynotes/SpeechReader;Lkr/memorynotes/SpeechService;)V

    iget-object p1, p0, Lkr/memorynotes/SpeechReader$1;->this$0:Lkr/memorynotes/SpeechReader;

    # getter for: Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;
    invoke-static {p1}, Lkr/memorynotes/SpeechReader;->access$1(Lkr/memorynotes/SpeechReader;)Lkr/memorynotes/SpeechService;

    move-result-object p1

    iget-object p1, p1, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz p1, :cond_24

    iget-object p1, p0, Lkr/memorynotes/SpeechReader$1;->this$0:Lkr/memorynotes/SpeechReader;

    # getter for: Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;
    invoke-static {p1}, Lkr/memorynotes/SpeechReader;->access$1(Lkr/memorynotes/SpeechReader;)Lkr/memorynotes/SpeechService;

    move-result-object p1

    iget-object p1, p1, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    new-instance p2, Lkr/memorynotes/SpeechReader$1$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lkr/memorynotes/SpeechReader$1$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/SpeechReader$1;)V

    iput-object p2, p1, Lkr/memorynotes/SpeechPlayback;->observer:Ljava/lang/Runnable;

    :cond_24
    iget-object p1, p0, Lkr/memorynotes/SpeechReader$1;->this$0:Lkr/memorynotes/SpeechReader;

    # invokes: Lkr/memorynotes/SpeechReader;->render()V
    invoke-static {p1}, Lkr/memorynotes/SpeechReader;->access$2(Lkr/memorynotes/SpeechReader;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 3

    .line 9
    iget-object p1, p0, Lkr/memorynotes/SpeechReader$1;->this$0:Lkr/memorynotes/SpeechReader;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lkr/memorynotes/SpeechReader;->access$0(Lkr/memorynotes/SpeechReader;Lkr/memorynotes/SpeechService;)V

    return-void
.end method
