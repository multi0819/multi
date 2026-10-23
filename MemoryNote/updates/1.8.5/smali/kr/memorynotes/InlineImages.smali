.class final Lkr/memorynotes/InlineImages;
.super Ljava/lang/Object;
.source "InlineImages.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkr/memorynotes/InlineImages$MaskedPicture;,
        Lkr/memorynotes/InlineImages$OpenPicture;,
        Lkr/memorynotes/InlineImages$Picture;
    }
.end annotation


# static fields
.field static final cache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 4
    new-instance v0, Lkr/memorynotes/InlineImages$1;

    const/high16 v1, 0x800000

    invoke-direct {v0, v1}, Lkr/memorynotes/InlineImages$1;-><init>(I)V

    sput-object v0, Lkr/memorynotes/InlineImages;->cache:Landroid/util/LruCache;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static apply(Lkr/memorynotes/Ui;Landroid/widget/TextView;Landroid/text/Spannable;Z)V
    .registers 15

    .line 7
    invoke-interface {p2}, Landroid/text/Spannable;->length()I

    move-result v0

    const-class v1, Lkr/memorynotes/InlineImages$Picture;

    const/4 v2, 0x0

    invoke-interface {p2, v2, v0, v1}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkr/memorynotes/InlineImages$Picture;

    array-length v1, v0

    move v3, v2

    :goto_f
    if-lt v3, v1, :cond_111

    .line 8
    invoke-interface {p2}, Landroid/text/Spannable;->length()I

    move-result v0

    const-class v1, Lkr/memorynotes/InlineImages$OpenPicture;

    invoke-interface {p2, v2, v0, v1}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, [Lkr/memorynotes/InlineImages$OpenPicture;

    array-length v5, v4

    move v0, v2

    :goto_20
    if-lt v0, v5, :cond_108

    .line 9
    invoke-virtual {p1}, Landroid/widget/TextView;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    if-gtz v0, :cond_45

    iget-object v0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v1, 0x42c80000    # 100.0f

    invoke-virtual {p0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    sub-int/2addr v0, v1

    :cond_45
    const/high16 v1, 0x42a00000    # 80.0f

    invoke-virtual {p0, v1}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 10
    sget-object v0, Lkr/memorynotes/InlineImageText;->PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 11
    nop

    :cond_56
    :goto_56
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_5d

    .line 20
    return-void

    .line 12
    :cond_5d
    move v0, v2

    :goto_5e
    iget-object v4, p0, Lkr/memorynotes/Ui;->pictures:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    const-string v5, "file"

    const/4 v6, 0x1

    if-lt v0, v4, :cond_6b

    const/4 v0, 0x0

    goto :goto_82

    :cond_6b
    iget-object v4, p0, Lkr/memorynotes/Ui;->pictures:Lorg/json/JSONArray;

    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_104

    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_104

    move-object v0, v4

    .line 13
    :goto_82
    const-string v4, "masks"

    if-nez v0, :cond_9c

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_8b
    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9a
    .catch Lorg/json/JSONException; {:try_start_8b .. :try_end_9a} :catch_9b

    goto :goto_9c

    :catch_9b
    move-exception v5

    .line 14
    :cond_9c
    :goto_9c
    nop

    .line 15
    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lkr/memorynotes/InlineImages;->load(Lkr/memorynotes/Ui;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v5

    if-nez v5, :cond_a8

    goto :goto_56

    .line 16
    :cond_a8
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    int-to-double v7, v7

    int-to-double v9, v1

    mul-double/2addr v7, v9

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    int-to-double v9, v9

    div-double/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->round(D)J

    move-result-wide v7

    long-to-int v7, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 17
    new-instance v7, Lkr/memorynotes/InlineImages$MaskedPicture;

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-direct {v7, v5, v4, p3}, Lkr/memorynotes/InlineImages$MaskedPicture;-><init>(Landroid/graphics/Bitmap;Lorg/json/JSONArray;Z)V

    invoke-virtual {v7, v2, v2, v1, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance v4, Lkr/memorynotes/InlineImages$Picture;

    invoke-direct {v4, v7}, Lkr/memorynotes/InlineImages$Picture;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->start()I

    move-result v5

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->end()I

    move-result v6

    const/16 v7, 0x21

    invoke-interface {p2, v4, v5, v6, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 18
    instance-of v4, p1, Landroid/widget/EditText;

    if-nez v4, :cond_56

    iget-object v4, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    instance-of v4, v4, Lkr/memorynotes/MainActivity;

    if-eqz v4, :cond_56

    new-instance v4, Lkr/memorynotes/InlineImages$OpenPicture;

    new-instance v5, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda1;

    invoke-direct {v5, p0, v0, p3}, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda1;-><init>(Lkr/memorynotes/Ui;Lorg/json/JSONObject;Z)V

    invoke-direct {v4, v5}, Lkr/memorynotes/InlineImages$OpenPicture;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->start()I

    move-result v0

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    invoke-interface {p2, v4, v0, v5, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    goto/16 :goto_56

    .line 12
    :cond_104
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_5e

    .line 8
    :cond_108
    aget-object v1, v4, v0

    invoke-interface {p2, v1}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_20

    .line 7
    :cond_111
    aget-object v4, v0, v3

    invoke-interface {p2, v4}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_f
.end method

.method static bind(Lkr/memorynotes/Ui;Landroid/widget/TextView;Z)V
    .registers 4

    .line 22
    new-instance v0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1, p0, p2}, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda0;-><init>(Landroid/widget/TextView;Lkr/memorynotes/Ui;Z)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 23
    return-void
.end method

.method static synthetic lambda$0(Lkr/memorynotes/Ui;Lorg/json/JSONObject;Z)V
    .registers 5

    .line 18
    iget-object p0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    check-cast p0, Lkr/memorynotes/MainActivity;

    new-instance v0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda2;-><init>()V

    const/4 v1, 0x0

    invoke-static {p0, p1, v1, v0, p2}, Lkr/memorynotes/ImageMaskView;->dialog(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;ZLjava/lang/Runnable;Z)V

    return-void
.end method

.method static synthetic lambda$1()V
    .registers 0

    .line 18
    return-void
.end method

.method static synthetic lambda$2(Landroid/widget/TextView;Lkr/memorynotes/Ui;ZLandroid/view/View;IIIIIIII)V
    .registers 12

    .line 22
    sub-int/2addr p6, p4

    sub-int/2addr p10, p8

    if-eq p6, p10, :cond_18

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p3

    instance-of p3, p3, Landroid/text/Spannable;

    if-eqz p3, :cond_18

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p3

    check-cast p3, Landroid/text/Spannable;

    invoke-static {p1, p0, p3, p2}, Lkr/memorynotes/InlineImages;->apply(Lkr/memorynotes/Ui;Landroid/widget/TextView;Landroid/text/Spannable;Z)V

    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    :cond_18
    return-void
.end method

.method static load(Lkr/memorynotes/Ui;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 5

    .line 5
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/io/File;

    iget-object p0, p0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v2, "images"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lkr/memorynotes/InlineImages;->cache:Landroid/util/LruCache;

    invoke-virtual {p1, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    if-eqz p1, :cond_21

    return-object p1

    :cond_21
    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {p0, p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    :goto_2c
    iget v1, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v1, v0

    const/16 v2, 0x400

    if-gt v1, v2, :cond_49

    iget v1, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr v1, v0

    if-gt v1, v2, :cond_49

    iput v0, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/4 v0, 0x0

    iput-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {p0, p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_48

    sget-object v0, Lkr/memorynotes/InlineImages;->cache:Landroid/util/LruCache;

    invoke-virtual {v0, p0, p1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_48
    return-object p1

    :cond_49
    mul-int/lit8 v0, v0, 0x2

    goto :goto_2c
.end method
