.class final Lkr/memorynotes/ColorText;
.super Ljava/lang/Object;
.source "ColorText.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkr/memorynotes/ColorText$Tint;
    }
.end annotation


# static fields
.field static final COLORS:[I

.field static final NAMES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .line 4
    const-string v4, "\ubcf4\ub77c"

    const-string v5, "\uae30\ubcf8\uc0c9\uc73c\ub85c \ub418\ub3cc\ub9ac\uae30"

    const-string v0, "\ube68\uac15"

    const-string v1, "\uc8fc\ud669"

    const-string v2, "\ucd08\ub85d"

    const-string v3, "\ud30c\ub791"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lkr/memorynotes/ColorText;->NAMES:[Ljava/lang/String;

    .line 5
    const v0, -0x996012

    const v1, -0x527c2a

    const v2, -0x189088

    const v3, -0x236cba

    const v4, -0xa85777

    filled-new-array {v2, v3, v4, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lkr/memorynotes/ColorText;->COLORS:[I

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static append(Landroid/text/SpannableStringBuilder;Lorg/json/JSONArray;III)V
    .registers 11

    .line 14
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_8

    return-void

    :cond_8
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-nez v1, :cond_f

    goto :goto_39

    :cond_f
    const-string v2, "start"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {p2, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const-string v3, "end"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {p3, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-le v3, v2, :cond_39

    new-instance v4, Lkr/memorynotes/ColorText$Tint;

    const-string v5, "color"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct {v4, v1}, Lkr/memorynotes/ColorText$Tint;-><init>(I)V

    add-int/2addr v2, p4

    sub-int/2addr v2, p2

    add-int/2addr v3, p4

    sub-int/2addr v3, p2

    const/16 v1, 0x21

    invoke-virtual {p0, v4, v2, v3, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_39
    :goto_39
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method static apply(Landroid/text/Spannable;Lorg/json/JSONArray;)V
    .registers 9

    .line 9
    invoke-interface {p0}, Landroid/text/Spannable;->length()I

    move-result v0

    const-class v1, Lkr/memorynotes/ColorText$Tint;

    const/4 v2, 0x0

    invoke-interface {p0, v2, v0, v1}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkr/memorynotes/ColorText$Tint;

    array-length v1, v0

    move v3, v2

    :goto_f
    if-lt v3, v1, :cond_4d

    move v0, v2

    :goto_12
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_19

    return-void

    :cond_19
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-nez v1, :cond_20

    goto :goto_4a

    :cond_20
    const-string v3, "start"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-interface {p0}, Landroid/text/Spannable;->length()I

    move-result v4

    const-string v5, "end"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    if-le v4, v3, :cond_4a

    new-instance v5, Lkr/memorynotes/ColorText$Tint;

    const-string v6, "color"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct {v5, v1}, Lkr/memorynotes/ColorText$Tint;-><init>(I)V

    const/16 v1, 0x21

    invoke-interface {p0, v5, v3, v4, v1}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    :cond_4a
    :goto_4a
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    :cond_4d
    aget-object v4, v0, v3

    invoke-interface {p0, v4}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_f
.end method

.method static bind(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;Ljava/lang/Runnable;Z)V
    .registers 13

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ink:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_1c

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Landroid/widget/EditText;->setAutoHandwritingEnabled(Z)V

    :cond_1c
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {p1, p2}, Lkr/memorynotes/ColorText;->ranges(Lkr/memorynotes/Note;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-static {v0, v1}, Lkr/memorynotes/ColorText;->apply(Landroid/text/Spannable;Lorg/json/JSONArray;)V

    new-instance v0, Lkr/memorynotes/ColorText$1;

    invoke-direct {v0, p1, p2, p3}, Lkr/memorynotes/ColorText$1;-><init>(Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;)V

    invoke-virtual {p3, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    if-eqz p5, :cond_3f

    new-instance p5, Lkr/memorynotes/ColorText$2;

    move-object v1, p5

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lkr/memorynotes/ColorText$2;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;Ljava/lang/Runnable;)V

    invoke-virtual {p3, p5}, Landroid/widget/EditText;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    :cond_3f
    return-void
.end method

.method static choose(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;Ljava/lang/Runnable;)V
    .registers 14

    .line 13
    invoke-virtual {p3}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    invoke-virtual {p3}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-virtual {p3}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    invoke-virtual {p3}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v7

    if-ltz v6, :cond_3c

    if-gt v7, v6, :cond_1d

    goto :goto_3c

    :cond_1d
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p0, "\uc120\ud0dd\ud55c \uae00\uc790\uc0c9"

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    sget-object v0, Lkr/memorynotes/ColorText;->NAMES:[Ljava/lang/String;

    new-instance v1, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;

    move-object v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v8, p4

    invoke-direct/range {v2 .. v8}, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;IILjava/lang/Runnable;)V

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    :cond_3c
    :goto_3c
    iget-object p0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string p1, "\uba3c\uc800 \uc0c9\uc744 \ubc14\uafc0 \uae00\uc790\ub97c \uae38\uac8c \ub20c\ub7ec \ube14\ub85d\uc73c\ub85c \uc120\ud0dd\ud558\uc138\uc694."

    invoke-virtual {p0, p1}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void
.end method

.method static collect(Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;)V
    .registers 10

    .line 10
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    invoke-interface {p2}, Landroid/text/Editable;->length()I

    move-result v1

    const-class v2, Lkr/memorynotes/ColorText$Tint;

    const/4 v3, 0x0

    invoke-interface {p2, v3, v1, v2}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lkr/memorynotes/ColorText$Tint;

    array-length v2, v1

    :goto_17
    if-lt v3, v2, :cond_1d

    invoke-static {p0, p1, v0}, Lkr/memorynotes/ColorText;->store(Lkr/memorynotes/Note;Ljava/lang/String;Lorg/json/JSONArray;)V

    return-void

    :cond_1d
    aget-object v4, v1, v3

    invoke-interface {p2, v4}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v5

    invoke-interface {p2, v4}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v6

    iget v4, v4, Lkr/memorynotes/ColorText$Tint;->color:I

    invoke-static {v0, v5, v6, v4}, Lkr/memorynotes/ColorRanges;->add(Lorg/json/JSONArray;III)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_17
.end method

.method static synthetic lambda$0(Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;IILjava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 9

    .line 13
    invoke-static {p0, p1, p2}, Lkr/memorynotes/ColorText;->collect(Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;)V

    invoke-static {p0, p1}, Lkr/memorynotes/ColorText;->ranges(Lkr/memorynotes/Note;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p6

    sget-object v0, Lkr/memorynotes/ColorText;->COLORS:[I

    array-length v0, v0

    if-ge p7, v0, :cond_15

    sget-object v0, Lkr/memorynotes/ColorText;->COLORS:[I

    aget p7, v0, p7

    invoke-static {p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p7

    goto :goto_16

    :cond_15
    const/4 p7, 0x0

    :goto_16
    invoke-static {p6, p3, p4, p7}, Lkr/memorynotes/ColorRanges;->replace(Lorg/json/JSONArray;IILjava/lang/Integer;)Lorg/json/JSONArray;

    move-result-object p3

    invoke-static {p0, p1, p3}, Lkr/memorynotes/ColorText;->store(Lkr/memorynotes/Note;Ljava/lang/String;Lorg/json/JSONArray;)V

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-static {p0, p3}, Lkr/memorynotes/ColorText;->apply(Landroid/text/Spannable;Lorg/json/JSONArray;)V

    invoke-virtual {p2}, Landroid/widget/EditText;->invalidate()V

    invoke-interface {p5}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static ranges(Lkr/memorynotes/Note;Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 2

    .line 7
    iget-object p0, p0, Lkr/memorynotes/Note;->textColors:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-nez p0, :cond_d

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    :cond_d
    return-object p0
.end method

.method static refresh(Landroid/text/Editable;)V
    .registers 8

    .line 12
    invoke-interface {p0}, Landroid/text/Editable;->length()I

    move-result v0

    const-class v1, Lkr/memorynotes/ColorText$Tint;

    const/4 v2, 0x0

    invoke-interface {p0, v2, v0, v1}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkr/memorynotes/ColorText$Tint;

    array-length v1, v0

    :goto_e
    if-lt v2, v1, :cond_11

    return-void

    :cond_11
    aget-object v3, v0, v2

    invoke-interface {p0, v3}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    invoke-interface {p0, v3}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v5

    invoke-interface {p0, v3}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    if-le v5, v4, :cond_25

    const/16 v6, 0x21

    invoke-interface {p0, v3, v4, v5, v6}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    :cond_25
    add-int/lit8 v2, v2, 0x1

    goto :goto_e
.end method

.method static replaceText(Landroid/widget/EditText;Ljava/lang/String;)V
    .registers 8

    .line 15
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_23

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_23

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_20

    goto :goto_23

    :cond_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_23
    :goto_23
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    :goto_2b
    if-le v2, v1, :cond_43

    if-le v3, v1, :cond_43

    add-int/lit8 v4, v2, -0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    add-int/lit8 v5, v3, -0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v4, v5, :cond_3e

    goto :goto_43

    :cond_3e
    add-int/lit8 v2, v2, -0x1

    add-int/lit8 v3, v3, -0x1

    goto :goto_2b

    :cond_43
    :goto_43
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v1, v2, p1}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    return-void
.end method

.method static store(Lkr/memorynotes/Note;Ljava/lang/String;Lorg/json/JSONArray;)V
    .registers 3

    .line 8
    :try_start_0
    iget-object p0, p0, Lkr/memorynotes/Note;->textColors:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    move-exception p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method
