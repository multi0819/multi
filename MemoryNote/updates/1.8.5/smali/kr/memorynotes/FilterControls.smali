.class final Lkr/memorynotes/FilterControls;
.super Ljava/lang/Object;
.source "FilterControls.java"


# instance fields
.field final a:Lkr/memorynotes/MainActivity;

.field changed:Ljava/lang/Runnable;

.field final chapter:Landroid/widget/Spinner;

.field chapters:Lkr/memorynotes/ChapterChoices;

.field final favorite:Landroid/widget/CheckBox;

.field final status:Landroid/widget/Spinner;

.field final subjectIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final subjects:Landroid/widget/Spinner;

.field final type:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Z)V
    .registers 12

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/FilterControls;->subjectIds:Ljava/util/ArrayList;

    new-instance v0, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda0;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/FilterControls;->changed:Ljava/lang/Runnable;

    .line 8
    iput-object p1, p0, Lkr/memorynotes/FilterControls;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, p1, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, "subjects"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/NoteDb;->groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/FilterControls;->subjectIds:Ljava/util/ArrayList;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lkr/memorynotes/FilterControls;->subjectIds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "\ubaa8\ub4e0 \uacfc\ubaa9"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 9
    iget-object v0, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v2, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v2}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v2

    iget-object v3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v3

    iget-object v4, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4, v0, v2}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v4, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4, v0, v3}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 10
    iget-object v0, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iget-object v5, p0, Lkr/memorynotes/FilterControls;->subjectIds:Ljava/util/ArrayList;

    invoke-virtual {v5, p3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p3

    const-string v5, "\uacfc\ubaa9"

    invoke-virtual {v0, v2, v5, v1, p3}, Lkr/memorynotes/Ui;->spinner(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object p3

    iput-object p3, p0, Lkr/memorynotes/FilterControls;->subjects:Landroid/widget/Spinner;

    iget-object p3, p0, Lkr/memorynotes/FilterControls;->subjects:Landroid/widget/Spinner;

    const-string v0, "filter.subject"

    invoke-virtual {p3, v0}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    .line 11
    iget-object p3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v0, "\ubaa8\ub4e0 \ub2e8\uc6d0"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const-string v1, "\ub2e8\uc6d0"

    invoke-virtual {p3, v3, v1, v0, v4}, Lkr/memorynotes/Ui;->spinner(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object p3

    iput-object p3, p0, Lkr/memorynotes/FilterControls;->chapter:Landroid/widget/Spinner;

    iget-object p3, p0, Lkr/memorynotes/FilterControls;->chapter:Landroid/widget/Spinner;

    const-string v0, "filter.chapter"

    invoke-virtual {p3, v0}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    iget-object p3, p0, Lkr/memorynotes/FilterControls;->chapter:Landroid/widget/Spinner;

    invoke-virtual {p1}, Lkr/memorynotes/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x42400000    # 48.0f

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p3, v0}, Landroid/widget/Spinner;->setDropDownWidth(I)V

    invoke-direct {p0}, Lkr/memorynotes/FilterControls;->reloadChapters()V

    .line 12
    iget-object p3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p3}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object p3

    iget-object v0, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v1

    iget-object v2, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v2, p3, v0}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v2, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v2, p3, v1}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 13
    iget-object p3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v2, "\ubb38\ub2f5 \uce74\ub4dc"

    const-string v3, "\uc624\ub2f5\ub178\ud2b8"

    const-string v5, "\ubaa8\ub4e0 \uc720\ud615"

    const-string v6, "\uc77c\ubc18 \ub178\ud2b8"

    filled-new-array {v5, v6, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    if-eqz p4, :cond_df

    const/4 v3, 0x3

    goto :goto_e0

    :cond_df
    move v3, v4

    :goto_e0
    const-string v5, "\uc720\ud615"

    invoke-virtual {p3, v0, v5, v2, v3}, Lkr/memorynotes/Ui;->spinner(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object p3

    iput-object p3, p0, Lkr/memorynotes/FilterControls;->type:Landroid/widget/Spinner;

    iget-object p3, p0, Lkr/memorynotes/FilterControls;->type:Landroid/widget/Spinner;

    const-string v0, "filter.type"

    invoke-virtual {p3, v0}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    if-eqz p4, :cond_f6

    iget-object p3, p0, Lkr/memorynotes/FilterControls;->type:Landroid/widget/Spinner;

    invoke-virtual {p3, v4}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 14
    :cond_f6
    iget-object p3, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string p4, "\ud5f7\uac08\ub9bc"

    const-string v0, "\uc678\uc6e0\uc74c"

    const-string v2, "\uc804\uccb4"

    const-string v3, "\uc0c8 \ub178\ud2b8"

    const-string v5, "\ubaa8\ub984"

    filled-new-array {v2, v3, v5, p4, v0}, [Ljava/lang/String;

    move-result-object p4

    const-string v0, "\uc774\ud574\ub3c4"

    invoke-virtual {p3, v1, v0, p4, v4}, Lkr/memorynotes/Ui;->spinner(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object p3

    iput-object p3, p0, Lkr/memorynotes/FilterControls;->status:Landroid/widget/Spinner;

    iget-object p3, p0, Lkr/memorynotes/FilterControls;->status:Landroid/widget/Spinner;

    const-string p4, "filter.rating"

    invoke-virtual {p3, p4}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    .line 15
    new-instance p3, Landroid/widget/CheckBox;

    invoke-direct {p3, p1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Lkr/memorynotes/FilterControls;->favorite:Landroid/widget/CheckBox;

    iget-object p3, p0, Lkr/memorynotes/FilterControls;->favorite:Landroid/widget/CheckBox;

    const-string p4, "\uc990\uaca8\ucc3e\uae30\ub9cc"

    invoke-virtual {p3, p4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object p3, p0, Lkr/memorynotes/FilterControls;->favorite:Landroid/widget/CheckBox;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget p1, p1, Lkr/memorynotes/Ui;->ink:I

    invoke-virtual {p3, p1}, Landroid/widget/CheckBox;->setTextColor(I)V

    iget-object p1, p0, Lkr/memorynotes/FilterControls;->favorite:Landroid/widget/CheckBox;

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 16
    iget-object p1, p0, Lkr/memorynotes/FilterControls;->subjects:Landroid/widget/Spinner;

    new-instance p2, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0}, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda1;-><init>(Lkr/memorynotes/FilterControls;)V

    invoke-static {p2}, Lkr/memorynotes/MainActivity;->listener(Ljava/lang/Runnable;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object p1, p0, Lkr/memorynotes/FilterControls;->chapter:Landroid/widget/Spinner;

    new-instance p2, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0}, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda2;-><init>(Lkr/memorynotes/FilterControls;)V

    invoke-static {p2}, Lkr/memorynotes/MainActivity;->listener(Ljava/lang/Runnable;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object p1, p0, Lkr/memorynotes/FilterControls;->type:Landroid/widget/Spinner;

    new-instance p2, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda3;

    invoke-direct {p2, p0}, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda3;-><init>(Lkr/memorynotes/FilterControls;)V

    invoke-static {p2}, Lkr/memorynotes/MainActivity;->listener(Ljava/lang/Runnable;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object p1, p0, Lkr/memorynotes/FilterControls;->status:Landroid/widget/Spinner;

    new-instance p2, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda4;

    invoke-direct {p2, p0}, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda4;-><init>(Lkr/memorynotes/FilterControls;)V

    invoke-static {p2}, Lkr/memorynotes/MainActivity;->listener(Ljava/lang/Runnable;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object p1, p0, Lkr/memorynotes/FilterControls;->favorite:Landroid/widget/CheckBox;

    new-instance p2, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda5;

    invoke-direct {p2, p0}, Lkr/memorynotes/FilterControls$$ExternalSyntheticLambda5;-><init>(Lkr/memorynotes/FilterControls;)V

    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 17
    return-void
.end method

.method static synthetic lambda$0()V
    .registers 0

    .line 6
    return-void
.end method

.method private reloadChapters()V
    .registers 7

    .line 19
    iget-object v0, p0, Lkr/memorynotes/FilterControls;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, "subjects"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/NoteDb;->groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;

    move-result-object v0

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_40

    new-instance v2, Lkr/memorynotes/ChapterChoices;

    invoke-direct {p0}, Lkr/memorynotes/FilterControls;->subject()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v0, v1, v3}, Lkr/memorynotes/ChapterChoices;-><init>(Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)V

    iput-object v2, p0, Lkr/memorynotes/FilterControls;->chapters:Lkr/memorynotes/ChapterChoices;

    iget-object v0, p0, Lkr/memorynotes/FilterControls;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/FilterControls;->chapter:Landroid/widget/Spinner;

    iget-object v2, p0, Lkr/memorynotes/FilterControls;->chapters:Lkr/memorynotes/ChapterChoices;

    iget-object v2, v2, Lkr/memorynotes/ChapterChoices;->labels:Ljava/util/ArrayList;

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lkr/memorynotes/Ui;->setOptions(Landroid/widget/Spinner;[Ljava/lang/String;I)V

    return-void

    :cond_40
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lkr/memorynotes/FilterControls;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v5, "chapters"

    invoke-virtual {v4, v5, v3}, Lkr/memorynotes/NoteDb;->groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18
.end method

.method private subject()Ljava/lang/String;
    .registers 4

    .line 18
    iget-object v0, p0, Lkr/memorynotes/FilterControls;->subjectIds:Ljava/util/ArrayList;

    iget-object v1, p0, Lkr/memorynotes/FilterControls;->subjects:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method synthetic lambda$1$kr-memorynotes-FilterControls()V
    .registers 2

    .line 16
    invoke-direct {p0}, Lkr/memorynotes/FilterControls;->reloadChapters()V

    iget-object v0, p0, Lkr/memorynotes/FilterControls;->changed:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method synthetic lambda$2$kr-memorynotes-FilterControls()V
    .registers 2

    .line 16
    iget-object v0, p0, Lkr/memorynotes/FilterControls;->changed:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method synthetic lambda$3$kr-memorynotes-FilterControls()V
    .registers 2

    .line 16
    iget-object v0, p0, Lkr/memorynotes/FilterControls;->changed:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method synthetic lambda$4$kr-memorynotes-FilterControls()V
    .registers 2

    .line 16
    iget-object v0, p0, Lkr/memorynotes/FilterControls;->changed:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method synthetic lambda$5$kr-memorynotes-FilterControls(Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 16
    iget-object p1, p0, Lkr/memorynotes/FilterControls;->changed:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method selection()Lkr/memorynotes/NoteFilter;
    .registers 5

    .line 20
    new-instance v0, Lkr/memorynotes/NoteFilter;

    invoke-direct {v0}, Lkr/memorynotes/NoteFilter;-><init>()V

    invoke-direct {p0}, Lkr/memorynotes/FilterControls;->subject()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/NoteFilter;->subject:Ljava/lang/String;

    iget-object v1, p0, Lkr/memorynotes/FilterControls;->chapters:Lkr/memorynotes/ChapterChoices;

    iget-object v1, v1, Lkr/memorynotes/ChapterChoices;->ids:Ljava/util/ArrayList;

    iget-object v2, p0, Lkr/memorynotes/FilterControls;->chapter:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    iget-object v3, p0, Lkr/memorynotes/FilterControls;->chapters:Lkr/memorynotes/ChapterChoices;

    iget-object v3, v3, Lkr/memorynotes/ChapterChoices;->ids:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Lkr/memorynotes/NoteFilter;->chapter:Ljava/lang/String;

    iget-object v1, p0, Lkr/memorynotes/FilterControls;->type:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    if-lez v1, :cond_43

    iget-object v1, p0, Lkr/memorynotes/FilterControls;->type:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_45

    :cond_43
    const-string v1, ""

    :goto_45
    iput-object v1, v0, Lkr/memorynotes/NoteFilter;->type:Ljava/lang/String;

    iget-object v1, p0, Lkr/memorynotes/FilterControls;->status:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    if-lez v1, :cond_58

    iget-object v1, p0, Lkr/memorynotes/FilterControls;->status:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    goto :goto_59

    :cond_58
    const/4 v1, -0x2

    :goto_59
    iput v1, v0, Lkr/memorynotes/NoteFilter;->rating:I

    iget-object v1, p0, Lkr/memorynotes/FilterControls;->favorite:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    iput-boolean v1, v0, Lkr/memorynotes/NoteFilter;->favoriteOnly:Z

    return-object v0
.end method
