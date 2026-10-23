.class public Lkr/memorynotes/NoteEditor;
.super Ljava/lang/Object;
.source "NoteEditor.java"


# instance fields
.field final a:Lkr/memorynotes/MainActivity;

.field activeType:Ljava/lang/String;

.field answer:Landroid/widget/EditText;

.field body:Landroid/widget/EditText;

.field caution:Landroid/widget/EditText;

.field chapter:Landroid/widget/Spinner;

.field chapterIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field extras:Landroid/widget/LinearLayout;

.field favorite:Landroid/widget/CheckBox;

.field generalFields:Landroid/widget/LinearLayout;

.field images:Landroid/widget/LinearLayout;

.field mine:Landroid/widget/EditText;

.field mineFields:Landroid/widget/LinearLayout;

.field mistakeFields:Landroid/widget/LinearLayout;

.field final note:Lkr/memorynotes/Note;

.field question:Landroid/widget/EditText;

.field ready:Z

.field reason:Landroid/widget/EditText;

.field subject:Landroid/widget/Spinner;

.field subjectIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field tags:Landroid/widget/EditText;

.field title:Landroid/widget/EditText;

.field type:Landroid/widget/Spinner;

.field final u:Lkr/memorynotes/Ui;


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V
    .registers 4

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/NoteEditor;->subjectIds:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/NoteEditor;->chapterIds:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/NoteEditor;->ready:Z

    .line 5
    iput-object p1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iput-object v0, p0, Lkr/memorynotes/NoteEditor;->u:Lkr/memorynotes/Ui;

    if-nez p2, :cond_22

    new-instance v0, Lkr/memorynotes/Note;

    invoke-direct {v0}, Lkr/memorynotes/Note;-><init>()V

    goto :goto_23

    :cond_22
    move-object v0, p2

    :goto_23
    iput-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    if-nez p2, :cond_35

    iget-object p2, p1, Lkr/memorynotes/MainActivity;->subjectFilter:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_35

    iget-object p2, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->subjectFilter:Ljava/lang/String;

    iput-object p1, p2, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    :cond_35
    return-void
.end method

.method static synthetic lambda$3(Landroid/widget/LinearLayout;)V
    .registers 3

    .line 32
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    move v0, v1

    :goto_a
    if-eqz v0, :cond_d

    goto :goto_f

    :cond_d
    const/16 v1, 0x8

    :goto_f
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method addImage(Ljava/lang/String;)V
    .registers 4

    .line 103
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "file"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "masks"

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object p1, p1, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    iget-object p1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    if-ne p1, p0, :cond_2e

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->drawImages()V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_27} :catch_28

    goto :goto_2e

    :catch_28
    move-exception p1

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v0, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :cond_2e
    :goto_2e
    return-void
.end method

