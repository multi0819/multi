.class public final Lkr/memorynotes/EditorLayout;
.super Ljava/lang/Object;
.source "EditorLayout.java"


# instance fields
.field private final a:Lkr/memorynotes/MainActivity;

.field private final dark:Z

.field private final e:Lkr/memorynotes/NoteEditor;

.field private final u:Lkr/memorynotes/Ui;


# direct methods
.method private constructor <init>(Lkr/memorynotes/NoteEditor;)V
    .locals 2

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object p1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object p1, p1, Lkr/memorynotes/NoteEditor;->a:Lkr/memorynotes/MainActivity;

    iput-object p1, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iput-object p1, p0, Lkr/memorynotes/EditorLayout;->u:Lkr/memorynotes/Ui;

    iget-object p1, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v1, "dark"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lkr/memorynotes/EditorLayout;->dark:Z

    return-void
.end method

.method static synthetic access$000(Lkr/memorynotes/EditorLayout;)Lkr/memorynotes/NoteEditor;
    .locals 0

    .line 10
    iget-object p0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    return-object p0
.end method

.method static synthetic access$100(Lkr/memorynotes/EditorLayout;Landroid/widget/Button;I)Landroid/widget/Button;
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Lkr/memorynotes/EditorLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lkr/memorynotes/EditorLayout;)Lkr/memorynotes/MainActivity;
    .locals 0

    .line 10
    iget-object p0, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    return-object p0
.end method

.method public static attach(Lkr/memorynotes/NoteEditor;)V
    .locals 1

    .line 16
    new-instance v0, Lkr/memorynotes/EditorLayout;

    invoke-direct {v0, p0}, Lkr/memorynotes/EditorLayout;-><init>(Lkr/memorynotes/NoteEditor;)V

    invoke-direct {v0}, Lkr/memorynotes/EditorLayout;->build()V

    return-void
.end method

