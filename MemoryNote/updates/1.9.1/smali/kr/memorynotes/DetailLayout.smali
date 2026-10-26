.class public final Lkr/memorynotes/DetailLayout;
.super Ljava/lang/Object;
.source "DetailLayout.java"


# instance fields
.field final a:Lkr/memorynotes/MainActivity;

.field final dark:Z

.field final u:Lkr/memorynotes/Ui;


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;)V
    .locals 2

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iput-object v0, p0, Lkr/memorynotes/DetailLayout;->u:Lkr/memorynotes/Ui;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v1, "dark"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lkr/memorynotes/DetailLayout;->dark:Z

    return-void
.end method

.method public static attach(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V
    .locals 1

    .line 10
    new-instance v0, Lkr/memorynotes/DetailLayout;

    invoke-direct {v0, p0}, Lkr/memorynotes/DetailLayout;-><init>(Lkr/memorynotes/MainActivity;)V

    invoke-virtual {v0, p1}, Lkr/memorynotes/DetailLayout;->build(Lkr/memorynotes/Note;)V

    return-void
.end method


# virtual methods
.method build(Lkr/memorynotes/Note;)V
    .locals 20

    .line 22
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v3, "\uc218\uc815"

    invoke-virtual {v0, v2, v3}, Lkr/memorynotes/DetailLayout;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iget-object v4, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v5, "\uc990\uaca8\ucc3e\uae30"

    invoke-virtual {v0, v4, v5}, Lkr/memorynotes/DetailLayout;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v10

    iget-object v4, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v5, "\uc77d\uc5b4\uc8fc\uae30"

    invoke-virtual {v0, v4, v5}, Lkr/memorynotes/DetailLayout;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v11

    iget-object v4, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v12, "\uc774 \ub178\ud2b8 \ubcf5\uc2b5"

    invoke-virtual {v0, v4, v12}, Lkr/memorynotes/DetailLayout;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v13

    iget-object v4, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v5, "\uc624\ub2f5\ub178\ud2b8\ub85c"

    invoke-virtual {v0, v4, v5}, Lkr/memorynotes/DetailLayout;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v14

    iget-object v4, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v5, "\ub178\ud2b8 \uc0ad\uc81c"

    invoke-virtual {v0, v4, v5}, Lkr/memorynotes/DetailLayout;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v15

    .line 23
    if-eqz v2, :cond_9

    if-nez v13, :cond_0

    goto/16 :goto_2

    .line 24
    :cond_0
    invoke-virtual {v2}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Landroid/view/ViewGroup;

    .line 25
    move-object v4, v2

    move-object v5, v10

    move-object v6, v11

    move-object v7, v13

    move-object v8, v14

    move-object/from16 v16, v14

    move-object v14, v9

    move-object v9, v15

    filled-new-array/range {v4 .. v9}, [Landroid/widget/Button;

    move-result-object v4

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    const/4 v7, 0x6

    if-ge v6, v7, :cond_1

    aget-object v7, v4, v6

    invoke-virtual {v0, v7}, Lkr/memorynotes/DetailLayout;->detach(Landroid/view/View;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 26
    :cond_1
    iget-object v4, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    if-eq v14, v4, :cond_2

    invoke-virtual {v14}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v0, v14}, Lkr/memorynotes/DetailLayout;->detach(Landroid/view/View;)V

    .line 27
    :cond_2
    iget-object v4, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    iget-object v6, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v6, v6, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 28
    const-string v8, "\ud39c"

    invoke-virtual {v0, v6, v8}, Lkr/memorynotes/DetailLayout;->description(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v8

    const-string v9, "\ud14d\uc2a4\ud2b8 \uc120\ud0dd \ubaa8\ub4dc"

    invoke-virtual {v0, v6, v9}, Lkr/memorynotes/DetailLayout;->description(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v9

    .line 29
    if-eqz v9, :cond_3

    invoke-virtual {v9}, Landroid/widget/Button;->performClick()Z

    :cond_3
    const/16 v14, 0x8

    invoke-virtual {v6, v14}, Landroid/view/View;->setVisibility(I)V

    .line 30
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/high16 v14, 0x41800000    # 16.0f

    invoke-virtual {v0, v14}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v7

    const/high16 v5, 0x40e00000    # 7.0f

    move-object/from16 v17, v15

    invoke-virtual {v0, v5}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v15

    invoke-virtual {v0, v14}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v14

    invoke-virtual {v0, v5}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v5

    invoke-virtual {v4, v7, v15, v14, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/DetailLayout;->row()Landroid/widget/LinearLayout;

    move-result-object v5

    .line 31
    new-instance v7, Lkr/memorynotes/DetailLayout$1;

    invoke-direct {v7, v0}, Lkr/memorynotes/DetailLayout$1;-><init>(Lkr/memorynotes/DetailLayout;)V

    const-string v14, "\u2039"

    const/4 v15, 0x0

    invoke-virtual {v0, v14, v15, v7}, Lkr/memorynotes/DetailLayout;->button(Ljava/lang/String;ILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v7

    const/high16 v14, 0x41d00000    # 26.0f

    invoke-virtual {v7, v14}, Landroid/widget/Button;->setTextSize(F)V

    const-string v14, "\ub4a4\ub85c \uac00\uae30"

    invoke-virtual {v7, v14}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v15, 0x42380000    # 46.0f

    move-object/from16 v18, v10

    invoke-virtual {v0, v15}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v10

    invoke-virtual {v0, v15}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v15

    invoke-direct {v14, v10, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/DetailLayout;->col()Landroid/widget/LinearLayout;

    move-result-object v7

    const/high16 v10, 0x41400000    # 12.0f

    invoke-virtual {v0, v10}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v10

    const/high16 v14, 0x40c00000    # 6.0f

    invoke-virtual {v0, v14}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v14

    const/4 v15, 0x0

    invoke-virtual {v7, v10, v15, v14, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const-string v10, "\ubb38\ub2f5 \uce74\ub4dc"

    iget-object v14, v1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    const-string v10, "\ubb38\ub2f5 \ub178\ud2b8"

    goto :goto_1

    :cond_4
    iget-object v10, v1, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    :goto_1
    iget-object v14, v0, Lkr/memorynotes/DetailLayout;->u:Lkr/memorynotes/Ui;

    iget-object v15, v0, Lkr/memorynotes/DetailLayout;->u:Lkr/memorynotes/Ui;

    iget v15, v15, Lkr/memorynotes/Ui;->ink:I

    move-object/from16 v19, v11

    const/16 v11, 0x12

    invoke-virtual {v14, v10, v11, v15}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v14, 0x1

    invoke-virtual {v10, v11, v14}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/4 v11, 0x2

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v7, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v10, v0, Lkr/memorynotes/DetailLayout;->u:Lkr/memorynotes/Ui;

    iget-object v14, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v14, v1}, Lkr/memorynotes/MainActivity;->meta(Lkr/memorynotes/Note;)Ljava/lang/String;

    move-result-object v1

    iget-object v14, v0, Lkr/memorynotes/DetailLayout;->u:Lkr/memorynotes/Ui;

    iget v14, v14, Lkr/memorynotes/Ui;->muted:I

    const/16 v15, 0xb

    invoke-virtual {v10, v1, v15, v14}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v11}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v14, -0x2

    const/4 v15, 0x0

    invoke-direct {v1, v15, v14, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    new-instance v1, Lkr/memorynotes/DetailLayout$2;

    invoke-direct {v1, v0, v6, v8, v9}, Lkr/memorynotes/DetailLayout$2;-><init>(Lkr/memorynotes/DetailLayout;Landroid/view/View;Landroid/widget/Button;Landroid/widget/Button;)V

    const-string v6, "\ud544\uae30 \u25be"

    invoke-virtual {v0, v6, v15, v1}, Lkr/memorynotes/DetailLayout;->button(Ljava/lang/String;ILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v14, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v7, 0x41000000    # 8.0f

    invoke-virtual {v0, v7}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v7

    invoke-virtual {v6, v15, v15, v7, v15}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v5, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2, v11}, Lkr/memorynotes/DetailLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42900000    # 72.0f

    invoke-virtual {v0, v3}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v3

    invoke-direct {v1, v3, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 35
    iget-object v1, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lkr/memorynotes/DetailLayout;->styleSections(Landroid/view/ViewGroup;)V

    .line 36
    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/DetailLayout;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v13, v12}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    invoke-virtual {v0, v13, v2}, Lkr/memorynotes/DetailLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    invoke-virtual {v0, v1, v13}, Lkr/memorynotes/DetailLayout;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    if-eqz v19, :cond_5

    const-string v2, "\u25b6 \uc77d\uc5b4\uc8fc\uae30"

    move-object/from16 v3, v19

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x4

    invoke-virtual {v0, v3, v2}, Lkr/memorynotes/DetailLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    invoke-virtual {v0, v1, v3}, Lkr/memorynotes/DetailLayout;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    :cond_5
    iget-object v2, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 37
    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/DetailLayout;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    const/4 v2, 0x3

    if-eqz v18, :cond_6

    move-object/from16 v3, v18

    invoke-virtual {v0, v3, v2}, Lkr/memorynotes/DetailLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    invoke-virtual {v0, v1, v3}, Lkr/memorynotes/DetailLayout;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    .line 38
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/DetailLayout;->col()Landroid/widget/LinearLayout;

    move-result-object v3

    new-instance v4, Lkr/memorynotes/DetailLayout$3;

    invoke-direct {v4, v0}, Lkr/memorynotes/DetailLayout$3;-><init>(Lkr/memorynotes/DetailLayout;)V

    const-string v5, "\ub354 \ubcf4\uae30 \u25be"

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6, v4}, Lkr/memorynotes/DetailLayout;->button(Ljava/lang/String;ILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v4

    new-instance v5, Lkr/memorynotes/DetailLayout$4;

    invoke-direct {v5, v0, v3, v4}, Lkr/memorynotes/DetailLayout$4;-><init>(Lkr/memorynotes/DetailLayout;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1, v4}, Lkr/memorynotes/DetailLayout;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v4, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 39
    const/4 v1, -0x1

    if-eqz v16, :cond_7

    move-object/from16 v4, v16

    invoke-virtual {v0, v4, v2}, Lkr/memorynotes/DetailLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v1, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7
    if-eqz v17, :cond_8

    const/4 v2, 0x5

    move-object/from16 v4, v17

    invoke-virtual {v0, v4, v2}, Lkr/memorynotes/DetailLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v1, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_8
    const/16 v1, 0x8

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v1, v0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 40
    return-void

    .line 23
    :cond_9
    :goto_2
    return-void
.end method

.method button(Ljava/lang/String;ILjava/lang/Runnable;)Landroid/widget/Button;
    .locals 1

    .line 19
    iget-object v0, p0, Lkr/memorynotes/DetailLayout;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0, p1, p3}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lkr/memorynotes/DetailLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    move-result-object p1

    return-object p1
.end method

.method children(Landroid/view/ViewGroup;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method col()Landroid/widget/LinearLayout;
    .locals 2

    .line 15
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-object v0
.end method

.method color(Landroid/widget/Button;I)Landroid/widget/Button;
    .locals 3

    .line 18
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setAllCaps(Z)V

    iget-object v1, p0, Lkr/memorynotes/DetailLayout;->u:Lkr/memorynotes/Ui;

    iget v1, v1, Lkr/memorynotes/Ui;->scale:F

    const/high16 v2, 0x41500000    # 13.0f

    mul-float/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    iget-boolean v1, p0, Lkr/memorynotes/DetailLayout;->dark:Z

    invoke-static {v1, p2}, Lkr/memorynotes/EditorPalette;->foreground(ZI)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setTextColor(I)V

    invoke-virtual {p1, v2}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iget-boolean v2, p0, Lkr/memorynotes/DetailLayout;->dark:Z

    invoke-static {v2, p2}, Lkr/memorynotes/EditorPalette;->background(ZI)I

    move-result p2

    invoke-virtual {v1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 p2, 0x41400000    # 12.0f

    invoke-virtual {p0, p2}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {v1, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setMinWidth(I)V

    const/high16 p2, 0x42380000    # 46.0f

    invoke-virtual {p0, p2}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setMinimumHeight(I)V

    invoke-virtual {p0, p2}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setMinHeight(I)V

    const/high16 p2, 0x41200000    # 10.0f

    invoke-virtual {p0, p2}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v0

    const/high16 v1, 0x41100000    # 9.0f

    invoke-virtual {p0, v1}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v2

    invoke-virtual {p0, p2}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result p2

    invoke-virtual {p0, v1}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v1

    invoke-virtual {p1, v0, v2, p2, v1}, Landroid/widget/Button;->setPadding(IIII)V

    return-object p1
.end method

.method description(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;
    .locals 1

    .line 17
    instance-of v0, p1, Landroid/widget/Button;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_0
    invoke-virtual {p2, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    check-cast p1, Landroid/widget/Button;

    return-object p1

    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1}, Lkr/memorynotes/DetailLayout;->children(Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {p0, v0, p2}, Lkr/memorynotes/DetailLayout;->description(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_2

    return-object v0

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method detach(Landroid/view/View;)V
    .locals 1

    .line 13
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method dp(F)I
    .locals 1

    .line 11
    iget-object v0, p0, Lkr/memorynotes/DetailLayout;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0, p1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p1

    return p1
.end method

.method find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;
    .locals 2

    .line 16
    instance-of v0, p1, Landroid/widget/Button;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1}, Lkr/memorynotes/DetailLayout;->children(Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {p0, v0, p2}, Lkr/memorynotes/DetailLayout;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_1

    return-object v0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method row()Landroid/widget/LinearLayout;
    .locals 2

    .line 14
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/DetailLayout;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    return-object v0
.end method

.method shape(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 48
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 p1, 0x41200000    # 10.0f

    invoke-virtual {p0, p1}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method styleSections(Landroid/view/ViewGroup;)V
    .locals 4

    .line 42
    invoke-virtual {p0, p1}, Lkr/memorynotes/DetailLayout;->children(Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    instance-of v1, v0, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_5

    check-cast v0, Landroid/widget/LinearLayout;

    .line 43
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_4

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/TextView;

    if-eqz v2, :cond_4

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "\uc815\ub2f5"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    goto :goto_1

    :cond_0
    const-string v3, "\ubb38\uc81c"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v2, 0x2

    goto :goto_1

    :cond_1
    const-string v3, "\uc8fc\uc758"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v2, 0x5

    goto :goto_1

    :cond_2
    const-string v3, "\ud2c0\ub9b0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v2, 0x3

    goto :goto_1

    :cond_3
    const/4 v2, -0x1

    .line 44
    :goto_1
    if-ltz v2, :cond_4

    iget-boolean v3, p0, Lkr/memorynotes/DetailLayout;->dark:Z

    invoke-static {v3, v2}, Lkr/memorynotes/EditorPalette;->foreground(ZI)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-boolean v3, p0, Lkr/memorynotes/DetailLayout;->dark:Z

    invoke-static {v3, v2}, Lkr/memorynotes/EditorPalette;->background(ZI)I

    move-result v2

    invoke-virtual {p0, v2}, Lkr/memorynotes/DetailLayout;->shape(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 45
    :cond_4
    invoke-virtual {p0, v0}, Lkr/memorynotes/DetailLayout;->styleSections(Landroid/view/ViewGroup;)V

    .line 42
    :cond_5
    goto :goto_0

    .line 47
    :cond_6
    return-void
.end method

.method weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .locals 5

    .line 20
    invoke-virtual {p0, p2}, Lkr/memorynotes/DetailLayout;->detach(Landroid/view/View;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v1, 0x40400000    # 3.0f

    invoke-virtual {p0, v1}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v2

    const/high16 v3, 0x40800000    # 4.0f

    invoke-virtual {p0, v3}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v4

    invoke-virtual {p0, v1}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v1

    invoke-virtual {p0, v3}, Lkr/memorynotes/DetailLayout;->dp(F)I

    move-result v3

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
