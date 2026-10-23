.class final Lkr/memorynotes/PhraseSelectionDialog;
.super Ljava/lang/Object;
.source "PhraseSelectionDialog.java"


# instance fields
.field private final a:Lkr/memorynotes/MainActivity;

.field private final boxes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/widget/CheckBox;",
            ">;"
        }
    .end annotation
.end field

.field private chosen:Landroid/widget/LinearLayout;

.field private count:Landroid/widget/TextView;

.field private final lines:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/PhraseSelection$Range;",
            ">;"
        }
    .end annotation
.end field

.field private preview:Landroid/widget/TextView;

.field private final selection:Lkr/memorynotes/PhraseSelection;

.field private syncing:Z

.field private final target:Landroid/widget/EditText;


# direct methods
.method public static synthetic $r8$lambda$9IeepzsWvl9ihaR9nSEFtkP_-Og(Lkr/memorynotes/PhraseSelectionDialog;)V
    .registers 1

    invoke-direct {p0}, Lkr/memorynotes/PhraseSelectionDialog;->addSelected()V

    return-void
.end method

.method constructor <init>(Lkr/memorynotes/MainActivity;Landroid/widget/EditText;)V
    .registers 4

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->boxes:Ljava/util/ArrayList;

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->lines:Ljava/util/ArrayList;

    .line 15
    iput-object p1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/PhraseSelectionDialog;->target:Landroid/widget/EditText;

    new-instance p1, Lkr/memorynotes/PhraseSelection;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lkr/memorynotes/PhraseSelection;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {p2}, Landroid/widget/EditText;->getSelectionStart()I

    move-result p1

    invoke-virtual {p2}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result p2

    if-ltz p1, :cond_35

    if-le p2, p1, :cond_35

    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {v0, p1, p2}, Lkr/memorynotes/PhraseSelection;->add(II)Z

    :cond_35
    return-void
.end method

.method static synthetic access$0(Lkr/memorynotes/PhraseSelectionDialog;)V
    .registers 1

    .line 35
    invoke-direct {p0}, Lkr/memorynotes/PhraseSelectionDialog;->addSelected()V

    return-void
.end method

.method private addSelected()V
    .registers 4

    .line 35
    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->preview:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v0

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->preview:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v1

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {v2, v0, v1}, Lkr/memorynotes/PhraseSelection;->addVisible(II)Z

    move-result v0

    if-nez v0, :cond_21

    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    const-string v1, "\uc0c8 \ubb38\uad6c\ub97c \uc120\ud0dd\ud558\uc138\uc694. \uc774\ubbf8 \uac00\ub9b0 \uacf3\uc774\ub098 \uc120\ud0dd\uc774 \uacb9\uce5c \uacf3\uc740 \uc81c\uc678\ud569\ub2c8\ub2e4."

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_21
    invoke-direct {p0}, Lkr/memorynotes/PhraseSelectionDialog;->refresh()V

    return-void
.end method

.method static synthetic lambda$6(Lkr/memorynotes/PhraseSelection$Range;)I
    .registers 1

    .line 33
    iget p0, p0, Lkr/memorynotes/PhraseSelection$Range;->start:I

    return p0
.end method

