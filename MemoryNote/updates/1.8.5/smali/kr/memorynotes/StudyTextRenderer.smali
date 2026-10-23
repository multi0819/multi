.class final Lkr/memorynotes/StudyTextRenderer;
.super Ljava/lang/Object;
.source "StudyTextRenderer.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendText(Lkr/memorynotes/Ui;Landroid/widget/LinearLayout;Ljava/lang/CharSequence;I)V
    .registers 6

    .line 63
    invoke-static {p2}, Lkr/memorynotes/ImageSpacing;->visibleLength(Ljava/lang/CharSequence;)I

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    const-string v0, ""

    iget v1, p0, Lkr/memorynotes/Ui;->ink:I

    invoke-virtual {p0, v0, p3, v1}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p0

    sget-object p3, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {p0, p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, -0x1

    const/4 v0, -0x2

    invoke-direct {p2, p3, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    return-void
.end method

.method static content(Lkr/memorynotes/Ui;Ljava/lang/String;IZZ)Landroid/view/View;
    .registers 11

    .line 39
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lkr/memorynotes/StudyTextRenderer;->content(Lkr/memorynotes/Ui;Ljava/lang/String;IZZLorg/json/JSONArray;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static content(Lkr/memorynotes/Ui;Ljava/lang/String;IZZLorg/json/JSONArray;)Landroid/view/View;
    .registers 19

    .line 41
    invoke-static {p1}, Lkr/memorynotes/InlineImageText;->files(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-static/range {p0 .. p5}, Lkr/memorynotes/StudyTextRenderer;->create(Lkr/memorynotes/Ui;Ljava/lang/String;IZZLorg/json/JSONArray;)Landroid/widget/TextView;

    move-result-object v0

    return-object v0

    .line 42
    :cond_f
    invoke-virtual {p0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    const/4 v1, 0x1

    new-array v11, v1, [Ljava/lang/Runnable;

    .line 43
    new-instance v12, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;

    move-object v1, v12

    move-object v2, v0

    move-object v3, p0

    move-object v4, p1

    move/from16 v5, p3

    move/from16 v6, p4

    move-object v8, v11

    move-object/from16 v9, p5

    move v10, p2

    invoke-direct/range {v1 .. v10}, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;-><init>(Landroid/widget/LinearLayout;Lkr/memorynotes/Ui;Ljava/lang/String;ZZLjava/util/Set;[Ljava/lang/Runnable;Lorg/json/JSONArray;I)V

    const/4 v1, 0x0

    aput-object v12, v11, v1

    .line 60
    aget-object v1, v11, v1

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    return-object v0
.end method

.method static create(Lkr/memorynotes/Ui;Ljava/lang/String;IZZ)Landroid/widget/TextView;
    .registers 11

    .line 13
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lkr/memorynotes/StudyTextRenderer;->create(Lkr/memorynotes/Ui;Ljava/lang/String;IZZLorg/json/JSONArray;)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static create(Lkr/memorynotes/Ui;Ljava/lang/String;IZZLorg/json/JSONArray;)Landroid/widget/TextView;
    .registers 15

    .line 15
    const-string v0, ""

    iget v1, p0, Lkr/memorynotes/Ui;->ink:I

    invoke-virtual {p0, v0, p2, v1}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 16
    move-object v2, p0

    move-object v3, p2

    move-object v4, p1

    move v5, p3

    move v6, p4

    move-object v8, p5

    invoke-static/range {v2 .. v8}, Lkr/memorynotes/StudyTextRenderer;->render(Lkr/memorynotes/Ui;Landroid/widget/TextView;Ljava/lang/String;ZZLjava/util/Set;Lorg/json/JSONArray;)V

    invoke-static {p0, p2, p4}, Lkr/memorynotes/InlineImages;->bind(Lkr/memorynotes/Ui;Landroid/widget/TextView;Z)V

    return-object p2
.end method

.method static editor(Lkr/memorynotes/Ui;Landroid/widget/EditText;Z)V
    .registers 4

    .line 66
    new-instance v0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda1;

    invoke-direct {v0, p1, p0, p2}, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda1;-><init>(Landroid/widget/EditText;Lkr/memorynotes/Ui;Z)V

    .line 77
    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Lkr/memorynotes/InlineImages;->bind(Lkr/memorynotes/Ui;Landroid/widget/TextView;Z)V

    .line 78
    new-instance p0, Lkr/memorynotes/StudyTextRenderer$2;

    invoke-direct {p0, v0}, Lkr/memorynotes/StudyTextRenderer$2;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 79
    return-void
.end method

.method private static format(Lkr/memorynotes/Ui;Ljava/lang/String;ZZLjava/util/Set;Ljava/lang/Runnable;Lorg/json/JSONArray;)Landroid/text/SpannableStringBuilder;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkr/memorynotes/Ui;",
            "Ljava/lang/String;",
            "ZZ",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/Runnable;",
            "Lorg/json/JSONArray;",
            ")",
            "Landroid/text/SpannableStringBuilder;"
        }
    .end annotation

    .line 23
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 24
    const/4 v1, 0x0

    invoke-static {p1, v1, p2}, Lkr/memorynotes/StudyText;->parts(Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_e
    :goto_e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-nez p2, :cond_15

    .line 36
    return-object v0

    .line 24
    :cond_15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkr/memorynotes/StudyText$Part;

    .line 25
    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eqz p3, :cond_31

    iget v4, p2, Lkr/memorynotes/StudyText$Part;->kind:I

    if-ne v4, v3, :cond_31

    iget v4, p2, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p4, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_31

    move v4, v2

    goto :goto_32

    :cond_31
    move v4, v1

    .line 26
    :goto_32
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    if-eqz v4, :cond_3b

    const-string v6, "[\u2022\u2022\u2022]"

    goto :goto_3d

    :cond_3b
    iget-object v6, p2, Lkr/memorynotes/StudyText$Part;->text:Ljava/lang/String;

    :goto_3d
    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    .line 27
    iget v7, p2, Lkr/memorynotes/StudyText$Part;->kind:I

    if-ne v7, v3, :cond_4b

    iget v7, p0, Lkr/memorynotes/Ui;->clozeColor:I

    goto :goto_54

    :cond_4b
    iget v7, p2, Lkr/memorynotes/StudyText$Part;->kind:I

    if-ne v7, v2, :cond_52

    iget v7, p0, Lkr/memorynotes/Ui;->answerColor:I

    goto :goto_54

    :cond_52
    iget v7, p0, Lkr/memorynotes/Ui;->ink:I

    .line 28
    :goto_54
    new-instance v8, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v8, v7}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v7, 0x21

    invoke-virtual {v0, v8, v5, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 29
    iget v8, p2, Lkr/memorynotes/StudyText$Part;->kind:I

    if-ne v8, v3, :cond_7e

    .line 30
    new-instance v3, Landroid/text/style/StyleSpan;

    invoke-direct {v3, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v0, v3, v5, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 31
    if-eqz v4, :cond_7e

    new-instance v2, Landroid/text/style/BackgroundColorSpan;

    iget v3, p0, Lkr/memorynotes/Ui;->clozeTint:I

    invoke-direct {v2, v3}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    invoke-virtual {v0, v2, v5, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 32
    new-instance v2, Lkr/memorynotes/StudyTextRenderer$1;

    invoke-direct {v2, p4, p2, p5, p0}, Lkr/memorynotes/StudyTextRenderer$1;-><init>(Ljava/util/Set;Lkr/memorynotes/StudyText$Part;Ljava/lang/Runnable;Lkr/memorynotes/Ui;)V

    invoke-virtual {v0, v2, v5, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 34
    :cond_7e
    if-nez v4, :cond_e

    iget v2, p2, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    iget p2, p2, Lkr/memorynotes/StudyText$Part;->sourceEnd:I

    invoke-static {v0, p6, v2, p2, v5}, Lkr/memorynotes/ColorText;->append(Landroid/text/SpannableStringBuilder;Lorg/json/JSONArray;III)V

    goto :goto_e
.end method

.method static synthetic lambda$0(Lkr/memorynotes/Ui;Landroid/widget/TextView;Ljava/lang/String;ZZLjava/util/Set;Lorg/json/JSONArray;)V
    .registers 7

    .line 19
    invoke-static/range {p0 .. p6}, Lkr/memorynotes/StudyTextRenderer;->render(Lkr/memorynotes/Ui;Landroid/widget/TextView;Ljava/lang/String;ZZLjava/util/Set;Lorg/json/JSONArray;)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/widget/LinearLayout;Lkr/memorynotes/Ui;Ljava/lang/String;ZZLjava/util/Set;[Ljava/lang/Runnable;Lorg/json/JSONArray;I)V
    .registers 16

    .line 44
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    new-instance v5, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda3;

    invoke-direct {v5, p6}, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda3;-><init>([Ljava/lang/Runnable;)V

    move-object v0, p1

    move-object v1, p2

    move v2, p3

    move v3, p4

    move-object v4, p5

    move-object v6, p7

    invoke-static/range {v0 .. v6}, Lkr/memorynotes/StudyTextRenderer;->format(Lkr/memorynotes/Ui;Ljava/lang/String;ZZLjava/util/Set;Ljava/lang/Runnable;Lorg/json/JSONArray;)Landroid/text/SpannableStringBuilder;

    move-result-object p2

    .line 45
    sget-object p3, Lkr/memorynotes/InlineImageText;->PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {p3, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p3

    .line 46
    const/4 p5, 0x0

    move p6, p5

    :goto_1a
    invoke-virtual {p3}, Ljava/util/regex/Matcher;->find()Z

    move-result p7

    if-nez p7, :cond_2c

    .line 58
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p3

    invoke-virtual {p2, p6, p3}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p1, p0, p2, p8}, Lkr/memorynotes/StudyTextRenderer;->appendText(Lkr/memorynotes/Ui;Landroid/widget/LinearLayout;Ljava/lang/CharSequence;I)V

    .line 59
    return-void

    .line 47
    :cond_2c
    invoke-virtual {p3}, Ljava/util/regex/Matcher;->start()I

    move-result p7

    invoke-virtual {p2, p6, p7}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p6

    invoke-static {p1, p0, p6, p8}, Lkr/memorynotes/StudyTextRenderer;->appendText(Lkr/memorynotes/Ui;Landroid/widget/LinearLayout;Ljava/lang/CharSequence;I)V

    .line 48
    const/4 p6, 0x1

    invoke-virtual {p3, p6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p7

    .line 49
    move v0, p5

    :goto_3d
    iget-object v1, p1, Lkr/memorynotes/Ui;->pictures:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    const-string v2, "file"

    if-lt v0, v1, :cond_49

    const/4 v0, 0x0

    goto :goto_5c

    :cond_49
    iget-object v1, p1, Lkr/memorynotes/Ui;->pictures:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_9e

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9e

    move-object v0, v1

    .line 50
    :goto_5c
    if-nez v0, :cond_72

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_63
    invoke-virtual {v0, v2, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "masks"

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_70
    .catch Lorg/json/JSONException; {:try_start_63 .. :try_end_70} :catch_71

    goto :goto_72

    :catch_71
    move-exception v1

    .line 51
    :cond_72
    :goto_72
    nop

    .line 52
    new-instance v1, Lkr/memorynotes/ImageMaskView;

    iget-object v2, p1, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {v1, v2, v0, p4, p5}, Lkr/memorynotes/ImageMaskView;-><init>(Landroid/content/Context;Lorg/json/JSONObject;ZZ)V

    .line 53
    iput-boolean p6, v1, Lkr/memorynotes/ImageMaskView;->fitContentWidth:Z

    new-instance p6, Ljava/lang/StringBuilder;

    const-string v2, "ink:image:"

    invoke-direct {p6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p6, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p6

    invoke-virtual {v1, p6}, Lkr/memorynotes/ImageMaskView;->setTag(Ljava/lang/Object;)V

    .line 54
    new-instance p6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p7, -0x1

    const/4 v2, -0x2

    invoke-direct {p6, p7, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, p6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    invoke-virtual {p3}, Ljava/util/regex/Matcher;->end()I

    move-result p6

    goto/16 :goto_1a

    .line 49
    :cond_9e
    add-int/lit8 v0, v0, 0x1

    goto :goto_3d
.end method

.method static synthetic lambda$2([Ljava/lang/Runnable;)V
    .registers 2

    .line 44
    const/4 v0, 0x0

    aget-object p0, p0, v0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$3(Lkr/memorynotes/Ui;Lorg/json/JSONObject;Z)V
    .registers 5

    .line 55
    iget-object p0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    check-cast p0, Lkr/memorynotes/MainActivity;

    new-instance v0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda2;-><init>()V

    const/4 v1, 0x0

    invoke-static {p0, p1, v1, v0, p2}, Lkr/memorynotes/ImageMaskView;->dialog(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;ZLjava/lang/Runnable;Z)V

    return-void
.end method

.method static synthetic lambda$4()V
    .registers 0

    .line 55
    return-void
.end method

.method static synthetic lambda$5(Landroid/widget/EditText;Lkr/memorynotes/Ui;Z)V
    .registers 12

    .line 67
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v1

    const-class v2, Landroid/text/style/ForegroundColorSpan;

    const/4 v3, 0x0

    invoke-interface {v0, v3, v1, v2}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/text/style/ForegroundColorSpan;

    array-length v2, v1

    move v4, v3

    :goto_13
    if-lt v4, v2, :cond_99

    .line 68
    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v1

    const-class v2, Landroid/text/style/StyleSpan;

    invoke-interface {v0, v3, v1, v2}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, [Landroid/text/style/StyleSpan;

    array-length v6, v5

    move v1, v3

    :goto_24
    if-lt v1, v6, :cond_91

    .line 69
    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v1

    const/16 v2, 0x21

    if-lez v1, :cond_3c

    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    iget v4, p1, Lkr/memorynotes/Ui;->ink:I

    invoke-direct {v1, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v4

    invoke-interface {v0, v1, v3, v4, v2}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    .line 70
    :cond_3c
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3, p2}, Lkr/memorynotes/StudyText;->parts(Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_48
    :goto_48
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-nez p2, :cond_55

    .line 75
    invoke-static {p1, p0, v0, v3}, Lkr/memorynotes/InlineImages;->apply(Lkr/memorynotes/Ui;Landroid/widget/TextView;Landroid/text/Spannable;Z)V

    invoke-static {v0}, Lkr/memorynotes/ColorText;->refresh(Landroid/text/Editable;)V

    .line 76
    return-void

    .line 70
    :cond_55
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkr/memorynotes/StudyText$Part;

    .line 71
    iget v1, p2, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    iget v5, p2, Lkr/memorynotes/StudyText$Part;->sourceEnd:I

    if-ne v1, v5, :cond_62

    goto :goto_48

    .line 72
    :cond_62
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    iget v5, p2, Lkr/memorynotes/StudyText$Part;->kind:I

    const/4 v6, 0x2

    const/4 v7, 0x1

    if-ne v5, v6, :cond_6d

    iget v5, p1, Lkr/memorynotes/Ui;->clozeColor:I

    goto :goto_76

    :cond_6d
    iget v5, p2, Lkr/memorynotes/StudyText$Part;->kind:I

    if-ne v5, v7, :cond_74

    iget v5, p1, Lkr/memorynotes/Ui;->answerColor:I

    goto :goto_76

    :cond_74
    iget v5, p1, Lkr/memorynotes/Ui;->ink:I

    :goto_76
    invoke-direct {v1, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    iget v5, p2, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    iget v8, p2, Lkr/memorynotes/StudyText$Part;->sourceEnd:I

    invoke-interface {v0, v1, v5, v8, v2}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    .line 73
    iget v1, p2, Lkr/memorynotes/StudyText$Part;->kind:I

    if-ne v1, v6, :cond_48

    new-instance v1, Landroid/text/style/StyleSpan;

    invoke-direct {v1, v7}, Landroid/text/style/StyleSpan;-><init>(I)V

    iget v5, p2, Lkr/memorynotes/StudyText$Part;->sourceStart:I

    iget p2, p2, Lkr/memorynotes/StudyText$Part;->sourceEnd:I

    invoke-interface {v0, v1, v5, p2, v2}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_48

    .line 68
    :cond_91
    aget-object v2, v5, v1

    invoke-interface {v0, v2}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    .line 67
    :cond_99
    aget-object v5, v1, v4

    invoke-interface {v0, v5}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_13
.end method

.method private static render(Lkr/memorynotes/Ui;Landroid/widget/TextView;Ljava/lang/String;ZZLjava/util/Set;Lorg/json/JSONArray;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkr/memorynotes/Ui;",
            "Landroid/widget/TextView;",
            "Ljava/lang/String;",
            "ZZ",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Lorg/json/JSONArray;",
            ")V"
        }
    .end annotation

    .line 19
    new-instance v8, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;

    move-object v0, v8

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;-><init>(Lkr/memorynotes/Ui;Landroid/widget/TextView;Ljava/lang/String;ZZLjava/util/Set;Lorg/json/JSONArray;)V

    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move v3, p4

    move-object v4, p5

    move-object v5, v8

    move-object v6, p6

    invoke-static/range {v0 .. v6}, Lkr/memorynotes/StudyTextRenderer;->format(Lkr/memorynotes/Ui;Ljava/lang/String;ZZLjava/util/Set;Ljava/lang/Runnable;Lorg/json/JSONArray;)Landroid/text/SpannableStringBuilder;

    move-result-object p2

    .line 20
    sget-object p3, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {p1, p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    check-cast p2, Landroid/text/Spannable;

    invoke-static {p0, p1, p2, p4}, Lkr/memorynotes/InlineImages;->apply(Lkr/memorynotes/Ui;Landroid/widget/TextView;Landroid/text/Spannable;Z)V

    if-eqz p4, :cond_2f

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 21
    :cond_2f
    return-void
.end method
