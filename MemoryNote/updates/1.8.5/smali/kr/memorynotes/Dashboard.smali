.class public final Lkr/memorynotes/Dashboard;
.super Ljava/lang/Object;
.source "Dashboard.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkr/memorynotes/Dashboard$Ring;,
        Lkr/memorynotes/Dashboard$Symbol;,
        Lkr/memorynotes/Dashboard$SymbolDrawable;,
        Lkr/memorynotes/Dashboard$Thumbnail;
    }
.end annotation


# instance fields
.field final a:Lkr/memorynotes/MainActivity;

.field counter:Landroid/widget/TextView;

.field list:Landroid/widget/LinearLayout;

.field mode:I

.field starred:Z

.field subject:Ljava/lang/String;

.field final u:Lkr/memorynotes/Ui;


# direct methods
.method constructor <init>(Lkr/memorynotes/MainActivity;)V
    .registers 3

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const-string v0, ""

    iput-object v0, p0, Lkr/memorynotes/Dashboard;->subject:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lkr/memorynotes/Dashboard;->mode:I

    iput-boolean v0, p0, Lkr/memorynotes/Dashboard;->starred:Z

    .line 12
    iput-object p1, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iput-object p1, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    return-void
.end method

.method static blend(IIF)I
    .registers 7

    .line 50
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p2

    mul-float/2addr v0, v1

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p2

    add-float/2addr v0, v2

    float-to-int v0, v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, p2

    add-float/2addr v2, v3

    float-to-int v2, v2

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    int-to-float p0, p0

    mul-float/2addr p0, v1

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr p1, p2

    add-float/2addr p0, p1

    float-to-int p0, p0

    invoke-static {v0, v2, p0}, Landroid/graphics/Color;->rgb(III)I

    move-result p0

    return p0
.end method

