.class public final Lkr/memorynotes/ReviewLayout;
.super Ljava/lang/Object;
.source "ReviewLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkr/memorynotes/ReviewLayout$Symbol;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static accent(IZ)I
    .registers 11

    .line 5
    const/4 v0, 0x6

    new-array v1, v0, [I

    const v2, -0xb69b81

    const/4 v3, 0x0

    aput v2, v1, v3

    const v2, -0xe9919a    # -1.9995742E38f

    const/4 v4, 0x1

    aput v2, v1, v4

    const v2, -0x63c0c8

    const/4 v5, 0x2

    aput v2, v1, v5

    const v2, -0x7fa900

    const/4 v6, 0x3

    aput v2, v1, v6

    const v2, -0xdb8cb7

    const/4 v7, 0x4

    aput v2, v1, v7

    const v2, -0xa69d90

    const/4 v8, 0x5

    aput v2, v1, v8

    new-array v0, v0, [I

    const v2, -0x573b1e

    aput v2, v0, v3

    const v2, -0x6e2937

    aput v2, v0, v4

    const/16 v2, -0x555d

    aput v2, v0, v5

    const v2, -0xd3080

    aput v2, v0, v6

    const v2, -0x62244a

    aput v2, v0, v7

    const v2, -0x423a30

    aput v2, v0, v8

    if-eqz p1, :cond_49

    move-object v1, v0

    :cond_49
    aget p0, v1, p0

    return p0
.end method

.method public static apply(Lkr/memorynotes/MainActivity;)V
    .registers 22

    .line 19
    move-object/from16 v6, p0

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "dark"

    invoke-interface {v0, v1, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 20
    const/4 v0, 0x0

    move-object v10, v0

    move-object v11, v10

    move-object v12, v11

    move-object v13, v12

    move v0, v7

    :goto_18
    iget-object v1, v6, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const-string v14, "\ub2e4\uc2dc \uac00\ub9ac\uae30"

    if-lt v0, v1, :cond_155

    .line 21
    iget-object v0, v6, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-static {v0}, Lkr/memorynotes/ReviewLayout;->back(Landroid/view/View;)Landroid/widget/Button;

    move-result-object v15

    .line 22
    const/4 v5, 0x0

    const-string v0, "\uc218\uc815"

    const/4 v3, -0x1

    if-eqz v15, :cond_8f

    if-eqz v13, :cond_8f

    invoke-virtual {v15}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_8f

    invoke-virtual {v15}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, v15}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v7

    invoke-static/range {p0 .. p0}, Lkr/memorynotes/ReviewLayout;->row(Lkr/memorynotes/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v4

    const-string v2, "\ub4a4\ub85c"

    invoke-virtual {v15, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v13, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v17, "back"

    const/16 v18, 0x0

    const/4 v2, 0x5

    move-object/from16 v0, p0

    move-object/from16 v19, v1

    move-object v1, v15

    move-object/from16 v3, v17

    move-object/from16 v20, v4

    move/from16 v4, v18

    move-object/from16 v16, v9

    move v9, v5

    move v5, v8

    invoke-static/range {v0 .. v5}, Lkr/memorynotes/ReviewLayout;->style(Lkr/memorynotes/MainActivity;Landroid/widget/Button;ILjava/lang/String;ZZ)V

    const-string v3, "edit"

    const/4 v4, 0x0

    const/4 v2, 0x0

    move-object v1, v13

    invoke-static/range {v0 .. v5}, Lkr/memorynotes/ReviewLayout;->style(Lkr/memorynotes/MainActivity;Landroid/widget/Button;ILjava/lang/String;ZZ)V

    move-object/from16 v0, v20

    const/4 v1, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v6, v0, v15, v5, v1}, Lkr/memorynotes/ReviewLayout;->put(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Landroid/widget/Button;FI)V

    iget-object v1, v6, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x42b40000    # 90.0f

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    invoke-static {v6, v0, v13, v9, v1}, Lkr/memorynotes/ReviewLayout;->put(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Landroid/widget/Button;FI)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v15, -0x2

    invoke-direct {v1, v4, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object/from16 v2, v19

    invoke-virtual {v2, v0, v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    move v13, v4

    move v7, v5

    goto :goto_ac

    :cond_8f
    move v4, v3

    move-object/from16 v16, v9

    const/4 v15, -0x2

    move v9, v5

    const/high16 v5, 0x3f800000    # 1.0f

    .line 23
    if-eqz v13, :cond_aa

    invoke-virtual {v13, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v3, "edit"

    const/4 v7, 0x0

    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object v1, v13

    move v13, v4

    move v4, v7

    move v7, v5

    move v5, v8

    invoke-static/range {v0 .. v5}, Lkr/memorynotes/ReviewLayout;->style(Lkr/memorynotes/MainActivity;Landroid/widget/Button;ILjava/lang/String;ZZ)V

    goto :goto_ac

    :cond_aa
    move v13, v4

    move v7, v5

    .line 24
    :goto_ac
    if-eqz v11, :cond_b1

    invoke-static {v11}, Lkr/memorynotes/ReviewLayout;->detach(Landroid/view/View;)V

    .line 25
    :cond_b1
    if-nez v10, :cond_b5

    if-eqz v12, :cond_103

    :cond_b5
    invoke-static/range {p0 .. p0}, Lkr/memorynotes/ReviewLayout;->row(Lkr/memorynotes/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v11

    if-eqz v10, :cond_dc

    invoke-virtual {v10}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_cc

    const-string v0, "hide"

    goto :goto_ce

    :cond_cc
    const-string v0, "eye"

    :goto_ce
    move-object v3, v0

    const/4 v4, 0x0

    const/4 v2, 0x1

    move-object/from16 v0, p0

    move-object v1, v10

    move v5, v8

    invoke-static/range {v0 .. v5}, Lkr/memorynotes/ReviewLayout;->style(Lkr/memorynotes/MainActivity;Landroid/widget/Button;ILjava/lang/String;ZZ)V

    const/4 v0, 0x0

    invoke-static {v6, v11, v10, v7, v0}, Lkr/memorynotes/ReviewLayout;->put(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Landroid/widget/Button;FI)V

    :cond_dc
    if-eqz v12, :cond_f9

    const-string v0, "\uac74\ub108\ub6f0\uae30"

    invoke-virtual {v12, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v3, "skip"

    const/4 v4, 0x0

    const/4 v2, 0x5

    move-object/from16 v0, p0

    move-object v1, v12

    move v5, v8

    invoke-static/range {v0 .. v5}, Lkr/memorynotes/ReviewLayout;->style(Lkr/memorynotes/MainActivity;Landroid/widget/Button;ILjava/lang/String;ZZ)V

    iget-object v0, v6, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v1, 0x42e00000    # 112.0f

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-static {v6, v11, v12, v9, v0}, Lkr/memorynotes/ReviewLayout;->put(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Landroid/widget/Button;FI)V

    :cond_f9
    iget-object v0, v6, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v13, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    :cond_103
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_154

    invoke-static/range {p0 .. p0}, Lkr/memorynotes/ReviewLayout;->row(Lkr/memorynotes/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v9

    const/4 v10, 0x0

    :goto_10e
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v10, v0, :cond_11f

    iget-object v0, v6, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v13, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v9, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_154

    :cond_11f
    move-object/from16 v11, v16

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Landroid/widget/Button;

    invoke-virtual {v12}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkr/memorynotes/ReviewLayout;->ratingText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    add-int/lit8 v2, v10, 0x2

    const-string v0, "unsure"

    const-string v1, "check"

    const-string v3, "retry"

    filled-new-array {v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    aget-object v3, v0, v10

    const/4 v4, 0x1

    move-object/from16 v0, p0

    move-object v1, v12

    move v5, v8

    invoke-static/range {v0 .. v5}, Lkr/memorynotes/ReviewLayout;->style(Lkr/memorynotes/MainActivity;Landroid/widget/Button;ILjava/lang/String;ZZ)V

    const/4 v1, 0x0

    invoke-static {v6, v9, v12, v7, v1}, Lkr/memorynotes/ReviewLayout;->put(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Landroid/widget/Button;FI)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_10e

    .line 27
    :cond_154
    :goto_154
    return-void

    .line 20
    :cond_155
    move v1, v7

    move-object v2, v9

    iget-object v3, v6, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v4, v3, Landroid/widget/Button;

    if-eqz v4, :cond_1b4

    check-cast v3, Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "\ub178\ud2b8 \uc218\uc815"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_175

    move-object v13, v3

    goto :goto_1cb

    :cond_175
    const-string v5, "\uc774\ubc88\uc5d0\ub294 \uac74\ub108\ub6f0\uae30"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17f

    move-object v12, v3

    goto :goto_1cb

    :cond_17f
    const-string v5, "\ubaa8\ub984 \u00b7"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1b0

    const-string v5, "\ud5f7\uac08\ub9bc \u00b7"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1b0

    const-string v5, "\uc678\uc6e0\uc74c \u00b7"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_198

    goto :goto_1b0

    :cond_198
    const-string v5, "\uc815\ub2f5 \ud655\uc778"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1ae

    const-string v5, "\uac00\ub9b0 \ubb38\uad6c \ud655\uc778"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1ae

    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1cb

    :cond_1ae
    move-object v10, v3

    goto :goto_1cb

    :cond_1b0
    :goto_1b0
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1cb

    :cond_1b4
    instance-of v4, v3, Landroid/widget/TextView;

    if-eqz v4, :cond_1cb

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "\uc5bc\ub9c8\ub098 \uae30\uc5b5\ud588\ub098\uc694?"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1cb

    move-object v11, v3

    :cond_1cb
    :goto_1cb
    add-int/lit8 v0, v0, 0x1

    move v7, v1

    move-object v9, v2

    goto/16 :goto_18
.end method

.method static back(Landroid/view/View;)Landroid/widget/Button;
    .registers 4

    .line 8
    instance-of v0, p0, Landroid/widget/Button;

    if-eqz v0, :cond_18

    move-object v0, p0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\ub3cc\uc544\uac00\uae30"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_18

    return-object v0

    :cond_18
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_34

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_1f
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_26

    goto :goto_34

    :cond_26
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lkr/memorynotes/ReviewLayout;->back(Landroid/view/View;)Landroid/widget/Button;

    move-result-object v1

    if-eqz v1, :cond_31

    return-object v1

    :cond_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    :cond_34
    :goto_34
    const/4 p0, 0x0

    return-object p0
.end method

.method static blend(II)I
    .registers 5

    .line 6
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x9

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    add-int/2addr v0, v1

    div-int/lit8 v0, v0, 0xa

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    mul-int/lit8 v1, v1, 0x9

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    add-int/2addr v1, v2

    div-int/lit8 v1, v1, 0xa

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    mul-int/lit8 p0, p0, 0x9

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    add-int/2addr p0, p1

    div-int/lit8 p0, p0, 0xa

    invoke-static {v0, v1, p0}, Landroid/graphics/Color;->rgb(III)I

    move-result p0

    return p0
.end method

.method static detach(Landroid/view/View;)V
    .registers 2

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_11
    return-void
.end method

.method static put(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Landroid/widget/Button;FI)V
    .registers 9

    .line 17
    invoke-static {p2}, Lkr/memorynotes/ReviewLayout;->detach(Landroid/view/View;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, p4, v1, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iget-object p3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 p4, 0x40400000    # 3.0f

    invoke-virtual {p3, p4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p3

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x40800000    # 4.0f

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3, p4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p4

    iget-object p0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p0, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p0

    invoke-virtual {v0, p3, v1, p4, p0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static ratingText(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 7
    const-string v0, " \u00b7 \ub0b4\uc77c \ub2e4\uc2dc"

    const-string v1, "\n\ub0b4\uc77c"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, " \u00b7 3\uc77c \ub4a4"

    const-string v1, "\n3\uc77c \ub4a4"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, " \u00b7 "

    const-string v1, "\n"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static row(Lkr/memorynotes/MainActivity;)Landroid/widget/LinearLayout;
    .registers 2

    .line 16
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 p0, 0x10

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setGravity(I)V

    return-object v0
.end method

.method static style(Lkr/memorynotes/MainActivity;Landroid/widget/Button;ILjava/lang/String;ZZ)V
    .registers 12

    .line 11
    invoke-static {p2, p5}, Lkr/memorynotes/ReviewLayout;->accent(IZ)I

    move-result p2

    iget-object p5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget p5, p5, Lkr/memorynotes/Ui;->bg:I

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    if-eqz p4, :cond_19

    const/16 v2, 0xe

    goto :goto_1b

    :cond_19
    const/16 v2, 0xf

    :goto_1b
    int-to-float v2, v2

    invoke-virtual {p1, v2}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setTextColor(I)V

    const/16 v2, 0x11

    invoke-virtual {p1, v2}, Landroid/widget/Button;->setGravity(I)V

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/16 v2, 0x5c

    const/16 v3, 0x30

    if-eqz p4, :cond_37

    move v4, v2

    goto :goto_38

    :cond_37
    move v4, v3

    :goto_38
    int-to-float v4, v4

    invoke-virtual {v1, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setMinHeight(I)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    if-eqz p4, :cond_45

    goto :goto_46

    :cond_45
    move v2, v3

    :goto_46
    int-to-float v2, v2

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setMinimumHeight(I)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    iget-object v4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    invoke-virtual {p1, v1, v3, v4, v2}, Landroid/widget/Button;->setPadding(IIII)V

    if-eqz p4, :cond_6f

    const/4 v1, 0x3

    goto :goto_70

    :cond_6f
    const/4 v1, 0x2

    :goto_70
    invoke-virtual {p1, v1}, Landroid/widget/Button;->setMaxLines(I)V

    .line 12
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-static {p5, p2}, Lkr/memorynotes/ReviewLayout;->blend(II)I

    move-result p5

    invoke-virtual {v1, p5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget-object p5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x41600000    # 14.0f

    invoke-virtual {p5, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p5

    int-to-float p5, p5

    invoke-virtual {v1, p5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/4 p5, 0x1

    invoke-static {p5, v0}, Ljava/lang/Math;->max(II)I

    move-result p5

    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    const/16 v4, 0x55

    invoke-static {v4, v0, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    invoke-virtual {v1, p5, v0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 13
    new-instance p5, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    const/16 v4, 0x37

    invoke-static {v4, v0, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    const/4 v2, 0x0

    invoke-direct {p5, v0, v1, v2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, p5}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 14
    new-instance p5, Lkr/memorynotes/ReviewLayout$Symbol;

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v1, 0x41b00000    # 22.0f

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-direct {p5, p3, p2, v0}, Lkr/memorynotes/ReviewLayout$Symbol;-><init>(Ljava/lang/String;II)V

    iget-object p0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 p2, 0x40a00000    # 5.0f

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    if-eqz p4, :cond_e2

    invoke-virtual {p1, v2, p5, v2, v2}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_e5

    :cond_e2
    invoke-virtual {p1, p5, v2, v2, v2}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :goto_e5
    invoke-virtual {p1}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 p2, 0xa

    const/16 p3, 0x20

    invoke-virtual {p0, p2, p3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 15
    return-void
.end method
