.class final Lkr/memorynotes/ReviewPicker;
.super Ljava/lang/Object;
.source "ReviewPicker.java"


# instance fields
.field final a:Lkr/memorynotes/MainActivity;

.field final count:Landroid/widget/TextView;

.field final dialog:Landroid/app/AlertDialog;

.field final filters:Lkr/memorynotes/FilterControls;

.field final range:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;ZLjava/lang/String;)V
    .registers 10

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    iput-object p1, p0, Lkr/memorynotes/ReviewPicker;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v1, v1, Lkr/memorynotes/Ui;->surface:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    iget-object v3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v4, 0x41200000    # 10.0f

    invoke-virtual {v3, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    iget-object v5, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v5, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    invoke-virtual {v0, v1, v3, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 7
    new-instance v1, Lkr/memorynotes/FilterControls;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v0, p3, v2}, Lkr/memorynotes/FilterControls;-><init>(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Z)V

    iput-object v1, p0, Lkr/memorynotes/ReviewPicker;->filters:Lkr/memorynotes/FilterControls;

    iget-object p3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v1, "\uc804\uccb4 \ub178\ud2b8 \u00b7 \ubcf5\uc2b5 \uc608\uc815\uc77c \ubb34\uad00"

    const-string v2, "\uc624\ub298 \ubcf5\uc2b5\ud560 \ub178\ud2b8\ub9cc"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\ubcf5\uc2b5 \ubc94\uc704"

    invoke-virtual {p3, v0, v2, v1, p2}, Lkr/memorynotes/Ui;->spinner(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object p2

    iput-object p2, p0, Lkr/memorynotes/ReviewPicker;->range:Landroid/widget/Spinner;

    iget-object p2, p0, Lkr/memorynotes/ReviewPicker;->range:Landroid/widget/Spinner;

    const-string p3, "review.range"

    invoke-virtual {p2, p3}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    iget-object p2, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object p3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget p3, p3, Lkr/memorynotes/Ui;->ink:I

    const-string v1, ""

    const/16 v2, 0x12

    invoke-virtual {p2, v1, v2, p3}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    iput-object p2, p0, Lkr/memorynotes/ReviewPicker;->count:Landroid/widget/TextView;

    iget-object p2, p0, Lkr/memorynotes/ReviewPicker;->count:Landroid/widget/TextView;

    const-string p3, "review.count"

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    iget-object p2, p0, Lkr/memorynotes/ReviewPicker;->count:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 8
    new-instance p2, Landroid/widget/ScrollView;

    invoke-direct {p2, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iget-object p3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget p3, p3, Lkr/memorynotes/Ui;->surface:I

    invoke-virtual {p2, p3}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    invoke-virtual {p2, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object p3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v0, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v0, v0, Lkr/memorynotes/Ui;->ink:I

    const-string v1, "\ubcf5\uc2b5 \ubc94\uc704 \uc120\ud0dd"

    const/16 v2, 0x14

    invoke-virtual {p3, v1, v2, v0}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p3

    iget-object v0, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    iget-object v2, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    iget-object v3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {p3, v0, v2, v1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v0, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v0, v0, Lkr/memorynotes/Ui;->surface:I

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 9
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setCustomTitle(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    invoke-virtual {p3, p2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string p3, "\ucde8\uc18c"

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string p3, "\ubcf5\uc2b5 \uc2dc\uc791"

    invoke-virtual {p2, p3, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p2

    iput-object p2, p0, Lkr/memorynotes/ReviewPicker;->dialog:Landroid/app/AlertDialog;

    .line 10
    iget-object p2, p0, Lkr/memorynotes/ReviewPicker;->dialog:Landroid/app/AlertDialog;

    new-instance p3, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda1;

    invoke-direct {p3, p0, p1}, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda1;-><init>(Lkr/memorynotes/ReviewPicker;Lkr/memorynotes/MainActivity;)V

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 11
    iget-object p1, p0, Lkr/memorynotes/ReviewPicker;->filters:Lkr/memorynotes/FilterControls;

    new-instance p2, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0}, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda2;-><init>(Lkr/memorynotes/ReviewPicker;)V

    iput-object p2, p1, Lkr/memorynotes/FilterControls;->changed:Ljava/lang/Runnable;

    iget-object p1, p0, Lkr/memorynotes/ReviewPicker;->range:Landroid/widget/Spinner;

    new-instance p2, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda3;

    invoke-direct {p2, p0}, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda3;-><init>(Lkr/memorynotes/ReviewPicker;)V

    invoke-static {p2}, Lkr/memorynotes/MainActivity;->listener(Ljava/lang/Runnable;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object p1, p0, Lkr/memorynotes/ReviewPicker;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    .line 12
    return-void
.end method


# virtual methods
.method synthetic lambda$0$kr-memorynotes-ReviewPicker(Lkr/memorynotes/MainActivity;Landroid/content/DialogInterface;)V
    .registers 6

    .line 10
    iget-object p2, p0, Lkr/memorynotes/ReviewPicker;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {p2}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    iget-object v0, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v1, v1, Lkr/memorynotes/Ui;->surface:I

    const/16 v2, 0x12

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p2, p0, Lkr/memorynotes/ReviewPicker;->dialog:Landroid/app/AlertDialog;

    const/4 v0, -0x1

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p2

    new-instance v0, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lkr/memorynotes/ReviewPicker$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/ReviewPicker;Lkr/memorynotes/MainActivity;)V

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkr/memorynotes/ReviewPicker;->refresh()V

    return-void
.end method

.method synthetic lambda$1$kr-memorynotes-ReviewPicker(Lkr/memorynotes/MainActivity;Landroid/view/View;)V
    .registers 4

    .line 10
    invoke-virtual {p0}, Lkr/memorynotes/ReviewPicker;->selected()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lkr/memorynotes/ReviewPicker;->refresh()V

    return-void

    :cond_e
    iget-object v0, p0, Lkr/memorynotes/ReviewPicker;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    invoke-virtual {p1, p2}, Lkr/memorynotes/MainActivity;->beginReview(Ljava/util/ArrayList;)V

    return-void
.end method

.method synthetic lambda$2$kr-memorynotes-ReviewPicker()V
    .registers 1

    .line 11
    invoke-virtual {p0}, Lkr/memorynotes/ReviewPicker;->refresh()V

    return-void
.end method

.method synthetic lambda$3$kr-memorynotes-ReviewPicker()V
    .registers 1

    .line 11
    invoke-virtual {p0}, Lkr/memorynotes/ReviewPicker;->refresh()V

    return-void
.end method

.method refresh()V
    .registers 5

    .line 14
    invoke-virtual {p0}, Lkr/memorynotes/ReviewPicker;->selected()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lkr/memorynotes/ReviewPicker;->count:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\uc120\ud0dd\ud55c \uc870\uac74\uc758 \ub178\ud2b8 "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\uac1c"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lkr/memorynotes/ReviewPicker;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_41

    iget-object v1, p0, Lkr/memorynotes/ReviewPicker;->dialog:Landroid/app/AlertDialog;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    if-eqz v1, :cond_41

    iget-object v1, p0, Lkr/memorynotes/ReviewPicker;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    if-lez v0, :cond_3d

    const/4 v0, 0x1

    goto :goto_3e

    :cond_3d
    const/4 v0, 0x0

    :goto_3e
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_41
    return-void
.end method

.method selected()Ljava/util/ArrayList;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;"
        }
    .end annotation

    .line 13
    iget-object v0, p0, Lkr/memorynotes/ReviewPicker;->filters:Lkr/memorynotes/FilterControls;

    invoke-virtual {v0}, Lkr/memorynotes/FilterControls;->selection()Lkr/memorynotes/NoteFilter;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/ReviewPicker;->range:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_10

    goto :goto_11

    :cond_10
    const/4 v2, 0x0

    :goto_11
    iput-boolean v2, v0, Lkr/memorynotes/NoteFilter;->dueOnly:Z

    iget-object v1, p0, Lkr/memorynotes/ReviewPicker;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v2, ""

    invoke-virtual {v1, v2}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v2

    invoke-virtual {v2}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/NoteFilter;->select(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method