.method public static card(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Lkr/memorynotes/Note;)V
    .registers 12

    invoke-static {p0, p1, p2}, Lkr/memorynotes/NoteSwipe;->card(Lkr/memorynotes/MainActivity;Landroid/view/ViewGroup;Lkr/memorynotes/Note;)V

    .line 44
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0, p1}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object p1

    const/high16 v1, 0x41700000    # 15.0f

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {v0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    invoke-virtual {v0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {p1, v2, v4, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    invoke-direct {v3, v6, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, p2}, Lkr/memorynotes/MainActivity;->meta(Lkr/memorynotes/Note;)Ljava/lang/String;

    move-result-object v3

    iget v4, v0, Lkr/memorynotes/Ui;->muted:I

    const/16 v5, 0xb

    invoke-static {v0, v3, v5, v4, v6}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 v3, 0x5

    invoke-virtual {v0, v2, v3}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    iget-object v3, p2, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-static {v3}, Lkr/memorynotes/HomePolicy;->preview(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v7, 0x10

    iget v8, v0, Lkr/memorynotes/Ui;->ink:I

    invoke-static {v0, v3, v7, v8, v4}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v3, p2, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    const-string v7, "\uc77c\ubc18 \ub178\ud2b8"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_77

    iget-object v3, p2, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    goto :goto_79

    :cond_77
    iget-object v3, p2, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    :goto_79
    invoke-static {v3}, Lkr/memorynotes/Cloze;->mask(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lkr/memorynotes/HomePolicy;->preview(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_a6

    iget-object v7, p2, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-static {v7}, Lkr/memorynotes/HomePolicy;->preview(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a6

    const/16 v7, 0xc

    iget v8, v0, Lkr/memorynotes/Ui;->muted:I

    invoke-static {v0, v3, v7, v8, v6}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 45
    :cond_a6
    iget-object v2, p2, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/high16 v3, 0x41000000    # 8.0f

    if-lez v2, :cond_d5

    iget-object v2, p2, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_d5

    new-instance v4, Lkr/memorynotes/Dashboard$Thumbnail;

    invoke-direct {v4, p0, v2, v0}, Lkr/memorynotes/Dashboard$Thumbnail;-><init>(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;Lkr/memorynotes/Ui;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42800000    # 64.0f

    invoke-virtual {v0, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v8

    invoke-virtual {v0, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v7

    invoke-direct {v2, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v7

    iput v7, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v1, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    :cond_d5
    iget-boolean v2, p2, Lkr/memorynotes/Note;->favorite:Z

    if-eqz v2, :cond_dc

    const-string v2, "\uc911\uc694 \ub178\ud2b8 \ud574\uc81c"

    goto :goto_de

    :cond_dc
    const-string v2, "\uc911\uc694 \ub178\ud2b8 \uace0\uc815"

    :goto_de
    new-instance v4, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda15;

    invoke-direct {v4, p2, p0}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda15;-><init>(Lkr/memorynotes/Note;Lkr/memorynotes/MainActivity;)V

    iget-boolean v7, p2, Lkr/memorynotes/Note;->favorite:Z

    const-string v8, "star"

    invoke-static {v0, v8, v2, v4, v7}, Lkr/memorynotes/Dashboard;->iconAction(Lkr/memorynotes/Ui;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v2

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42300000    # 44.0f

    invoke-virtual {v0, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v8

    invoke-virtual {v0, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v7

    invoke-direct {v4, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    iput v3, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 v1, 0x7

    invoke-virtual {v0, p1, v1}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Lkr/memorynotes/MainActivity;->rating(Lkr/memorynotes/Note;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p2, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const-string v3, ""

    if-lez v2, :cond_13d

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, " \u00b7 \uc0ac\uc9c4 "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p2, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\uc7a5"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_13e

    :cond_13d
    move-object v2, v3

    :goto_13e
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, p2}, Lkr/memorynotes/MainActivity;->due(Lkr/memorynotes/Note;)Z

    move-result v2

    if-eqz v2, :cond_14a

    const-string v3, " \u00b7 \ubcf5\uc2b5 \uc608\uc815"

    :cond_14a
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, v0, Lkr/memorynotes/Ui;->green:I

    invoke-static {v0, v1, v5, v2, v6}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda16;

    invoke-direct {v0, p0, p2}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda16;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    return-void
.end method

.method static iconAction(Lkr/memorynotes/Ui;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;
    .registers 11

    .line 49
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {p0, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {p0, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {p0, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    invoke-virtual {p0, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/widget/Button;->setPadding(IIII)V

    iget v2, p0, Lkr/memorynotes/Ui;->surface:I

    if-eqz p4, :cond_35

    iget v3, p0, Lkr/memorynotes/Ui;->green:I

    const v4, 0x3e23d70a    # 0.16f

    invoke-static {v2, v3, v4}, Lkr/memorynotes/Dashboard;->blend(IIF)I

    move-result v2

    :cond_35
    const/16 v3, 0xe

    invoke-virtual {p0, v2, v3}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v2, Lkr/memorynotes/Dashboard$SymbolDrawable;

    if-eqz p4, :cond_45

    iget p4, p0, Lkr/memorynotes/Ui;->green:I

    goto :goto_47

    :cond_45
    iget p4, p0, Lkr/memorynotes/Ui;->muted:I

    :goto_47
    invoke-direct {v2, p0, p1, p4}, Lkr/memorynotes/Dashboard$SymbolDrawable;-><init>(Lkr/memorynotes/Ui;Ljava/lang/String;I)V

    const/high16 p1, 0x41b00000    # 22.0f

    invoke-virtual {p0, p1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p4

    invoke-virtual {p0, p1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p1

    invoke-virtual {v2, v1, v1, p4, p1}, Lkr/memorynotes/Dashboard$SymbolDrawable;->setBounds(IIII)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1, v2, p1, p1}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance p1, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda2;

    invoke-direct {p1, p3}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 p2, 0x42300000    # 44.0f

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p3

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p0

    invoke-direct {p1, p3, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method static label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .registers 5

    .line 14
    invoke-virtual {p0, p1, p2, p3}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p0

    if-eqz p4, :cond_b

    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_b
    return-object p0
.end method

.method static synthetic lambda$13(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 41
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$16(Lkr/memorynotes/Note;Lkr/memorynotes/MainActivity;)V
    .registers 3

    .line 46
    iget-boolean v0, p0, Lkr/memorynotes/Note;->favorite:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lkr/memorynotes/Note;->favorite:Z

    :try_start_6
    iget-object v0, p1, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {v0, p0}, Lkr/memorynotes/NoteDb;->save(Lkr/memorynotes/Note;)V

    iget-object p0, p1, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_10} :catch_11

    goto :goto_15

    :catch_11
    move-exception p0

    invoke-virtual {p1, p0}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_15
    return-void
.end method

.method static synthetic lambda$17(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Landroid/view/View;)V
    .registers 3

    .line 46
    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->detail(Lkr/memorynotes/Note;)V

    return-void
.end method

.method static synthetic lambda$18(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 48
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$19(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 49
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$9(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 39
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public static nav(Lkr/memorynotes/Ui;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/Button;
    .registers 11

    .line 48
    const-string v0, "\ud648"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "home"

    goto :goto_2e

    :cond_b
    const-string v0, "\uacfc\ubaa9"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string v0, "book"

    goto :goto_2e

    :cond_16
    const-string v0, "\uc624\ub2f5"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    const-string v0, "error"

    goto :goto_2e

    :cond_21
    const-string v0, "\uac80\uc0c9"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    const-string v0, "search"

    goto :goto_2e

    :cond_2c
    const-string v0, "settings"

    :goto_2e
    new-instance v1, Landroid/widget/Button;

    iget-object v2, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v1, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41200000    # 10.0f

    iget v4, p0, Lkr/memorynotes/Ui;->scale:F

    mul-float/2addr v4, v3

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTextSize(F)V

    if-eqz p2, :cond_49

    iget v3, p0, Lkr/memorynotes/Ui;->green:I

    goto :goto_4b

    :cond_49
    iget v3, p0, Lkr/memorynotes/Ui;->muted:I

    :goto_4b
    invoke-virtual {v1, v3}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 v3, 0x42600000    # 56.0f

    invoke-virtual {p0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v3, 0x40000000    # 2.0f

    invoke-virtual {p0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    const/high16 v5, 0x40c00000    # 6.0f

    invoke-virtual {p0, v5}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    invoke-virtual {p0, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    const/high16 v6, 0x40800000    # 4.0f

    invoke-virtual {p0, v6}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v6

    invoke-virtual {v1, v4, v5, v3, v6}, Landroid/widget/Button;->setPadding(IIII)V

    new-instance v3, Lkr/memorynotes/Dashboard$SymbolDrawable;

    if-eqz p2, :cond_7d

    iget v4, p0, Lkr/memorynotes/Ui;->green:I

    goto :goto_7f

    :cond_7d
    iget v4, p0, Lkr/memorynotes/Ui;->muted:I

    :goto_7f
    invoke-direct {v3, p0, v0, v4}, Lkr/memorynotes/Dashboard$SymbolDrawable;-><init>(Lkr/memorynotes/Ui;Ljava/lang/String;I)V

    const/high16 v0, 0x41a80000    # 21.0f

    invoke-virtual {p0, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {p0, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-virtual {v3, v2, v2, v4, v0}, Lkr/memorynotes/Dashboard$SymbolDrawable;->setBounds(IIII)V

    const/4 v0, 0x0

    invoke-virtual {v1, v0, v3, v0, v0}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    const/high16 v0, 0x40400000    # 3.0f

    invoke-virtual {p0, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    if-eqz p2, :cond_aa

    iget p2, p0, Lkr/memorynotes/Ui;->surface:I

    iget v0, p0, Lkr/memorynotes/Ui;->green:I

    const v2, 0x3df5c28f    # 0.12f

    invoke-static {p2, v0, v2}, Lkr/memorynotes/Dashboard;->blend(IIF)I

    move-result p2

    goto :goto_ac

    :cond_aa
    iget p2, p0, Lkr/memorynotes/Ui;->surface:I

    :goto_ac
    const/16 v0, 0xe

    invoke-virtual {p0, p2, v0}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, p1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance p0, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda0;

    invoke-direct {p0, p3}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v1
.end method

.method static pad(Lkr/memorynotes/Ui;Landroid/view/View;I)V
    .registers 6

    .line 15
    int-to-float p2, p2

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p0

    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method static panel(Lkr/memorynotes/Ui;II)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 16
    invoke-virtual {p0, p1, p2}, Lkr/memorynotes/Ui;->shape(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p0, p2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p2

    iget p0, p0, Lkr/memorynotes/Ui;->line:I

    invoke-virtual {p1, p2, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    return-object p1
.end method

.method public static show(Lkr/memorynotes/MainActivity;)V
    .registers 4

    .line 13
    const-string v0, ""

    const/4 v1, 0x1

    const-string v2, "\ub0b4 \ud559\uc2b5 \uacf5\uac04"

    invoke-virtual {p0, v2, v0, v1, v1}, Lkr/memorynotes/MainActivity;->shell(Ljava/lang/String;Ljava/lang/String;ZZ)V

    new-instance v0, Lkr/memorynotes/Dashboard;

    invoke-direct {v0, p0}, Lkr/memorynotes/Dashboard;-><init>(Lkr/memorynotes/MainActivity;)V

    invoke-virtual {v0}, Lkr/memorynotes/Dashboard;->render()V

    return-void
.end method

.method public static track(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V
    .registers 3

    .line 43
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "last.note"

    iget-object p1, p1, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method chip(Landroid/widget/LinearLayout;Ljava/lang/String;ZLjava/lang/Runnable;)V
    .registers 10

    .line 41
    iget-object v0, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    if-eqz p3, :cond_9

    iget v1, v1, Lkr/memorynotes/Ui;->bg:I

    goto :goto_b

    :cond_9
    iget v1, v1, Lkr/memorynotes/Ui;->muted:I

    :goto_b
    const/16 v2, 0xc

    invoke-static {v0, p2, v2, v1, p3}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object p2

    const/16 v0, 0x11

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v1, 0x42200000    # 40.0f

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setMinHeight(I)V

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    iget-object v2, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v3, 0x40c00000    # 6.0f

    invoke-virtual {v2, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v4, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    iget-object v4, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    invoke-virtual {p2, v0, v2, v1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    if-eqz p3, :cond_49

    iget-object p3, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget p3, p3, Lkr/memorynotes/Ui;->green:I

    goto :goto_4d

    :cond_49
    iget-object p3, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget p3, p3, Lkr/memorynotes/Ui;->surface:I

    :goto_4d
    const/16 v1, 0x14

    invoke-static {v0, p3, v1}, Lkr/memorynotes/Dashboard;->panel(Lkr/memorynotes/Ui;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {p3, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    iget-object v1, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    iget-object v3, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3, v2}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p3, v3, v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda3;

    invoke-direct {p1, p4}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$0$kr-memorynotes-Dashboard()V
    .registers 3

    .line 21
    iget-object v0, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    const-string v1, "\uac80\uc0c9"

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$1$kr-memorynotes-Dashboard(I)V
    .registers 5

    .line 30
    const-string v0, ""

    if-lez p1, :cond_b

    iget-object p1, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Lkr/memorynotes/MainActivity;->startReview(ZLjava/lang/String;)V

    goto :goto_13

    :cond_b
    new-instance p1, Lkr/memorynotes/ReviewPicker;

    iget-object v1, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    const/4 v2, 0x0

    invoke-direct {p1, v1, v2, v0}, Lkr/memorynotes/ReviewPicker;-><init>(Lkr/memorynotes/MainActivity;ZLjava/lang/String;)V

    :goto_13
    return-void
.end method

.method synthetic lambda$10$kr-memorynotes-Dashboard(Landroid/widget/LinearLayout;)V
    .registers 3

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lkr/memorynotes/Dashboard;->subject:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/Dashboard;->starred:Z

    invoke-virtual {p0, p1}, Lkr/memorynotes/Dashboard;->rebuildChips(Landroid/widget/LinearLayout;)V

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard;->refresh()V

    return-void
.end method

.method synthetic lambda$11$kr-memorynotes-Dashboard(Landroid/widget/LinearLayout;)V
    .registers 3

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lkr/memorynotes/Dashboard;->subject:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lkr/memorynotes/Dashboard;->starred:Z

    invoke-virtual {p0, p1}, Lkr/memorynotes/Dashboard;->rebuildChips(Landroid/widget/LinearLayout;)V

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard;->refresh()V

    return-void
.end method

.method synthetic lambda$12$kr-memorynotes-Dashboard(Ljava/util/Map$Entry;Landroid/widget/LinearLayout;)V
    .registers 3

    .line 40
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lkr/memorynotes/Dashboard;->subject:Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lkr/memorynotes/Dashboard;->starred:Z

    invoke-virtual {p0, p2}, Lkr/memorynotes/Dashboard;->rebuildChips(Landroid/widget/LinearLayout;)V

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard;->refresh()V

    return-void
.end method

.method synthetic lambda$14$kr-memorynotes-Dashboard(Lkr/memorynotes/Note;)Z
    .registers 4

    .line 42
    iget-object v0, p0, Lkr/memorynotes/Dashboard;->subject:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_12

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->subject:Ljava/lang/String;

    iget-object v1, p1, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    :cond_12
    iget-boolean v0, p0, Lkr/memorynotes/Dashboard;->starred:Z

    if-eqz v0, :cond_1d

    iget-boolean p1, p1, Lkr/memorynotes/Note;->favorite:Z

    if-eqz p1, :cond_1b

    goto :goto_1d

    :cond_1b
    const/4 p1, 0x1

    goto :goto_1e

    :cond_1d
    :goto_1d
    const/4 p1, 0x0

    :goto_1e
    return p1
.end method

.method synthetic lambda$15$kr-memorynotes-Dashboard(Lkr/memorynotes/Note;Lkr/memorynotes/Note;)I
    .registers 12

    .line 42
    iget-boolean v0, p1, Lkr/memorynotes/Note;->favorite:Z

    iget-object v1, p1, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    iget-wide v2, p1, Lkr/memorynotes/Note;->updated:J

    iget-boolean v4, p2, Lkr/memorynotes/Note;->favorite:Z

    iget-object v5, p2, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    iget-wide v6, p2, Lkr/memorynotes/Note;->updated:J

    iget v8, p0, Lkr/memorynotes/Dashboard;->mode:I

    invoke-static/range {v0 .. v8}, Lkr/memorynotes/HomePolicy;->compare(ZLjava/lang/String;JZLjava/lang/String;JI)I

    move-result p1

    return p1
.end method

.method synthetic lambda$2$kr-memorynotes-Dashboard()V
    .registers 5

    .line 30
    new-instance v0, Lkr/memorynotes/ReviewPicker;

    iget-object v1, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    const/4 v2, 0x0

    const-string v3, ""

    invoke-direct {v0, v1, v2, v3}, Lkr/memorynotes/ReviewPicker;-><init>(Lkr/memorynotes/MainActivity;ZLjava/lang/String;)V

    return-void
.end method

.method synthetic lambda$3$kr-memorynotes-Dashboard()V
    .registers 3

    .line 31
    iget-object v0, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->edit(Lkr/memorynotes/Note;)V

    return-void
.end method

.method synthetic lambda$4$kr-memorynotes-Dashboard()V
    .registers 4

    .line 31
    iget-object v0, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v1, v1, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v2, ""

    invoke-virtual {v1, v2}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lkr/memorynotes/MainActivity;->startListening(Ljava/util/ArrayList;)V

    return-void
.end method

.method synthetic lambda$5$kr-memorynotes-Dashboard(Ljava/lang/String;Landroid/view/View;)V
    .registers 4

    .line 33
    :try_start_0
    iget-object p2, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lkr/memorynotes/Note;->from(Lorg/json/JSONObject;)Lkr/memorynotes/Note;

    move-result-object p1

    invoke-virtual {p2, p1}, Lkr/memorynotes/MainActivity;->edit(Lkr/memorynotes/Note;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    goto :goto_15

    :catch_f
    move-exception p1

    iget-object p2, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {p2, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_15
    return-void
.end method

.method synthetic lambda$6$kr-memorynotes-Dashboard(Lkr/memorynotes/Note;Landroid/view/View;)V
    .registers 3

    .line 33
    iget-object p2, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {p2, p1}, Lkr/memorynotes/MainActivity;->detail(Lkr/memorynotes/Note;)V

    return-void
.end method

.method synthetic lambda$7$kr-memorynotes-Dashboard(Landroid/widget/TextView;Landroid/view/View;)V
    .registers 6

    .line 34
    new-instance p2, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {p2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "\ub178\ud2b8 \uc815\ub82c"

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string v0, "\ucd5c\uadfc \uc218\uc815\uc21c"

    const-string v1, "\ubcf5\uc2b5 \uc608\uc815\uc21c"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lkr/memorynotes/Dashboard;->mode:I

    new-instance v2, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda17;

    invoke-direct {v2, p0, p1}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda17;-><init>(Lkr/memorynotes/Dashboard;Landroid/widget/TextView;)V

    invoke-virtual {p2, v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$8$kr-memorynotes-Dashboard(Landroid/widget/TextView;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 34
    iput p3, p0, Lkr/memorynotes/Dashboard;->mode:I

    new-instance v0, Ljava/lang/StringBuilder;

    if-nez p3, :cond_9

    const-string p3, "\ucd5c\uadfc \uc218\uc815\uc21c"

    goto :goto_b

    :cond_9
    const-string p3, "\ubcf5\uc2b5 \uc608\uc815\uc21c"

    :goto_b
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p3, "  \u25be"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard;->refresh()V

    return-void
.end method

.method link(Ljava/lang/String;)Landroid/widget/TextView;
    .registers 6

    .line 38
    iget-object v0, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v1, v1, Lkr/memorynotes/Ui;->green:I

    const/4 v2, 0x1

    const/16 v3, 0xc

    invoke-static {v0, p1, v3, v1, v2}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object p1

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v1, 0x41200000    # 10.0f

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    iget-object v2, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v2, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0, v2, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v1, 0x42300000    # 44.0f

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMinHeight(I)V

    const/16 v0, 0x10

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    return-object p1
.end method

.method quick(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/view/View;
    .registers 10

    .line 39
    iget-object v0, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v1, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->surface:I

    const/16 v3, 0xe

    invoke-static {v1, v2, v3}, Lkr/memorynotes/Dashboard;->panel(Lkr/memorynotes/Ui;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Lkr/memorynotes/Dashboard$Symbol;

    iget-object v2, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v4, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v5, v5, Lkr/memorynotes/Ui;->green:I

    invoke-direct {v1, v2, v4, p1, v5}, Lkr/memorynotes/Dashboard$Symbol;-><init>(Landroid/content/Context;Lkr/memorynotes/Ui;Ljava/lang/String;I)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v2, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v4, 0x41b00000    # 22.0f

    invoke-virtual {v2, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v5, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-direct {p1, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "  "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->ink:I

    const/4 v4, 0x1

    invoke-static {p1, v1, v3, v2, v4}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance p1, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda1;

    invoke-direct {p1, p3}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method rebuildChips(Landroid/widget/LinearLayout;)V
    .registers 7

    .line 40
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->subject:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-boolean v0, p0, Lkr/memorynotes/Dashboard;->starred:Z

    if-nez v0, :cond_11

    const/4 v0, 0x1

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    new-instance v1, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0, p1}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda12;-><init>(Lkr/memorynotes/Dashboard;Landroid/widget/LinearLayout;)V

    const-string v2, "\uc804\uccb4"

    invoke-virtual {p0, p1, v2, v0, v1}, Lkr/memorynotes/Dashboard;->chip(Landroid/widget/LinearLayout;Ljava/lang/String;ZLjava/lang/Runnable;)V

    iget-boolean v0, p0, Lkr/memorynotes/Dashboard;->starred:Z

    new-instance v1, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0, p1}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda13;-><init>(Lkr/memorynotes/Dashboard;Landroid/widget/LinearLayout;)V

    const-string v2, "\uc911\uc694"

    invoke-virtual {p0, p1, v2, v0, v1}, Lkr/memorynotes/Dashboard;->chip(Landroid/widget/LinearLayout;Ljava/lang/String;ZLjava/lang/Runnable;)V

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, "subjects"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/NoteDb;->groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_42

    return-void

    :cond_42
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lkr/memorynotes/Dashboard;->subject:Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    new-instance v4, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda14;

    invoke-direct {v4, p0, v1, p1}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda14;-><init>(Lkr/memorynotes/Dashboard;Ljava/util/Map$Entry;Landroid/widget/LinearLayout;)V

    invoke-virtual {p0, p1, v2, v3, v4}, Lkr/memorynotes/Dashboard;->chip(Landroid/widget/LinearLayout;Ljava/lang/String;ZLjava/lang/Runnable;)V

    goto :goto_3b
.end method

.method refresh()V
    .registers 8

    .line 42
    iget-object v0, p0, Lkr/memorynotes/Dashboard;->list:Landroid/widget/LinearLayout;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lkr/memorynotes/Dashboard;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda18;

    invoke-direct {v1, p0}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda18;-><init>(Lkr/memorynotes/Dashboard;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    new-instance v1, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda19;

    invoke-direct {v1, p0}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda19;-><init>(Lkr/memorynotes/Dashboard;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    iget-object v1, p0, Lkr/memorynotes/Dashboard;->counter:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\ub0b4 \ub178\ud2b8 \u00b7 "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_7c

    iget-object v1, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/Dashboard;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget-boolean v3, p0, Lkr/memorynotes/Dashboard;->starred:Z

    if-eqz v3, :cond_53

    const-string v3, "\uc911\uc694\ud55c \ub178\ud2b8\ub97c \ubaa8\uc544\ubcf4\uc138\uc694"

    goto :goto_55

    :cond_53
    const-string v3, "\uc544\uc9c1 \ub178\ud2b8\uac00 \uc5c6\uc5b4\uc694"

    :goto_55
    iget-object v4, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->ink:I

    const/4 v5, 0x1

    const/16 v6, 0x11

    invoke-static {v2, v3, v6, v4, v5}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget-boolean v3, p0, Lkr/memorynotes/Dashboard;->starred:Z

    if-eqz v3, :cond_6c

    const-string v3, "\ub178\ud2b8 \uc624\ub978\ucabd \ubcc4\uc744 \ub20c\ub7ec \uace0\uc815\ud560 \uc218 \uc788\uc5b4\uc694"

    goto :goto_6e

    :cond_6c
    const-string v3, "\uc0c8 \ub178\ud2b8\uc5d0\uc11c \uccab \ud559\uc2b5 \ub0b4\uc6a9\uc744 \uc815\ub9ac\ud574 \ubcf4\uc138\uc694"

    :goto_6e
    iget-object v4, p0, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->muted:I

    const/4 v5, 0x0

    const/16 v6, 0xd

    invoke-static {v2, v3, v6, v4, v5}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_7c
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_80
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_87

    return-void

    :cond_87
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkr/memorynotes/Note;

    iget-object v2, p0, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v3, p0, Lkr/memorynotes/Dashboard;->list:Landroid/widget/LinearLayout;

    invoke-static {v2, v3, v1}, Lkr/memorynotes/Dashboard;->card(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Lkr/memorynotes/Note;)V

    goto :goto_80
.end method

.method render()V
    .registers 17

    .line 18
    move-object/from16 v1, p0

    iget-object v0, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v0, v0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v2, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-virtual {v2, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v4, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    iget-object v4, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v5, 0x40800000    # 4.0f

    invoke-virtual {v4, v5}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v0, v2, v5, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 20
    iget-object v2, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v3, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v4, 0x41b00000    # 22.0f

    invoke-virtual {v3, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    iget-object v6, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v7, 0x41600000    # 14.0f

    invoke-virtual {v6, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v6

    iget-object v7, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v7, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    iget-object v7, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v8, 0x41200000    # 10.0f

    invoke-virtual {v7, v8}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v7

    invoke-virtual {v2, v3, v6, v4, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 21
    iget-object v3, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v3

    iget-object v4, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v4

    iget-object v6, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget-object v7, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v7, v7, Lkr/memorynotes/Ui;->green:I

    const-string v8, "MEMORY NOTE"

    const/16 v9, 0xb

    const/4 v10, 0x1

    invoke-static {v6, v8, v9, v7, v10}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v6, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget-object v7, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v7, v7, Lkr/memorynotes/Ui;->ink:I

    const-string v8, "\ub0b4 \ud559\uc2b5 \uacf5\uac04"

    const/16 v9, 0x17

    invoke-static {v6, v8, v9, v7, v10}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v6, v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    new-instance v6, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda4;

    invoke-direct {v6, v1}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda4;-><init>(Lkr/memorynotes/Dashboard;)V

    const-string v9, "search"

    const-string v11, "\ub178\ud2b8 \uac80\uc0c9"

    invoke-static {v4, v9, v11, v6, v5}, Lkr/memorynotes/Dashboard;->iconAction(Lkr/memorynotes/Ui;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 22
    iget-object v2, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v2, v2, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v3, ""

    invoke-virtual {v2, v3}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v6, v5

    :goto_ac
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_3b7

    .line 23
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 24
    iget-object v9, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v9, v9, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {v9}, Lkr/memorynotes/NoteDb;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v9

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v11

    invoke-virtual {v11}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v11

    filled-new-array {v11}, [Ljava/lang/String;

    move-result-object v11

    const-string v12, "SELECT DISTINCT note FROM history WHERE day=?"

    invoke-virtual {v9, v12, v11}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 25
    nop

    :goto_d2
    :try_start_d2
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v11
    :try_end_d6
    .catchall {:try_start_d2 .. :try_end_d6} :catchall_3b2

    if-nez v11, :cond_3a7

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 26
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    move v9, v5

    :goto_e0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_38b

    .line 27
    iget-object v4, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4, v0}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v4

    const-string v11, "home.header"

    invoke-virtual {v4, v11}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    iget-object v11, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v12, 0x41900000    # 18.0f

    invoke-virtual {v11, v12}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v11

    iget-object v13, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v14, 0x41800000    # 16.0f

    invoke-virtual {v13, v14}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v13

    iget-object v15, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v15, v12}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    iget-object v15, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v15, v14}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v14

    invoke-virtual {v4, v11, v13, v12, v14}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 28
    iget-object v11, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v11}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v11

    iget-object v12, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v14

    invoke-virtual {v14}, Ljava/time/LocalDate;->getMonthValue()I

    move-result v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v14, "\uc6d4 "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v14

    invoke-virtual {v14}, Ljava/time/LocalDate;->getDayOfMonth()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\uc77c \u00b7 \uc624\ub298\uc758 \ud559\uc2b5"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iget-object v14, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v14, v14, Lkr/memorynotes/Ui;->muted:I

    const/16 v15, 0xc

    invoke-static {v12, v13, v15, v14, v5}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v12

    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v13, v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v12, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v12, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "\ucd1d "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\uac1c"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iget-object v14, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v14, v14, Lkr/memorynotes/Ui;->green:I

    invoke-static {v12, v13, v15, v14, v10}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v4, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v11, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/16 v12, 0x8

    invoke-virtual {v11, v4, v12}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    .line 29
    iget-object v11, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v11}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v11

    iget-object v13, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v13}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v13

    iget-object v14, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    if-nez v6, :cond_19a

    const-string v15, "\uc624\ub298\uc758 \ubcf5\uc2b5\uc744 \ub9c8\ucce4\uc5b4\uc694"

    goto :goto_19c

    :cond_19a
    const-string v15, "\uae30\uc5b5\uc744 \uc313\ub294 \uc2dc\uac04"

    :goto_19c
    iget-object v12, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v12, v12, Lkr/memorynotes/Ui;->ink:I

    const/16 v7, 0x15

    invoke-static {v14, v15, v7, v12, v10}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v7

    invoke-virtual {v13, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v7, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    if-nez v6, :cond_1b0

    const-string v12, "\ub2e4\ub978 \ubc94\uc704\ub3c4 \uc790\uc720\ub86d\uac8c \ubcf5\uc2b5\ud574 \ubcf4\uc138\uc694"

    goto :goto_1c5

    :cond_1b0
    new-instance v12, Ljava/lang/StringBuilder;

    const-string v14, "\ubcf5\uc2b5\ud560 \ub178\ud2b8 "

    invoke-direct {v12, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v14, "\uac1c\uac00 \uae30\ub2e4\ub9ac\uace0 \uc788\uc5b4\uc694"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    :goto_1c5
    iget-object v14, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v14, v14, Lkr/memorynotes/Ui;->muted:I

    const/16 v15, 0xd

    invoke-static {v7, v12, v15, v14, v5}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v7

    const-string v12, "home.summary"

    invoke-virtual {v7, v12}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v13, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    invoke-direct {v7, v5, v12, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v13, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v7, Lkr/memorynotes/Dashboard$Ring;

    iget-object v12, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    iget-object v13, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-static {v9, v6}, Lkr/memorynotes/HomePolicy;->progress(II)I

    move-result v9

    invoke-direct {v7, v12, v13, v9}, Lkr/memorynotes/Dashboard$Ring;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Ui;I)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v12, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v13, 0x42780000    # 62.0f

    invoke-virtual {v12, v13}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    iget-object v14, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v14, v13}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v13

    invoke-direct {v9, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v7, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/16 v9, 0xa

    invoke-virtual {v7, v4, v9}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    .line 30
    iget-object v7, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v7}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v7

    iget-object v9, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    if-lez v6, :cond_21a

    const-string v11, "\ubcf5\uc2b5 \uc2dc\uc791  \u2192"

    goto :goto_21c

    :cond_21a
    const-string v11, "\uc804\uccb4 \ubcf5\uc2b5  \u2192"

    :goto_21c
    new-instance v12, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda5;

    invoke-direct {v12, v1, v6}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda5;-><init>(Lkr/memorynotes/Dashboard;I)V

    invoke-virtual {v9, v11, v12}, Lkr/memorynotes/Ui;->primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v6

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, -0x2

    invoke-direct {v9, v5, v11, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v6, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    new-instance v9, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda6;

    invoke-direct {v9, v1}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda6;-><init>(Lkr/memorynotes/Dashboard;)V

    const-string v12, "\ubc94\uc704 \uc120\ud0dd"

    invoke-virtual {v6, v12, v9}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v6

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v12, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v13, 0x42d00000    # 104.0f

    invoke-virtual {v12, v13}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v12

    invoke-direct {v9, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v11, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v12, 0x41000000    # 8.0f

    invoke-virtual {v11, v12}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v11

    iput v11, v9, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v7, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 31
    iget-object v4, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v4

    new-instance v6, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda7;

    invoke-direct {v6, v1}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda7;-><init>(Lkr/memorynotes/Dashboard;)V

    const-string v7, "plus"

    const-string v9, "\uc0c8 \ub178\ud2b8"

    invoke-virtual {v1, v7, v9, v6}, Lkr/memorynotes/Dashboard;->quick(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/view/View;

    move-result-object v6

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v9, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/high16 v11, 0x42480000    # 50.0f

    invoke-virtual {v9, v11}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v9

    invoke-direct {v7, v5, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v7, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v7, v11}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v7

    invoke-direct {v6, v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iget-object v7, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v7, v12}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v7

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    new-instance v7, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda8;

    invoke-direct {v7, v1}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda8;-><init>(Lkr/memorynotes/Dashboard;)V

    const-string v9, "audio"

    const-string v11, "\uc77d\uc5b4\uc8fc\uae30"

    invoke-virtual {v1, v9, v11, v7}, Lkr/memorynotes/Dashboard;->quick(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v4, v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v4, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    const/16 v6, 0x8

    invoke-virtual {v4, v0, v6}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    .line 32
    iget-object v4, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v4, v5}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v6, "draft"

    invoke-interface {v4, v6, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v6, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v6, v5}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v7, "last.note"

    invoke-interface {v6, v7, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 33
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2d8

    const-string v3, "\uc791\uc131 \uc911\uc778 \ub178\ud2b8 \uc774\uc5b4\uc4f0\uae30  \u2192"

    invoke-virtual {v1, v3}, Lkr/memorynotes/Dashboard;->link(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    new-instance v6, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda9;

    invoke-direct {v6, v1, v4}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda9;-><init>(Lkr/memorynotes/Dashboard;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_31d

    :cond_2d8
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2dc
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2e3

    goto :goto_31d

    :cond_2e3
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkr/memorynotes/Note;

    iget-object v4, v3, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_388

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "\ucd5c\uadfc \ub178\ud2b8 \uc774\uc5b4\ubcf4\uae30  \u2192  "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v3, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-static {v6}, Lkr/memorynotes/HomePolicy;->preview(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lkr/memorynotes/Dashboard;->link(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v6, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda10;

    invoke-direct {v6, v1, v3}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda10;-><init>(Lkr/memorynotes/Dashboard;Lkr/memorynotes/Note;)V

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 34
    :goto_31d
    iget-object v3, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v3

    iget-object v4, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "\ub0b4 \ub178\ud2b8 \u00b7 "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v6, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    iget v6, v6, Lkr/memorynotes/Ui;->ink:I

    const/16 v7, 0x10

    invoke-static {v4, v2, v7, v6, v10}, Lkr/memorynotes/Dashboard;->label(Lkr/memorynotes/Ui;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    iput-object v2, v1, Lkr/memorynotes/Dashboard;->counter:Landroid/widget/TextView;

    iget-object v2, v1, Lkr/memorynotes/Dashboard;->counter:Landroid/widget/TextView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v13, -0x2

    invoke-direct {v4, v5, v13, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v2, "\ucd5c\uadfc \uc218\uc815\uc21c  \u25be"

    invoke-virtual {v1, v2}, Lkr/memorynotes/Dashboard;->link(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    new-instance v4, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda11;

    invoke-direct {v4, v1, v2}, Lkr/memorynotes/Dashboard$$ExternalSyntheticLambda11;-><init>(Lkr/memorynotes/Dashboard;Landroid/widget/TextView;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 35
    new-instance v2, Landroid/widget/HorizontalScrollView;

    iget-object v3, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    invoke-direct {v2, v3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v5}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    iget-object v3, v1, Lkr/memorynotes/Dashboard;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v3}, Lkr/memorynotes/Dashboard;->rebuildChips(Landroid/widget/LinearLayout;)V

    .line 36
    iget-object v2, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v2, v0}, Lkr/memorynotes/MainActivity;->scrollingNotes(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, v1, Lkr/memorynotes/Dashboard;->list:Landroid/widget/LinearLayout;

    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/Dashboard;->refresh()V

    .line 37
    return-void

    .line 33
    :cond_388
    const/4 v13, -0x2

    goto/16 :goto_2dc

    .line 26
    :cond_38b
    move v13, v7

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkr/memorynotes/Note;

    iget-object v12, v7, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v4, v12}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3a4

    iget-object v12, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v12, v7}, Lkr/memorynotes/MainActivity;->due(Lkr/memorynotes/Note;)Z

    move-result v7

    if-nez v7, :cond_3a4

    add-int/lit8 v9, v9, 0x1

    :cond_3a4
    move v7, v13

    goto/16 :goto_e0

    .line 25
    :cond_3a7
    move v13, v7

    :try_start_3a8
    invoke-interface {v9, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_3af
    .catchall {:try_start_3a8 .. :try_end_3af} :catchall_3b2

    move v7, v13

    goto/16 :goto_d2

    :catchall_3b2
    move-exception v0

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v0

    .line 22
    :cond_3b7
    move v13, v7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkr/memorynotes/Note;

    iget-object v9, v1, Lkr/memorynotes/Dashboard;->a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v9, v7}, Lkr/memorynotes/MainActivity;->due(Lkr/memorynotes/Note;)Z

    move-result v7

    if-eqz v7, :cond_3c8

    add-int/lit8 v6, v6, 0x1

    :cond_3c8
    move v7, v13

    goto/16 :goto_ac
.end method
