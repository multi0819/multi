.class final Lkr/memorynotes/SpeechReader;
.super Ljava/lang/Object;
.source "SpeechReader.java"


# instance fields
.field private final a:Lkr/memorynotes/MainActivity;

.field private bound:Z

.field private closed:Z

.field private final connection:Landroid/content/ServiceConnection;

.field private dialog:Landroid/app/AlertDialog;

.field private next:Landroid/widget/Button;

.field private play:Landroid/widget/Button;

.field private service:Lkr/memorynotes/SpeechService;

.field private status:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;)V
    .registers 3

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Lkr/memorynotes/SpeechReader$1;

    invoke-direct {v0, p0}, Lkr/memorynotes/SpeechReader$1;-><init>(Lkr/memorynotes/SpeechReader;)V

    iput-object v0, p0, Lkr/memorynotes/SpeechReader;->connection:Landroid/content/ServiceConnection;

    .line 11
    iput-object p1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    return-void
.end method

.method static synthetic access$0(Lkr/memorynotes/SpeechReader;Lkr/memorynotes/SpeechService;)V
    .registers 2

    .line 6
    iput-object p1, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    return-void
.end method

.method static synthetic access$1(Lkr/memorynotes/SpeechReader;)Lkr/memorynotes/SpeechService;
    .registers 1

    .line 6
    iget-object p0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    return-object p0
.end method

.method static synthetic access$2(Lkr/memorynotes/SpeechReader;)V
    .registers 1

    .line 26
    invoke-direct {p0}, Lkr/memorynotes/SpeechReader;->render()V

    return-void
.end method

.method private render()V
    .registers 4

    .line 26
    iget-boolean v0, p0, Lkr/memorynotes/SpeechReader;->closed:Z

    if-nez v0, :cond_3e

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    if-eqz v0, :cond_3e

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-nez v0, :cond_f

    goto :goto_3e

    :cond_f
    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->status()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->play:Landroid/widget/Button;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_27

    const-string v2, "\uc77d\uae30 \uc815\uc9c0"

    goto :goto_29

    :cond_27
    const-string v2, "\uc77d\uae30 \uc2dc\uc791"

    :goto_29
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->play:Landroid/widget/Button;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->isReady()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->next:Landroid/widget/Button;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->isReady()Z

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_3e
    :goto_3e
    return-void
.end method


# virtual methods
.method close()V
    .registers 5

    .line 28
    iget-boolean v0, p0, Lkr/memorynotes/SpeechReader;->closed:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    const-class v3, Lkr/memorynotes/SpeechService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->stopService(Landroid/content/Intent;)Z

    invoke-virtual {p0}, Lkr/memorynotes/SpeechReader;->detach()V

    return-void
.end method

.method detach()V
    .registers 4

    .line 27
    iget-boolean v0, p0, Lkr/memorynotes/SpeechReader;->closed:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lkr/memorynotes/SpeechReader;->closed:Z

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    iput-object v1, v0, Lkr/memorynotes/SpeechPlayback;->observer:Ljava/lang/Runnable;

    :cond_19
    iget-boolean v0, p0, Lkr/memorynotes/SpeechReader;->bound:Z

    if-eqz v0, :cond_27

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, p0, Lkr/memorynotes/SpeechReader;->connection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v2}, Lkr/memorynotes/MainActivity;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/SpeechReader;->bound:Z

    :cond_27
    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->dialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_35

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_35
    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    if-ne v0, p0, :cond_3f

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iput-object v1, v0, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    :cond_3f
    return-void
.end method

.method synthetic lambda$0$kr-memorynotes-SpeechReader()V
    .registers 2

    .line 18
    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->toggle()V

    :cond_11
    return-void
.end method

.method synthetic lambda$1$kr-memorynotes-SpeechReader()V
    .registers 2

    .line 19
    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lkr/memorynotes/SpeechReader;->service:Lkr/memorynotes/SpeechService;

    iget-object v0, v0, Lkr/memorynotes/SpeechService;->playback:Lkr/memorynotes/SpeechPlayback;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechPlayback;->next()V

    :cond_11
    return-void
.end method

