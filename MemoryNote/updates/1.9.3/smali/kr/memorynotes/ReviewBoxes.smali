.class public final Lkr/memorynotes/ReviewBoxes;
.super Ljava/lang/Object;
.source "ReviewBoxes.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Lkr/memorynotes/MainActivity;)V
    .locals 4

    .line 6
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v1, "ink:question"

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v1, "ink:body"

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 7
    :cond_0
    if-nez v0, :cond_1

    return-void

    .line 9
    :cond_1
    nop

    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    if-eq v1, v2, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    .line 10
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const/4 v3, 0x0

    if-ne v1, v2, :cond_3

    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 11
    :cond_3
    const-string v0, "question"

    const-string v1, "\ubb38\uc81c \u00b7 \uc9c8\ubb38"

    invoke-static {p0, v0, v1, v3}, Lkr/memorynotes/ReviewBoxes;->wrap(Lkr/memorynotes/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "answer"

    const-string v1, "\uc815\ub2f5 \u00b7 \ud574\uc124"

    invoke-static {p0, v0, v1, v3}, Lkr/memorynotes/ReviewBoxes;->wrap(Lkr/memorynotes/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "body"

    const-string v1, "\ub0b4\uc6a9"

    invoke-static {p0, v0, v1, v3}, Lkr/memorynotes/ReviewBoxes;->wrap(Lkr/memorynotes/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V

    .line 12
    const-string v0, "\ub0b4 \ub2f5"

    const/4 v1, 0x3

    const-string v2, "mine"

    invoke-static {p0, v2, v0, v1}, Lkr/memorynotes/ReviewBoxes;->wrap(Lkr/memorynotes/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "\ud2c0\ub9b0 \uc810"

    const/4 v1, 0x1

    const-string v2, "reason"

    invoke-static {p0, v2, v0, v1}, Lkr/memorynotes/ReviewBoxes;->wrap(Lkr/memorynotes/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "\uc8fc\uc758\uc0ac\ud56d"

    const/4 v1, 0x2

    const-string v2, "caution"

    invoke-static {p0, v2, v0, v1}, Lkr/memorynotes/ReviewBoxes;->wrap(Lkr/memorynotes/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V

    .line 13
    new-instance v0, Lkr/memorynotes/DetailLayout;

    invoke-direct {v0, p0}, Lkr/memorynotes/DetailLayout;-><init>(Lkr/memorynotes/MainActivity;)V

    iget-object p0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Lkr/memorynotes/DetailLayout;->styleSections(Landroid/view/ViewGroup;)V

    .line 14
    return-void
.end method

.method static textSize(Landroid/view/View;F)V
    .locals 2

    .line 25
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Lkr/memorynotes/ReviewBoxes;->textSize(Landroid/view/View;F)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method static wrap(Lkr/memorynotes/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 8

    .line 16
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ink:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    goto/16 :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "review:box"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 18
    :cond_1
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 19
    if-lez v1, :cond_3

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/TextView;

    if-eqz v4, :cond_3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "\uc815\ub2f5 \u00b7 \ud574\uc124"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "\ub0b4 \ub2f5"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "\ud2c0\ub9b0 \uc774\uc720"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "\ub2e4\uc74c\uc5d0 \ud655\uc778\ud560 \uac83"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    :cond_2
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    add-int/lit8 v1, v1, -0x1

    .line 20
    :cond_3
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3, v0, p2, p3}, Lkr/memorynotes/Ui;->section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object p2

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 21
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    invoke-virtual {v0, p3}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v6, 0x40a00000    # 5.0f

    invoke-virtual {v5, v6}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    iget-object v6, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v7, 0x41400000    # 12.0f

    invoke-virtual {v6, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v2, v7, v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v0, p3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 23
    iget-object p0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget p0, p0, Lkr/memorynotes/Ui;->scale:F

    const/high16 p3, 0x41900000    # 18.0f

    mul-float/2addr p0, p3

    invoke-static {p1, p0}, Lkr/memorynotes/ReviewBoxes;->textSize(Landroid/view/View;F)V

    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    return-void

    .line 16
    :cond_4
    :goto_0
    return-void
.end method