.method private build()V
    .locals 14

    .line 36
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v1, "\ub178\ud2b8 \uc800\uc7a5"

    invoke-direct {p0, v0, v1}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 37
    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v2, "\uc791\uc131 \ucde8\uc18c"

    invoke-direct {p0, v1, v2}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 38
    if-nez v0, :cond_0

    return-void

    .line 39
    :cond_0
    invoke-direct {p0, v0}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    const-string v1, "\uc800\uc7a5"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lkr/memorynotes/EditorLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    .line 40
    iget-object v2, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 41
    iget-object v4, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, v4, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 43
    const-string v5, "\ud39c"

    invoke-direct {p0, v4, v5}, Lkr/memorynotes/EditorLayout;->findByDescription(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    .line 44
    const-string v6, "\ud14d\uc2a4\ud2b8 \uc120\ud0dd \ubaa8\ub4dc"

    invoke-direct {p0, v4, v6}, Lkr/memorynotes/EditorLayout;->findByDescription(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    .line 45
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Landroid/widget/Button;->performClick()Z

    .line 46
    :cond_1
    const/16 v7, 0x8

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    .line 47
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/high16 v7, 0x41800000    # 16.0f

    invoke-direct {p0, v7}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v8

    const/high16 v9, 0x40e00000    # 7.0f

    invoke-direct {p0, v9}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v10

    invoke-direct {p0, v7}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v7

    invoke-direct {p0, v9}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v9

    invoke-virtual {v2, v8, v10, v7, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 48
    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->row()Landroid/widget/LinearLayout;

    move-result-object v7

    .line 49
    new-instance v8, Lkr/memorynotes/EditorLayout$1;

    invoke-direct {v8, p0}, Lkr/memorynotes/EditorLayout$1;-><init>(Lkr/memorynotes/EditorLayout;)V

    const-string v9, "\u2039"

    invoke-direct {p0, v9, v3, v8}, Lkr/memorynotes/EditorLayout;->button(Ljava/lang/String;ILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v8

    .line 50
    const/high16 v9, 0x41d00000    # 26.0f

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setTextSize(F)V

    const-string v9, "\ub4a4\ub85c \uac00\uae30 \u00b7 \uc784\uc2dc\uc800\uc7a5"

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 51
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x42380000    # 46.0f

    invoke-direct {p0, v10}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v11

    invoke-direct {p0, v10}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v10

    invoke-direct {v9, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->column()Landroid/widget/LinearLayout;

    move-result-object v8

    const/high16 v9, 0x41400000    # 12.0f

    invoke-direct {p0, v9}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v9

    const/high16 v10, 0x40800000    # 4.0f

    invoke-direct {p0, v10}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v10

    invoke-virtual {v8, v9, v3, v10, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 53
    iget-object v9, p0, Lkr/memorynotes/EditorLayout;->u:Lkr/memorynotes/Ui;

    iget-object v10, p0, Lkr/memorynotes/EditorLayout;->u:Lkr/memorynotes/Ui;

    iget v10, v10, Lkr/memorynotes/Ui;->ink:I

    const-string v11, "\ub178\ud2b8 \uc791\uc131"

    const/16 v12, 0x12

    invoke-virtual {v9, v11, v12, v10}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 54
    iget-object v9, p0, Lkr/memorynotes/EditorLayout;->u:Lkr/memorynotes/Ui;

    iget-object v11, p0, Lkr/memorynotes/EditorLayout;->u:Lkr/memorynotes/Ui;

    iget v11, v11, Lkr/memorynotes/Ui;->muted:I

    const-string v12, "\uc790\ub3d9 \uc784\uc2dc\uc800\uc7a5"

    const/16 v13, 0xb

    invoke-virtual {v9, v12, v13, v11}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 55
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v12, -0x2

    invoke-direct {v9, v3, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    new-instance v8, Lkr/memorynotes/EditorLayout$2;

    invoke-direct {v8, p0, v4, v5, v6}, Lkr/memorynotes/EditorLayout$2;-><init>(Lkr/memorynotes/EditorLayout;Landroid/view/View;Landroid/widget/Button;Landroid/widget/Button;)V

    const-string v4, "\ud544\uae30 \u25be"

    invoke-direct {p0, v4, v3, v8}, Lkr/memorynotes/EditorLayout;->button(Ljava/lang/String;ILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v4

    .line 60
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41000000    # 8.0f

    invoke-direct {p0, v6}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v6

    invoke-virtual {v5, v3, v3, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v7, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42900000    # 72.0f

    invoke-direct {p0, v5}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v5

    invoke-direct {v4, v5, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 62
    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->compactMetadata()V

    .line 63
    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->setupGeneralTools()V

    .line 64
    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->setupCardTools()V

    .line 65
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->reason:Landroid/widget/EditText;

    const-string v2, "\ud2c0\ub9b0 \uc810"

    const/4 v4, 0x3

    invoke-direct {p0, v0, v2, v4}, Lkr/memorynotes/EditorLayout;->foldField(Landroid/widget/EditText;Ljava/lang/String;I)V

    .line 66
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->caution:Landroid/widget/EditText;

    const-string v2, "\uc8fc\uc758\uc0ac\ud56d"

    const/4 v4, 0x5

    invoke-direct {p0, v0, v2, v4}, Lkr/memorynotes/EditorLayout;->foldField(Landroid/widget/EditText;Ljava/lang/String;I)V

    .line 67
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v2, "\uc0ac\uc9c4 \u00b7 \ud0dc\uadf8"

    invoke-direct {p0, v0, v2}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 68
    if-eqz v0, :cond_2

    const-string v2, "\ucd94\uac00 \uc635\uc158  \u00b7  \uc0ac\uc9c4 / \ud0dc\uadf8 / \uc990\uaca8\ucc3e\uae30  \u25be"

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, v0, v3}, Lkr/memorynotes/EditorLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    .line 69
    :cond_2
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v2, "\uac24\ub7ec\ub9ac\uc5d0\uc11c"

    invoke-direct {p0, v0, v2}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_3

    const-string v2, "\uff0b \uc0ac\uc9c4 \ucca8\ubd80"

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x4

    invoke-direct {p0, v0, v2}, Lkr/memorynotes/EditorLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    .line 70
    :cond_3
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->body:Landroid/widget/EditText;

    const/16 v2, 0xa

    invoke-direct {p0, v0, v2}, Lkr/memorynotes/EditorLayout;->styleField(Landroid/widget/EditText;I)V

    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->question:Landroid/widget/EditText;

    invoke-direct {p0, v0, v4}, Lkr/memorynotes/EditorLayout;->styleField(Landroid/widget/EditText;I)V

    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->answer:Landroid/widget/EditText;

    const/4 v2, 0x7

    invoke-direct {p0, v0, v2}, Lkr/memorynotes/EditorLayout;->styleField(Landroid/widget/EditText;I)V

    .line 71
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->title:Landroid/widget/EditText;

    iget-object v2, p0, Lkr/memorynotes/EditorLayout;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->scale:F

    const/high16 v3, 0x41980000    # 19.0f

    mul-float/2addr v2, v3

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextSize(F)V

    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->title:Landroid/widget/EditText;

    invoke-virtual {v0, v10, v1}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 72
    return-void
.end method

.method private button(Ljava/lang/String;ILjava/lang/Runnable;)Landroid/widget/Button;
    .locals 1

    .line 31
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0, p1, p3}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lkr/memorynotes/EditorLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    move-result-object p1

    return-object p1
.end method

.method private children(Landroid/view/ViewGroup;)Ljava/util/ArrayList;
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

    .line 33
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

.method private color(Landroid/widget/Button;I)Landroid/widget/Button;
    .locals 4

    .line 24
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setAllCaps(Z)V

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->u:Lkr/memorynotes/Ui;

    iget v1, v1, Lkr/memorynotes/Ui;->scale:F

    const/high16 v2, 0x41500000    # 13.0f

    mul-float/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 25
    iget-boolean v1, p0, Lkr/memorynotes/EditorLayout;->dark:Z

    invoke-static {v1, p2}, Lkr/memorynotes/EditorPalette;->foreground(ZI)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setTextColor(I)V

    invoke-virtual {p1, v2}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 26
    iget-boolean v1, p0, Lkr/memorynotes/EditorLayout;->dark:Z

    invoke-static {v1, p2}, Lkr/memorynotes/EditorPalette;->background(ZI)I

    move-result p2

    invoke-direct {p0, p2}, Lkr/memorynotes/EditorLayout;->shape(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 27
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setMinWidth(I)V

    const/high16 p2, 0x42380000    # 46.0f

    invoke-direct {p0, p2}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-direct {p0, p2}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 28
    const/high16 p2, 0x41200000    # 10.0f

    invoke-direct {p0, p2}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v1

    const/high16 v2, 0x41100000    # 9.0f

    invoke-direct {p0, v2}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v3

    invoke-direct {p0, p2}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result p2

    invoke-direct {p0, v2}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v2

    invoke-virtual {p1, v1, v3, p2, v2}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setFocusable(Z)V

    .line 29
    return-object p1
.end method

.method private column()Landroid/widget/LinearLayout;
    .locals 2

    .line 18
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-object v0
.end method

.method private compactMetadata()V
    .locals 10

    .line 80
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 81
    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->subject:Landroid/widget/Spinner;

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->chapter:Landroid/widget/Spinner;

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->type:Landroid/widget/Spinner;

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->mistakeFields:Landroid/widget/LinearLayout;

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    .line 82
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v2

    const/high16 v3, 0x41000000    # 8.0f

    invoke-direct {p0, v3}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v3

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v1

    const/high16 v4, 0x41600000    # 14.0f

    invoke-direct {p0, v4}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v4

    invoke-virtual {v0, v2, v3, v1, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 83
    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    .line 84
    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->column()Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->column()Landroid/widget/LinearLayout;

    move-result-object v3

    .line 85
    const-string v4, "\uacfc\ubaa9"

    const/4 v5, 0x0

    invoke-direct {p0, v4, v5}, Lkr/memorynotes/EditorLayout;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v4, "\ub2e8\uc6d0"

    invoke-direct {p0, v4, v5}, Lkr/memorynotes/EditorLayout;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 86
    iget-object v4, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v4, v4, Lkr/memorynotes/NoteEditor;->subject:Landroid/widget/Spinner;

    const/high16 v6, 0x42400000    # 48.0f

    invoke-direct {p0, v6}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/widget/Spinner;->setMinimumHeight(I)V

    iget-object v4, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v4, v4, Lkr/memorynotes/NoteEditor;->chapter:Landroid/widget/Spinner;

    invoke-direct {p0, v6}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/widget/Spinner;->setMinimumHeight(I)V

    .line 87
    iget-object v4, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v4, v4, Lkr/memorynotes/NoteEditor;->subject:Landroid/widget/Spinner;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v4, v4, Lkr/memorynotes/NoteEditor;->chapter:Landroid/widget/Spinner;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    invoke-direct {p0, v1, v2}, Lkr/memorynotes/EditorLayout;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-direct {p0, v1, v3}, Lkr/memorynotes/EditorLayout;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 89
    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->type:Landroid/widget/Spinner;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setVisibility(I)V

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->type:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 90
    const-string v1, "\ub178\ud2b8 \uc720\ud615"

    invoke-direct {p0, v1, v5}, Lkr/memorynotes/EditorLayout;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 91
    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    .line 92
    const-string v2, "\ubb38\ub2f5"

    const-string v3, "\uc624\ub2f5"

    const-string v4, "\uc77c\ubc18"

    filled-new-array {v4, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    .line 93
    const-string v3, "\ubb38\ub2f5 \uce74\ub4dc"

    const-string v4, "\uc624\ub2f5\ub178\ud2b8"

    const-string v6, "\uc77c\ubc18 \ub178\ud2b8"

    filled-new-array {v6, v3, v4}, [Ljava/lang/String;

    move-result-object v3

    .line 94
    const/4 v4, 0x3

    new-array v6, v4, [Landroid/widget/Button;

    .line 95
    move v7, v5

    :goto_0
    if-ge v7, v4, :cond_0

    .line 96
    nop

    .line 97
    aget-object v8, v2, v7

    new-instance v9, Lkr/memorynotes/EditorLayout$3;

    invoke-direct {v9, p0, v7, v3, v6}, Lkr/memorynotes/EditorLayout$3;-><init>(Lkr/memorynotes/EditorLayout;I[Ljava/lang/String;[Landroid/widget/Button;)V

    invoke-direct {p0, v8, v5, v9}, Lkr/memorynotes/EditorLayout;->button(Ljava/lang/String;ILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v8

    aput-object v8, v6, v7

    .line 102
    aget-object v8, v6, v7

    invoke-direct {p0, v1, v8}, Lkr/memorynotes/EditorLayout;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    .line 95
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 104
    :cond_0
    iget-object v2, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v2, v2, Lkr/memorynotes/NoteEditor;->type:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    if-ltz v2, :cond_1

    if-ge v2, v4, :cond_1

    aget-object v2, v6, v2

    const/4 v3, 0x2

    invoke-direct {p0, v2, v3}, Lkr/memorynotes/EditorLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    .line 105
    :cond_1
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->mistakeFields:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 106
    return-void
.end method

.method private detach(Landroid/view/View;)V
    .locals 1

    .line 20
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

.method private dp(F)I
    .locals 1

    .line 17
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0, p1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p1

    return p1
.end method

.method private findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;
    .locals 3

    .line 34
    invoke-direct {p0, p1}, Lkr/memorynotes/EditorLayout;->children(Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    instance-of v1, v0, Landroid/widget/Button;

    if-eqz v1, :cond_1

    move-object v1, v0

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    :cond_1
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v0, p2}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method private findByDescription(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;
    .locals 1

    .line 74
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

    .line 75
    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    check-cast p1, Landroid/view/ViewGroup;

    invoke-direct {p0, p1}, Lkr/memorynotes/EditorLayout;->children(Landroid/view/ViewGroup;)Ljava/util/ArrayList;

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

    invoke-direct {p0, v0, p2}, Lkr/memorynotes/EditorLayout;->findByDescription(Landroid/view/View;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_2

    return-object v0

    .line 76
    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method private foldField(Landroid/widget/EditText;Ljava/lang/String;I)V
    .locals 6

    .line 133
    invoke-virtual {p1}, Landroid/widget/EditText;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 134
    if-lez v1, :cond_0

    add-int/lit8 v2, v1, -0x1

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 135
    :goto_0
    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :cond_1

    instance-of v3, v2, Landroid/widget/EditText;

    if-nez v3, :cond_1

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    add-int/lit8 v1, v1, -0x1

    .line 136
    :cond_1
    invoke-direct {p0, p1}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    .line 137
    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->column()Landroid/widget/LinearLayout;

    move-result-object v2

    .line 138
    new-instance v3, Lkr/memorynotes/EditorLayout$6;

    invoke-direct {v3, p0}, Lkr/memorynotes/EditorLayout$6;-><init>(Lkr/memorynotes/EditorLayout;)V

    invoke-direct {p0, p2, p3, v3}, Lkr/memorynotes/EditorLayout;->button(Ljava/lang/String;ILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p3

    .line 139
    nop

    .line 140
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-static {v3}, Lkr/memorynotes/EditorPalette;->initiallyOpen(Ljava/lang/CharSequence;)Z

    move-result v3

    .line 141
    const/4 v4, 0x0

    if-eqz v3, :cond_2

    move v5, v4

    goto :goto_1

    :cond_2
    const/16 v5, 0x8

    :goto_1
    invoke-virtual {p1, v5}, Landroid/widget/EditText;->setVisibility(I)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz v3, :cond_3

    const-string v3, "  \u25be"

    goto :goto_2

    :cond_3
    const-string v3, "  \u25b8"

    :goto_2
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 142
    new-instance v3, Lkr/memorynotes/EditorLayout$7;

    invoke-direct {v3, p0, p1, p3, p2}, Lkr/memorynotes/EditorLayout$7;-><init>(Lkr/memorynotes/EditorLayout;Landroid/widget/EditText;Landroid/widget/Button;Ljava/lang/String;)V

    invoke-virtual {p3, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v5, -0x2

    invoke-direct {p2, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p3, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p2, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p1, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 p2, 0x41200000    # 10.0f

    invoke-direct {p0, p2}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result p2

    invoke-virtual {p1, v4, p2, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v0, v2, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 145
    return-void
.end method

.method private label(Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 3

    .line 32
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->u:Lkr/memorynotes/Ui;

    iget-boolean v1, p0, Lkr/memorynotes/EditorLayout;->dark:Z

    invoke-static {v1, p2}, Lkr/memorynotes/EditorPalette;->foreground(ZI)I

    move-result p2

    const/16 v1, 0xd

    invoke-virtual {v0, p1, v1, p2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    const/4 p2, 0x0

    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/high16 p2, 0x40800000    # 4.0f

    invoke-direct {p0, p2}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result p2

    const/high16 v0, 0x41200000    # 10.0f

    invoke-direct {p0, v0}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v0

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v0, v2, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object p1
.end method

.method private row()Landroid/widget/LinearLayout;
    .locals 2

    .line 19
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    return-object v0
.end method

.method private setupCardTools()V
    .locals 4

    .line 127
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    const-string v1, "\ubb38\uc81c\uc758 \uac00\ub9b4"

    invoke-direct {p0, v0, v1}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    const-string v2, "\uc815\ub2f5\uc758 \uac00\ub9b4"

    invoke-direct {p0, v1, v2}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 128
    const/4 v2, 0x3

    if-eqz v0, :cond_0

    const-string v3, "\ubb38\uc81c \ubb38\uad6c \uac00\ub9ac\uae30"

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, v0, v2}, Lkr/memorynotes/EditorLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    .line 129
    :cond_0
    if-eqz v1, :cond_1

    const-string v0, "\uc815\ub2f5 \ubb38\uad6c \uac00\ub9ac\uae30"

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, v1, v2}, Lkr/memorynotes/EditorLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    .line 130
    :cond_1
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->extras:Landroid/widget/LinearLayout;

    invoke-direct {p0, v0}, Lkr/memorynotes/EditorLayout;->children(Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    instance-of v2, v1, Landroid/widget/TextView;

    if-eqz v2, :cond_2

    instance-of v2, v1, Landroid/widget/EditText;

    if-nez v2, :cond_2

    instance-of v2, v1, Landroid/widget/Button;

    if-nez v2, :cond_2

    move-object v2, v1

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "\ubcf5\uc2b5\ud560 \ub54c\ub294"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    goto :goto_0

    .line 131
    :cond_3
    return-void
.end method

.method private setupGeneralTools()V
    .locals 8

    .line 108
    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    const-string v1, "\uc120\ud0dd\ud55c \uc804\uccb4"

    invoke-direct {p0, v0, v1}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 109
    iget-object v1, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v1, v1, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    const-string v2, "\uac00\ub9bc \ubb38\uad6c"

    invoke-direct {p0, v1, v2}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 110
    iget-object v2, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v2, v2, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    const-string v3, "\uadf8\ub9bc \ubd99\uc5ec\ub123\uae30"

    invoke-direct {p0, v2, v3}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 111
    iget-object v3, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v3, v3, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    const-string v4, "\ubcf8\ubb38 \uadf8\ub9bc"

    invoke-direct {p0, v3, v4}, Lkr/memorynotes/EditorLayout;->findButton(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 112
    invoke-direct {p0, v0}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    invoke-direct {p0, v2}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    invoke-direct {p0, v3}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    .line 113
    iget-object v4, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v4, v4, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    invoke-direct {p0, v4}, Lkr/memorynotes/EditorLayout;->children(Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    instance-of v6, v5, Landroid/widget/TextView;

    if-eqz v6, :cond_0

    instance-of v6, v5, Landroid/widget/EditText;

    if-nez v6, :cond_0

    instance-of v6, v5, Landroid/widget/Button;

    if-nez v6, :cond_0

    move-object v6, v5

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "\ub2f5\uc740 \ud30c\ub791"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-direct {p0, v5}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    goto :goto_0

    .line 114
    :cond_1
    invoke-direct {p0}, Lkr/memorynotes/EditorLayout;->row()Landroid/widget/LinearLayout;

    move-result-object v4

    .line 115
    new-instance v5, Lkr/memorynotes/EditorLayout$4;

    invoke-direct {v5, p0}, Lkr/memorynotes/EditorLayout$4;-><init>(Lkr/memorynotes/EditorLayout;)V

    const-string v6, "\uff0b \uadf8\ub9bc \u25be"

    const/4 v7, 0x4

    invoke-direct {p0, v6, v7, v5}, Lkr/memorynotes/EditorLayout;->button(Ljava/lang/String;ILjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v5

    .line 116
    new-instance v6, Lkr/memorynotes/EditorLayout$5;

    invoke-direct {v6, p0, v5, v2, v3}, Lkr/memorynotes/EditorLayout$5;-><init>(Lkr/memorynotes/EditorLayout;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    if-eqz v0, :cond_2

    const-string v2, "\ub2f5 \uc9c0\uc815"

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x2

    invoke-direct {p0, v0, v2}, Lkr/memorynotes/EditorLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    invoke-direct {p0, v4, v0}, Lkr/memorynotes/EditorLayout;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    .line 123
    :cond_2
    if-eqz v1, :cond_3

    const-string v0, "\ubb38\uad6c \uac00\ub9ac\uae30"

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x3

    invoke-direct {p0, v1, v0}, Lkr/memorynotes/EditorLayout;->color(Landroid/widget/Button;I)Landroid/widget/Button;

    invoke-direct {p0, v4, v1}, Lkr/memorynotes/EditorLayout;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    .line 124
    :cond_3
    invoke-direct {p0, v4, v5}, Lkr/memorynotes/EditorLayout;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v0, p0, Lkr/memorynotes/EditorLayout;->e:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->generalFields:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 125
    return-void
.end method

.method private shape(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 22
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 p1, 0x41400000    # 12.0f

    invoke-direct {p0, p1}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method private styleField(Landroid/widget/EditText;I)V
    .locals 3

    .line 78
    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setMinLines(I)V

    const/high16 p2, 0x41600000    # 14.0f

    invoke-direct {p0, p2}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v0

    const/high16 v1, 0x41400000    # 12.0f

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v2

    invoke-direct {p0, p2}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result p2

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v1

    invoke-virtual {p1, v0, v2, p2, v1}, Landroid/widget/EditText;->setPadding(IIII)V

    const p2, 0x800033

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setGravity(I)V

    return-void
.end method

.method private weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .locals 5

    .line 21
    invoke-direct {p0, p2}, Lkr/memorynotes/EditorLayout;->detach(Landroid/view/View;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v1, 0x40400000    # 3.0f

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v2

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v3

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v4

    invoke-direct {p0, v1}, Lkr/memorynotes/EditorLayout;->dp(F)I

    move-result v1

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
