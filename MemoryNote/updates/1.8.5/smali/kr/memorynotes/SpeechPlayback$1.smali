.class Lkr/memorynotes/SpeechPlayback$1;
.super Landroid/speech/tts/UtteranceProgressListener;
.source "SpeechPlayback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/SpeechPlayback;->initialize(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/SpeechPlayback;


# direct methods
.method constructor <init>(Lkr/memorynotes/SpeechPlayback;)V
    .registers 2

    .line 44
    iput-object p1, p0, Lkr/memorynotes/SpeechPlayback$1;->this$0:Lkr/memorynotes/SpeechPlayback;

    invoke-direct {p0}, Landroid/speech/tts/UtteranceProgressListener;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$0$kr-memorynotes-SpeechPlayback$1(Ljava/lang/String;)V
    .registers 3

    .line 46
    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback$1;->this$0:Lkr/memorynotes/SpeechPlayback;

    # invokes: Lkr/memorynotes/SpeechPlayback;->finished(Ljava/lang/String;)V
    invoke-static {v0, p1}, Lkr/memorynotes/SpeechPlayback;->access$1(Lkr/memorynotes/SpeechPlayback;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$1$kr-memorynotes-SpeechPlayback$1(Ljava/lang/String;)V
    .registers 3

    .line 47
    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback$1;->this$0:Lkr/memorynotes/SpeechPlayback;

    # invokes: Lkr/memorynotes/SpeechPlayback;->valid(Ljava/lang/String;)Z
    invoke-static {v0, p1}, Lkr/memorynotes/SpeechPlayback;->access$2(Lkr/memorynotes/SpeechPlayback;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_f

    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback$1;->this$0:Lkr/memorynotes/SpeechPlayback;

    const-string v0, "\uc74c\uc131\uc744 \uc77d\uc9c0 \ubabb\ud588\uc2b5\ub2c8\ub2e4. \uc74c\uc131 \uc124\uc815\uc744 \ud655\uc778\ud55c \ub4a4 \ub2e4\uc2dc \uc2dc\ub3c4\ud558\uc138\uc694."

    # invokes: Lkr/memorynotes/SpeechPlayback;->fail(Ljava/lang/String;)V
    invoke-static {p1, v0}, Lkr/memorynotes/SpeechPlayback;->access$3(Lkr/memorynotes/SpeechPlayback;Ljava/lang/String;)V

    :cond_f
    return-void
.end method

.method public onDone(Ljava/lang/String;)V
    .registers 4

    .line 46
    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback$1;->this$0:Lkr/memorynotes/SpeechPlayback;

    # getter for: Lkr/memorynotes/SpeechPlayback;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lkr/memorynotes/SpeechPlayback;->access$0(Lkr/memorynotes/SpeechPlayback;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lkr/memorynotes/SpeechPlayback$1$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lkr/memorynotes/SpeechPlayback$1$$ExternalSyntheticLambda1;-><init>(Lkr/memorynotes/SpeechPlayback$1;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .registers 4

    .line 47
    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback$1;->this$0:Lkr/memorynotes/SpeechPlayback;

    # getter for: Lkr/memorynotes/SpeechPlayback;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lkr/memorynotes/SpeechPlayback;->access$0(Lkr/memorynotes/SpeechPlayback;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lkr/memorynotes/SpeechPlayback$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lkr/memorynotes/SpeechPlayback$1$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/SpeechPlayback$1;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onStart(Ljava/lang/String;)V
    .registers 2

    .line 45
    return-void
.end method
