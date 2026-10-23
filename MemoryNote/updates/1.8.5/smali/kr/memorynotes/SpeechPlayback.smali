.class final Lkr/memorynotes/SpeechPlayback;
.super Ljava/lang/Object;
.source "SpeechPlayback.java"


# instance fields
.field private final audio:Landroid/media/AudioManager;

.field private closed:Z

.field private final focus:Landroid/media/AudioFocusRequest;

.field private generation:I

.field private final handler:Landroid/os/Handler;

.field private index:I

.field label:Ljava/lang/String;

.field private final notes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;"
        }
    .end annotation
.end field

.field observer:Ljava/lang/Runnable;

.field private playing:Z

.field private ready:Z

.field private final service:Lkr/memorynotes/SpeechService;

.field private tts:Landroid/speech/tts/TextToSpeech;

.field private final wake:Landroid/os/PowerManager$WakeLock;


# direct methods
.method constructor <init>(Lkr/memorynotes/SpeechService;)V
    .registers 6

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const-string v0, "\ud55c\uad6d\uc5b4 \uc74c\uc131\uc744 \uc900\ube44\ud558\uace0 \uc788\uc2b5\ub2c8\ub2e4\u2026"

    iput-object v0, p0, Lkr/memorynotes/SpeechPlayback;->label:Ljava/lang/String;

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/SpeechPlayback;->notes:Ljava/util/ArrayList;

    .line 19
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lkr/memorynotes/SpeechPlayback;->handler:Landroid/os/Handler;

    .line 22
    const/4 v0, 0x0

    iput v0, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    iput v0, p0, Lkr/memorynotes/SpeechPlayback;->generation:I

    iput-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->ready:Z

    iput-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->playing:Z

    iput-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->closed:Z

    .line 24
    iput-object p1, p0, Lkr/memorynotes/SpeechPlayback;->service:Lkr/memorynotes/SpeechService;

    const-class v1, Landroid/media/AudioManager;

    invoke-virtual {p1, v1}, Lkr/memorynotes/SpeechService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    iput-object v1, p0, Lkr/memorynotes/SpeechPlayback;->audio:Landroid/media/AudioManager;

    .line 25
    new-instance v1, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v1

    .line 26
    new-instance v3, Landroid/media/AudioFocusRequest$Builder;

    invoke-direct {v3, v2}, Landroid/media/AudioFocusRequest$Builder;-><init>(I)V

    invoke-virtual {v3, v1}, Landroid/media/AudioFocusRequest$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object v1

    new-instance v3, Lkr/memorynotes/SpeechPlayback$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0}, Lkr/memorynotes/SpeechPlayback$$ExternalSyntheticLambda3;-><init>(Lkr/memorynotes/SpeechPlayback;)V

    invoke-virtual {v1, v3}, Landroid/media/AudioFocusRequest$Builder;->setOnAudioFocusChangeListener(Landroid/media/AudioManager$OnAudioFocusChangeListener;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/AudioFocusRequest$Builder;->build()Landroid/media/AudioFocusRequest;

    move-result-object v1

    iput-object v1, p0, Lkr/memorynotes/SpeechPlayback;->focus:Landroid/media/AudioFocusRequest;

    .line 27
    const-class v1, Landroid/os/PowerManager;

    invoke-virtual {p1, v1}, Lkr/memorynotes/SpeechService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    const-string v1, "kr.memorynotes:reading"

    invoke-virtual {p1, v2, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    iput-object p1, p0, Lkr/memorynotes/SpeechPlayback;->wake:Landroid/os/PowerManager$WakeLock;

    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->wake:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {p1, v0}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 28
    return-void
.end method

.method static synthetic access$0(Lkr/memorynotes/SpeechPlayback;)Landroid/os/Handler;
    .registers 1

    .line 19
    iget-object p0, p0, Lkr/memorynotes/SpeechPlayback;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$1(Lkr/memorynotes/SpeechPlayback;Ljava/lang/String;)V
    .registers 2

    .line 65
    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->finished(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2(Lkr/memorynotes/SpeechPlayback;Ljava/lang/String;)Z
    .registers 2

    .line 64
    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->valid(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3(Lkr/memorynotes/SpeechPlayback;Ljava/lang/String;)V
    .registers 2

    .line 71
    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->fail(Ljava/lang/String;)V

    return-void
.end method

.method private fail(Ljava/lang/String;)V
    .registers 3

    .line 71
    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->stop()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->ready:Z

    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->update(Ljava/lang/String;)V

    return-void
.end method

.method private finished(Ljava/lang/String;)V
    .registers 6

    .line 66
    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->valid(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 67
    :cond_7
    iget v0, p0, Lkr/memorynotes/SpeechPlayback;->generation:I

    .line 68
    const-string v1, ":q"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    const-string p1, "3\ucd08 \ub3d9\uc548 \ub2f5\uc744 \ub5a0\uc62c\ub824\ubcf4\uc138\uc694"

    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->update(Ljava/lang/String;)V

    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->handler:Landroid/os/Handler;

    new-instance v1, Lkr/memorynotes/SpeechPlayback$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0}, Lkr/memorynotes/SpeechPlayback$$ExternalSyntheticLambda1;-><init>(Lkr/memorynotes/SpeechPlayback;I)V

    const-wide/16 v2, 0xbb8

    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_37

    .line 69
    :cond_23
    const-string v1, ":a"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_37

    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->handler:Landroid/os/Handler;

    new-instance v1, Lkr/memorynotes/SpeechPlayback$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, v0}, Lkr/memorynotes/SpeechPlayback$$ExternalSyntheticLambda2;-><init>(Lkr/memorynotes/SpeechPlayback;I)V

    const-wide/16 v2, 0x4b0

    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 70
    :cond_37
    :goto_37
    return-void
.end method

.method private initialize(I)V
    .registers 4

    .line 40
    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->closed:Z

    if-eqz v0, :cond_5

    return-void

    .line 41
    :cond_5
    if-eqz p1, :cond_d

    const-string p1, "\uc74c\uc131 \uc5d4\uc9c4\uc744 \uc2dc\uc791\ud558\uc9c0 \ubabb\ud588\uc2b5\ub2c8\ub2e4. \ud734\ub300\ud3f0\uc758 \uae00\uc790 \uc77d\uc5b4\uc8fc\uae30 \uc124\uc815\uc744 \ud655\uc778\ud558\uc138\uc694."

    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->fail(Ljava/lang/String;)V

    return-void

    .line 42
    :cond_d
    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->tts:Landroid/speech/tts/TextToSpeech;

    sget-object v0, Ljava/util/Locale;->KOREAN:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    move-result p1

    .line 43
    const/4 v0, -0x1

    if-eq p1, v0, :cond_43

    const/4 v0, -0x2

    if-ne p1, v0, :cond_1c

    goto :goto_43

    .line 44
    :cond_1c
    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->tts:Landroid/speech/tts/TextToSpeech;

    new-instance v0, Lkr/memorynotes/SpeechPlayback$1;

    invoke-direct {v0, p0}, Lkr/memorynotes/SpeechPlayback$1;-><init>(Lkr/memorynotes/SpeechPlayback;)V

    invoke-virtual {p1, v0}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I

    .line 49
    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->tts:Landroid/speech/tts/TextToSpeech;

    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/speech/tts/TextToSpeech;->setAudioAttributes(Landroid/media/AudioAttributes;)I

    iput-boolean v1, p0, Lkr/memorynotes/SpeechPlayback;->ready:Z

    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->start()V

    .line 50
    return-void

    .line 43
    :cond_43
    :goto_43
    const-string p1, "\ud55c\uad6d\uc5b4 \uc74c\uc131 \ub370\uc774\ud130\uac00 \uc5c6\uc2b5\ub2c8\ub2e4. \ud734\ub300\ud3f0 \uc124\uc815\uc5d0\uc11c \ud55c\uad6d\uc5b4 TTS \uc74c\uc131\uc744 \uc124\uce58\ud55c \ub4a4 \ub2e4\uc2dc \uc5f4\uc5b4\uc8fc\uc138\uc694."

    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->fail(Ljava/lang/String;)V

    return-void
.end method

.method private speak(Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    .line 57
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const-string v1, ":"

    if-eqz v0, :cond_27

    new-instance p1, Ljava/lang/StringBuilder;

    iget v0, p0, Lkr/memorynotes/SpeechPlayback;->generation:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->finished(Ljava/lang/String;)V

    return-void

    .line 58
    :cond_27
    invoke-static {}, Landroid/speech/tts/TextToSpeech;->getMaxSpeechInputLength()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    const/16 v3, 0xdac

    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 59
    const/4 v3, 0x0

    :goto_34
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v3, v4, :cond_3b

    .line 63
    return-void

    .line 59
    :cond_3b
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int v5, v3, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_59

    add-int/lit8 v5, v4, -0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v5

    if-eqz v5, :cond_59

    add-int/lit8 v4, v4, -0x1

    .line 60
    :cond_59
    new-instance v5, Ljava/lang/StringBuilder;

    iget v6, p0, Lkr/memorynotes/SpeechPlayback;->generation:I

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v4, v6, :cond_70

    move-object v6, p2

    goto :goto_72

    :cond_70
    const-string v6, "chunk"

    :goto_72
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 61
    iget-object v6, p0, Lkr/memorynotes/SpeechPlayback;->tts:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/4 v7, 0x0

    invoke-virtual {v6, v3, v2, v7, v5}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I

    move-result v3

    const/4 v5, -0x1

    if-ne v3, v5, :cond_8e

    const-string p1, "\uc74c\uc131\uc744 \uc77d\uc9c0 \ubabb\ud588\uc2b5\ub2c8\ub2e4. \ud734\ub300\ud3f0\uc758 \uc74c\uc131 \uc124\uc815\uc744 \ud655\uc778\ud558\uc138\uc694."

    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->fail(Ljava/lang/String;)V

    return-void

    :cond_8e
    move v3, v4

    goto :goto_34
.end method

.method private start()V
    .registers 5

    .line 53
    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->ready:Z

    if-eqz v0, :cond_45

    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->closed:Z

    if-eqz v0, :cond_9

    goto :goto_45

    :cond_9
    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->stop()V

    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->audio:Landroid/media/AudioManager;

    iget-object v1, p0, Lkr/memorynotes/SpeechPlayback;->focus:Landroid/media/AudioFocusRequest;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioFocusRequest;)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1d

    const-string v0, "\ub2e4\ub978 \uc18c\ub9ac\uac00 \ub05d\ub098\uba74 \uc77d\uae30 \uc2dc\uc791\uc744 \ub20c\ub7ec\uc8fc\uc138\uc694."

    invoke-direct {p0, v0}, Lkr/memorynotes/SpeechPlayback;->update(Ljava/lang/String;)V

    return-void

    :cond_1d
    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->wake:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iput-boolean v1, p0, Lkr/memorynotes/SpeechPlayback;->playing:Z

    const-string v0, "\ubb38\uc81c \uc77d\ub294 \uc911"

    invoke-direct {p0, v0}, Lkr/memorynotes/SpeechPlayback;->update(Ljava/lang/String;)V

    .line 54
    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->notes:Ljava/util/ArrayList;

    iget v1, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/Note;

    iget-object v1, v0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    iget-object v2, v0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    iget-object v3, v0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    iget-object v0, v0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    invoke-static {v1, v2, v3, v0}, Lkr/memorynotes/SpeechText;->question(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "q"

    invoke-direct {p0, v0, v1}, Lkr/memorynotes/SpeechPlayback;->speak(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    return-void

    .line 53
    :cond_45
    :goto_45
    return-void
.end method

.method private stop()V
    .registers 3

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->playing:Z

    iget v0, p0, Lkr/memorynotes/SpeechPlayback;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkr/memorynotes/SpeechPlayback;->generation:I

    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->tts:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->stop()I

    :cond_18
    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->wake:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_25

    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->wake:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_25
    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->audio:Landroid/media/AudioManager;

    iget-object v1, p0, Lkr/memorynotes/SpeechPlayback;->focus:Landroid/media/AudioFocusRequest;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocusRequest(Landroid/media/AudioFocusRequest;)I

    return-void
.end method

.method private update(Ljava/lang/String;)V
    .registers 2

    .line 51
    iput-object p1, p0, Lkr/memorynotes/SpeechPlayback;->label:Ljava/lang/String;

    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->service:Lkr/memorynotes/SpeechService;

    invoke-virtual {p1}, Lkr/memorynotes/SpeechService;->refresh()V

    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->observer:Ljava/lang/Runnable;

    if-eqz p1, :cond_10

    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->observer:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_10
    return-void
.end method

.method private valid(Ljava/lang/String;)Z
    .registers 4

    .line 64
    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->closed:Z

    if-nez v0, :cond_25

    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->playing:Z

    if-eqz v0, :cond_25

    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lkr/memorynotes/SpeechPlayback;->generation:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_25

    const/4 p1, 0x1

    return p1

    :cond_25
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method close()V
    .registers 3

    .line 73
    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->closed:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->closed:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->ready:Z

    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->stop()V

    const-string v0, "\uc77d\uae30\ub97c \uc885\ub8cc\ud588\uc2b5\ub2c8\ub2e4."

    iput-object v0, p0, Lkr/memorynotes/SpeechPlayback;->label:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->observer:Ljava/lang/Runnable;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->observer:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_1b
    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->tts:Landroid/speech/tts/TextToSpeech;

    const/4 v1, 0x0

    if-eqz v0, :cond_27

    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->tts:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->shutdown()V

    iput-object v1, p0, Lkr/memorynotes/SpeechPlayback;->tts:Landroid/speech/tts/TextToSpeech;

    :cond_27
    iput-object v1, p0, Lkr/memorynotes/SpeechPlayback;->observer:Ljava/lang/Runnable;

    return-void
.end method

.method isPlaying()Z
    .registers 2

    .line 34
    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->playing:Z

    return v0
.end method

.method isReady()Z
    .registers 2

    .line 35
    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->ready:Z

    return v0
.end method

.method synthetic lambda$0$kr-memorynotes-SpeechPlayback(I)V
    .registers 2

    .line 26
    if-gez p1, :cond_a

    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->stop()V

    const-string p1, "\ub2e4\ub978 \uc18c\ub9ac\ub85c \uc778\ud574 \uc815\uc9c0\ub428"

    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->update(Ljava/lang/String;)V

    :cond_a
    return-void
.end method

.method synthetic lambda$1$kr-memorynotes-SpeechPlayback(I)V
    .registers 4

    .line 32
    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->handler:Landroid/os/Handler;

    new-instance v1, Lkr/memorynotes/SpeechPlayback$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lkr/memorynotes/SpeechPlayback$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/SpeechPlayback;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$2$kr-memorynotes-SpeechPlayback(I)V
    .registers 2

    .line 32
    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->initialize(I)V

    return-void
.end method

.method synthetic lambda$3$kr-memorynotes-SpeechPlayback(I)V
    .registers 4

    .line 68
    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->closed:Z

    if-nez v0, :cond_2b

    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->playing:Z

    if-eqz v0, :cond_2b

    iget v0, p0, Lkr/memorynotes/SpeechPlayback;->generation:I

    if-eq p1, v0, :cond_d

    goto :goto_2b

    :cond_d
    const-string p1, "\uc815\ub2f5 \uc77d\ub294 \uc911"

    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->update(Ljava/lang/String;)V

    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->notes:Ljava/util/ArrayList;

    iget v0, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkr/memorynotes/Note;

    iget-object v0, p1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    iget-object v1, p1, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    iget-object p1, p1, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lkr/memorynotes/SpeechText;->answer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "a"

    invoke-direct {p0, p1, v0}, Lkr/memorynotes/SpeechPlayback;->speak(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2b
    :goto_2b
    return-void
.end method

.method synthetic lambda$4$kr-memorynotes-SpeechPlayback(I)V
    .registers 3

    .line 69
    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->closed:Z

    if-nez v0, :cond_2c

    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->playing:Z

    if-eqz v0, :cond_2c

    iget v0, p0, Lkr/memorynotes/SpeechPlayback;->generation:I

    if-eq p1, v0, :cond_d

    goto :goto_2c

    :cond_d
    iget p1, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    iget p1, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->notes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_29

    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->stop()V

    const/4 p1, 0x0

    iput p1, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    const-string p1, "\ubaa8\ub450 \uc77d\uc5c8\uc2b5\ub2c8\ub2e4. \ub2e4\uc2dc \uc2dc\uc791\ud560 \uc218 \uc788\uc2b5\ub2c8\ub2e4."

    invoke-direct {p0, p1}, Lkr/memorynotes/SpeechPlayback;->update(Ljava/lang/String;)V

    goto :goto_2c

    :cond_29
    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->start()V

    :cond_2c
    :goto_2c
    return-void
.end method

.method next()V
    .registers 3

    .line 38
    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->ready:Z

    if-eqz v0, :cond_28

    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->closed:Z

    if-eqz v0, :cond_9

    goto :goto_28

    :cond_9
    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->stop()V

    iget v0, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    iget v0, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    iget-object v1, p0, Lkr/memorynotes/SpeechPlayback;->notes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_25

    const/4 v0, 0x0

    iput v0, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    const-string v0, "\ubaa8\ub450 \uc77d\uc5c8\uc2b5\ub2c8\ub2e4. \ub2e4\uc2dc \uc2dc\uc791\ud560 \uc218 \uc788\uc2b5\ub2c8\ub2e4."

    invoke-direct {p0, v0}, Lkr/memorynotes/SpeechPlayback;->update(Ljava/lang/String;)V

    goto :goto_28

    :cond_25
    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->start()V

    :cond_28
    :goto_28
    return-void
.end method

.method open(Ljava/util/ArrayList;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;)V"
        }
    .end annotation

    .line 30
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2b

    .line 31
    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->notes:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_18

    iget-object p1, p0, Lkr/memorynotes/SpeechPlayback;->service:Lkr/memorynotes/SpeechService;

    invoke-virtual {p1}, Lkr/memorynotes/SpeechService;->stopSelf()V

    return-void

    .line 32
    :cond_18
    new-instance p1, Landroid/speech/tts/TextToSpeech;

    iget-object v0, p0, Lkr/memorynotes/SpeechPlayback;->service:Lkr/memorynotes/SpeechService;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lkr/memorynotes/SpeechPlayback$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lkr/memorynotes/SpeechPlayback$$ExternalSyntheticLambda4;-><init>(Lkr/memorynotes/SpeechPlayback;)V

    invoke-direct {p1, v0, v1}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    iput-object p1, p0, Lkr/memorynotes/SpeechPlayback;->tts:Landroid/speech/tts/TextToSpeech;

    .line 33
    return-void

    .line 30
    :cond_2b
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/Note;

    iget-object v1, v0, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    invoke-static {v1}, Lkr/memorynotes/SpeechText;->eligible(I)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lkr/memorynotes/SpeechPlayback;->notes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4
.end method

.method status()Ljava/lang/String;
    .registers 5

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lkr/memorynotes/SpeechPlayback;->label:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lkr/memorynotes/SpeechPlayback;->notes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_16

    const-string v1, ""

    goto :goto_53

    :cond_16
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/SpeechPlayback;->notes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/SpeechPlayback;->notes:Ljava/util/ArrayList;

    iget v3, p0, Lkr/memorynotes/SpeechPlayback;->index:I

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkr/memorynotes/Note;

    iget-object v2, v2, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-static {v2}, Lkr/memorynotes/SpeechText;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toggle()V
    .registers 2

    .line 37
    iget-boolean v0, p0, Lkr/memorynotes/SpeechPlayback;->playing:Z

    if-eqz v0, :cond_d

    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->stop()V

    const-string v0, "\uc815\uc9c0\ub428"

    invoke-direct {p0, v0}, Lkr/memorynotes/SpeechPlayback;->update(Ljava/lang/String;)V

    goto :goto_10

    :cond_d
    invoke-direct {p0}, Lkr/memorynotes/SpeechPlayback;->start()V

    :goto_10
    return-void
.end method
