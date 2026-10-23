.class public final Lkr/memorynotes/NoteSwipe;
.super Ljava/lang/Object;
.source "NoteSwipe.java"


# static fields
.field private static final states:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lkr/memorynotes/MainActivity;",
            "Lkr/memorynotes/NoteSwipe;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private current:Lkr/memorynotes/Note;

.field private listParent:Landroid/view/ViewGroup;

.field private final notes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;"
        }
    .end annotation
.end field

.field private review:Lkr/memorynotes/ReviewScreen;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lkr/memorynotes/NoteSwipe;->states:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    .line 3
    return-void
.end method

.method public static bind(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V
    .registers 6

    .line 8
    invoke-static {p0}, Lkr/memorynotes/NoteSwipe;->state(Lkr/memorynotes/MainActivity;)Lkr/memorynotes/NoteSwipe;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, v0, Lkr/memorynotes/NoteSwipe;->review:Lkr/memorynotes/ReviewScreen;

    iput-object p1, v0, Lkr/memorynotes/NoteSwipe;->current:Lkr/memorynotes/Note;

    const/4 v1, 0x0

    :goto_a
    iget-object v2, v0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v1, v2, :cond_13

    goto :goto_2a

    :cond_13
    iget-object v2, v0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkr/memorynotes/Note;

    iget-object v2, v2, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    iget-object v3, p1, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2e

    iget-object v2, v0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    invoke-virtual {v2, v1, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :goto_2a
    invoke-direct {v0, p0}, Lkr/memorynotes/NoteSwipe;->install(Lkr/memorynotes/MainActivity;)V

    return-void

    :cond_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_a
.end method

.method public static bindReview(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V
    .registers 5

    .line 9
    invoke-static {p0}, Lkr/memorynotes/NoteSwipe;->state(Lkr/memorynotes/MainActivity;)Lkr/memorynotes/NoteSwipe;

    move-result-object v0

    iget v1, p1, Lkr/memorynotes/ReviewScreen;->index:I

    if-ltz v1, :cond_1d

    iget v1, p1, Lkr/memorynotes/ReviewScreen;->index:I

    iget-object v2, p1, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v1, v2, :cond_13

    goto :goto_1d

    :cond_13
    const/4 v1, 0x0

    iput-object v1, v0, Lkr/memorynotes/NoteSwipe;->current:Lkr/memorynotes/Note;

    iput-object p1, v0, Lkr/memorynotes/NoteSwipe;->review:Lkr/memorynotes/ReviewScreen;

    iput-object p1, p0, Lkr/memorynotes/MainActivity;->review:Lkr/memorynotes/ReviewScreen;

    invoke-direct {v0, p0}, Lkr/memorynotes/NoteSwipe;->install(Lkr/memorynotes/MainActivity;)V

    :cond_1d
    :goto_1d
    return-void
.end method

.method public static card(Lkr/memorynotes/MainActivity;Landroid/view/ViewGroup;Lkr/memorynotes/Note;)V
    .registers 5

    .line 7
    invoke-static {p0}, Lkr/memorynotes/NoteSwipe;->state(Lkr/memorynotes/MainActivity;)Lkr/memorynotes/NoteSwipe;

    move-result-object p0

    iget-object v0, p0, Lkr/memorynotes/NoteSwipe;->listParent:Landroid/view/ViewGroup;

    if-ne p1, v0, :cond_e

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_15

    :cond_e
    iget-object v0, p0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iput-object p1, p0, Lkr/memorynotes/NoteSwipe;->listParent:Landroid/view/ViewGroup;

    :cond_15
    iget-object p1, p0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_27

    iget-object p0, p0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_27
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/Note;

    iget-object v0, v0, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    iget-object v1, p2, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    return-void
.end method

.method public static clear(Lkr/memorynotes/MainActivity;)V
    .registers 2

    .line 10
    invoke-static {p0}, Lkr/memorynotes/NoteSwipe;->state(Lkr/memorynotes/MainActivity;)Lkr/memorynotes/NoteSwipe;

    move-result-object p0

    const/4 v0, 0x0

    iput-object v0, p0, Lkr/memorynotes/NoteSwipe;->current:Lkr/memorynotes/Note;

    iput-object v0, p0, Lkr/memorynotes/NoteSwipe;->review:Lkr/memorynotes/ReviewScreen;

    return-void
.end method

.method private install(Lkr/memorynotes/MainActivity;)V
    .registers 6

    .line 14
    iget-object v0, p1, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    if-nez v0, :cond_5

    return-void

    .line 15
    :cond_5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 16
    nop

    :goto_a
    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_1b

    iget-object v2, p1, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    if-ne v1, v2, :cond_13

    goto :goto_1b

    :cond_13
    move-object v0, v1

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto :goto_a

    .line 17
    :cond_1b
    :goto_1b
    iget-object v2, p1, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    if-ne v1, v2, :cond_41

    instance-of v1, v0, Lkr/memorynotes/SwipePager;

    if-eqz v1, :cond_24

    goto :goto_41

    .line 18
    :cond_24
    iget-object v1, p1, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    if-gez v1, :cond_2d

    return-void

    .line 19
    :cond_2d
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget-object v3, p1, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    .line 20
    new-instance v3, Lkr/memorynotes/SwipePager;

    invoke-direct {v3, p1, p0, v0}, Lkr/memorynotes/SwipePager;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/NoteSwipe;Landroid/view/View;)V

    iget-object p1, p1, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 21
    return-void

    .line 17
    :cond_41
    :goto_41
    return-void
.end method

.method private static state(Lkr/memorynotes/MainActivity;)Lkr/memorynotes/NoteSwipe;
    .registers 3

    .line 6
    sget-object v0, Lkr/memorynotes/NoteSwipe;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/NoteSwipe;

    if-nez v0, :cond_14

    new-instance v0, Lkr/memorynotes/NoteSwipe;

    invoke-direct {v0}, Lkr/memorynotes/NoteSwipe;-><init>()V

    sget-object v1, Lkr/memorynotes/NoteSwipe;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    return-object v0
.end method


# virtual methods
.method canGo(I)Z
    .registers 4

    .line 23
    invoke-virtual {p0}, Lkr/memorynotes/NoteSwipe;->index()I

    move-result v0

    iget-object v1, p0, Lkr/memorynotes/NoteSwipe;->review:Lkr/memorynotes/ReviewScreen;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lkr/memorynotes/NoteSwipe;->review:Lkr/memorynotes/ReviewScreen;

    iget-object v1, v1, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    goto :goto_f

    :cond_d
    iget-object v1, p0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    :goto_f
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ltz v0, :cond_1c

    add-int/2addr v0, p1

    if-ltz v0, :cond_1c

    if-ge v0, v1, :cond_1c

    const/4 p1, 0x1

    return p1

    :cond_1c
    const/4 p1, 0x0

    return p1
.end method

.method go(Lkr/memorynotes/MainActivity;I)Z
    .registers 5

    .line 24
    invoke-virtual {p0, p2}, Lkr/memorynotes/NoteSwipe;->canGo(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    iget-object v0, p0, Lkr/memorynotes/NoteSwipe;->review:Lkr/memorynotes/ReviewScreen;

    if-eqz v0, :cond_19

    iget-object p1, p0, Lkr/memorynotes/NoteSwipe;->review:Lkr/memorynotes/ReviewScreen;

    iget v0, p1, Lkr/memorynotes/ReviewScreen;->index:I

    add-int/2addr v0, p2

    iput v0, p1, Lkr/memorynotes/ReviewScreen;->index:I

    iput-boolean v1, p1, Lkr/memorynotes/ReviewScreen;->revealed:Z

    invoke-virtual {p1}, Lkr/memorynotes/ReviewScreen;->show()V

    goto :goto_29

    :cond_19
    iget-object v0, p0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lkr/memorynotes/NoteSwipe;->index()I

    move-result v1

    add-int/2addr v1, p2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkr/memorynotes/Note;

    invoke-virtual {p1, p2}, Lkr/memorynotes/MainActivity;->detail(Lkr/memorynotes/Note;)V

    :goto_29
    const/4 p1, 0x1

    return p1
.end method

.method index()I
    .registers 4

    .line 22
    iget-object v0, p0, Lkr/memorynotes/NoteSwipe;->review:Lkr/memorynotes/ReviewScreen;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lkr/memorynotes/NoteSwipe;->review:Lkr/memorynotes/ReviewScreen;

    iget v0, v0, Lkr/memorynotes/ReviewScreen;->index:I

    return v0

    :cond_9
    iget-object v0, p0, Lkr/memorynotes/NoteSwipe;->current:Lkr/memorynotes/Note;

    if-eqz v0, :cond_2f

    const/4 v0, 0x0

    :goto_e
    iget-object v1, p0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_17

    goto :goto_2f

    :cond_17
    iget-object v1, p0, Lkr/memorynotes/NoteSwipe;->notes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkr/memorynotes/Note;

    iget-object v1, v1, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    iget-object v2, p0, Lkr/memorynotes/NoteSwipe;->current:Lkr/memorynotes/Note;

    iget-object v2, v2, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2c

    return v0

    :cond_2c
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_2f
    :goto_2f
    const/4 v0, -0x1

    return v0
.end method
