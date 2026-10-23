.class Lkr/memorynotes/Ui$1;
.super Landroid/widget/ArrayAdapter;
.source "Ui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/Ui;->setOptions(Landroid/widget/Spinner;[Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/Ui;


# direct methods
.method constructor <init>(Lkr/memorynotes/Ui;Landroid/content/Context;I[Ljava/lang/String;)V
    .registers 5

    .line 49
    iput-object p1, p0, Lkr/memorynotes/Ui$1;->this$0:Lkr/memorynotes/Ui;

    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    return-void
.end method

.method private item(Ljava/lang/String;Landroid/view/View;)Landroid/view/View;
    .registers 7

    .line 51
    instance-of v0, p2, Landroid/widget/TextView;

    if-eqz v0, :cond_7

    check-cast p2, Landroid/widget/TextView;

    goto :goto_10

    :cond_7
    new-instance p2, Landroid/widget/TextView;

    iget-object v0, p0, Lkr/memorynotes/Ui$1;->this$0:Lkr/memorynotes/Ui;

    iget-object v0, v0, Lkr/memorynotes/Ui;->a:Landroid/app/Activity;

    invoke-direct {p2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 52
    :goto_10
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lkr/memorynotes/Ui$1;->this$0:Lkr/memorynotes/Ui;

    iget p1, p1, Lkr/memorynotes/Ui;->ink:I

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lkr/memorynotes/Ui$1;->this$0:Lkr/memorynotes/Ui;

    iget p1, p1, Lkr/memorynotes/Ui;->scale:F

    const/high16 v0, 0x41800000    # 16.0f

    mul-float/2addr p1, v0

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 54
    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setSingleLine(Z)V

    const p1, 0x7fffffff

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 55
    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    const/16 p1, 0x10

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 56
    iget-object p1, p0, Lkr/memorynotes/Ui$1;->this$0:Lkr/memorynotes/Ui;

    const/high16 v0, 0x42500000    # 52.0f

    invoke-virtual {p1, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setMinHeight(I)V

    iget-object p1, p0, Lkr/memorynotes/Ui$1;->this$0:Lkr/memorynotes/Ui;

    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {p1, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p1

    iget-object v1, p0, Lkr/memorynotes/Ui$1;->this$0:Lkr/memorynotes/Ui;

    invoke-virtual {v1, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v1

    iget-object v2, p0, Lkr/memorynotes/Ui$1;->this$0:Lkr/memorynotes/Ui;

    invoke-virtual {v2, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v3, p0, Lkr/memorynotes/Ui$1;->this$0:Lkr/memorynotes/Ui;

    invoke-virtual {v3, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    invoke-virtual {p2, p1, v1, v2, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 57
    iget-object p1, p0, Lkr/memorynotes/Ui$1;->this$0:Lkr/memorynotes/Ui;

    iget p1, p1, Lkr/memorynotes/Ui;->surface:I

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    return-object p2
.end method


# virtual methods
.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 4

    .line 60
    invoke-virtual {p0, p1}, Lkr/memorynotes/Ui$1;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lkr/memorynotes/Ui$1;->item(Ljava/lang/String;Landroid/view/View;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 4

    .line 59
    invoke-virtual {p0, p1}, Lkr/memorynotes/Ui$1;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lkr/memorynotes/Ui$1;->item(Ljava/lang/String;Landroid/view/View;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method
