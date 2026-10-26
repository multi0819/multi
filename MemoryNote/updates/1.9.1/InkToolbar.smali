.class public final Lkr/memorynotes/InkToolbar;
.super Ljava/lang/Object;
.source "InkToolbar.java"


# static fields
.field static final colors:[I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 4
    const v0, -0x684b01

    const v1, -0x4c7c19

    const v2, -0x5a8a1

    const v3, -0x6e303e

    const v4, -0xdda58b

    filled-new-array {v2, v3, v4, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lkr/memorynotes/InkToolbar;->colors:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 16

    .line 6
    move-object/from16 v0, p0

    iget-object v1, v0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    new-instance v8, Lkr/memorynotes/InkPage;

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    invoke-direct {v8, v0, v5, v6, v7}, Lkr/memorynotes/InkPage;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v1, v5}, Lkr/memorynotes/InkPage;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v8, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 7
    iget-object v1, v0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v2

    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {v1, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    const/high16 v5, 0x40c00000    # 6.0f

    invoke-virtual {v1, v5}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v9

    invoke-virtual {v1, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {v1, v5}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    invoke-virtual {v2, v4, v9, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/16 v3, 0xb

    iget v4, v1, Lkr/memorynotes/Ui;->muted:I

    const-string v5, "S\ud39c\uc73c\ub85c \ud544\uae30 \u00b7 \uc190\uac00\ub77d\uc73c\ub85c \uc2a4\ud06c\ub864"

    invoke-virtual {v1, v5, v3, v4}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v11

    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/HorizontalScrollView;

    invoke-direct {v3, v0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    invoke-virtual {v1}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v5

    const/high16 v9, 0x40a00000    # 5.0f

    invoke-virtual {v1, v9}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v10

    invoke-virtual {v1, v9}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    invoke-virtual {v1, v9}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v13

    invoke-virtual {v1, v9}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v9

    invoke-virtual {v5, v10, v12, v13, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget v9, v1, Lkr/memorynotes/Ui;->surface:I

    const/16 v10, 0x12

    invoke-static {v1, v9, v10}, Lkr/memorynotes/Dashboard;->panel(Lkr/memorynotes/Ui;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v5}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v3, v0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v6, 0x1

    invoke-virtual {v3, v2, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 8
    new-array v2, v6, [Ljava/lang/Runnable;

    new-instance v3, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda1;

    invoke-direct {v3, v8, v2}, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda1;-><init>(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V

    const-string v6, "pen"

    const-string v7, "\ud39c"

    invoke-static {v1, v6, v7, v3}, Lkr/memorynotes/InkToolbar;->tool(Lkr/memorynotes/Ui;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v6

    new-instance v3, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda2;

    invoke-direct {v3, v8, v2}, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda2;-><init>(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V

    const-string v7, "erase"

    const-string v9, "\uc9c0\uc6b0\uac1c"

    invoke-static {v1, v7, v9, v3}, Lkr/memorynotes/InkToolbar;->tool(Lkr/memorynotes/Ui;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v9

    new-instance v3, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda3;

    invoke-direct {v3, v8, v2}, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda3;-><init>(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V

    const-string v7, "book"

    const-string v10, "\ud14d\uc2a4\ud2b8 \uc120\ud0dd \ubaa8\ub4dc"

    invoke-static {v1, v7, v10, v3}, Lkr/memorynotes/InkToolbar;->tool(Lkr/memorynotes/Ui;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v10

    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v5, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 9
    new-instance v3, Landroid/view/View;

    invoke-direct {v3, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iget v7, v1, Lkr/memorynotes/Ui;->line:I

    invoke-virtual {v3, v7}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-virtual {v1, v12}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    const/high16 v13, 0x41c80000    # 25.0f

    invoke-virtual {v1, v13}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v13

    invoke-direct {v7, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v12, 0x41000000    # 8.0f

    invoke-virtual {v1, v12}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v13

    invoke-virtual {v1, v12}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    invoke-virtual {v7, v13, v4, v12, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v5, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    sget-object v3, Lkr/memorynotes/InkToolbar;->colors:[I

    array-length v3, v3

    new-array v12, v3, [Landroid/widget/Button;

    move v3, v4

    :goto_0
    sget-object v7, Lkr/memorynotes/InkToolbar;->colors:[I

    array-length v7, v7

    const/high16 v13, 0x42300000    # 44.0f

    if-lt v3, v7, :cond_0

    .line 11
    new-instance v3, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda5;

    invoke-direct {v3, v8}, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda5;-><init>(Lkr/memorynotes/InkPage;)V

    const-string v7, "\u2501"

    invoke-virtual {v1, v7, v3}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    const-string v7, "\ud39c \uad75\uae30\uc640 \ucd94\uac00 \uc0c9\uc0c1"

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x42580000    # 54.0f

    invoke-virtual {v1, v14}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v14

    invoke-virtual {v1, v13}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v15

    invoke-direct {v7, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda6;

    invoke-direct {v3, v8}, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda6;-><init>(Lkr/memorynotes/InkPage;)V

    const-string v7, "undo"

    const-string v14, "\uc2e4\ud589 \ucde8\uc18c"

    invoke-static {v1, v7, v14, v3}, Lkr/memorynotes/InkToolbar;->tool(Lkr/memorynotes/Ui;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda7;

    invoke-direct {v3, v0, v8, v1}, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda7;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/InkPage;Lkr/memorynotes/Ui;)V

    const-string v0, "\u22ef"

    invoke-virtual {v1, v0, v3}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    const-string v3, "\ud544\uae30 \ucd94\uac00 \uc124\uc815"

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v1, v13}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v7

    invoke-virtual {v1, v13}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v13

    invoke-direct {v3, v7, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 12
    new-instance v0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda8;

    move-object v5, v0

    move-object v7, v1

    invoke-direct/range {v5 .. v12}, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda8;-><init>(Landroid/widget/Button;Lkr/memorynotes/Ui;Lkr/memorynotes/InkPage;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;[Landroid/widget/Button;)V

    aput-object v0, v2, v4

    aget-object v0, v2, v4

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 13
    return-void

    .line 10
    :cond_0
    sget-object v7, Lkr/memorynotes/InkToolbar;->colors:[I

    aget v7, v7, v3

    new-instance v14, Landroid/widget/Button;

    invoke-direct {v14, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v15, ""

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v14, v4}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v14, v4}, Landroid/widget/Button;->setMinimumWidth(I)V

    const-string v15, "\ud30c\ub791"

    const-string v4, "\ubcf4\ub77c"

    const-string v13, "\ube68\uac15"

    const-string v0, "\ubbfc\ud2b8"

    move-object/from16 p3, v6

    const-string v6, "\uccad\ub85d"

    filled-new-array {v13, v0, v6, v15, v4}, [Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v3

    invoke-virtual {v14, v0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42280000    # 42.0f

    invoke-virtual {v1, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    const/high16 v6, 0x42300000    # 44.0f

    invoke-virtual {v1, v6}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v6

    invoke-direct {v0, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v14, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda4;

    invoke-direct {v0, v8, v7, v2}, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda4;-><init>(Lkr/memorynotes/InkPage;I[Ljava/lang/Runnable;)V

    invoke-virtual {v14, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    aput-object v14, v12, v3

    invoke-virtual {v5, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    move-object/from16 v6, p3

    const/4 v4, 0x0

    goto/16 :goto_0
.end method

.method static synthetic lambda$0(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V
    .locals 1

    .line 8
    const/4 v0, 0x1

    iput-boolean v0, p0, Lkr/memorynotes/InkPage;->enabled:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/InkPage;->eraser:Z

    aget-object p0, p1, v0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$1(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V
    .locals 0
    invoke-static {p0, p1}, Lkr/memorynotes/EraseMenu;->show(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V
    return-void
.end method

.method static synthetic lambda$2(Lkr/memorynotes/InkPage;[Ljava/lang/Runnable;)V
    .locals 1

    .line 8
    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/InkPage;->enabled:Z

    aget-object p0, p1, v0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$3(Lkr/memorynotes/InkPage;I[Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 10
    iput p1, p0, Lkr/memorynotes/InkPage;->color:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lkr/memorynotes/InkPage;->enabled:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lkr/memorynotes/InkPage;->eraser:Z

    aget-object p0, p2, p1

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$4(Lkr/memorynotes/InkPage;)V
    .locals 0

    .line 11
    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->settings()V

    return-void
.end method

.method static synthetic lambda$5(Lkr/memorynotes/InkPage;)V
    .locals 0

    .line 11
    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->undo()V

    return-void
.end method

.method static synthetic lambda$6(Lkr/memorynotes/MainActivity;Lkr/memorynotes/InkPage;Lkr/memorynotes/Ui;)V
    .locals 2

    .line 11
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p0, "\uc0c9\uc0c1\u00b7\uad75\uae30 \uc124\uc815"

    const-string v1, "필기 전체 지우기"

    filled-new-array {p0, v1}, [Ljava/lang/String;

    move-result-object p0

    new-instance v1, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda9;

    invoke-direct {v1, p1, p2}, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda9;-><init>(Lkr/memorynotes/InkPage;Lkr/memorynotes/Ui;)V

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method static synthetic lambda$7(Lkr/memorynotes/InkPage;Lkr/memorynotes/Ui;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 11
    if-nez p3, :cond_0

    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->settings()V

    goto :goto_0

    :cond_0
    new-instance p2, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lkr/memorynotes/InkToolbar$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/InkPage;)V

    const-string p0, "\ud544\uae30 \uc9c0\uc6b0\uae30"

    const-string p3, "현재 노트의 필기를 모두 지울까요? \uc2e4\ud589 \ucde8\uc18c\ub85c \ub418\ub3cc\ub9b4 \uc218 \uc788\uc2b5\ub2c8\ub2e4."

    invoke-virtual {p1, p0, p3, p2}, Lkr/memorynotes/Ui;->confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$8(Lkr/memorynotes/InkPage;)V
    .locals 0

    .line 11
    invoke-virtual {p0}, Lkr/memorynotes/InkPage;->clear()V

    return-void
.end method

.method static synthetic lambda$9(Landroid/widget/Button;Lkr/memorynotes/Ui;Lkr/memorynotes/InkPage;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;[Landroid/widget/Button;)V
    .locals 7

    .line 12
    iget-boolean v0, p2, Lkr/memorynotes/InkPage;->enabled:Z

    const/high16 v1, 0x3e800000    # 0.25f

    if-eqz v0, :cond_0

    iget-boolean v0, p2, Lkr/memorynotes/InkPage;->eraser:Z

    if-nez v0, :cond_0

    iget v0, p1, Lkr/memorynotes/Ui;->surface:I

    iget v2, p1, Lkr/memorynotes/Ui;->green:I

    invoke-static {v0, v2, v1}, Lkr/memorynotes/Dashboard;->blend(IIF)I

    move-result v0

    goto :goto_0

    :cond_0
    iget v0, p1, Lkr/memorynotes/Ui;->surface:I

    :goto_0
    const/16 v2, 0x16

    invoke-virtual {p1, v0, v2}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-boolean p0, p2, Lkr/memorynotes/InkPage;->enabled:Z

    if-eqz p0, :cond_1

    iget-boolean p0, p2, Lkr/memorynotes/InkPage;->eraser:Z

    if-eqz p0, :cond_1

    iget p0, p1, Lkr/memorynotes/Ui;->surface:I

    iget v0, p1, Lkr/memorynotes/Ui;->green:I

    invoke-static {p0, v0, v1}, Lkr/memorynotes/Dashboard;->blend(IIF)I

    move-result p0

    goto :goto_1

    :cond_1
    iget p0, p1, Lkr/memorynotes/Ui;->surface:I

    :goto_1
    invoke-virtual {p1, p0, v2}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    invoke-virtual {p3, p0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-boolean p0, p2, Lkr/memorynotes/InkPage;->enabled:Z

    if-nez p0, :cond_2

    iget p0, p1, Lkr/memorynotes/Ui;->surface:I

    iget p3, p1, Lkr/memorynotes/Ui;->green:I

    invoke-static {p0, p3, v1}, Lkr/memorynotes/Dashboard;->blend(IIF)I

    move-result p0

    goto :goto_2

    :cond_2
    iget p0, p1, Lkr/memorynotes/Ui;->surface:I

    :goto_2
    invoke-virtual {p1, p0, v2}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    invoke-virtual {p4, p0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-boolean p0, p2, Lkr/memorynotes/InkPage;->enabled:Z

    if-eqz p0, :cond_3

    const-string p0, "S\ud39c\uc73c\ub85c \ud544\uae30 \u00b7 \uc190\uac00\ub77d\uc73c\ub85c \uc2a4\ud06c\ub864"

    goto :goto_3

    :cond_3
    const-string p0, "\ud14d\uc2a4\ud2b8 \uc120\ud0dd \ubaa8\ub4dc \u00b7 \uae00\uc790\ub97c \uc120\ud0dd\ud574 \uc0c9\uc0c1\uc744 \ubc14\uafb8\uc138\uc694"

    :goto_3
    invoke-virtual {p5, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p0, 0x0

    move p3, p0

    :goto_4
    array-length p4, p6

    if-lt p3, p4, :cond_4

    return-void

    :cond_4
    sget-object p4, Lkr/memorynotes/InkToolbar;->colors:[I

    aget p4, p4, p3

    const/16 p5, 0x1e

    invoke-virtual {p1, p4, p5}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    iget p4, p2, Lkr/memorynotes/InkPage;->color:I

    sget-object p5, Lkr/memorynotes/InkToolbar;->colors:[I

    aget p5, p5, p3

    if-ne p4, p5, :cond_5

    const/4 p4, 0x3

    goto :goto_5

    :cond_5
    move p4, p0

    :goto_5
    int-to-float p4, p4

    invoke-virtual {p1, p4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p4

    iget p5, p1, Lkr/memorynotes/Ui;->ink:I

    invoke-virtual {v1, p4, p5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    aget-object p4, p6, p3

    new-instance p5, Landroid/graphics/drawable/InsetDrawable;

    const/high16 v0, 0x40e00000    # 7.0f

    invoke-virtual {p1, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    const/high16 v3, 0x41000000    # 8.0f

    invoke-virtual {p1, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {p1, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    invoke-virtual {p1, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v6

    move-object v0, p5

    move v3, v4

    move v4, v5

    move v5, v6

    invoke-direct/range {v0 .. v5}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    invoke-virtual {p4, p5}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_4
.end method

.method static tool(Lkr/memorynotes/Ui;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 1

    .line 14
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lkr/memorynotes/Dashboard;->iconAction(Lkr/memorynotes/Ui;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method