.method private refresh()V
    .registers 11

    .line 37
    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->count:Landroid/widget/TextView;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->count:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {v2}, Lkr/memorynotes/PhraseSelection;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\uac1c \ubb38\uad6c \uc120\ud0dd \u00b7 \uc801\uc6a9 \uc804\uae4c\uc9c0 \uc6d0\ubb38\uc740 \uc720\uc9c0\ub429\ub2c8\ub2e4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->chosen:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {v0}, Lkr/memorynotes/PhraseSelection;->ranges()Ljava/util/List;

    move-result-object v0

    .line 38
    const/4 v1, 0x0

    move v2, v1

    :goto_30
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-lt v2, v3, :cond_f5

    .line 39
    const/4 v3, 0x1

    iput-boolean v3, p0, Lkr/memorynotes/PhraseSelectionDialog;->syncing:Z

    move v4, v1

    :goto_3a
    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->boxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v4, v2, :cond_be

    iput-boolean v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->syncing:Z

    .line 40
    new-instance v2, Landroid/text/SpannableStringBuilder;

    iget-object v4, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    iget-object v5, v5, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    const/16 v6, 0x11

    invoke-virtual {v4, v5, v6, v3, v1}, Lkr/memorynotes/Ui;->study(Ljava/lang/String;IZZ)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 41
    iget-object v4, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    iget-object v4, v4, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-static {v4, v1, v3}, Lkr/memorynotes/StudyText;->parts(Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v6, v1

    :goto_68
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_74

    .line 42
    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->preview:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    return-void

    .line 41
    :cond_74
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lkr/memorynotes/StudyText$Part;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_7f
    :goto_7f
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_8d

    iget-object v1, v7, Lkr/memorynotes/StudyText$Part;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v6, v1

    goto :goto_68

    :cond_8d
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkr/memorynotes/PhraseSelection$Range;

    iget v3, v1, Lkr/memorynotes/PhraseSelection$Range;->start:I

    iget v4, v7, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v1, v1, Lkr/memorynotes/PhraseSelection$Range;->end:I

    iget v4, v7, Lkr/memorynotes/StudyText$Part;->sourceEnd:I

    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    if-ge v3, v1, :cond_7f

    new-instance v4, Landroid/text/style/BackgroundColorSpan;

    iget-object v9, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v9, v9, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v9, v9, Lkr/memorynotes/Ui;->clozeTint:I

    invoke-direct {v4, v9}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    add-int/2addr v3, v6

    iget v9, v7, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    sub-int/2addr v3, v9

    add-int/2addr v1, v6

    iget v9, v7, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    sub-int/2addr v1, v9

    const/16 v9, 0x21

    invoke-virtual {v2, v4, v3, v1, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_7f

    .line 39
    :cond_be
    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->lines:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lkr/memorynotes/PhraseSelection$Range;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v2, v1

    :cond_cc
    :goto_cc
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_e1

    iget-object v5, p0, Lkr/memorynotes/PhraseSelectionDialog;->boxes:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/widget/CheckBox;

    invoke-virtual {v5, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_3a

    :cond_e1
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkr/memorynotes/PhraseSelection$Range;

    iget v8, v7, Lkr/memorynotes/PhraseSelection$Range;->start:I

    iget v9, v5, Lkr/memorynotes/PhraseSelection$Range;->start:I

    if-ne v8, v9, :cond_cc

    iget v7, v7, Lkr/memorynotes/PhraseSelection$Range;->end:I

    iget v8, v5, Lkr/memorynotes/PhraseSelection$Range;->end:I

    if-ne v7, v8, :cond_cc

    move v2, v3

    goto :goto_cc

    .line 38
    :cond_f5
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkr/memorynotes/PhraseSelection$Range;

    iget-object v4, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "\u00d7  "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    iget-object v6, v6, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    iget v7, v3, Lkr/memorynotes/PhraseSelection$Range;->start:I

    iget v3, v3, Lkr/memorynotes/PhraseSelection$Range;->end:I

    invoke-virtual {v6, v7, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v5, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda7;

    invoke-direct {v5, p0, v2}, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda7;-><init>(Lkr/memorynotes/PhraseSelectionDialog;I)V

    invoke-virtual {v4, v3, v5}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    iget-object v4, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->clozeColor:I

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setTextColor(I)V

    iget-object v4, p0, Lkr/memorynotes/PhraseSelectionDialog;->chosen:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_30
.end method


# virtual methods
.method synthetic lambda$1$kr-memorynotes-PhraseSelectionDialog()V
    .registers 2

    .line 27
    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {v0}, Lkr/memorynotes/PhraseSelection;->selectLines()V

    invoke-direct {p0}, Lkr/memorynotes/PhraseSelectionDialog;->refresh()V

    return-void
.end method

.method synthetic lambda$2$kr-memorynotes-PhraseSelectionDialog()V
    .registers 2

    .line 27
    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {v0}, Lkr/memorynotes/PhraseSelection;->clear()V

    invoke-direct {p0}, Lkr/memorynotes/PhraseSelectionDialog;->refresh()V

    return-void
.end method

.method synthetic lambda$3$kr-memorynotes-PhraseSelectionDialog(Lkr/memorynotes/PhraseSelection$Range;Landroid/widget/CompoundButton;Z)V
    .registers 6

    .line 29
    iget-boolean p2, p0, Lkr/memorynotes/PhraseSelectionDialog;->syncing:Z

    if-eqz p2, :cond_5

    return-void

    :cond_5
    iget-object p2, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    if-eqz p3, :cond_20

    iget p3, p1, Lkr/memorynotes/PhraseSelection$Range;->start:I

    iget p1, p1, Lkr/memorynotes/PhraseSelection$Range;->end:I

    invoke-virtual {p2, p3, p1}, Lkr/memorynotes/PhraseSelection;->add(II)Z

    move-result p1

    if-nez p1, :cond_2c

    iget-object p1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    const-string p2, "\uc774\ubbf8 \uc120\ud0dd\ud55c \ubb38\uad6c\uc640 \uacb9\uce69\ub2c8\ub2e4."

    const/4 p3, 0x0

    invoke-static {p1, p2, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_2c

    :cond_20
    invoke-virtual {p2}, Lkr/memorynotes/PhraseSelection;->ranges()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    :goto_2a
    if-gez p3, :cond_30

    :cond_2c
    :goto_2c
    invoke-direct {p0}, Lkr/memorynotes/PhraseSelectionDialog;->refresh()V

    return-void

    :cond_30
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/PhraseSelection$Range;

    iget v0, v0, Lkr/memorynotes/PhraseSelection$Range;->start:I

    iget v1, p1, Lkr/memorynotes/PhraseSelection$Range;->start:I

    if-ne v0, v1, :cond_4d

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/PhraseSelection$Range;

    iget v0, v0, Lkr/memorynotes/PhraseSelection$Range;->end:I

    iget v1, p1, Lkr/memorynotes/PhraseSelection$Range;->end:I

    if-ne v0, v1, :cond_4d

    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {v0, p3}, Lkr/memorynotes/PhraseSelection;->remove(I)V

    :cond_4d
    add-int/lit8 p3, p3, -0x1

    goto :goto_2a
.end method

.method synthetic lambda$4$kr-memorynotes-PhraseSelectionDialog(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .registers 4

    .line 33
    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p2

    new-instance v0, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0, p1}, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda5;-><init>(Lkr/memorynotes/PhraseSelectionDialog;Landroid/app/AlertDialog;)V

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$5$kr-memorynotes-PhraseSelectionDialog(Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 7

    .line 33
    iget-object p2, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {p2}, Lkr/memorynotes/PhraseSelection;->size()I

    move-result p2

    if-nez p2, :cond_12

    iget-object p1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string p2, "\uac00\ub9b4 \ubb38\uad6c \ub610\ub294 \uc904\uc744 \ud558\ub098 \uc774\uc0c1 \uc120\ud0dd\ud558\uc138\uc694."

    invoke-virtual {p1, p2}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void

    :cond_12
    iget-object p2, p0, Lkr/memorynotes/PhraseSelectionDialog;->target:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    iget-object v0, v0, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_30

    iget-object p1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string p2, "\uc6d0\ubb38\uc774 \ubcc0\uacbd\ub418\uc5b4 \uc801\uc6a9\ud558\uc9c0 \uc54a\uc558\uc2b5\ub2c8\ub2e4. \ub2e4\uc2dc \uc5f4\uc5b4\uc8fc\uc138\uc694."

    invoke-virtual {p1, p2}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void

    :cond_30
    iget-object p2, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {p2}, Lkr/memorynotes/PhraseSelection;->ranges()Ljava/util/List;

    move-result-object p2

    new-instance v0, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda6;

    invoke-direct {v0}, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda6;-><init>()V

    invoke-static {v0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Comparator;->reversed()Ljava/util/Comparator;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_4a
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_5f

    iget-object p2, p0, Lkr/memorynotes/PhraseSelectionDialog;->target:Landroid/widget/EditText;

    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->target:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setSelection(I)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    return-void

    :cond_5f
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/PhraseSelection$Range;

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->target:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    iget v2, v0, Lkr/memorynotes/PhraseSelection$Range;->end:I

    const-string v3, "}}"

    invoke-interface {v1, v2, v3}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->target:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    iget v0, v0, Lkr/memorynotes/PhraseSelection$Range;->start:I

    const-string v2, "{{"

    invoke-interface {v1, v0, v2}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    goto :goto_4a
.end method

.method synthetic lambda$7$kr-memorynotes-PhraseSelectionDialog(I)V
    .registers 3

    .line 38
    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {v0, p1}, Lkr/memorynotes/PhraseSelection;->remove(I)V

    invoke-direct {p0}, Lkr/memorynotes/PhraseSelectionDialog;->refresh()V

    return-void
.end method

.method show()V
    .registers 9

    .line 17
    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    iget-object v3, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v3, v3, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v4, 0x41400000    # 12.0f

    invoke-virtual {v3, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    iget-object v5, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v5, v5, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v5, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v5, v5, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    invoke-virtual {v0, v1, v3, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v1, v1, Lkr/memorynotes/Ui;->surface:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 18
    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->muted:I

    const-string v3, "\ubb38\uad6c\ub97c \uae38\uac8c \ub20c\ub7ec \uc120\ud0dd \u2192 \u2018\uc120\ud0dd \ubb38\uad6c \ucd94\uac00\u2019\ub97c \ubc18\ubcf5\ud558\uc138\uc694. \uc544\ub798\uc5d0\uc11c \uc5ec\ub7ec \uc904\uc744 \uccb4\ud06c\ud574\ub3c4 \ub429\ub2c8\ub2e4."

    const/16 v5, 0xe

    invoke-virtual {v1, v3, v5, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 19
    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    iget-object v2, v2, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    const/16 v3, 0x11

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-virtual {v1, v2, v3, v6, v7}, Lkr/memorynotes/Ui;->study(Ljava/lang/String;IZZ)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->preview:Landroid/widget/TextView;

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->preview:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->preview:Landroid/widget/TextView;

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v2, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v3, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v3, v3, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {v1, v7, v2, v7, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->preview:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 20
    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->preview:Landroid/widget/TextView;

    new-instance v2, Lkr/memorynotes/PhraseSelectionDialog$1;

    invoke-direct {v2, p0}, Lkr/memorynotes/PhraseSelectionDialog$1;-><init>(Lkr/memorynotes/PhraseSelectionDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 26
    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/PhraseSelectionDialog;)V

    const-string v3, "\uc120\ud0dd \ubb38\uad6c \ucd94\uac00"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 27
    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v1}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v3, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v3, v3, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v4, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0}, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda1;-><init>(Lkr/memorynotes/PhraseSelectionDialog;)V

    const-string v6, "\uc904 \uc804\uccb4 \uc120\ud0dd"

    invoke-virtual {v3, v6, v4}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v3, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v3, v3, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v4, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda2;

    invoke-direct {v4, p0}, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda2;-><init>(Lkr/memorynotes/PhraseSelectionDialog;)V

    const-string v6, "\uc120\ud0dd \ubaa8\ub450 \ud574\uc81c"

    invoke-virtual {v3, v6, v4}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 28
    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->lines:Ljava/util/ArrayList;

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    invoke-virtual {v2}, Lkr/memorynotes/PhraseSelection;->lines()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->lines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_f7

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->muted:I

    const-string v3, "\uc904\ubcc4 \ube60\ub978 \uc120\ud0dd"

    invoke-virtual {v1, v3, v5, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 29
    :cond_f7
    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->lines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_fd
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_18c

    .line 30
    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->clozeColor:I

    const-string v3, ""

    const/16 v4, 0xf

    invoke-virtual {v1, v3, v4, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->count:Landroid/widget/TextView;

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->count:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v1

    iput-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->chosen:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog;->chosen:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 31
    new-instance v1, Landroid/widget/ScrollView;

    iget-object v2, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v1, v2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v0}, Lkr/memorynotes/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-double v2, v0

    const-wide v4, 0x3fe3d70a3d70a3d7L    # 0.62

    mul-double/2addr v2, v4

    double-to-int v0, v2

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "\uac00\ub9bc \ubb38\uad6c \uc5ec\ub7ec \uac1c \uc124\uc815"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\ucde8\uc18c"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\ud55c \ubc88\uc5d0 \uc801\uc6a9"

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 33
    new-instance v3, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda4;

    invoke-direct {v3, p0, v2}, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda4;-><init>(Lkr/memorynotes/PhraseSelectionDialog;Landroid/app/AlertDialog;)V

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    invoke-virtual {v1}, Landroid/widget/ScrollView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1}, Landroid/widget/ScrollView;->requestLayout()V

    invoke-direct {p0}, Lkr/memorynotes/PhraseSelectionDialog;->refresh()V

    .line 34
    return-void

    .line 29
    :cond_18c
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkr/memorynotes/PhraseSelection$Range;

    new-instance v3, Landroid/widget/CheckBox;

    iget-object v4, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v3, v4}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Lkr/memorynotes/PhraseSelectionDialog;->selection:Lkr/memorynotes/PhraseSelection;

    iget-object v4, v4, Lkr/memorynotes/PhraseSelection;->source:Ljava/lang/String;

    iget v5, v2, Lkr/memorynotes/PhraseSelection$Range;->start:I

    iget v6, v2, Lkr/memorynotes/PhraseSelection$Range;->end:I

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lkr/memorynotes/Cloze;->reveal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->answerColor:I

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setTextColor(I)V

    iget-object v4, p0, Lkr/memorynotes/PhraseSelectionDialog;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->scale:F

    const/high16 v5, 0x41700000    # 15.0f

    mul-float/2addr v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setTextSize(F)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v4, p0, Lkr/memorynotes/PhraseSelectionDialog;->boxes:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v4, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda3;

    invoke-direct {v4, p0, v2}, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda3;-><init>(Lkr/memorynotes/PhraseSelectionDialog;Lkr/memorynotes/PhraseSelection$Range;)V

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto/16 :goto_fd
.end method
