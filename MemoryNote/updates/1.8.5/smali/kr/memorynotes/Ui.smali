.class public final Lkr/memorynotes/Ui;
.super Ljava/lang/Object;
.source "Ui.java"


# instance fields
.field public final a:Landroid/app/Activity;

.field public final answerColor:I

.field public final bg:I

.field public final clozeColor:I

.field public final clozeTint:I

.field public final green:I

.field public final ink:I

.field public final line:I

.field public final muted:I

.field public pictures:Lorg/json/JSONArray;

.field public final scale:F

.field public final surface:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 5

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/Ui;->pictures:Lorg/json/JSONArray;

    .line 6
    iput-object p1, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "dark"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1c

    const-string v2, "#16181C"

    goto :goto_1e

    :cond_1c
    const-string v2, "#F5F7F3"

    :goto_1e
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lkr/memorynotes/Ui;->bg:I

    if-eqz v1, :cond_29

    const-string v2, "#23262C"

    goto :goto_2b

    :cond_29
    const-string v2, "#FFFFFF"

    :goto_2b
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lkr/memorynotes/Ui;->surface:I

    if-eqz v1, :cond_36

    const-string v2, "#ECEEF2"

    goto :goto_38

    :cond_36
    const-string v2, "#203B32"

    :goto_38
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lkr/memorynotes/Ui;->ink:I

    if-eqz v1, :cond_43

    const-string v2, "#ADB3BD"

    goto :goto_45

    :cond_43
    const-string v2, "#74867B"

    :goto_45
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lkr/memorynotes/Ui;->muted:I

    if-eqz v1, :cond_50

    const-string v2, "#78B7AE"

    goto :goto_52

    :cond_50
    const-string v2, "#257967"

    :goto_52
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lkr/memorynotes/Ui;->green:I

    if-eqz v1, :cond_5d

    const-string v2, "#424750"

    goto :goto_5f

    :cond_5d
    const-string v2, "#DBE5DC"

    :goto_5f
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lkr/memorynotes/Ui;->line:I

    if-eqz v1, :cond_6a

    const-string v2, "#8ABEFF"

    goto :goto_6c

    :cond_6a
    const-string v2, "#195CAC"

    :goto_6c
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lkr/memorynotes/Ui;->answerColor:I

    if-eqz v1, :cond_77

    const-string v2, "#FFBF75"

    goto :goto_79

    :cond_77
    const-string v2, "#A64900"

    :goto_79
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lkr/memorynotes/Ui;->clozeColor:I

    if-eqz v1, :cond_84

    const-string v1, "#49341E"

    goto :goto_86

    :cond_84
    const-string v1, "#FFF0DB"

    :goto_86
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lkr/memorynotes/Ui;->clozeTint:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "font"

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p1

    iput p1, p0, Lkr/memorynotes/Ui;->scale:F

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 38
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 66
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method private styledButton(Ljava/lang/String;IIILjava/lang/Runnable;)Landroid/widget/Button;
    .registers 11

    .line 34
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 p1, 0x41700000    # 15.0f

    iget v2, p0, Lkr/memorynotes/Ui;->scale:F

    mul-float/2addr v2, p1

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 p1, 0x42500000    # 52.0f

    invoke-virtual {p0, p1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    const/high16 p1, 0x41400000    # 12.0f

    invoke-virtual {p0, p1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual {p0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {p0, p1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p1

    invoke-virtual {p0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {v0, v2, v4, p1, v3}, Landroid/widget/Button;->setPadding(IIII)V

    .line 35
    new-instance p1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 36
    const/16 v2, 0xc

    invoke-virtual {p0, p3, v2}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p3

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {p0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {p3, v3, p4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 37
    invoke-virtual {p0, p4, v2}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p4

    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual {p0, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    invoke-virtual {p4, v2, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 38
    const p2, 0x10100a7

    filled-new-array {p2}, [I

    move-result-object p2

    invoke-virtual {p1, p2, p4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array p2, v1, [I

    invoke-virtual {p1, p2, p3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Lkr/memorynotes/Ui$$ExternalSyntheticLambda1;

    invoke-direct {p1, p5}, Lkr/memorynotes/Ui$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x1

    const/4 p3, -0x2

    invoke-direct {p1, p2, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 p2, 0x40a00000    # 5.0f

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p3

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p2

    invoke-virtual {p1, v1, p3, v1, p2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method


# virtual methods
.method public answerButton(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 11

    .line 44
    iget-object v0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "dark"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v1, "#D5E8FF"

    goto :goto_14

    :cond_12
    const-string v1, "#154D8F"

    :goto_14
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    move v4, v1

    if-eqz v0, :cond_1e

    const-string v0, "#293B50"

    goto :goto_20

    :cond_1e
    const-string v0, "#E2EEFF"

    :goto_20
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    move v5, v0

    iget v6, p0, Lkr/memorynotes/Ui;->answerColor:I

    move-object v2, p0

    move-object v3, p1

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lkr/memorynotes/Ui;->styledButton(Ljava/lang/String;IIILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    return-object p1
.end method

.method public button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 11

    .line 41
    iget-object v0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "dark"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v1, "#E3E7ED"

    goto :goto_14

    :cond_12
    const-string v1, "#20503D"

    :goto_14
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    move v4, v1

    if-eqz v0, :cond_1e

    const-string v1, "#2C3037"

    goto :goto_20

    :cond_1e
    const-string v1, "#E4F0E9"

    :goto_20
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    move v5, v1

    if-eqz v0, :cond_2a

    const-string v0, "#515966"

    goto :goto_2c

    :cond_2a
    const-string v0, "#A5C5B2"

    :goto_2c
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    move v6, v0

    move-object v2, p0

    move-object v3, p1

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lkr/memorynotes/Ui;->styledButton(Ljava/lang/String;IIILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    return-object p1
.end method

.method public card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .registers 7

    .line 19
    invoke-virtual {p0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v0

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {p0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual {p0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {p0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    invoke-virtual {p0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget v1, p0, Lkr/memorynotes/Ui;->surface:I

    const/16 v2, 0x12

    invoke-virtual {p0, v1, v2}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-virtual {p0, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    const/high16 v3, 0x40e00000    # 7.0f

    invoke-virtual {p0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public clozeButton(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 11

    .line 45
    iget-object v0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "dark"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v1, "#FFE3BC"

    goto :goto_14

    :cond_12
    const-string v1, "#853C00"

    :goto_14
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    move v4, v1

    if-eqz v0, :cond_1e

    const-string v0, "#493D2C"

    goto :goto_20

    :cond_1e
    const-string v0, "#FFF0D9"

    :goto_20
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    move v5, v0

    iget v6, p0, Lkr/memorynotes/Ui;->clozeColor:I

    move-object v2, p0

    move-object v3, p1

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lkr/memorynotes/Ui;->styledButton(Ljava/lang/String;IIILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    return-object p1
.end method

.method public col()Landroid/widget/LinearLayout;
    .registers 3

    .line 8
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-object v0
.end method

.method public confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 6

    .line 66
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\ucde8\uc18c"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p2, Lkr/memorynotes/Ui$$ExternalSyntheticLambda0;

    invoke-direct {p2, p3}, Lkr/memorynotes/Ui$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    const-string p3, "\ud655\uc778"

    invoke-virtual {p1, p3, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method public dp(F)I
    .registers 3

    .line 7
    iget-object v0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method public edit(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;I)Landroid/widget/EditText;
    .registers 8

    .line 47
    const/16 v0, 0xd

    iget v1, p0, Lkr/memorynotes/Ui;->muted:I

    invoke-virtual {p0, p2, v0, v1}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p2, Lkr/memorynotes/PictureEditText;

    iget-object v0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {p2, v0}, Lkr/memorynotes/PictureEditText;-><init>(Landroid/content/Context;)V

    iget v0, p0, Lkr/memorynotes/Ui;->ink:I

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setTextColor(I)V

    iget v0, p0, Lkr/memorynotes/Ui;->muted:I

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setHintTextColor(I)V

    const/high16 v0, 0x41800000    # 16.0f

    iget v1, p0, Lkr/memorynotes/Ui;->scale:F

    mul-float/2addr v1, v0

    invoke-virtual {p2, v1}, Landroid/widget/EditText;->setTextSize(F)V

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const/16 p3, 0x30

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setGravity(I)V

    invoke-virtual {p2, p4}, Landroid/widget/EditText;->setMinLines(I)V

    const p3, 0x24001

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setInputType(I)V

    iget-object p3, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    const/4 p4, 0x0

    invoke-virtual {p3, p4}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p3

    const-string v0, "dark"

    invoke-interface {p3, v0, p4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_47

    const-string p3, "#1B1E23"

    goto :goto_49

    :cond_47
    const-string p3, "#F4F8F5"

    :goto_49
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    const/16 p4, 0xa

    invoke-virtual {p0, p3, p4}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p3

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    iget v1, p0, Lkr/memorynotes/Ui;->line:I

    invoke-virtual {p3, v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 p3, 0x41400000    # 12.0f

    invoke-virtual {p0, p3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-virtual {p0, p3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    invoke-virtual {p0, p3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    invoke-virtual {p0, p3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p3

    invoke-virtual {p2, v0, v1, v2, p3}, Landroid/widget/EditText;->setPadding(IIII)V

    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p3, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, p1, p4}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    return-object p2
.end method

.method public gap(Landroid/widget/LinearLayout;I)V
    .registers 6

    .line 18
    new-instance v0, Landroid/view/View;

    iget-object v1, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    int-to-float p2, p2

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p2

    const/4 v2, 0x1

    invoke-direct {v1, v2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public message(Ljava/lang/String;)V
    .registers 4

    .line 67
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\ud655\uc778"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method public navigation(Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/Button;
    .registers 4

    invoke-static {p0, p1, p2, p3}, Lkr/memorynotes/Dashboard;->nav(Lkr/memorynotes/Ui;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method public noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;
    .registers 13

    .line 14
    invoke-static {p1, p2}, Lkr/memorynotes/ColorText;->ranges(Lkr/memorynotes/Note;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    move-object v0, p0

    move-object v1, p3

    move v2, p4

    move v3, p5

    move v4, p6

    invoke-static/range {v0 .. v5}, Lkr/memorynotes/StudyTextRenderer;->content(Lkr/memorynotes/Ui;Ljava/lang/String;IZZLorg/json/JSONArray;)Landroid/view/View;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "ink:"

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object p1
.end method

.method public primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 11

    .line 42
    iget-object v0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "dark"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string v1, "#F4F7F8"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    goto :goto_18

    :cond_16
    iget v1, p0, Lkr/memorynotes/Ui;->bg:I

    :goto_18
    move v4, v1

    if-eqz v0, :cond_22

    const-string v1, "#356F68"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    goto :goto_24

    :cond_22
    iget v1, p0, Lkr/memorynotes/Ui;->green:I

    :goto_24
    move v5, v1

    if-eqz v0, :cond_2e

    const-string v0, "#5A9C92"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    goto :goto_30

    :cond_2e
    iget v0, p0, Lkr/memorynotes/Ui;->green:I

    :goto_30
    move v6, v0

    move-object v2, p0

    move-object v3, p1

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lkr/memorynotes/Ui;->styledButton(Ljava/lang/String;IIILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    return-object p1
.end method

.method public row()Landroid/widget/LinearLayout;
    .registers 3

    .line 9
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    return-object v0
.end method

.method public section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;
    .registers 13

    .line 21
    iget-object v0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "dark"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 22
    const/4 v2, 0x4

    new-array v3, v2, [Ljava/lang/String;

    const-string v4, "#195CAC"

    aput-object v4, v3, v1

    const-string v4, "#B12B35"

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-string v4, "#935000"

    const/4 v6, 0x2

    aput-object v4, v3, v6

    const-string v4, "#596775"

    const/4 v7, 0x3

    aput-object v4, v3, v7

    .line 23
    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "#8ABEFF"

    aput-object v4, v2, v1

    const-string v4, "#FF9DA7"

    aput-object v4, v2, v5

    const-string v4, "#FFBF75"

    aput-object v4, v2, v6

    const-string v4, "#BDCBD8"

    aput-object v4, v2, v7

    .line 24
    if-eqz v0, :cond_38

    move-object v3, v2

    :cond_38
    aget-object p3, v3, p3

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    .line 25
    invoke-virtual {p0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v2

    iget v3, p0, Lkr/memorynotes/Ui;->surface:I

    const/16 v4, 0xe

    invoke-virtual {p0, v3, v4}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    const/high16 v4, 0x40000000    # 2.0f

    invoke-virtual {p0, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4, p3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 26
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/4 v6, -0x1

    invoke-direct {v3, v6, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v4, 0x40a00000    # 5.0f

    invoke-virtual {p0, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    const/high16 v7, 0x41400000    # 12.0f

    invoke-virtual {p0, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v8

    invoke-virtual {v3, v1, v4, v1, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    invoke-virtual {p0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object p1

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {p0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {p0, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {p0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v8

    invoke-virtual {p0, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v7

    invoke-virtual {p1, v3, v4, v8, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 28
    const v3, 0xffffff

    and-int/2addr v3, p3

    if-eqz v0, :cond_91

    const/high16 v0, 0x24000000

    goto :goto_93

    :cond_91
    const/high16 v0, 0x10000000

    :goto_93
    or-int/2addr v0, v3

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 29
    const/16 v0, 0x10

    invoke-virtual {p0, p2, v0, p3}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, v0, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 30
    new-instance p1, Landroid/view/View;

    iget-object p2, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 p3, 0x3f800000    # 1.0f

    invoke-virtual {p0, p3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p3

    invoke-direct {p2, v6, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    invoke-virtual {p0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object p1

    invoke-virtual {p0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p2

    const/high16 p3, 0x41600000    # 14.0f

    invoke-virtual {p0, p3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p3

    invoke-virtual {p0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-virtual {p0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object p1
.end method

.method public setOptions(Landroid/widget/Spinner;[Ljava/lang/String;I)V
    .registers 7

    .line 49
    new-instance v0, Lkr/memorynotes/Ui$1;

    iget-object v1, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    const v2, 0x1090008

    invoke-direct {v0, p0, v1, v2, p2}, Lkr/memorynotes/Ui$1;-><init>(Lkr/memorynotes/Ui;Landroid/content/Context;I[Ljava/lang/String;)V

    .line 62
    const p2, 0x1090009

    invoke-virtual {v0, p2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    invoke-virtual {p1, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    const/4 p2, 0x0

    invoke-static {p2, p3}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setSelection(I)V

    iget p2, p0, Lkr/memorynotes/Ui;->surface:I

    const/16 p3, 0xc

    invoke-virtual {p0, p2, p3}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 63
    invoke-virtual {p1}, Landroid/widget/Spinner;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_39

    invoke-virtual {p1}, Landroid/widget/Spinner;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget p2, p0, Lkr/memorynotes/Ui;->green:I

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 64
    :cond_39
    return-void
.end method

.method public shape(II)Landroid/graphics/drawable/GradientDrawable;
    .registers 4

    .line 10
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    int-to-float p1, p2

    invoke-virtual {p0, p1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method public spinner(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;
    .registers 7

    .line 65
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_11

    const/16 v0, 0xd

    iget v1, p0, Lkr/memorynotes/Ui;->muted:I

    invoke-virtual {p0, p2, v0, v1}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_11
    new-instance p2, Landroid/widget/Spinner;

    iget-object v0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    const/4 v1, 0x1

    invoke-direct {p2, v0, v1}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;I)V

    invoke-virtual {p0, p2, p3, p4}, Lkr/memorynotes/Ui;->setOptions(Landroid/widget/Spinner;[Ljava/lang/String;I)V

    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p4, -0x1

    const/4 v0, -0x2

    invoke-direct {p3, p4, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 p3, 0xa

    invoke-virtual {p0, p1, p3}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    return-object p2
.end method

.method public study(Ljava/lang/String;IZZ)Landroid/widget/TextView;
    .registers 5

    .line 12
    invoke-static {p0, p1, p2, p3, p4}, Lkr/memorynotes/StudyTextRenderer;->create(Lkr/memorynotes/Ui;Ljava/lang/String;IZZ)Landroid/widget/TextView;

    move-result-object p1

    return-object p1
.end method

.method public studyContent(Ljava/lang/String;IZZ)Landroid/view/View;
    .registers 5

    .line 13
    invoke-static {p0, p1, p2, p3, p4}, Lkr/memorynotes/StudyTextRenderer;->content(Lkr/memorynotes/Ui;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public studyEditor(Landroid/widget/EditText;Z)V
    .registers 3

    .line 15
    invoke-static {p0, p1, p2}, Lkr/memorynotes/StudyTextRenderer;->editor(Lkr/memorynotes/Ui;Landroid/widget/EditText;Z)V

    return-void
.end method

.method public studyLegend()Landroid/widget/LinearLayout;
    .registers 5

    .line 16
    invoke-virtual {p0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v0

    iget v1, p0, Lkr/memorynotes/Ui;->ink:I

    const-string v2, "\uc81c\ubaa9\u00b7\ubb38\uc81c"

    const/16 v3, 0xc

    invoke-virtual {p0, v2, v3, v1}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v1, "\ub2f5 \uc804\uccb4  \u00b7  \ud30c\ub791"

    iget v2, p0, Lkr/memorynotes/Ui;->answerColor:I

    invoke-virtual {p0, v1, v3, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v1, "\uac00\ub9bc \ubb38\uad6c  \u00b7  \uc8fc\ud669"

    iget v2, p0, Lkr/memorynotes/Ui;->clozeColor:I

    invoke-virtual {p0, v1, v3, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method public text(Ljava/lang/String;II)Landroid/widget/TextView;
    .registers 6

    .line 11
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    int-to-float p1, p2

    iget p2, p0, Lkr/memorynotes/Ui;->scale:F

    mul-float/2addr p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 p1, 0x40400000    # 3.0f

    invoke-virtual {p0, p1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p1

    int-to-float p1, p1

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setLineSpacing(FF)V

    return-object v0
.end method

.method public title(Ljava/lang/String;)Landroid/widget/TextView;
    .registers 5

    .line 17
    const/16 v0, 0x1b

    iget v1, p0, Lkr/memorynotes/Ui;->ink:I

    invoke-virtual {p0, p1, v0, v1}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/high16 v0, 0x41000000    # 8.0f

    invoke-virtual {p0, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    const/high16 v1, 0x41200000    # 10.0f

    invoke-virtual {p0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0, v2, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object p1
.end method

.method public weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 7

    .line 46
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
