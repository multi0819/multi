.class public final Lkr/memorynotes/SpeechService;
.super Landroid/app/Service;
.source "SpeechService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkr/memorynotes/SpeechService$LocalBinder;
    }
.end annotation


# static fields
.field static pending:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;"
        }
    .end annotation
.end field

.field static running:Z


# instance fields
.field private media:Landroid/media/session/MediaSession;

.field playback:Lkr/memorynotes/SpeechPlayback;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lkr/memorynotes/SpeechService;)V
    .registers 1

    .line 16
    invoke-direct {p0}, Lkr/memorynotes/SpeechService;->endSession()V

    return-void
.end method

.method private command(Ljava/lang/String;I)Landroid/app/PendingIntent;
    .registers 5

    .line 17
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lkr/memorynotes/SpeechService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const/high16 v0, 0xc000000

    invoke-static {p0, p2, p1, v0}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    return-object p1
.end method

.method private endSession()V
    .registers 3

    .line 16
    iget-object v0, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    :cond_c
    const/4 v0, 0x0

    sput-boolean v0, Lkr/memorynotes/SpeechService;->running:Z

    iget-object v1, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    invoke-virtual {v1, v0}, Landroid/media/session/MediaSession;->setActive(Z)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lkr/memorynotes/SpeechService;->stopForeground(I)V

    invoke-virtual {p0}, Lkr/memorynotes/SpeechService;->stopSelf()V

    return-void
.end method