.method addStudyControls(Landroid/widget/LinearLayout;Landroid/widget/EditText;)V
    .registers 7

    .line 59
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/4 v1, 0x1

    invoke-virtual {v0, p2, v1}, Lkr/memorynotes/Ui;->studyEditor(Landroid/widget/EditText;Z)V

    .line 60
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v1, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0, p2}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda11;-><init>(Lkr/memorynotes/NoteEditor;Landroid/widget/EditText;)V

    const-string v2, "\uc120\ud0dd\ud55c \uc804\uccb4 \ube14\ub85d\uc744 \ub2f5\uc73c\ub85c \uc9c0\uc815"

    invoke-virtual {v0, v2, v1}, Lkr/memorynotes/Ui;->answerButton(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 61
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v1, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0, p2}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda12;-><init>(Lkr/memorynotes/NoteEditor;Landroid/widget/EditText;)V

    const-string v2, "\uac00\ub9bc \ubb38\uad6c \uc5ec\ub7ec \uac1c \uc124\uc815"

    invoke-virtual {v0, v2, v1}, Lkr/memorynotes/Ui;->clozeButton(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 62
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v1, v1, Lkr/memorynotes/Ui;->muted:I

    const-string v2, "\ub2f5\uc740 \ud30c\ub791, \uac00\ub9bc \ubb38\uad6c\ub294 \uc8fc\ud669\uc73c\ub85c \ud45c\uc2dc\ub429\ub2c8\ub2e4. \uc5ec\ub7ec \ubb38\uad6c\ub97c \uc120\ud0dd\ud55c \ud6c4 \ud55c \ubc88\uc5d0 \uc801\uc6a9\ud558\uc138\uc694."

    const/16 v3, 0xc

    invoke-virtual {v0, v2, v3, v1}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 63
    new-instance p1, Lkr/memorynotes/NoteEditor$1;

    invoke-direct {p1, p0, p2}, Lkr/memorynotes/NoteEditor$1;-><init>(Lkr/memorynotes/NoteEditor;Landroid/widget/EditText;)V

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 69
    return-void
.end method

.method applyVisibility()V
    .registers 7

    .line 46
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->activeType:Ljava/lang/String;

    invoke-static {v0}, Lkr/memorynotes/EditorPolicy;->isGeneral(Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-eqz v0, :cond_f

    move v4, v2

    goto :goto_10

    :cond_f
    move v4, v3

    :goto_10
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_19

    move v4, v3

    goto :goto_1a

    :cond_19
    move v4, v2

    :goto_1a
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const-string v1, "\uc624\ub2f5\ub178\ud2b8"

    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->activeType:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->mineFields:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_2b

    move v5, v2

    goto :goto_2c

    :cond_2b
    move v5, v3

    :goto_2c
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->mistakeFields:Landroid/widget/LinearLayout;

    if-nez v0, :cond_37

    if-eqz v1, :cond_36

    goto :goto_37

    :cond_36
    move v2, v3

    :cond_37
    :goto_37
    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method collect()V
    .registers 5

    .line 72
    iget-boolean v0, p0, Lkr/memorynotes/NoteEditor;->ready:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->collectFields()V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->activeType:Ljava/lang/String;

    iput-object v1, v0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->activeType:Ljava/lang/String;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v2, v2, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    iget-object v3, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v3, v3, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lkr/memorynotes/EditorPolicy;->titleFor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->subjectIds:Ljava/util/ArrayList;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor;->subject:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->chapterIds:Ljava/util/ArrayList;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor;->chapter:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    return-void
.end method

.method collectFields()V
    .registers 12

    .line 54
    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x8

    if-lt v0, v1, :cond_80

    .line 55
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->title:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->question:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->mine:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->mine:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->reason:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->reason:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->caution:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->caution:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->tags:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->tags:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->favorite:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    iput-boolean v1, v0, Lkr/memorynotes/Note;->favorite:Z

    .line 56
    return-void

    .line 54
    :cond_80
    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    const-string v8, "caution"

    const-string v9, "tags"

    const-string v2, "title"

    const-string v3, "body"

    const-string v4, "question"

    const-string v5, "answer"

    const-string v6, "mine"

    const-string v7, "reason"

    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v0

    iget-object v3, p0, Lkr/memorynotes/NoteEditor;->title:Landroid/widget/EditText;

    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    iget-object v5, p0, Lkr/memorynotes/NoteEditor;->question:Landroid/widget/EditText;

    iget-object v6, p0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    iget-object v7, p0, Lkr/memorynotes/NoteEditor;->mine:Landroid/widget/EditText;

    iget-object v8, p0, Lkr/memorynotes/NoteEditor;->reason:Landroid/widget/EditText;

    iget-object v9, p0, Lkr/memorynotes/NoteEditor;->caution:Landroid/widget/EditText;

    iget-object v10, p0, Lkr/memorynotes/NoteEditor;->tags:Landroid/widget/EditText;

    filled-new-array/range {v3 .. v10}, [Landroid/widget/EditText;

    move-result-object v3

    aget-object v3, v3, v0

    invoke-static {v1, v2, v3}, Lkr/memorynotes/ColorText;->collect(Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;)V

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1
.end method

.method drawImages()V
    .registers 10

    .line 104
    const-string v0, "file"

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->images:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v1, 0x0

    move v2, v1

    :goto_9
    iget-object v3, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v3, v3, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v2, v3, :cond_14

    return-void

    :cond_14
    :try_start_14
    iget-object v3, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v3, v3, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lkr/memorynotes/InlineImageText;->isReferenced(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3b

    :goto_3a
    goto :goto_ad

    :cond_3b
    new-instance v4, Lkr/memorynotes/ImageMaskView;

    iget-object v5, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v4, v5, v3, v1, v1}, Lkr/memorynotes/ImageMaskView;-><init>(Landroid/content/Context;Lorg/json/JSONObject;ZZ)V

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "ink:image:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lkr/memorynotes/ImageMaskView;->setTag(Ljava/lang/Object;)V

    iget-object v5, p0, Lkr/memorynotes/NoteEditor;->images:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v7, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v7, v7, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v8, 0x43660000    # 230.0f

    invoke-virtual {v7, v8}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {v6, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v4

    iget-object v5, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v5, v5, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v6, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v6, v6, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v7, "\ud655\ub300 \u00b7 \uac00\ub9bc \uc124\uc815"

    new-instance v8, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda8;

    invoke-direct {v8, p0, v3}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda8;-><init>(Lkr/memorynotes/NoteEditor;Lorg/json/JSONObject;)V

    invoke-virtual {v6, v7, v8}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v5, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v5, v5, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v6, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v6, v6, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v7, "\ucca8\ubd80 \uc81c\uac70"

    new-instance v8, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda9;

    invoke-direct {v8, p0, v3, v2}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda9;-><init>(Lkr/memorynotes/NoteEditor;Lorg/json/JSONObject;I)V

    invoke-virtual {v6, v7, v8}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v5, v4, v3}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v3, p0, Lkr/memorynotes/NoteEditor;->images:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    :try_end_a6
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_a6} :catch_a7

    goto :goto_3a

    :catch_a7
    move-exception v3

    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v4, v3}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_ad
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_9
.end method

.method synthetic lambda$1$kr-memorynotes-NoteEditor(Lkr/memorynotes/Ui;)V
    .registers 3

    .line 21
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    check-cast v0, Lkr/memorynotes/PictureEditText;

    invoke-virtual {v0}, Lkr/memorynotes/PictureEditText;->pastePicture()Z

    move-result v0

    if-nez v0, :cond_f

    const-string v0, "\uba3c\uc800 \uac24\ub7ec\ub9ac \ub4f1\uc5d0\uc11c \uadf8\ub9bc\uc744 \ubcf5\uc0ac\ud55c \ub2e4\uc74c \ubd99\uc5ec\ub123\uc5b4 \uc8fc\uc138\uc694."

    invoke-virtual {p1, v0}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    :cond_f
    return-void
.end method

.method synthetic lambda$11$kr-memorynotes-NoteEditor(Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 42
    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    return-void
.end method

.method synthetic lambda$14$kr-memorynotes-NoteEditor(Landroid/widget/EditText;)V
    .registers 2

    .line 60
    invoke-virtual {p0, p1}, Lkr/memorynotes/NoteEditor;->markAnswer(Landroid/widget/EditText;)V

    return-void
.end method

.method synthetic lambda$15$kr-memorynotes-NoteEditor(Landroid/widget/EditText;)V
    .registers 4

    .line 61
    new-instance v0, Lkr/memorynotes/PhraseSelectionDialog;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v0, v1, p1}, Lkr/memorynotes/PhraseSelectionDialog;-><init>(Lkr/memorynotes/MainActivity;Landroid/widget/EditText;)V

    invoke-virtual {v0}, Lkr/memorynotes/PhraseSelectionDialog;->show()V

    return-void
.end method

.method synthetic lambda$16$kr-memorynotes-NoteEditor(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 75
    iget-object p1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    const-string p2, "\ud648"

    invoke-virtual {p1, p2}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$17$kr-memorynotes-NoteEditor(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 75
    iget-object p1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "draft"

    invoke-interface {p1, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    const-string p2, "\ud648"

    invoke-virtual {p1, p2}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$18$kr-memorynotes-NoteEditor(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 81
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/json/JSONObject;

    new-instance p3, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {p3, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {p3, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string p3, "\ud655\ub300 \u00b7 \uac00\ub9bc \uc124\uc815"

    const-string p4, "\ubcf8\ubb38\uc5d0\uc11c \uadf8\ub9bc \uc0ad\uc81c"

    filled-new-array {p3, p4}, [Ljava/lang/String;

    move-result-object p3

    new-instance p4, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda7;

    invoke-direct {p4, p0, p1}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda7;-><init>(Lkr/memorynotes/NoteEditor;Lorg/json/JSONObject;)V

    invoke-virtual {p2, p3, p4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 84
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 85
    return-void
.end method

.method synthetic lambda$19$kr-memorynotes-NoteEditor(Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 82
    if-nez p3, :cond_e

    iget-object p2, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    new-instance p3, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda2;

    invoke-direct {p3, p0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda2;-><init>(Lkr/memorynotes/NoteEditor;)V

    const/4 v0, 0x1

    invoke-static {p2, p1, v0, p3}, Lkr/memorynotes/ImageMaskView;->dialog(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;ZLjava/lang/Runnable;)V

    goto :goto_1e

    .line 83
    :cond_e
    iget-object p2, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object p2, p2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance p3, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda3;

    invoke-direct {p3, p0, p1}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda3;-><init>(Lkr/memorynotes/NoteEditor;Lorg/json/JSONObject;)V

    const-string p1, "\ubcf8\ubb38 \uadf8\ub9bc \uc0ad\uc81c"

    const-string v0, "\uc774 \uadf8\ub9bc\uc744 \ubcf8\ubb38\uc5d0\uc11c \uc81c\uac70\ud560\uae4c\uc694?"

    invoke-virtual {p2, p1, v0, p3}, Lkr/memorynotes/Ui;->confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 84
    :goto_1e
    return-void
.end method

.method synthetic lambda$20$kr-memorynotes-NoteEditor()V
    .registers 5

    .line 82
    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lkr/memorynotes/InlineImages;->apply(Lkr/memorynotes/Ui;Landroid/widget/TextView;Landroid/text/Spannable;Z)V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->invalidate()V

    return-void
.end method

.method synthetic lambda$21$kr-memorynotes-NoteEditor(Lorg/json/JSONObject;)V
    .registers 6

    .line 83
    const-string v0, "file"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkr/memorynotes/InlineImageText;->marker(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lkr/memorynotes/ColorText;->replaceText(Landroid/widget/EditText;Ljava/lang/String;)V

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lkr/memorynotes/ColorText;->replaceText(Landroid/widget/EditText;Ljava/lang/String;)V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v0, v0, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_3c
    if-gez v0, :cond_45

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->drawImages()V

    return-void

    :cond_45
    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-ne v1, p1, :cond_56

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    :cond_56
    add-int/lit8 v0, v0, -0x1

    goto :goto_3c
.end method

.method synthetic lambda$22$kr-memorynotes-NoteEditor(Ljava/lang/Runnable;Ljava/util/List;Ljava/lang/Object;)V
    .registers 7

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 93
    :try_start_5
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_9
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_d} :catch_2d
    .catchall {:try_start_5 .. :try_end_d} :catchall_26

    if-nez v1, :cond_16

    :try_start_f
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_12} :catch_13

    goto :goto_14

    :catch_13
    move-exception p1

    .line 94
    :goto_14
    const/4 p1, 0x0

    goto :goto_34

    .line 93
    :cond_16
    :try_start_16
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-static {v2, v1}, Lkr/memorynotes/ImageMaskView;->importImage(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_25} :catch_2d
    .catchall {:try_start_16 .. :try_end_25} :catchall_26

    goto :goto_9

    :catchall_26
    move-exception p2

    :try_start_27
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_2a} :catch_2b

    goto :goto_2c

    :catch_2b
    move-exception p1

    :goto_2c
    throw p2

    :catch_2d
    move-exception p2

    :try_start_2e
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_31} :catch_32

    goto :goto_33

    :catch_32
    move-exception p1

    .line 94
    :goto_33
    move-object p1, p2

    .line 95
    :goto_34
    iget-object p2, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    new-instance v1, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1, v0, p3}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda4;-><init>(Lkr/memorynotes/NoteEditor;Ljava/lang/Exception;Ljava/util/ArrayList;Ljava/lang/Object;)V

    invoke-virtual {p2, v1}, Lkr/memorynotes/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 101
    return-void
.end method

.method synthetic lambda$23$kr-memorynotes-NoteEditor(Ljava/lang/Exception;Ljava/util/ArrayList;Ljava/lang/Object;)V
    .registers 9

    .line 95
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v0}, Lkr/memorynotes/MainActivity;->endBusy()V

    .line 96
    if-nez p1, :cond_8a

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    if-eq v0, p0, :cond_f

    goto/16 :goto_8a

    .line 97
    :cond_f
    :try_start_f
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1a
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_54

    .line 98
    iget-object p2, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-interface {p2, p3}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v0

    invoke-interface {p2, p3}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p2, p3}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    if-gez v0, :cond_38

    invoke-interface {p2}, Landroid/text/Editable;->length()I

    move-result v0

    move v1, v0

    :cond_38
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result p3

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, p3, v1}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    iget-object p2, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    add-int/2addr v0, p1

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setSelection(I)V

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->drawImages()V

    .line 99
    goto :goto_89

    .line 97
    :cond_54
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "file"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "masks"

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v2, v2, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-static {v0}, Lkr/memorynotes/InlineImageText;->marker(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_82} :catch_83

    goto :goto_1a

    .line 99
    :catch_83
    move-exception p1

    iget-object p2, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {p2, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    .line 100
    :goto_89
    return-void

    .line 96
    :cond_8a
    :goto_8a
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_8e
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_a5

    iget-object p2, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-interface {p2, p3}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    if-eqz p1, :cond_a4

    iget-object p2, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {p2, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :cond_a4
    return-void

    :cond_a5
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v3}, Lkr/memorynotes/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "images"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_8e
.end method

.method synthetic lambda$24$kr-memorynotes-NoteEditor(Lorg/json/JSONObject;)V
    .registers 5

    .line 104
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    new-instance v1, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda6;-><init>(Lkr/memorynotes/NoteEditor;)V

    const/4 v2, 0x1

    invoke-static {v0, p1, v2, v1}, Lkr/memorynotes/ImageMaskView;->dialog(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;ZLjava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$25$kr-memorynotes-NoteEditor()V
    .registers 1

    .line 104
    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->drawImages()V

    return-void
.end method

.method synthetic lambda$26$kr-memorynotes-NoteEditor(Lorg/json/JSONObject;I)V
    .registers 5

    .line 104
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v1, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0, p1, p2}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda10;-><init>(Lkr/memorynotes/NoteEditor;Lorg/json/JSONObject;I)V

    const-string p1, "\uc0ac\uc9c4 \uc81c\uac70"

    const-string p2, "\uc774 \ub178\ud2b8\uc5d0\uc11c \uc0ac\uc9c4\uc744 \uc81c\uac70\ud560\uae4c\uc694?"

    invoke-virtual {v0, p1, p2, v1}, Lkr/memorynotes/Ui;->confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$27$kr-memorynotes-NoteEditor(Lorg/json/JSONObject;I)V
    .registers 6

    .line 104
    const-string v0, "file"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lkr/memorynotes/InlineImageText;->marker(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, p1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lkr/memorynotes/ColorText;->replaceText(Landroid/widget/EditText;Ljava/lang/String;)V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lkr/memorynotes/ColorText;->replaceText(Landroid/widget/EditText;Ljava/lang/String;)V

    iget-object p1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object p1, p1, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->drawImages()V

    return-void
.end method

.method synthetic lambda$7$kr-memorynotes-NoteEditor()V
    .registers 2

    .line 38
    iget-boolean v0, p0, Lkr/memorynotes/NoteEditor;->ready:Z

    if-eqz v0, :cond_11

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->type:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lkr/memorynotes/NoteEditor;->switchType(Ljava/lang/String;)V

    :cond_11
    return-void
.end method

.method synthetic lambda$8$kr-memorynotes-NoteEditor()V
    .registers 3

    .line 39
    iget-boolean v0, p0, Lkr/memorynotes/NoteEditor;->ready:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->subjectIds:Ljava/util/ArrayList;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->subject:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->collectFields()V

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iput-object v0, v1, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    const-string v1, ""

    iput-object v1, v0, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->refreshChapters()V

    :cond_2d
    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    return-void
.end method

.method leave()V
    .registers 4

    .line 75
    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\uc791\uc131\uc744 \ub9c8\uce60\uae4c\uc694?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\uc784\uc2dc \uc800\uc7a5\ud558\uba74 \ud648\uc5d0\uc11c \uc774\uc5b4 \uc4f8 \uc218 \uc788\uc2b5\ub2c8\ub2e4."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\uacc4\uc18d \uc791\uc131"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/NoteEditor;)V

    const-string v2, "\uc784\uc2dc \uc800\uc7a5 \ud6c4 \ub098\uac00\uae30"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda1;-><init>(Lkr/memorynotes/NoteEditor;)V

    const-string v2, "\ucd08\uc548 \ubc84\ub9ac\uae30"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method manageInlinePictures()V
    .registers 9

    .line 77
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 78
    const/4 v2, 0x0

    move v3, v2

    :goto_c
    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v4, v4, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v3, v4, :cond_48

    .line 79
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_26

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v1, "\ub0b4\uc6a9\uc5d0 \ubd99\uc5ec\ub123\uc740 \uadf8\ub9bc\uc774 \uc5c6\uc2b5\ub2c8\ub2e4."

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void

    .line 80
    :cond_26
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v4, "\ubcf8\ubb38 \uadf8\ub9bc \uc120\ud0dd"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/CharSequence;

    new-instance v4, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda5;

    invoke-direct {v4, p0, v0, v1}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda5;-><init>(Lkr/memorynotes/NoteEditor;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {v3, v2, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 85
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 86
    return-void

    .line 78
    :cond_48
    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v4, v4, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_8b

    iget-object v5, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lkr/memorynotes/InlineImageText;->isReferenced(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8b

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\ubcf8\ubb38 \uadf8\ub9bc "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8b
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_c
.end method

.method markAnswer(Landroid/widget/EditText;)V
    .registers 6

    .line 70
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0, v1}, Lkr/memorynotes/PhraseSelection;->markAnswer(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_34

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    const-string v3, "]]"

    invoke-interface {v2, v1, v3}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    const-string v3, "[["

    invoke-interface {v2, v0, v3}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    :cond_34
    add-int/lit8 v1, v1, 0x4

    invoke-virtual {p1}, Landroid/widget/EditText;->length()I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V
    :try_end_41
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_41} :catch_42

    goto :goto_4e

    :catch_42
    move-exception p1

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    :goto_4e
    return-void
.end method

.method pastePictures(Ljava/util/List;Ljava/lang/Runnable;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-boolean v0, v0, Lkr/memorynotes/MainActivity;->busy:Z

    if-eqz v0, :cond_13

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    iget-object p1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string p2, "\uc0ac\uc9c4\uc744 \uac00\uc838\uc624\ub294 \uc911\uc785\ub2c8\ub2e4. \uc7a0\uc2dc \ud6c4 \ub2e4\uc2dc \ubd99\uc5ec\ub123\uc5b4 \uc8fc\uc138\uc694."

    invoke-virtual {p1, p2}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void

    .line 89
    :cond_13
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 90
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iget-object v3, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    const/16 v4, 0x22

    invoke-interface {v3, v2, v0, v1, v4}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    .line 91
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    const-string v1, "\uadf8\ub9bc\uc744 \ubd99\uc5ec\ub123\ub294 \uc911\uc785\ub2c8\ub2e4\u2026"

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->startBusy(Ljava/lang/String;)V

    .line 92
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda24;

    invoke-direct {v1, p0, p2, p1, v2}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda24;-><init>(Lkr/memorynotes/NoteEditor;Ljava/lang/Runnable;Ljava/util/List;Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 101
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 102
    return-void
.end method

.method persistDraft()V
    .registers 4

    .line 73
    const-string v0, "draft"

    iget-boolean v1, p0, Lkr/memorynotes/NoteEditor;->ready:Z

    if-nez v1, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->collect()V

    :try_start_a
    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    invoke-virtual {v2}, Lkr/memorynotes/Note;->json()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_26} :catch_27

    goto :goto_2d

    :catch_27
    move-exception v1

    const-string v2, "MemoryNote"

    invoke-static {v2, v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2d
    return-void
.end method

.method refreshChapters()V
    .registers 7

    .line 57
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->subjectIds:Ljava/util/ArrayList;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->subject:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v2, "chapters"

    invoke-virtual {v1, v2, v0}, Lkr/memorynotes/NoteDb;->groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->chapterIds:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->chapterIds:Ljava/util/ArrayList;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->chapterIds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "\ub2e8\uc6d0 \uc5c6\uc74c"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor;->chapter:Landroid/widget/Spinner;

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iget-object v4, p0, Lkr/memorynotes/NoteEditor;->chapterIds:Ljava/util/ArrayList;

    iget-object v5, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v5, v5, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v0, v2, v1, v3}, Lkr/memorynotes/Ui;->setOptions(Landroid/widget/Spinner;[Ljava/lang/String;I)V

    return-void
.end method

.method save()V
    .registers 3

    .line 74
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-boolean v0, v0, Lkr/memorynotes/MainActivity;->busy:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v1, "\uc0ac\uc9c4\uc744 \uac00\uc838\uc624\ub294 \uc911\uc785\ub2c8\ub2e4. \uc7a0\uc2dc \ud6c4 \uc800\uc7a5\ud558\uc138\uc694."

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void

    :cond_10
    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->collect()V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v0, v0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-static {v0}, Lkr/memorynotes/EditorPolicy;->isGeneral(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v0, v0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->title:Landroid/widget/EditText;

    const-string v1, "\uc81c\ubaa9\uc744 \uc785\ub825\ud558\uc138\uc694"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->title:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    return-void

    :cond_38
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v0, v0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    const-string v1, "\uc77c\ubc18 \ub178\ud2b8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6a

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v0, v0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_60

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v0, v0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6a

    :cond_60
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v1, "\ubb38\ub2f5 \uce74\ub4dc\uc640 \uc624\ub2f5\ub178\ud2b8\uc5d0\ub294 \ubb38\uc81c\uc640 \uc815\ub2f5\uc744 \uc785\ub825\ud558\uc138\uc694."

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void

    :cond_6a
    :try_start_6a
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    invoke-virtual {v0, v1}, Lkr/memorynotes/NoteDb;->save(Lkr/memorynotes/Note;)V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "draft"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->detail(Lkr/memorynotes/Note;)V
    :try_end_8e
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_8e} :catch_8f

    goto :goto_95

    :catch_8f
    move-exception v0

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v1, v0}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_95
    return-void
.end method

.method show()V
    .registers 22

    .line 7
    move-object/from16 v0, p0

    iget-object v1, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    const-string v2, "\ub178\ud2b8 \uc791\uc131"

    const-string v3, "\uc720\ud615\uc5d0 \ub9de\ub294 \uc785\ub825\ub780\uc73c\ub85c \uac04\ub2e8\ud558\uac8c \uc815\ub9ac\ud558\uc138\uc694."

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lkr/memorynotes/MainActivity;->shell(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 8
    iget-object v1, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v2, v2, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    iput-object v2, v1, Lkr/memorynotes/Ui;->pictures:Lorg/json/JSONArray;

    .line 9
    iget-object v1, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v3

    .line 10
    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v5, v5, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v6, "subjects"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lkr/memorynotes/NoteDb;->groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;

    move-result-object v5

    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->subjectIds:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 11
    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->subjectIds:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    const-string v7, "\uacfc\ubaa9"

    if-eqz v6, :cond_4b

    const-string v2, "\uacfc\ubaa9\uc744 \uba3c\uc800 \ucd94\uac00\ud558\uc138\uc694."

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    iget-object v1, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v1, v7}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void

    .line 12
    :cond_4b
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v5

    new-array v6, v4, [Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->subjectIds:Ljava/util/ArrayList;

    iget-object v8, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v8, v8, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    invoke-virtual {v1, v3, v7, v5, v6}, Lkr/memorynotes/Ui;->spinner(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->subject:Landroid/widget/Spinner;

    .line 13
    const-string v5, "\ub2e8\uc6d0 \uc5c6\uc74c"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\ub2e8\uc6d0"

    invoke-virtual {v1, v3, v6, v5, v4}, Lkr/memorynotes/Ui;->spinner(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->chapter:Landroid/widget/Spinner;

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/NoteEditor;->refreshChapters()V

    .line 14
    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v5, v5, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->activeType:Ljava/lang/String;

    .line 15
    const-string v5, "\uc77c\ubc18 \ub178\ud2b8"

    const-string v6, "\ubb38\ub2f5 \uce74\ub4dc"

    const-string v7, "\uc624\ub2f5\ub178\ud2b8"

    filled-new-array {v5, v6, v7}, [Ljava/lang/String;

    move-result-object v8

    filled-new-array {v5, v6, v7}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v6, v6, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v5

    const-string v6, "\ub178\ud2b8 \uc720\ud615"

    invoke-virtual {v1, v3, v6, v8, v5}, Lkr/memorynotes/Ui;->spinner(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->type:Landroid/widget/Spinner;

    .line 16
    const/16 v5, 0xc

    invoke-virtual {v1, v3, v5}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    .line 17
    invoke-virtual {v1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 18
    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v6, v6, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    const-string v7, "\uc81c\ubaa9 *"

    const/4 v8, 0x1

    invoke-virtual {v1, v5, v7, v6, v8}, Lkr/memorynotes/Ui;->edit(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;I)Landroid/widget/EditText;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->title:Landroid/widget/EditText;

    .line 19
    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v6, v6, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    const-string v7, "\ub0b4\uc6a9"

    const/4 v9, 0x5

    invoke-virtual {v1, v5, v7, v6, v9}, Lkr/memorynotes/Ui;->edit(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;I)Landroid/widget/EditText;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    invoke-virtual {v0, v5, v6}, Lkr/memorynotes/NoteEditor;->addStudyControls(Landroid/widget/LinearLayout;Landroid/widget/EditText;)V

    .line 20
    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    check-cast v5, Lkr/memorynotes/PictureEditText;

    new-instance v6, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda13;

    invoke-direct {v6, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda13;-><init>(Lkr/memorynotes/NoteEditor;)V

    iput-object v6, v5, Lkr/memorynotes/PictureEditText;->receiver:Lkr/memorynotes/PictureEditText$Receiver;

    .line 21
    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    new-instance v6, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda16;

    invoke-direct {v6, v0, v1}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda16;-><init>(Lkr/memorynotes/NoteEditor;Lkr/memorynotes/Ui;)V

    const-string v7, "\uadf8\ub9bc \ubd99\uc5ec\ub123\uae30"

    invoke-virtual {v1, v7, v6}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 22
    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    new-instance v6, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda17;

    invoke-direct {v6, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda17;-><init>(Lkr/memorynotes/NoteEditor;)V

    const-string v7, "\ubcf8\ubb38 \uadf8\ub9bc \ud655\ub300 \u00b7 \uac00\ub9bc \u00b7 \uc0ad\uc81c"

    invoke-virtual {v1, v7, v6}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 23
    invoke-virtual {v1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 24
    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v6, v6, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    const/4 v7, 0x3

    const-string v10, "\ubb38\uc81c *"

    invoke-virtual {v1, v5, v10, v6, v7}, Lkr/memorynotes/Ui;->edit(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;I)Landroid/widget/EditText;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->question:Landroid/widget/EditText;

    .line 25
    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v6, v6, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    const-string v7, "\ub2f5 *"

    invoke-virtual {v1, v5, v7, v6, v9}, Lkr/memorynotes/Ui;->edit(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;I)Landroid/widget/EditText;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    invoke-virtual {v1, v5, v8}, Lkr/memorynotes/Ui;->studyEditor(Landroid/widget/EditText;Z)V

    .line 26
    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    const/16 v6, 0xd

    iget v7, v1, Lkr/memorynotes/Ui;->muted:I

    const-string v9, "\ubcf5\uc2b5\ud560 \ub54c\ub294 \ubb38\uc81c\uac00 \uba3c\uc800 \ub098\uc624\uace0 \ub2f5\uc740 \uac00\ub824\uc9d1\ub2c8\ub2e4."

    invoke-virtual {v1, v9, v6, v7}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 27
    invoke-virtual {v1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->mineFields:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->mineFields:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->mineFields:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v6, v6, Lkr/memorynotes/Note;->mine:Ljava/lang/String;

    const-string v7, "\ub0b4\uac00 \uc4f4 \ub2f5"

    const/4 v9, 0x2

    invoke-virtual {v1, v5, v7, v6, v9}, Lkr/memorynotes/Ui;->edit(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;I)Landroid/widget/EditText;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->mine:Landroid/widget/EditText;

    .line 28
    invoke-virtual {v1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v5

    iput-object v5, v0, Lkr/memorynotes/NoteEditor;->mistakeFields:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->mistakeFields:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 29
    iget-object v3, v0, Lkr/memorynotes/NoteEditor;->mistakeFields:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v5, v5, Lkr/memorynotes/Note;->reason:Ljava/lang/String;

    const-string v6, "\ud2c0\ub9b0 \uc810 \u00b7 \ud5f7\uac08\ub9b0 \uc774\uc720 (\uc120\ud0dd)"

    invoke-virtual {v1, v3, v6, v5, v9}, Lkr/memorynotes/Ui;->edit(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;I)Landroid/widget/EditText;

    move-result-object v3

    iput-object v3, v0, Lkr/memorynotes/NoteEditor;->reason:Landroid/widget/EditText;

    .line 30
    iget-object v3, v0, Lkr/memorynotes/NoteEditor;->mistakeFields:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v5, v5, Lkr/memorynotes/Note;->caution:Ljava/lang/String;

    const-string v6, "\uc8fc\uc758\uc0ac\ud56d \u00b7 \ub2e4\uc74c\uc5d0 \ud655\uc778\ud560 \uac83 (\uc120\ud0dd)"

    invoke-virtual {v1, v3, v6, v5, v9}, Lkr/memorynotes/Ui;->edit(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;I)Landroid/widget/EditText;

    move-result-object v3

    iput-object v3, v0, Lkr/memorynotes/NoteEditor;->caution:Landroid/widget/EditText;

    .line 31
    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v5

    .line 32
    new-instance v6, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda18;

    invoke-direct {v6, v5}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda18;-><init>(Landroid/widget/LinearLayout;)V

    const-string v7, "\uc0ac\uc9c4 \u00b7 \ud0dc\uadf8 \u00b7 \uc990\uaca8\ucc3e\uae30  \u25be"

    invoke-virtual {v1, v7, v6}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v3, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v3, v3, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/16 v6, 0x8

    if-lez v3, :cond_1a6

    move v3, v4

    goto :goto_1a7

    :cond_1a6
    move v3, v6

    :goto_1a7
    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 33
    iget-object v3, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v3, v3, Lkr/memorynotes/Note;->tags:Ljava/lang/String;

    const-string v7, "\ud0dc\uadf8 (\uc27c\ud45c\ub85c \uad6c\ubd84)"

    invoke-virtual {v1, v5, v7, v3, v8}, Lkr/memorynotes/Ui;->edit(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;I)Landroid/widget/EditText;

    move-result-object v3

    iput-object v3, v0, Lkr/memorynotes/NoteEditor;->tags:Landroid/widget/EditText;

    .line 34
    new-instance v3, Landroid/widget/CheckBox;

    iget-object v7, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v3, v7}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lkr/memorynotes/NoteEditor;->favorite:Landroid/widget/CheckBox;

    iget-object v3, v0, Lkr/memorynotes/NoteEditor;->favorite:Landroid/widget/CheckBox;

    const-string v7, "\uc990\uaca8\ucc3e\uae30"

    invoke-virtual {v3, v7}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, v0, Lkr/memorynotes/NoteEditor;->favorite:Landroid/widget/CheckBox;

    iget v7, v1, Lkr/memorynotes/Ui;->ink:I

    invoke-virtual {v3, v7}, Landroid/widget/CheckBox;->setTextColor(I)V

    iget-object v3, v0, Lkr/memorynotes/NoteEditor;->favorite:Landroid/widget/CheckBox;

    iget-object v7, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-boolean v7, v7, Lkr/memorynotes/Note;->favorite:Z

    invoke-virtual {v3, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object v3, v0, Lkr/memorynotes/NoteEditor;->favorite:Landroid/widget/CheckBox;

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 35
    iget-object v3, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda19;

    invoke-direct {v7, v3}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda19;-><init>(Lkr/memorynotes/MainActivity;)V

    const-string v3, "\uff0b \uac24\ub7ec\ub9ac\uc5d0\uc11c \uc0ac\uc9c4 \ucd94\uac00"

    invoke-virtual {v1, v3, v7}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 36
    invoke-virtual {v1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v3

    iput-object v3, v0, Lkr/memorynotes/NoteEditor;->images:Landroid/widget/LinearLayout;

    iget-object v3, v0, Lkr/memorynotes/NoteEditor;->images:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/NoteEditor;->drawImages()V

    .line 37
    new-instance v3, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda20;

    invoke-direct {v3, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda20;-><init>(Lkr/memorynotes/NoteEditor;)V

    const-string v5, "\ub178\ud2b8 \uc800\uc7a5"

    invoke-virtual {v1, v5, v3}, Lkr/memorynotes/Ui;->primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda21;

    invoke-direct {v3, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda21;-><init>(Lkr/memorynotes/NoteEditor;)V

    const-string v5, "\uc791\uc131 \ucde8\uc18c"

    invoke-virtual {v1, v5, v3}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 38
    iget-object v1, v0, Lkr/memorynotes/NoteEditor;->type:Landroid/widget/Spinner;

    new-instance v2, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda22;

    invoke-direct {v2, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda22;-><init>(Lkr/memorynotes/NoteEditor;)V

    invoke-static {v2}, Lkr/memorynotes/MainActivity;->listener(Ljava/lang/Runnable;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 39
    iget-object v1, v0, Lkr/memorynotes/NoteEditor;->subject:Landroid/widget/Spinner;

    new-instance v2, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda23;

    invoke-direct {v2, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda23;-><init>(Lkr/memorynotes/NoteEditor;)V

    invoke-static {v2}, Lkr/memorynotes/MainActivity;->listener(Ljava/lang/Runnable;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 40
    iget-object v1, v0, Lkr/memorynotes/NoteEditor;->chapter:Landroid/widget/Spinner;

    new-instance v2, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;

    invoke-direct {v2, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;-><init>(Lkr/memorynotes/NoteEditor;)V

    invoke-static {v2}, Lkr/memorynotes/MainActivity;->listener(Ljava/lang/Runnable;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 41
    iget-object v9, v0, Lkr/memorynotes/NoteEditor;->title:Landroid/widget/EditText;

    iget-object v10, v0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    iget-object v11, v0, Lkr/memorynotes/NoteEditor;->question:Landroid/widget/EditText;

    iget-object v12, v0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    iget-object v13, v0, Lkr/memorynotes/NoteEditor;->mine:Landroid/widget/EditText;

    iget-object v14, v0, Lkr/memorynotes/NoteEditor;->reason:Landroid/widget/EditText;

    iget-object v15, v0, Lkr/memorynotes/NoteEditor;->caution:Landroid/widget/EditText;

    iget-object v1, v0, Lkr/memorynotes/NoteEditor;->tags:Landroid/widget/EditText;

    move-object/from16 v16, v1

    filled-new-array/range {v9 .. v16}, [Landroid/widget/EditText;

    move-result-object v1

    move v2, v4

    :goto_259
    if-lt v2, v6, :cond_2c3

    .line 42
    iget-object v1, v0, Lkr/memorynotes/NoteEditor;->favorite:Landroid/widget/CheckBox;

    new-instance v2, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda15;

    invoke-direct {v2, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda15;-><init>(Lkr/memorynotes/NoteEditor;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 43
    move v1, v4

    :goto_266
    if-lt v1, v6, :cond_27f

    .line 44
    iput-boolean v8, v0, Lkr/memorynotes/NoteEditor;->ready:Z

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/NoteEditor;->applyVisibility()V

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    iget-object v1, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    new-instance v3, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;

    invoke-direct {v3, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;-><init>(Lkr/memorynotes/NoteEditor;)V

    const-string v4, "editor"

    invoke-static {v1, v2, v4, v3}, Lkr/memorynotes/InkPage;->attach(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 45
    return-void

    .line 43
    :cond_27f
    iget-object v9, v0, Lkr/memorynotes/NoteEditor;->title:Landroid/widget/EditText;

    iget-object v10, v0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    iget-object v11, v0, Lkr/memorynotes/NoteEditor;->question:Landroid/widget/EditText;

    iget-object v12, v0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    iget-object v13, v0, Lkr/memorynotes/NoteEditor;->mine:Landroid/widget/EditText;

    iget-object v14, v0, Lkr/memorynotes/NoteEditor;->reason:Landroid/widget/EditText;

    iget-object v15, v0, Lkr/memorynotes/NoteEditor;->caution:Landroid/widget/EditText;

    iget-object v2, v0, Lkr/memorynotes/NoteEditor;->tags:Landroid/widget/EditText;

    move-object/from16 v16, v2

    filled-new-array/range {v9 .. v16}, [Landroid/widget/EditText;

    move-result-object v2

    aget-object v12, v2, v1

    const-string v19, "caution"

    const-string v20, "tags"

    const-string v13, "title"

    const-string v14, "body"

    const-string v15, "question"

    const-string v16, "answer"

    const-string v17, "mine"

    const-string v18, "reason"

    filled-new-array/range {v13 .. v20}, [Ljava/lang/String;

    move-result-object v2

    aget-object v11, v2, v1

    iget-object v9, v0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object v10, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    new-instance v13, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;

    invoke-direct {v13, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;-><init>(Lkr/memorynotes/NoteEditor;)V

    iget-object v2, v0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    if-eq v12, v2, :cond_2bc

    move v14, v8

    goto :goto_2bd

    :cond_2bc
    move v14, v4

    :goto_2bd
    invoke-static/range {v9 .. v14}, Lkr/memorynotes/ColorText;->bind(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;Ljava/lang/Runnable;Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_266

    .line 41
    :cond_2c3
    aget-object v3, v1, v2

    new-instance v5, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;

    invoke-direct {v5, v0}, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda14;-><init>(Lkr/memorynotes/NoteEditor;)V

    invoke-static {v5}, Lkr/memorynotes/MainActivity;->watcher(Ljava/lang/Runnable;)Landroid/text/TextWatcher;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_259
.end method

.method switchType(Ljava/lang/String;)V
    .registers 4

    .line 48
    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->activeType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 49
    :cond_9
    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->collectFields()V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->activeType:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lkr/memorynotes/EditorPolicy;->prepareSwitch(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/NoteEditor;->ready:Z

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->title:Landroid/widget/EditText;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-static {v0, v1}, Lkr/memorynotes/ColorText;->replaceText(Landroid/widget/EditText;Ljava/lang/String;)V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    invoke-static {v0, v1}, Lkr/memorynotes/ColorText;->replaceText(Landroid/widget/EditText;Ljava/lang/String;)V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->question:Landroid/widget/EditText;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    invoke-static {v0, v1}, Lkr/memorynotes/ColorText;->replaceText(Landroid/widget/EditText;Ljava/lang/String;)V

    iget-object v0, p0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-static {v0, v1}, Lkr/memorynotes/ColorText;->replaceText(Landroid/widget/EditText;Ljava/lang/String;)V

    iput-object p1, p0, Lkr/memorynotes/NoteEditor;->activeType:Ljava/lang/String;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lkr/memorynotes/NoteEditor;->ready:Z

    .line 51
    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->applyVisibility()V

    invoke-virtual {p0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    .line 52
    return-void
.end method

.method wrap(Landroid/widget/EditText;)V
    .registers 8

    .line 71
    invoke-virtual {p1}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    if-ltz v0, :cond_4d

    if-gt v1, v0, :cond_d

    goto :goto_4d

    :cond_d
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v0, v1}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "{{"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_43

    const-string v4, "}}"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2a

    goto :goto_43

    :cond_2a
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v0, v1, v2}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    return-void

    :cond_43
    :goto_43
    iget-object p1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v0, "\uc774\ubbf8 \ube48\uce78\uc73c\ub85c \uc9c0\uc815\ud55c \ubd80\ubd84\uc740 \uc81c\uc678\ud558\uace0 \uc120\ud0dd\ud558\uc138\uc694."

    invoke-virtual {p1, v0}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void

    :cond_4d
    :goto_4d
    iget-object p1, p0, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v0, "\uba3c\uc800 \uc678\uc6b8 \ubb38\uad6c\ub97c \uae38\uac8c \ub20c\ub7ec \uc120\ud0dd\ud558\uc138\uc694."

    invoke-virtual {p1, v0}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void
.end method
