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
    .locals 14

    .line 13
    iget-object v0, p0, Lkr/memorynotes/InkPage;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, v0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 14
    const-string v4, "ink:thickness"

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_0

    return-void

    .line 15
    :cond_0
    invoke-static {v2}, Lkr/memorynotes/ThicknessControl;->removeLegacy(Landroid/view/ViewGroup;)V

    .line 16
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v7, "dark"

    invoke-interface {v6, v7, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    .line 17
    invoke-static {v6, v5}, Lkr/memorynotes/EditorPalette;->foreground(ZI)I

    move-result v7

    .line 18
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v9, 0x10

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/high16 v9, 0x41200000    # 10.0f

    invoke-virtual {v1, v9}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v10

    const/high16 v11, 0x40000000    # 2.0f

    invoke-virtual {v1, v11}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    invoke-virtual {v1, v9}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v9

    invoke-virtual {v1, v11}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v11

    invoke-virtual {v8, v10, v12, v9, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 19
    new-instance v9, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v9}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-static {v6, v5}, Lkr/memorynotes/EditorPalette;->background(ZI)I

    move-result v6

    invoke-virtual {v9, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v6, 0x41800000    # 16.0f

    invoke-virtual {v1, v6}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v9, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 20
    const-string v6, "\uad75\uae30"

    const/16 v9, 0xc

    invoke-virtual {v1, v6, v9, v7}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v6

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x42180000    # 38.0f

    invoke-virtual {v1, v10}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v10

    const/4 v11, -0x2

    invoke-direct {v9, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    new-instance v6, Landroid/widget/SeekBar;

    invoke-direct {v6, v0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v4}, Landroid/widget/SeekBar;->setTag(Ljava/lang/Object;)V

    const/16 v4, 0x3b

    invoke-virtual {v6, v4}, Landroid/widget/SeekBar;->setMax(I)V

    const-string v4, "\ud39c \uad75\uae30 \uc870\uc808"

    invoke-virtual {v6, v4}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    iget v4, v1, Lkr/memorynotes/Ui;->green:I

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v6, v4}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    iget v4, v1, Lkr/memorynotes/Ui;->green:I

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v6, v4}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    .line 22
    const-string v4, ""

    const/16 v9, 0xd

    invoke-virtual {v1, v4, v9, v7}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v4

    const/16 v9, 0x11

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v9, 0x0

    invoke-virtual {v4, v9, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 23
    const-string v3, "\u2212"

    invoke-static {v0, v3, v7}, Lkr/memorynotes/ThicknessControl;->button(Lkr/memorynotes/MainActivity;Ljava/lang/String;I)Landroid/widget/Button;

    move-result-object v3

    const-string v9, "\uff0b"

    invoke-static {v0, v9, v7}, Lkr/memorynotes/ThicknessControl;->button(Lkr/memorynotes/MainActivity;Ljava/lang/String;I)Landroid/widget/Button;

    move-result-object v7

    const-string v9, "\ud39c \uad75\uae30 \uc904\uc774\uae30"

    invoke-virtual {v3, v9}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    const-string v9, "\ud39c \uad75\uae30 \ub298\ub9ac\uae30"

    invoke-virtual {v7, v9}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 24
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x42300000    # 44.0f

    invoke-virtual {v1, v10}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    invoke-virtual {v1, v10}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v13

    invoke-direct {v9, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v3, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v1, v10}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v9, v5, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x42200000    # 40.0f

    invoke-virtual {v1, v12}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    invoke-direct {v9, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v4, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v1, v10}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    invoke-virtual {v1, v10}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v10

    invoke-direct {v9, v12, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    new-instance v9, Lkr/memorynotes/ThicknessControl$1;

    invoke-direct {v9, p0, v4, v0}, Lkr/memorynotes/ThicknessControl$1;-><init>(Lkr/memorynotes/InkPage;Landroid/widget/TextView;Lkr/memorynotes/MainActivity;)V

    invoke-virtual {v6, v9}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 26
    invoke-virtual {v0, v5}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v9, "ink_thickness"

    iget v10, p0, Lkr/memorynotes/InkPage;->thickness:F

    invoke-interface {v0, v9, v10}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v0

    invoke-static {v0}, Lkr/memorynotes/WidthPolicy;->progress(F)I

    move-result v0

    invoke-virtual {v6, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-static {v0}, Lkr/memorynotes/WidthPolicy;->width(I)F

    move-result v9

    iput v9, p0, Lkr/memorynotes/InkPage;->thickness:F

    invoke-static {v0}, Lkr/memorynotes/WidthPolicy;->label(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    new-instance p0, Lkr/memorynotes/ThicknessControl$2;

    invoke-direct {p0, v6}, Lkr/memorynotes/ThicknessControl$2;-><init>(Landroid/widget/SeekBar;)V

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p0, Lkr/memorynotes/ThicknessControl$3;

    invoke-direct {p0, v6}, Lkr/memorynotes/ThicknessControl$3;-><init>(Landroid/widget/SeekBar;)V

    invoke-virtual {v7, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 28
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p0, v0, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v0, 0x40800000    # 4.0f

    invoke-virtual {v1, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-virtual {p0, v5, v0, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v2, v8, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    return-void
.end method

.method private static button(Lkr/memorynotes/MainActivity;Ljava/lang/String;I)Landroid/widget/Button;
    .locals 1

    .line 30
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

.method private static removeLegacy(Landroid/view/ViewGroup;)V
    .locals 4

    .line 32
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

    .line 33
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

    .line 34
    :cond_5
    return-void
.end method

.method public static show(Lkr/memorynotes/InkPage;)V
    .locals 1

    .line 35
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