.method synthetic lambda$2$kr-memorynotes-SpeechReader(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 20
    invoke-virtual {p0}, Lkr/memorynotes/SpeechReader;->close()V

    return-void
.end method

.method synthetic lambda$3$kr-memorynotes-SpeechReader(Landroid/content/DialogInterface;)V
    .registers 2

    .line 21
    invoke-virtual {p0}, Lkr/memorynotes/SpeechReader;->close()V

    return-void
.end method

.method open(Ljava/util/ArrayList;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;)V"
        }
    .end annotation

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_9
    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_112

    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_24

    iget-object p1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v0, "\uc77d\uc744 \ubb38\uc81c\uac00 \uc5c6\uc2b5\ub2c8\ub2e4. \uadf8\ub9bc\uc774 \ucca8\ubd80\ub41c \ubb38\uc81c\ub294 \uc77d\uc5b4\uc8fc\uae30\uc5d0\uc11c \uc81c\uc678\ud569\ub2c8\ub2e4."

    invoke-virtual {p1, v0}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    iget-object p1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    const/4 v0, 0x0

    iput-object v0, p1, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    return-void

    .line 15
    :cond_24
    iget-object p1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object p1

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x41b00000    # 22.0f

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    iget-object v3, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v3, v3, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v4, 0x41000000    # 8.0f

    invoke-virtual {v3, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    iget-object v5, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v5, v5, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v5, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v5, v5, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {p1, v1, v3, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 16
    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->muted:I

    const-string v3, "\ubb38\uc81c \u2192 3\ucd08 \uc0dd\uac01\ud558\uae30 \u2192 \uc815\ub2f5 \u2192 \ub2e4\uc74c \ubb38\uc81c\n\ud654\uba74\uc744 \ub0b4\ub9ac\uac70\ub098 \uaebc\ub3c4 \uacc4\uc18d \uc77d\uc2b5\ub2c8\ub2e4. \uadf8\ub9bc \ubb38\uc81c\ub294 \uc81c\uc678\ud569\ub2c8\ub2e4."

    const/16 v4, 0xe

    invoke-virtual {v1, v3, v4, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 17
    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->ink:I

    const-string v3, "\ud55c\uad6d\uc5b4 \uc74c\uc131\uc744 \uc900\ube44\ud558\uace0 \uc788\uc2b5\ub2c8\ub2e4\u2026"

    const/16 v4, 0x12

    invoke-virtual {v1, v3, v4, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Lkr/memorynotes/SpeechReader;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->status:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 18
    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/SpeechReader$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lkr/memorynotes/SpeechReader$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/SpeechReader;)V

    const-string v3, "\uc77d\uae30 \uc2dc\uc791"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, p0, Lkr/memorynotes/SpeechReader;->play:Landroid/widget/Button;

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->play:Landroid/widget/Button;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->play:Landroid/widget/Button;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 19
    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v3, Lkr/memorynotes/SpeechReader$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Lkr/memorynotes/SpeechReader$$ExternalSyntheticLambda1;-><init>(Lkr/memorynotes/SpeechReader;)V

    const-string v4, "\ub2e4\uc74c \ubb38\uc81c"

    invoke-virtual {v1, v4, v3}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, p0, Lkr/memorynotes/SpeechReader;->next:Landroid/widget/Button;

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->next:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->next:Landroid/widget/Button;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 20
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\ubb38\uc81c \uc77d\uc5b4\uc8fc\uae30"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v1, Lkr/memorynotes/SpeechReader$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lkr/memorynotes/SpeechReader$$ExternalSyntheticLambda2;-><init>(Lkr/memorynotes/SpeechReader;)V

    const-string v2, "\uc77d\uae30 \uc885\ub8cc"

    invoke-virtual {p1, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lkr/memorynotes/SpeechReader;->dialog:Landroid/app/AlertDialog;

    .line 21
    iget-object p1, p0, Lkr/memorynotes/SpeechReader;->dialog:Landroid/app/AlertDialog;

    new-instance v1, Lkr/memorynotes/SpeechReader$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lkr/memorynotes/SpeechReader$$ExternalSyntheticLambda3;-><init>(Lkr/memorynotes/SpeechReader;)V

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iget-object p1, p0, Lkr/memorynotes/SpeechReader;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    .line 23
    sget-boolean p1, Lkr/memorynotes/SpeechService;->running:Z

    if-nez p1, :cond_fd

    sput-object v0, Lkr/memorynotes/SpeechService;->pending:Ljava/util/ArrayList;

    iget-object p1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    const-class v2, Lkr/memorynotes/SpeechService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0}, Lkr/memorynotes/MainActivity;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 24
    :cond_fd
    iget-object p1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->a:Lkr/memorynotes/MainActivity;

    const-class v2, Lkr/memorynotes/SpeechService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lkr/memorynotes/SpeechReader;->connection:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lkr/memorynotes/MainActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result p1

    iput-boolean p1, p0, Lkr/memorynotes/SpeechReader;->bound:Z

    .line 25
    return-void

    .line 13
    :cond_112
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkr/memorynotes/Note;

    iget-object v2, v1, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-static {v2}, Lkr/memorynotes/SpeechText;->eligible(I)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_9
.end method