.method private notification()Landroid/app/Notification;
    .registers 6

    .line 18
    new-instance v0, Landroid/app/Notification$Builder;

    const-string v1, "reading"

    invoke-direct {v0, p0, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/high16 v1, 0x7f010000

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    const-string v1, "\uc554\uae30\ub178\ud2b8 \u00b7 \ubb38\uc81c \uc77d\uc5b4\uc8fc\uae30"

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-nez v1, :cond_1a

    const-string v1, "\uc74c\uc131\uc744 \uc900\ube44\ud558\uace0 \uc788\uc2b5\ub2c8\ub2e4\u2026"

    goto :goto_20

    :cond_1a
    iget-object v1, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v1}, Lkr/memorynotes/SpeechPlayback;->status()Ljava/lang/String;

    move-result-object v1

    :goto_20
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lkr/memorynotes/MainActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x20000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0xc000000

    const/4 v3, 0x0

    invoke-static {p0, v3, v1, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    move-result-object v0

    new-instance v2, Landroid/app/Notification$MediaStyle;

    invoke-direct {v2}, Landroid/app/Notification$MediaStyle;-><init>()V

    iget-object v4, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    invoke-virtual {v4}, Landroid/media/session/MediaSession;->getSessionToken()Landroid/media/session/MediaSession$Token;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/Notification$MediaStyle;->setMediaSession(Landroid/media/session/MediaSession$Token;)Landroid/app/Notification$MediaStyle;

    move-result-object v2

    filled-new-array {v3, v1}, [I

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/Notification$MediaStyle;->setShowActionsInCompactView([I)Landroid/app/Notification$MediaStyle;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    move-result-object v0

    iget-object v2, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v2, :cond_74

    iget-object v2, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v2}, Lkr/memorynotes/SpeechPlayback;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_74

    const v2, 0x1080023

    goto :goto_77

    :cond_74
    const v2, 0x1080024

    :goto_77
    iget-object v3, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v3, :cond_86

    iget-object v3, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v3}, Lkr/memorynotes/SpeechPlayback;->isPlaying()Z

    move-result v3

    if-eqz v3, :cond_86

    const-string v3, "\uc815\uc9c0"

    goto :goto_88

    :cond_86
    const-string v3, "\uacc4\uc18d \uc77d\uae30"

    :goto_88
    const-string v4, "toggle"

    invoke-direct {p0, v4, v1}, Lkr/memorynotes/SpeechService;->command(Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v0

    const-string v1, "stop"

    const/4 v2, 0x2

    invoke-direct {p0, v1, v2}, Lkr/memorynotes/SpeechService;->command(Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v2, 0x1080038

    const-string v3, "\uc885\ub8cc"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    .line 6
    new-instance p1, Lkr/memorynotes/SpeechService$LocalBinder;

    invoke-direct {p1, p0}, Lkr/memorynotes/SpeechService$LocalBinder;-><init>(Lkr/memorynotes/SpeechService;)V

    return-object p1
.end method

.method public onCreate()V
    .registers 6

    .line 7
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    const-class v0, Landroid/app/NotificationManager;

    invoke-virtual {p0, v0}, Lkr/memorynotes/SpeechService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    new-instance v1, Landroid/app/NotificationChannel;

    const-string v2, "\ubb38\uc81c \uc77d\uc5b4\uc8fc\uae30"

    const/4 v3, 0x2

    const-string v4, "reading"

    invoke-direct {v1, v4, v2, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    new-instance v0, Landroid/media/session/MediaSession;

    const-string v1, "MemoryNoteReading"

    invoke-direct {v0, p0, v1}, Landroid/media/session/MediaSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    iget-object v0, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    new-instance v1, Lkr/memorynotes/SpeechService$1;

    invoke-direct {v1, p0}, Lkr/memorynotes/SpeechService$1;-><init>(Lkr/memorynotes/SpeechService;)V

    invoke-virtual {v0, v1}, Landroid/media/session/MediaSession;->setCallback(Landroid/media/session/MediaSession$Callback;)V

    iget-object v0, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/session/MediaSession;->setActive(Z)V

    return-void
.end method

.method public onDestroy()V
    .registers 4

    .line 20
    const/4 v0, 0x0

    sput-boolean v0, Lkr/memorynotes/SpeechService;->running:Z

    const/4 v1, 0x0

    sput-object v1, Lkr/memorynotes/SpeechService;->pending:Ljava/util/ArrayList;

    iget-object v2, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v2, :cond_11

    iget-object v2, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v2}, Lkr/memorynotes/SpeechPlayback;->close()V

    iput-object v1, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    :cond_11
    iget-object v1, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    invoke-virtual {v1, v0}, Landroid/media/session/MediaSession;->setActive(Z)V

    iget-object v0, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    invoke-virtual {v0}, Landroid/media/session/MediaSession;->release()V

    :cond_1f
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lkr/memorynotes/SpeechService;->stopForeground(I)V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 6

    .line 9
    const/16 p2, 0x2a

    invoke-direct {p0}, Lkr/memorynotes/SpeechService;->notification()Landroid/app/Notification;

    move-result-object p3

    invoke-virtual {p0, p2, p3}, Lkr/memorynotes/SpeechService;->startForeground(ILandroid/app/Notification;)V

    const/4 p2, 0x1

    sput-boolean p2, Lkr/memorynotes/SpeechService;->running:Z

    .line 10
    const/4 p3, 0x0

    if-nez p1, :cond_11

    move-object p1, p3

    goto :goto_15

    :cond_11
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    .line 11
    :goto_15
    const-string v0, "stop"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_22

    invoke-direct {p0}, Lkr/memorynotes/SpeechService;->endSession()V

    return v1

    .line 12
    :cond_22
    const-string v0, "toggle"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_34

    iget-object p1, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz p1, :cond_33

    iget-object p1, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {p1}, Lkr/memorynotes/SpeechPlayback;->toggle()V

    :cond_33
    return v1

    .line 13
    :cond_34
    iget-object p1, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-nez p1, :cond_5b

    sget-object p1, Lkr/memorynotes/SpeechService;->pending:Ljava/util/ArrayList;

    sput-object p3, Lkr/memorynotes/SpeechService;->pending:Ljava/util/ArrayList;

    if-eqz p1, :cond_57

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_45

    goto :goto_57

    :cond_45
    iget-object p3, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    invoke-virtual {p3, p2}, Landroid/media/session/MediaSession;->setActive(Z)V

    new-instance p2, Lkr/memorynotes/SpeechPlayback;

    invoke-direct {p2, p0}, Lkr/memorynotes/SpeechPlayback;-><init>(Lkr/memorynotes/SpeechService;)V

    iput-object p2, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    iget-object p2, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {p2, p1}, Lkr/memorynotes/SpeechPlayback;->open(Ljava/util/ArrayList;)V

    goto :goto_5b

    :cond_57
    :goto_57
    invoke-virtual {p0}, Lkr/memorynotes/SpeechService;->stopSelf()V

    return v1

    .line 14
    :cond_5b
    :goto_5b
    return v1
.end method

.method refresh()V
    .registers 7

    .line 19
    iget-object v0, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lkr/memorynotes/SpeechService;->media:Landroid/media/session/MediaSession;

    new-instance v1, Landroid/media/session/PlaybackState$Builder;

    invoke-direct {v1}, Landroid/media/session/PlaybackState$Builder;-><init>()V

    const-wide/16 v2, 0x27

    invoke-virtual {v1, v2, v3}, Landroid/media/session/PlaybackState$Builder;->setActions(J)Landroid/media/session/PlaybackState$Builder;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v2, :cond_1f

    iget-object v2, p0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v2}, Lkr/memorynotes/SpeechPlayback;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_1f

    const/4 v2, 0x3

    goto :goto_20

    :cond_1f
    const/4 v2, 0x2

    :goto_20
    const-wide/16 v3, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/media/session/PlaybackState$Builder;->setState(IJF)Landroid/media/session/PlaybackState$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/session/PlaybackState$Builder;->build()Landroid/media/session/PlaybackState;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V

    :cond_2f
    const-class v0, Landroid/app/NotificationManager;

    invoke-virtual {p0, v0}, Lkr/memorynotes/SpeechService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/16 v1, 0x2a

    invoke-direct {p0}, Lkr/memorynotes/SpeechService;->notification()Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method
