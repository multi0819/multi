.class public final Lkr/memorynotes/ReviewActions;
.super Ljava/lang/Object;
.source "ReviewActions.java"


# static fields
.field private static final editing:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lkr/memorynotes/MainActivity;",
            "Lkr/memorynotes/ReviewScreen;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lkr/memorynotes/ReviewActions;->editing:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/util/WeakHashMap;
    .registers 1

    .line 4
    sget-object v0, Lkr/memorynotes/ReviewActions;->editing:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method public static addEdit(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V
    .registers 5

    .line 12
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/ReviewActions$2;

    invoke-direct {v2, p1, p0}, Lkr/memorynotes/ReviewActions$2;-><init>(Lkr/memorynotes/ReviewScreen;Lkr/memorynotes/MainActivity;)V

    const-string p0, "\ub178\ud2b8 \uc218\uc815"

    invoke-virtual {v1, p0, v2}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    return-void
.end method

.method public static addRevealControl(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V
    .registers 5

    .line 7
    iget-object v0, p1, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    iget v1, p1, Lkr/memorynotes/ReviewScreen;->index:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/Note;

    .line 8
    const-string v1, "\uc77c\ubc18 \ub178\ud2b8"

    iget-object v2, v0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3d

    invoke-static {p1}, Lkr/memorynotes/ReviewFlow;->masked(Lkr/memorynotes/ReviewScreen;)Z

    move-result v1

    if-eqz v1, :cond_3d

    iget-object v1, v0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    invoke-static {v1}, Lkr/memorynotes/ReviewFlow;->hasPhrases(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2a

    iget-object v0, v0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-static {v0}, Lkr/memorynotes/ReviewFlow;->hasPhrases(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 9
    :cond_2a
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object p0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v1, Lkr/memorynotes/ReviewActions$1;

    invoke-direct {v1, p1}, Lkr/memorynotes/ReviewActions$1;-><init>(Lkr/memorynotes/ReviewScreen;)V

    const-string p1, "\uac00\ub9b0 \ubb38\uad6c \ud655\uc778"

    invoke-virtual {p0, p1, v1}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 10
    goto :goto_40

    :cond_3d
    invoke-static {p0, p1}, Lkr/memorynotes/ReviewControls;->addHide(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V

    .line 11
    :goto_40
    return-void
.end method

.method public static afterSave(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V
    .registers 5

    .line 14
    sget-object v0, Lkr/memorynotes/ReviewActions;->editing:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/ReviewScreen;

    if-eqz v0, :cond_36

    iget v1, v0, Lkr/memorynotes/ReviewScreen;->index:I

    iget-object v2, v0, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_36

    iget-object v1, v0, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    iget v2, v0, Lkr/memorynotes/ReviewScreen;->index:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    iget-object v2, p1, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    iget-object p0, v0, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    iget v1, v0, Lkr/memorynotes/ReviewScreen;->index:I

    invoke-virtual {p0, v1, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    iput-boolean p0, v0, Lkr/memorynotes/ReviewScreen;->revealed:Z

    invoke-virtual {v0}, Lkr/memorynotes/ReviewScreen;->show()V

    goto :goto_39

    :cond_36
    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->detail(Lkr/memorynotes/Note;)V

    :goto_39
    return-void
.end method

.method public static clear(Lkr/memorynotes/MainActivity;)V
    .registers 2

    .line 13
    sget-object v0, Lkr/memorynotes/ReviewActions;->editing:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static primaryLabel(Lkr/memorynotes/Note;)Ljava/lang/String;
    .registers 2

    .line 5
    const-string v0, "\uc77c\ubc18 \ub178\ud2b8"

    iget-object p0, p0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const-string p0, "\uac00\ub9b0 \ubb38\uad6c \ud655\uc778"

    goto :goto_f

    :cond_d
    const-string p0, "\uc815\ub2f5 \ud655\uc778"

    :goto_f
    return-object p0
.end method
