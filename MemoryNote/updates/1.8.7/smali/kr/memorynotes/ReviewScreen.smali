.class public Lkr/memorynotes/ReviewScreen;
.super Ljava/lang/Object;
.source "ReviewScreen.java"


# instance fields
.field final a:Lkr/memorynotes/MainActivity;

.field index:I

.field final notes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;"
        }
    .end annotation
.end field

.field revealed:Z


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;Ljava/util/ArrayList;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkr/memorynotes/MainActivity;",
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;)V"
        }
    .end annotation

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const/4 v0, 0x0

    iput v0, p0, Lkr/memorynotes/ReviewScreen;->index:I

    iput-boolean v0, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    .line 5
    iput-object p1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic lambda$3(Lkr/memorynotes/StudyText$Part;)Z
    .registers 2

    .line 6
    iget p0, p0, Lkr/memorynotes/StudyText$Part;->kind:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_7

    const/4 p0, 0x1

    goto :goto_8

    :cond_7
    const/4 p0, 0x0

    :goto_8
    return p0
.end method


# virtual methods
.method synthetic lambda$0$kr-memorynotes-ReviewScreen()V
    .registers 3

    .line 6
    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    const-string v1, "\ud648"

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$1$kr-memorynotes-ReviewScreen()V
    .registers 3

    .line 6
    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    const-string v1, "\ud648"

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$2$kr-memorynotes-ReviewScreen()V
    .registers 3

    .line 6
    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    const-string v1, "\ud648"

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$4$kr-memorynotes-ReviewScreen(Lkr/memorynotes/Note;I)V
    .registers 4

    .line 6
    :try_start_0
    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {v0, p1, p2}, Lkr/memorynotes/NoteDb;->review(Lkr/memorynotes/Note;I)V

    iget p1, p0, Lkr/memorynotes/ReviewScreen;->index:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lkr/memorynotes/ReviewScreen;->index:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    invoke-virtual {p0}, Lkr/memorynotes/ReviewScreen;->show()V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_14

    goto :goto_1a

    :catch_14
    move-exception p1

    iget-object p2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {p2, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_1a
    return-void
.end method

.method synthetic lambda$5$kr-memorynotes-ReviewScreen()V
    .registers 2

    .line 6
    const/4 v0, 0x1

    iput-boolean v0, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    invoke-virtual {p0}, Lkr/memorynotes/ReviewScreen;->show()V

    return-void
.end method

.method synthetic lambda$6$kr-memorynotes-ReviewScreen()V
    .registers 2

    .line 6
    iget v0, p0, Lkr/memorynotes/ReviewScreen;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkr/memorynotes/ReviewScreen;->index:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    invoke-virtual {p0}, Lkr/memorynotes/ReviewScreen;->show()V

    return-void
.end method

.method synthetic lambda$7$kr-memorynotes-ReviewScreen(Lkr/memorynotes/Note;)V
    .registers 3

    .line 6
    :try_start_0
    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {v0, p1}, Lkr/memorynotes/NoteDb;->save(Lkr/memorynotes/Note;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_8

    goto :goto_e

    :catch_8
    move-exception p1

    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v0, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_e
    return-void
.end method

.method show()V
    .registers 14

    .line 6
    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    const/4 v1, 0x0

    iput-object v1, v0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    iget v0, p0, Lkr/memorynotes/ReviewScreen;->index:I

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    if-lt v0, v2, :cond_54

    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iput-object v1, v0, Lkr/memorynotes/MainActivity;->review:Lkr/memorynotes/ReviewScreen;

    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\uac1c\uc758 \ub178\ud2b8\ub97c \ub3cc\uc544\ubd24\uc2b5\ub2c8\ub2e4."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\ubcf5\uc2b5\uc744 \ub9c8\ucce4\uc5b4\uc694!"

    invoke-virtual {v0, v2, v1, v3}, Lkr/memorynotes/MainActivity;->shell(Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    new-instance v1, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/ReviewScreen;)V

    iput-object v1, v0, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda1;-><init>(Lkr/memorynotes/ReviewScreen;)V

    const-string v3, "\ud648\uc73c\ub85c"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void

    :cond_54
    iget-object v0, p0, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    iget v1, p0, Lkr/memorynotes/ReviewScreen;->index:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    iget v4, p0, Lkr/memorynotes/ReviewScreen;->index:I

    const/4 v11, 0x1

    add-int/2addr v4, v11

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " / "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "  \uc624\ub298\uc758 \uae30\uc5b5"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v4, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v4, v0}, Lkr/memorynotes/MainActivity;->meta(Lkr/memorynotes/Note;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4, v3}, Lkr/memorynotes/MainActivity;->shell(Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, v0, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    iput-object v2, v1, Lkr/memorynotes/Ui;->pictures:Lorg/json/JSONArray;

    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    new-instance v2, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda2;-><init>(Lkr/memorynotes/ReviewScreen;)V

    iput-object v2, v1, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    iget-object v2, v0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    const-string v4, "\uc77c\ubc18 \ub178\ud2b8"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c4

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, v0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lkr/memorynotes/Ui;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_c4
    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v2}, Lkr/memorynotes/Ui;->studyLegend()Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/16 v5, 0xc

    invoke-virtual {v2, v1, v5}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    iget-object v2, v0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/16 v12, 0xd

    if-eqz v2, :cond_124

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v7, v0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    iget-boolean v2, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    xor-int/lit8 v10, v2, 0x1

    const-string v6, "body"

    const/16 v8, 0x15

    const/4 v9, 0x1

    move-object v5, v0

    invoke-virtual/range {v4 .. v10}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, v0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    invoke-static {v2, v3, v11}, Lkr/memorynotes/StudyText;->parts(Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v2

    new-instance v4, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda3;

    invoke-direct {v4}, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda3;-><init>()V

    invoke-interface {v2, v4}, Ljava/util/stream/Stream;->noneMatch(Ljava/util/function/Predicate;)Z

    move-result v2

    if-eqz v2, :cond_1c1

    iget-boolean v2, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    if-nez v2, :cond_1c1

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v4, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->muted:I

    const-string v5, "\ub0b4\uc6a9\uc744 \uc77d\uace0 \ud575\uc2ec\uc744 \ub5a0\uc62c\ub824\ubcf4\uc138\uc694. \uc218\uc815 \ud654\uba74\uc5d0\uc11c \uc5ec\ub7ec \ubb38\uad6c\ub97c \uac00\ub9bc\uc73c\ub85c \uc9c0\uc815\ud560 \uc218 \uc788\uc2b5\ub2c8\ub2e4."

    invoke-virtual {v2, v5, v12, v4}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    goto/16 :goto_1be

    :cond_124
    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v7, v0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-static {p0}, Lkr/memorynotes/ReviewFlow;->masked(Lkr/memorynotes/ReviewScreen;)Z

    move-result v10

    const-string v6, "question"

    const/16 v8, 0x15

    move-object v5, v0

    invoke-virtual/range {v4 .. v10}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-boolean v2, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    if-eqz v2, :cond_1c1

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/16 v4, 0xf

    invoke-virtual {v2, v1, v4}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v4, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->green:I

    const-string v5, "\uc815\ub2f5 \u00b7 \ud574\uc124"

    invoke-virtual {v2, v5, v12, v4}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v7, v0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    const/4 v9, 0x1

    invoke-static {p0}, Lkr/memorynotes/ReviewFlow;->masked(Lkr/memorynotes/ReviewScreen;)Z

    move-result v10

    const-string v6, "answer"

    const/16 v8, 0x15

    move-object v5, v0

    invoke-virtual/range {v4 .. v10}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, v0, Lkr/memorynotes/Note;->mine:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_19b

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v4, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->muted:I

    const-string v5, "\ub0b4 \ub2f5"

    invoke-virtual {v2, v5, v12, v4}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v7, v0, Lkr/memorynotes/Note;->mine:Ljava/lang/String;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-string v6, "mine"

    const/16 v8, 0x10

    move-object v5, v0

    invoke-virtual/range {v4 .. v10}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_19b
    iget-object v2, v0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    const-string v4, "\uc624\ub2f5\ub178\ud2b8"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c1

    iget-object v2, v0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1c1

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v7, v0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    const/4 v9, 0x1

    const/4 v10, 0x0

    const-string v6, "body"

    const/16 v8, 0x10

    move-object v5, v0

    invoke-virtual/range {v4 .. v10}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v2

    :goto_1be
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_1c1
    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-boolean v4, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    xor-int/2addr v4, v11

    invoke-static {v2, v1, v0, v4, v3}, Lkr/memorynotes/ImageMaskView;->appendImages(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Lkr/memorynotes/Note;ZZ)V

    iget-boolean v2, p0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    if-eqz v2, :cond_292

    iget-object v2, v0, Lkr/memorynotes/Note;->reason:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1fc

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v4, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->muted:I

    const-string v5, "\ud2c0\ub9b0 \uc774\uc720"

    invoke-virtual {v2, v5, v12, v4}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v7, v0, Lkr/memorynotes/Note;->reason:Ljava/lang/String;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-string v6, "reason"

    const/16 v8, 0x10

    move-object v5, v0

    invoke-virtual/range {v4 .. v10}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_1fc
    iget-object v2, v0, Lkr/memorynotes/Note;->caution:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_22b

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v4, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->muted:I

    const-string v5, "\ub2e4\uc74c\uc5d0 \ud655\uc778\ud560 \uac83"

    invoke-virtual {v2, v5, v12, v4}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v7, v0, Lkr/memorynotes/Note;->caution:Ljava/lang/String;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-string v6, "caution"

    const/16 v8, 0x10

    move-object v5, v0

    invoke-virtual/range {v4 .. v10}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_22b
    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    invoke-static {v1, p0}, Lkr/memorynotes/ReviewActions;->addRevealControl(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V

    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v4, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->ink:I

    const-string v5, "\uc5bc\ub9c8\ub098 \uae30\uc5b5\ud588\ub098\uc694?"

    const/16 v6, 0x12

    invoke-virtual {v2, v5, v6, v4}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :goto_249
    const/4 v1, 0x3

    if-lt v3, v1, :cond_24d

    goto :goto_2a8

    :cond_24d
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\uc678\uc6e0\uc74c \u00b7 "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, v0, Lkr/memorynotes/Note;->streak:I

    if-nez v2, :cond_25a

    const/4 v2, 0x7

    goto :goto_263

    :cond_25a
    iget v2, v0, Lkr/memorynotes/Note;->streak:I

    if-ne v2, v11, :cond_261

    const/16 v2, 0xe

    goto :goto_263

    :cond_261
    const/16 v2, 0x1e

    :goto_263
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\uc77c \ub4a4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\ubaa8\ub984 \u00b7 \ub0b4\uc77c \ub2e4\uc2dc"

    const-string v4, "\ud5f7\uac08\ub9bc \u00b7 3\uc77c \ub4a4"

    filled-new-array {v2, v4, v1}, [Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v3

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v5, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda4;

    invoke-direct {v5, p0, v0, v3}, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda4;-><init>(Lkr/memorynotes/ReviewScreen;Lkr/memorynotes/Note;I)V

    invoke-virtual {v4, v1, v5}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_249

    :cond_292
    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v3, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda5;

    invoke-direct {v3, p0}, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda5;-><init>(Lkr/memorynotes/ReviewScreen;)V

    invoke-static {v0}, Lkr/memorynotes/ReviewActions;->primaryLabel(Lkr/memorynotes/Note;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4, v3}, Lkr/memorynotes/Ui;->primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :goto_2a8
    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v3, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda6;

    invoke-direct {v3, p0}, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda6;-><init>(Lkr/memorynotes/ReviewScreen;)V

    const-string v4, "\uc774\ubc88\uc5d0\ub294 \uac74\ub108\ub6f0\uae30"

    invoke-virtual {v2, v4, v3}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    new-instance v2, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda7;

    invoke-direct {v2, p0, v0}, Lkr/memorynotes/ReviewScreen$$ExternalSyntheticLambda7;-><init>(Lkr/memorynotes/ReviewScreen;Lkr/memorynotes/Note;)V

    const-string v3, "review"

    invoke-static {v1, v0, v3, v2}, Lkr/memorynotes/InkPage;->attach(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/Runnable;)V

    iget-object v1, p0, Lkr/memorynotes/ReviewScreen;->a:Lkr/memorynotes/MainActivity;

    invoke-static {v1, p0}, Lkr/memorynotes/ReviewActions;->addEdit(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V

    invoke-static {v1, p0}, Lkr/memorynotes/NoteSwipe;->bindReview(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V

    return-void
.end method
