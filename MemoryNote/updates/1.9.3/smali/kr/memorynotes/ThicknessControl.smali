.class public final Lkr/memorynotes/ThicknessControl;
.super Ljava/lang/Object;
.source "ThicknessControl.java"


# static fields
.field private static final KEY:Ljava/lang/String; = "ink_thickness"

.field private static final TAG:Ljava/lang/String; = "ink:thickness"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Lkr/memorynotes/InkPage;)V
    .locals 16

    .line 13
    move-object/from16 v0, p0

    iget-object v1, v0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v3, v1, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 14
    const-string v5, "ink:thickness"

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_0

    return-void

    .line 15
    :cond_0
    invoke-static {v3}, Lkr/memorynotes/ThicknessControl;->removeLegacy(Landroid/view/ViewGroup;)V

    .line 16
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v7

    const-string v8, "dark"

    invoke-interface {v7, v8, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    .line 17
    invoke-static {v7, v6}, Lkr/memorynotes/EditorPalette;->foreground(ZI)I

    move-result v8

    .line 18
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v10, 0x10

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/high16 v10, 0x40800000    # 4.0f

    invoke-virtual {v2, v10}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v11

    invoke-virtual {v2, v10}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v10

    invoke-virtual {v9, v11, v6, v10, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 19
    new-instance v10, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v10}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-static {v7, v6}, Lkr/memorynotes/EditorPalette;->background(ZI)I

    move-result v7

    invoke-virtual {v10, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v7, 0x41800000    # 16.0f

    invoke-virtual {v2, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v10, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 20
    const-string v7, "\uad75\uae30"

    const/16 v10, 0xc

    invoke-virtual {v2, v7, v10, v8}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v7

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x41f00000    # 30.0f

    invoke-virtual {v2, v11}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v11

    const/4 v12, -0x2

    invoke-direct {v10, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v7, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    new-instance v7, Landroid/widget/SeekBar;

    invoke-direct {v7, v1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v5}, Landroid/widget/SeekBar;->setTag(Ljava/lang/Object;)V

    const/16 v5, 0x3b

    invoke-virtual {v7, v5}, Landroid/widget/SeekBar;->setMax(I)V

    const-string v5, "\ud39c \uad75\uae30 \uc870\uc808"

    invoke-virtual {v7, v5}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    iget v5, v2, Lkr/memorynotes/Ui;->green:I

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v7, v5}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    iget v5, v2, Lkr/memorynotes/Ui;->green:I

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v7, v5}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    .line 22
    const-string v5, ""

    const/16 v10, 0xd

    invoke-virtual {v2, v5, v10, v8}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v5

    const/16 v10, 0x11

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v10, 0x0

    invoke-virtual {v5, v10, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 23
    const-string v10, "\u2212"

    invoke-static {v1, v10, v8}, Lkr/memorynotes/ThicknessControl;->button(Lkr/memorynotes/MainActivity;Ljava/lang/String;I)Landroid/widget/Button;

    move-result-object v10

    const-string v11, "\uff0b"

    invoke-static {v1, v11, v8}, Lkr/memorynotes/ThicknessControl;->button(Lkr/memorynotes/MainActivity;Ljava/lang/String;I)Landroid/widget/Button;

    move-result-object v8

    const-string v11, "\ud39c \uad75\uae30 \uc904\uc774\uae30"

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    const-string v11, "\ud39c \uad75\uae30 \ub298\ub9ac\uae30"

    invoke-virtual {v8, v11}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 24
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x42000000    # 32.0f

    invoke-virtual {v2, v13}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v14

    const/high16 v15, 0x42300000    # 44.0f

    invoke-virtual {v2, v15}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-direct {v11, v14, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v2, v15}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v11

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-direct {v4, v6, v11, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v9, v7, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v2, v13}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v11

    invoke-direct {v4, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v2, v13}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v11

    invoke-virtual {v2, v15}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    invoke-direct {v4, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v8, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    new-instance v4, Lkr/memorynotes/ThicknessControl$1;

    invoke-direct {v4, v0, v5, v1}, Lkr/memorynotes/ThicknessControl$1;-><init>(Lkr/memorynotes/InkPage;Landroid/widget/TextView;Lkr/memorynotes/MainActivity;)V

    invoke-virtual {v7, v4}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 26
    invoke-virtual {v1, v6}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v4, "ink_thickness"

    iget v11, v0, Lkr/memorynotes/InkPage;->thickness:F

    invoke-interface {v1, v4, v11}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v1

    invoke-static {v1}, Lkr/memorynotes/WidthPolicy;->progress(F)I

    move-result v1

    invoke-virtual {v7, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-static {v1}, Lkr/memorynotes/WidthPolicy;->width(I)F

    move-result v4

    iput v4, v0, Lkr/memorynotes/InkPage;->thickness:F

    invoke-static {v1}, Lkr/memorynotes/WidthPolicy;->label(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    new-instance v0, Lkr/memorynotes/ThicknessControl$2;

    invoke-direct {v0, v7}, Lkr/memorynotes/ThicknessControl$2;-><init>(Landroid/widget/SeekBar;)V

    invoke-virtual {v10, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lkr/memorynotes/ThicknessControl$3;

    invoke-direct {v0, v7}, Lkr/memorynotes/ThicknessControl$3;-><init>(Landroid/widget/SeekBar;)V

    invoke-virtual {v8, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 28
    invoke-static {v3}, Lkr/memorynotes/ThicknessControl;->findColor(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/widget/LinearLayout;

    .line 29
    :cond_1
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x43700000    # 240.0f

    invoke-virtual {v2, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {v2, v15}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    invoke-direct {v1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-virtual {v2, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    invoke-virtual {v2, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    invoke-virtual {v1, v5, v6, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    if-nez v0, :cond_2

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    goto :goto_0

    :cond_2
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v0

    const/4 v2, 0x1

    add-int/2addr v0, v2

    :goto_0
    invoke-virtual {v3, v9, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 30
    return-void
.end method

.method private static button(Lkr/memorynotes/MainActivity;Ljava/lang/String;I)Landroid/widget/Button;
    .locals 1

    .line 32
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 p0, 0x41a00000    # 20.0f

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTextColor(I)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setAllCaps(Z)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setBackgroundColor(I)V

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, p0, p0, p0, p0}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setFocusable(Z)V

    return-object v0
.end method

.method private static findColor(Landroid/view/View;)Landroid/view/View;
    .locals 2

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_0
    const-string v1, "\ubcf4\ub77c"

    invoke-virtual {v1, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p0

    :cond_1
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_3

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lkr/memorynotes/ThicknessControl;->findColor(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    return-object v1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method private static removeLegacy(Landroid/view/ViewGroup;)V
    .locals 4

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 35
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v2

    if-nez v2, :cond_2

    const-string v2, ""

    goto :goto_2

    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_2
    const-string v3, "\ud39c \uad75\uae30\uc640 \ucd94\uac00 \uc0c9\uc0c1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "\ud544\uae30 \ucd94\uac00 \uc124\uc815"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_3

    :cond_3
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {v1}, Lkr/memorynotes/ThicknessControl;->removeLegacy(Landroid/view/ViewGroup;)V

    goto :goto_1

    :cond_4
    :goto_3
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_1

    .line 36
    :cond_5
    return-void
.end method

.method public static show(Lkr/memorynotes/InkPage;)V
    .locals 1

    .line 37
    iget-object p0, p0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    iget-object p0, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const-string v0, "ink:thickness"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    :cond_0
    return-void
.end method
