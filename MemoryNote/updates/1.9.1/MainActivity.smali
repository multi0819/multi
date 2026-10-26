.class public Lkr/memorynotes/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkr/memorynotes/MainActivity$NameAction;
    }
.end annotation


# instance fields
.field backAction:Ljava/lang/Runnable;

.field busy:Z

.field busyDialog:Landroid/app/AlertDialog;

.field content:Landroid/widget/LinearLayout;

.field db:Lkr/memorynotes/NoteDb;

.field editor:Lkr/memorynotes/NoteEditor;

.field page:Ljava/lang/String;

.field pendingImageNote:Ljava/lang/String;

.field review:Lkr/memorynotes/ReviewScreen;

.field root:Landroid/widget/LinearLayout;

.field speech:Lkr/memorynotes/SpeechReader;

.field subjectFilter:Ljava/lang/String;

.field u:Lkr/memorynotes/Ui;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 3
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 4
    const-string v0, "\ud648"

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->subjectFilter:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/MainActivity;->busy:Z

    .line 3
    return-void
.end method

.method static synthetic lambda$0(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 4

    .line 13
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p1}, Landroid/view/WindowInsets;->consumeSystemWindowInsets()Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$13(Ljava/util/Map$Entry;Lkr/memorynotes/Note;)Z
    .locals 0

    .line 32
    iget-object p1, p1, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$18(Landroid/app/AlertDialog;Landroid/widget/EditText;Lkr/memorynotes/MainActivity$NameAction;Landroid/content/DialogInterface;)V
    .locals 1

    .line 34
    const/4 p3, -0x1

    invoke-virtual {p0, p3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    new-instance v0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda52;

    invoke-direct {v0, p1, p2, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda52;-><init>(Landroid/widget/EditText;Lkr/memorynotes/MainActivity$NameAction;Landroid/app/AlertDialog;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic lambda$19(Landroid/widget/EditText;Lkr/memorynotes/MainActivity$NameAction;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 1

    .line 34
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "\uc774\ub984\uc744 \uc785\ub825\ud558\uc138\uc694"

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    invoke-interface {p1, p3}, Lkr/memorynotes/MainActivity$NameAction;->run(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$40(Lkr/memorynotes/Note;)I
    .locals 1

    .line 65
    iget v0, p0, Lkr/memorynotes/Note;->rating:I

    if-nez v0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    iget p0, p0, Lkr/memorynotes/Note;->rating:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_1

    move p0, v0

    goto :goto_0

    :cond_1
    const/4 p0, 0x2

    :goto_0
    return p0
.end method

.method static synthetic lambda$41(Lkr/memorynotes/Note;)Ljava/lang/String;
    .locals 0

    .line 65
    iget-object p0, p0, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic lambda$47(Ljava/util/Map$Entry;Lkr/memorynotes/Note;)Z
    .locals 0

    .line 66
    iget-object p1, p1, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$48(ILkr/memorynotes/Note;)Z
    .locals 0

    .line 66
    iget p1, p1, Lkr/memorynotes/Note;->rating:I

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static listener(Ljava/lang/Runnable;)Landroid/widget/AdapterView$OnItemSelectedListener;
    .locals 1

    .line 44
    new-instance v0, Lkr/memorynotes/MainActivity$2;

    invoke-direct {v0, p0}, Lkr/memorynotes/MainActivity$2;-><init>(Ljava/lang/Runnable;)V

    return-object v0
.end method

.method static watcher(Ljava/lang/Runnable;)Landroid/text/TextWatcher;
    .locals 1

    .line 43
    new-instance v0, Lkr/memorynotes/MainActivity$1;

    invoke-direct {v0, p0}, Lkr/memorynotes/MainActivity$1;-><init>(Ljava/lang/Runnable;)V

    return-object v0
.end method


# virtual methods
.method beginReview(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;)V"
        }
    .end annotation

    .line 65
    new-instance v0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda25;

    invoke-direct {v0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda25;-><init>()V

    invoke-static {v0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    move-result-object v0

    new-instance v1, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda26;

    invoke-direct {v1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda26;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/Comparator;->thenComparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v0, "\uc120\ud0dd\ud55c \uc870\uac74\uc5d0 \ubcf5\uc2b5\ud560 \ub178\ud2b8\uac00 \uc5c6\uc2b5\ub2c8\ub2e4. \ubc94\uc704\ub97c \ubc14\uafd4\ubcf4\uc138\uc694."

    invoke-virtual {p1, v0}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    new-instance v0, Lkr/memorynotes/ReviewScreen;

    invoke-direct {v0, p0, p1}, Lkr/memorynotes/ReviewScreen;-><init>(Lkr/memorynotes/MainActivity;Ljava/util/ArrayList;)V

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->review:Lkr/memorynotes/ReviewScreen;

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->review:Lkr/memorynotes/ReviewScreen;

    invoke-virtual {p1}, Lkr/memorynotes/ReviewScreen;->show()V

    return-void
.end method

.method chapters(Ljava/lang/String;)V
    .locals 7

    .line 35
    const-string v0, "subjects"

    invoke-virtual {p0, v0, p1}, Lkr/memorynotes/MainActivity;->groupName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\ub2e8\uc6d0 \uad00\ub9ac \u00b7 \uc774\ub984\uc744 \ubc14\uafd4\ub3c4 \ub178\ud2b8\ub294 \uc720\uc9c0\ub3fc\uc694."

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lkr/memorynotes/MainActivity;->shell(Ljava/lang/String;Ljava/lang/String;Z)V

    new-instance v0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda44;

    invoke-direct {v0, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda44;-><init>(Lkr/memorynotes/MainActivity;)V

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda45;

    invoke-direct {v2, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda45;-><init>(Lkr/memorynotes/MainActivity;Ljava/lang/String;)V

    const-string v3, "\uff0b \ub2e8\uc6d0 \ucd94\uac00"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, "chapters"

    invoke-virtual {v0, v1, p1}, Lkr/memorynotes/NoteDb;->groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v2

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v5, v5, Lkr/memorynotes/Ui;->ink:I

    const/16 v6, 0x12

    invoke-virtual {v3, v4, v6, v5}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v4, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda46;

    invoke-direct {v4, p0, v1, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda46;-><init>(Lkr/memorynotes/MainActivity;Ljava/util/Map$Entry;Ljava/lang/String;)V

    const-string v1, "\uc774\ub984 \ubcc0\uacbd"

    invoke-virtual {v3, v1, v4}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0
.end method

.method chooseImages()V
    .locals 3

    .line 67
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lkr/memorynotes/MainActivity;->busy:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    iget-object v0, v0, Lkr/memorynotes/NoteEditor;->note:Lkr/memorynotes/Note;

    iget-object v0, v0, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->pendingImageNote:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    invoke-virtual {v0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.ALLOW_MULTIPLE"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/16 v1, 0xa

    invoke-virtual {p0, v0, v1}, Lkr/memorynotes/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_1
    :goto_0
    return-void
.end method

.method detail(Lkr/memorynotes/Note;)V
    .locals 12

    invoke-static {p0, p1}, Lkr/memorynotes/Dashboard;->track(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->review:Lkr/memorynotes/ReviewScreen;

    iget-object v0, p1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    const-string v1, "\ubb38\ub2f5 \uce74\ub4dc"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\ubb38\ub2f5 \ub178\ud2b8"

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    :goto_0
    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->meta(Lkr/memorynotes/Note;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lkr/memorynotes/MainActivity;->shell(Ljava/lang/String;Ljava/lang/String;Z)V

    new-instance v0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda15;

    invoke-direct {v0, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda15;-><init>(Lkr/memorynotes/MainActivity;)V

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p1, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    iput-object v2, v0, Lkr/memorynotes/Ui;->pictures:Lorg/json/JSONArray;

    iget-object v0, p1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x2

    if-nez v0, :cond_1

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v2, p1, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    sget-object v4, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {v0, v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Landroid/text/Spannable;

    const-string v2, "title"

    invoke-static {p1, v2}, Lkr/memorynotes/ColorText;->ranges(Lkr/memorynotes/Note;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-static {v0, v2}, Lkr/memorynotes/ColorText;->apply(Landroid/text/Spannable;Lorg/json/JSONArray;)V

    :cond_1
    iget-object v0, p1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    const-string v2, "\uc77c\ubc18 \ub178\ud2b8"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x3

    const-string v4, "\uc624\ub2f5\ub178\ud2b8"

    if-eqz v0, :cond_2

    .line 52
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v6, "\ub0b4\uc6a9"

    invoke-virtual {v0, v5, v6, v3}, Lkr/memorynotes/Ui;->section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v8, p1, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    const/4 v10, 0x1

    const/4 v11, 0x0

    const-string v7, "body"

    const/16 v9, 0x12

    move-object v6, p1

    invoke-virtual/range {v5 .. v11}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 53
    goto/16 :goto_1

    .line 54
    :cond_2
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v6, "\ubb38\uc81c \u00b7 \uc9c8\ubb38"

    invoke-virtual {v0, v5, v6, v3}, Lkr/memorynotes/Ui;->section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v8, p1, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v7, "question"

    const/16 v9, 0x13

    move-object v6, p1

    invoke-virtual/range {v5 .. v11}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 55
    iget-object v0, p1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p1, Lkr/memorynotes/Note;->mine:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v6, "\ub0b4\uac00 \uc4f4 \ub2f5"

    invoke-virtual {v0, v5, v6, v2}, Lkr/memorynotes/Ui;->section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v8, p1, Lkr/memorynotes/Note;->mine:Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v7, "mine"

    const/16 v9, 0x12

    move-object v6, p1

    invoke-virtual/range {v5 .. v11}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 56
    :cond_3
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v6, "\uc815\ub2f5 \u00b7 \ud574\uc124"

    invoke-virtual {v0, v5, v6, v3}, Lkr/memorynotes/Ui;->section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v8, p1, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    const/4 v10, 0x1

    const/4 v11, 0x0

    const-string v7, "answer"

    const/16 v9, 0x12

    move-object v6, p1

    invoke-virtual/range {v5 .. v11}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 57
    iget-object v0, p1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p1, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v6, "\ub0b4\uc6a9 \u00b7 \ucd94\uac00 \uba54\ubaa8"

    invoke-virtual {v0, v5, v6, v3}, Lkr/memorynotes/Ui;->section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v8, p1, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    const/4 v10, 0x1

    const/4 v11, 0x0

    const-string v7, "body"

    const/16 v9, 0x12

    move-object v6, p1

    invoke-virtual/range {v5 .. v11}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 59
    :cond_4
    :goto_1
    iget-object v0, p1, Lkr/memorynotes/Note;->reason:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v6, "\ud2c0\ub9b0 \uc810 \u00b7 \ud5f7\uac08\ub9b0 \uc774\uc720"

    const/4 v7, 0x1

    invoke-virtual {v0, v5, v6, v7}, Lkr/memorynotes/Ui;->section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v8, p1, Lkr/memorynotes/Note;->reason:Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v7, "reason"

    const/16 v9, 0x12

    move-object v6, p1

    invoke-virtual/range {v5 .. v11}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 60
    :cond_5
    iget-object v0, p1, Lkr/memorynotes/Note;->caution:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v6, "\uc8fc\uc758\uc0ac\ud56d \u00b7 \ub2e4\uc74c\uc5d0 \ud655\uc778\ud560 \uac83"

    invoke-virtual {v0, v5, v6, v1}, Lkr/memorynotes/Ui;->section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v8, p1, Lkr/memorynotes/Note;->caution:Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v7, "caution"

    const/16 v9, 0x12

    move-object v6, p1

    invoke-virtual/range {v5 .. v11}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 61
    :cond_6
    iget-object v0, p1, Lkr/memorynotes/Note;->tags:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v5, "\ud0dc\uadf8"

    invoke-virtual {v0, v1, v5, v2}, Lkr/memorynotes/Ui;->section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v8, p1, Lkr/memorynotes/Note;->tags:Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v7, "tags"

    const/16 v9, 0xf

    move-object v6, p1

    invoke-virtual/range {v5 .. v11}, Lkr/memorynotes/Ui;->noteContent(Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/String;IZZ)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 62
    :cond_7
    invoke-static {p1}, Lkr/memorynotes/ImageMaskView;->hasSeparateImages(Lkr/memorynotes/Note;)Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    const-string v5, "\ucca8\ubd80 \uc0ac\uc9c4"

    invoke-virtual {v0, v1, v5, v2}, Lkr/memorynotes/Ui;->section(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-static {p0, v0, p1, v3, v3}, Lkr/memorynotes/ImageMaskView;->appendImages(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Lkr/memorynotes/Note;ZZ)V

    .line 63
    :cond_8
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v3, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda16;

    invoke-direct {v3, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda16;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    const-string v5, "\uc218\uc815"

    invoke-virtual {v2, v5, v3}, Lkr/memorynotes/Ui;->primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-boolean v3, p1, Lkr/memorynotes/Note;->favorite:Z

    if-eqz v3, :cond_9

    const-string v3, "\u2605 \uc990\uaca8\ucc3e\uae30 \ud574\uc81c"

    goto :goto_2

    :cond_9
    const-string v3, "\u2606 \uc990\uaca8\ucc3e\uae30"

    :goto_2
    new-instance v5, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda17;

    invoke-direct {v5, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda17;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    invoke-virtual {v2, v3, v5}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p1, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    invoke-static {v0}, Lkr/memorynotes/SpeechText;->eligible(I)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda18;

    invoke-direct {v2, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda18;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    const-string v3, "\u25b6 \uc774 \ubb38\uc81c \uc77d\uc5b4\uc8fc\uae30"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_a
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda19;

    invoke-direct {v2, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda19;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    const-string v3, "\uc774 \ub178\ud2b8 \ubcf5\uc2b5"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda20;

    invoke-direct {v2, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda20;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    const-string v3, "\uc624\ub2f5\ub178\ud2b8\ub85c \uc804\ud658"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_b
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda21;

    invoke-direct {v2, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda21;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    const-string v3, "\ub178\ud2b8 \uc0ad\uc81c"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda22;

    invoke-direct {v0, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda22;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    const-string v1, "detail"

    invoke-static {p0, p1, v1, v0}, Lkr/memorynotes/InkPage;->attach(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-static {p0, p1}, Lkr/memorynotes/DetailLayout;->attach(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    invoke-static {p0, p1}, Lkr/memorynotes/NoteSwipe;->bind(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    return-void
.end method

.method due(Lkr/memorynotes/Note;)Z
    .locals 1

    .line 20
    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v0

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lkr/memorynotes/NoteFilter;->isDue(Lkr/memorynotes/Note;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method edit(Lkr/memorynotes/Note;)V
    .locals 4

    .line 46
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "draft"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lkr/memorynotes/Note;->from(Lorg/json/JSONObject;)Lkr/memorynotes/Note;

    move-result-object v0

    if-eqz p1, :cond_0

    iget-object v1, p1, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    iget-object v2, v0, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->openEditor(Lkr/memorynotes/Note;)V

    return-void

    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\uc791\uc131 \uc911\uc778 \ub178\ud2b8\uac00 \uc788\uc2b5\ub2c8\ub2e4"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\ucd08\uc548\uc744 \uc774\uc5b4 \uc4f0\uac70\ub098 \ubc84\ub9b0 \ub4a4 \ub2e4\ub978 \ub178\ud2b8\ub97c \uc791\uc131\ud560 \uc218 \uc788\uc2b5\ub2c8\ub2e4."

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\ucde8\uc18c"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\ucd08\uc548 \uc774\uc5b4\uc4f0\uae30"

    new-instance v3, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0, v0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda2;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\ucd08\uc548 \ubc84\ub9ac\uace0 \uc791\uc131"

    new-instance v2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda3;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    return-void

    .line 48
    :cond_1
    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->openEditor(Lkr/memorynotes/Note;)V

    .line 49
    return-void
.end method

.method empty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 30
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->ink:I

    const/16 v3, 0x12

    invoke-virtual {v1, p1, v3, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v1, v1, Lkr/memorynotes/Ui;->muted:I

    const/16 v2, 0xe

    invoke-virtual {p1, p2, v2, v1}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method endBusy()V
    .locals 1

    .line 6
    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/MainActivity;->busy:Z

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->busyDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->busyDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->busyDialog:Landroid/app/AlertDialog;

    :cond_0
    return-void
.end method

.method error(Ljava/lang/Exception;)V
    .locals 3

    .line 69
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\ucc98\ub9ac\ud558\uc9c0 \ubabb\ud588\uc2b5\ub2c8\ub2e4. \uae30\uc874 \uc800\uc7a5 \ub0b4\uc6a9\uc740 \uc720\uc9c0\ub429\ub2c8\ub2e4.\n"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    return-void
.end method

.method filtered()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;"
        }
    .end annotation

    .line 19
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->subjectFilter:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda29;

    invoke-direct {v1, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda29;-><init>(Lkr/memorynotes/MainActivity;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    :cond_0
    return-object v0
.end method

.method groupName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 16
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lkr/memorynotes/NoteDb;->groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    const-string p1, "\ubbf8\ubd84\ub958"

    :cond_0
    return-object p1
.end method

.method home()V
    .locals 0

    invoke-static {p0}, Lkr/memorynotes/Dashboard;->show(Lkr/memorynotes/MainActivity;)V

    return-void
.end method

.method synthetic lambda$1$kr-memorynotes-MainActivity()V
    .locals 0

    .line 13
    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->onBackPressed()V

    return-void
.end method

.method synthetic lambda$10$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;Landroid/view/View;)V
    .locals 0

    .line 31
    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->detail(Lkr/memorynotes/Note;)V

    return-void
.end method

.method synthetic lambda$11$kr-memorynotes-MainActivity()V
    .locals 3

    .line 32
    new-instance v0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda0;-><init>(Lkr/memorynotes/MainActivity;)V

    const-string v1, "\uacfc\ubaa9 \ucd94\uac00"

    const-string v2, ""

    invoke-virtual {p0, v1, v2, v0}, Lkr/memorynotes/MainActivity;->nameDialog(Ljava/lang/String;Ljava/lang/String;Lkr/memorynotes/MainActivity$NameAction;)V

    return-void
.end method

.method synthetic lambda$12$kr-memorynotes-MainActivity(Ljava/lang/String;)V
    .locals 3

    .line 32
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, "subjects"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lkr/memorynotes/NoteDb;->addGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->subjects()V

    return-void
.end method

.method synthetic lambda$14$kr-memorynotes-MainActivity(Ljava/util/Map$Entry;)V
    .locals 0

    .line 32
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lkr/memorynotes/MainActivity;->subjectFilter:Ljava/lang/String;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->listPage(Z)V

    return-void
.end method

.method synthetic lambda$15$kr-memorynotes-MainActivity(Ljava/util/Map$Entry;)V
    .locals 0

    .line 32
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->chapters(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$16$kr-memorynotes-MainActivity(Ljava/util/Map$Entry;)V
    .locals 2

    .line 32
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda5;-><init>(Lkr/memorynotes/MainActivity;Ljava/util/Map$Entry;)V

    const-string p1, "\uacfc\ubaa9 \uc774\ub984"

    invoke-virtual {p0, p1, v0, v1}, Lkr/memorynotes/MainActivity;->nameDialog(Ljava/lang/String;Ljava/lang/String;Lkr/memorynotes/MainActivity$NameAction;)V

    return-void
.end method

.method synthetic lambda$17$kr-memorynotes-MainActivity(Ljava/util/Map$Entry;Ljava/lang/String;)V
    .locals 2

    .line 32
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string v1, "subjects"

    invoke-virtual {v0, v1, p1, p2}, Lkr/memorynotes/NoteDb;->renameGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->subjects()V

    return-void
.end method

.method synthetic lambda$2$kr-memorynotes-MainActivity(Ljava/lang/String;)V
    .locals 1

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->subjectFilter:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$20$kr-memorynotes-MainActivity()V
    .locals 1

    .line 35
    const-string v0, "\uacfc\ubaa9"

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$21$kr-memorynotes-MainActivity(Ljava/lang/String;)V
    .locals 2

    .line 35
    new-instance v0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda47;

    invoke-direct {v0, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda47;-><init>(Lkr/memorynotes/MainActivity;Ljava/lang/String;)V

    const-string p1, "\ub2e8\uc6d0 \ucd94\uac00"

    const-string v1, ""

    invoke-virtual {p0, p1, v1, v0}, Lkr/memorynotes/MainActivity;->nameDialog(Ljava/lang/String;Ljava/lang/String;Lkr/memorynotes/MainActivity$NameAction;)V

    return-void
.end method

.method synthetic lambda$22$kr-memorynotes-MainActivity(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 35
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, "chapters"

    invoke-virtual {v0, v1, p2, p1}, Lkr/memorynotes/NoteDb;->addGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->chapters(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$23$kr-memorynotes-MainActivity(Ljava/util/Map$Entry;Ljava/lang/String;)V
    .locals 2

    .line 35
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda28;

    invoke-direct {v1, p0, p1, p2}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda28;-><init>(Lkr/memorynotes/MainActivity;Ljava/util/Map$Entry;Ljava/lang/String;)V

    const-string p1, "\ub2e8\uc6d0 \uc774\ub984"

    invoke-virtual {p0, p1, v0, v1}, Lkr/memorynotes/MainActivity;->nameDialog(Ljava/lang/String;Ljava/lang/String;Lkr/memorynotes/MainActivity$NameAction;)V

    return-void
.end method

.method synthetic lambda$24$kr-memorynotes-MainActivity(Ljava/util/Map$Entry;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 35
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string v1, "chapters"

    invoke-virtual {v0, v1, p1, p3}, Lkr/memorynotes/NoteDb;->renameGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lkr/memorynotes/MainActivity;->chapters(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$25$kr-memorynotes-MainActivity(Lkr/memorynotes/FilterControls;Landroid/widget/EditText;)V
    .locals 1

    .line 40
    invoke-virtual {p1}, Lkr/memorynotes/FilterControls;->selection()Lkr/memorynotes/NoteFilter;

    move-result-object p1

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v0

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lkr/memorynotes/NoteFilter;->select(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->beginReview(Ljava/util/ArrayList;)V

    return-void
.end method

.method synthetic lambda$26$kr-memorynotes-MainActivity(Lkr/memorynotes/FilterControls;Landroid/widget/EditText;)V
    .locals 1

    .line 40
    invoke-virtual {p1}, Lkr/memorynotes/FilterControls;->selection()Lkr/memorynotes/NoteFilter;

    move-result-object p1

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v0

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lkr/memorynotes/NoteFilter;->select(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->startListening(Ljava/util/ArrayList;)V

    return-void
.end method

.method synthetic lambda$27$kr-memorynotes-MainActivity()V
    .locals 1

    .line 40
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->edit(Lkr/memorynotes/Note;)V

    return-void
.end method

.method synthetic lambda$28$kr-memorynotes-MainActivity(Landroid/widget/LinearLayout;Lkr/memorynotes/FilterControls;Landroid/widget/EditText;Landroid/widget/TextView;)V
    .locals 2

    .line 41
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {p2}, Lkr/memorynotes/FilterControls;->selection()Lkr/memorynotes/NoteFilter;

    move-result-object p2

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p3

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v0

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Lkr/memorynotes/NoteFilter;->select(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "\uac80\uc0c9 \uacb0\uacfc "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "\uac1c / \uc804\uccb4 "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "\uac1c"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-nez p4, :cond_1

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object p3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget p3, p3, Lkr/memorynotes/Ui;->muted:I

    const-string p4, "\uc870\uac74\uc5d0 \ub9de\ub294 \ub178\ud2b8\uac00 \uc5c6\uc2b5\ub2c8\ub2e4."

    const/16 v0, 0x10

    invoke-virtual {p2, p4, v0, p3}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_0
    return-void

    :cond_1
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lkr/memorynotes/Note;

    invoke-virtual {p0, p1, p4}, Lkr/memorynotes/MainActivity;->noteCard(Landroid/widget/LinearLayout;Lkr/memorynotes/Note;)V

    goto :goto_0
.end method

.method synthetic lambda$29$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 47
    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->openEditor(Lkr/memorynotes/Note;)V

    return-void
.end method

.method synthetic lambda$3$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;)Z
    .locals 1

    .line 19
    iget-object p1, p1, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->subjectFilter:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method synthetic lambda$30$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 47
    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string p3, "draft"

    invoke-interface {p2, p3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->openEditor(Lkr/memorynotes/Note;)V

    return-void
.end method

.method synthetic lambda$31$kr-memorynotes-MainActivity()V
    .locals 1

    .line 51
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$32$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;)V
    .locals 0

    .line 63
    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->edit(Lkr/memorynotes/Note;)V

    return-void
.end method

.method synthetic lambda$33$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;)V
    .locals 1

    .line 63
    iget-boolean v0, p1, Lkr/memorynotes/Note;->favorite:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p1, Lkr/memorynotes/Note;->favorite:Z

    :try_start_0
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {v0, p1}, Lkr/memorynotes/NoteDb;->save(Lkr/memorynotes/Note;)V

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->detail(Lkr/memorynotes/Note;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$34$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;)V
    .locals 1

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->startListening(Ljava/util/ArrayList;)V

    return-void
.end method

.method synthetic lambda$35$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;)V
    .locals 1

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Lkr/memorynotes/ReviewScreen;

    invoke-direct {p1, p0, v0}, Lkr/memorynotes/ReviewScreen;-><init>(Lkr/memorynotes/MainActivity;Ljava/util/ArrayList;)V

    iput-object p1, p0, Lkr/memorynotes/MainActivity;->review:Lkr/memorynotes/ReviewScreen;

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->review:Lkr/memorynotes/ReviewScreen;

    invoke-virtual {p1}, Lkr/memorynotes/ReviewScreen;->show()V

    return-void
.end method

.method synthetic lambda$36$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;)V
    .locals 1

    .line 63
    const-string v0, "\uc624\ub2f5\ub178\ud2b8"

    iput-object v0, p1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->edit(Lkr/memorynotes/Note;)V

    return-void
.end method

.method synthetic lambda$37$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;)V
    .locals 3

    .line 63
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v1, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda23;

    invoke-direct {v1, p0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda23;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    const-string p1, "\ub178\ud2b8 \uc0ad\uc81c"

    const-string v2, "\uc774 \ub178\ud2b8\uc640 \ubcf5\uc2b5 \uc774\ub825\uc744 \uc0ad\uc81c\ud560\uae4c\uc694?"

    invoke-virtual {v0, p1, v2, v1}, Lkr/memorynotes/Ui;->confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$38$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;)V
    .locals 1

    .line 63
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {v0, p1}, Lkr/memorynotes/NoteDb;->delete(Lkr/memorynotes/Note;)V

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$39$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;)V
    .locals 1

    .line 63
    :try_start_0
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {v0, p1}, Lkr/memorynotes/NoteDb;->save(Lkr/memorynotes/Note;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$42$kr-memorynotes-MainActivity(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 66
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "dark"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->settings()V

    return-void
.end method

.method synthetic lambda$43$kr-memorynotes-MainActivity(Landroid/widget/Spinner;)V
    .locals 4

    .line 66
    const/4 v0, 0x3

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "font"

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v1

    cmpl-float v1, p1, v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->settings()V

    :cond_0
    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f933333    # 1.15f
        0x3fa66666    # 1.3f
    .end array-data
.end method

.method synthetic lambda$44$kr-memorynotes-MainActivity()V
    .locals 3

    .line 66
    iget-boolean v0, p0, Lkr/memorynotes/MainActivity;->busy:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "application/zip"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\uc554\uae30\ub178\ud2b8-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".zip"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.extra.TITLE"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/16 v1, 0x14

    invoke-virtual {p0, v0, v1}, Lkr/memorynotes/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method synthetic lambda$45$kr-memorynotes-MainActivity()V
    .locals 4

    .line 66
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v1, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda27;

    invoke-direct {v1, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda27;-><init>(Lkr/memorynotes/MainActivity;)V

    const-string v2, "\ubc31\uc5c5 \ubcf5\uc6d0"

    const-string v3, "\ud604\uc7ac \ub178\ud2b8\uc640 \uc0ac\uc9c4\uc774 \ubc31\uc5c5 \ub0b4\uc6a9\uc73c\ub85c \ub300\uccb4\ub429\ub2c8\ub2e4. \uba3c\uc800 \ud604\uc7ac \ub370\uc774\ud130\ub97c \ubc31\uc5c5\ud588\ub294\uc9c0 \ud655\uc778\ud558\uc138\uc694."

    invoke-virtual {v0, v2, v3, v1}, Lkr/memorynotes/Ui;->confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$46$kr-memorynotes-MainActivity()V
    .locals 2

    .line 66
    iget-boolean v0, p0, Lkr/memorynotes/MainActivity;->busy:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v1, 0x15

    invoke-virtual {p0, v0, v1}, Lkr/memorynotes/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method synthetic lambda$49$kr-memorynotes-MainActivity(Ljava/util/ArrayList;Lkr/memorynotes/NoteEditor;)V
    .locals 2

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 p1, 0x0

    goto :goto_1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    invoke-static {p0, v1}, Lkr/memorynotes/ImageMaskView;->importImage(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    :goto_1
    new-instance v1, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, v0, p2, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda4;-><init>(Lkr/memorynotes/MainActivity;Ljava/util/ArrayList;Lkr/memorynotes/NoteEditor;Ljava/lang/Exception;)V

    invoke-virtual {p0, v1}, Lkr/memorynotes/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$5$kr-memorynotes-MainActivity()V
    .locals 2

    .line 25
    const/4 v0, 0x1

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lkr/memorynotes/MainActivity;->startReview(ZLjava/lang/String;)V

    return-void
.end method

.method synthetic lambda$50$kr-memorynotes-MainActivity(Ljava/util/ArrayList;Lkr/memorynotes/NoteEditor;Ljava/lang/Exception;)V
    .locals 1

    .line 68
    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->endBusy()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p3, :cond_0

    invoke-virtual {p0, p3}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :cond_0
    return-void

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Lkr/memorynotes/NoteEditor;->addImage(Ljava/lang/String;)V

    goto :goto_0
.end method

.method synthetic lambda$51$kr-memorynotes-MainActivity(ILandroid/net/Uri;)V
    .locals 5

    .line 68
    :try_start_0
    new-instance v0, Lkr/memorynotes/BackupManager;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-direct {v0, p0, v1}, Lkr/memorynotes/BackupManager;-><init>(Landroid/content/Context;Lkr/memorynotes/NoteDb;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v1, 0x14

    const-string v2, "\ud30c\uc77c\uc744 \uc5f4 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4"

    const/4 v3, 0x0

    if-ne p1, v1, :cond_4

    :try_start_1
    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v4, "wt"

    invoke-virtual {v1, p2, v4}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz p2, :cond_0

    :try_start_2
    invoke-virtual {v0, p2}, Lkr/memorynotes/BackupManager;->exportTo(Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz p2, :cond_8

    :try_start_3
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    :catchall_0
    move-exception v0

    move-object v3, v0

    goto :goto_0

    :cond_0
    :try_start_4
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :goto_0
    if-eqz p2, :cond_1

    :try_start_5
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    :cond_1
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p2

    if-eqz v3, :cond_3

    if-eq v3, p2, :cond_2

    :try_start_6
    invoke-virtual {v3, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    move-object p2, v3

    :cond_3
    :goto_1
    throw p2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    :cond_4
    :try_start_7
    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    if-eqz p2, :cond_5

    :try_start_8
    invoke-virtual {v0, p2}, Lkr/memorynotes/BackupManager;->validateAndRestore(Ljava/io/InputStream;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    if-eqz p2, :cond_8

    :try_start_9
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_3

    :catchall_2
    move-exception v0

    move-object v3, v0

    goto :goto_2

    :cond_5
    :try_start_a
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :goto_2
    if-eqz p2, :cond_6

    :try_start_b
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    :cond_6
    throw v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    :catchall_3
    move-exception p2

    if-eqz v3, :cond_3

    if-eq v3, p2, :cond_7

    :try_start_c
    invoke-virtual {v3, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0

    :cond_7
    move-object p2, v3

    goto :goto_1

    :catch_0
    move-exception p2

    move-object v3, p2

    :cond_8
    :goto_3
    new-instance p2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda24;

    invoke-direct {p2, p0, v3, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda24;-><init>(Lkr/memorynotes/MainActivity;Ljava/lang/Exception;I)V

    invoke-virtual {p0, p2}, Lkr/memorynotes/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$52$kr-memorynotes-MainActivity(Ljava/lang/Exception;I)V
    .locals 1

    .line 68
    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->endBusy()V

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    goto :goto_1

    :cond_0
    const/16 p1, 0x15

    if-ne p2, p1, :cond_1

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "draft"

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1
    const-string p1, "\uc124\uc815"

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/16 v0, 0x14

    if-ne p2, v0, :cond_2

    const-string p2, "\uc0ac\uc9c4\uc744 \ud3ec\ud568\ud55c \ubc31\uc5c5\uc744 \uc800\uc7a5\ud588\uc2b5\ub2c8\ub2e4."

    goto :goto_0

    :cond_2
    const-string p2, "\ubc31\uc5c5 \ubcf5\uc6d0\uc744 \uc644\ub8cc\ud588\uc2b5\ub2c8\ub2e4."

    :goto_0
    invoke-virtual {p1, p2}, Lkr/memorynotes/Ui;->message(Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method synthetic lambda$6$kr-memorynotes-MainActivity()V
    .locals 3

    .line 25
    new-instance v0, Lkr/memorynotes/ReviewPicker;

    const/4 v1, 0x0

    const-string v2, ""

    invoke-direct {v0, p0, v1, v2}, Lkr/memorynotes/ReviewPicker;-><init>(Lkr/memorynotes/MainActivity;ZLjava/lang/String;)V

    return-void
.end method

.method synthetic lambda$7$kr-memorynotes-MainActivity()V
    .locals 1

    .line 26
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->edit(Lkr/memorynotes/Note;)V

    return-void
.end method

.method synthetic lambda$8$kr-memorynotes-MainActivity()V
    .locals 2

    .line 26
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->startListening(Ljava/util/ArrayList;)V

    return-void
.end method

.method synthetic lambda$9$kr-memorynotes-MainActivity(Ljava/lang/String;)V
    .locals 1

    .line 27
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lkr/memorynotes/Note;->from(Lorg/json/JSONObject;)Lkr/memorynotes/Note;

    move-result-object p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->edit(Lkr/memorynotes/Note;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method listPage(Z)V
    .locals 11

    .line 37
    if-eqz p1, :cond_0

    const-string v0, "\uc624\ub2f5"

    goto :goto_0

    :cond_0
    const-string v0, "\uac80\uc0c9"

    :goto_0
    iput-object v0, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    if-eqz p1, :cond_1

    const-string v0, "\uc2e4\uc218\ub97c, \ub0b4 \uac83\uc73c\ub85c"

    goto :goto_1

    :cond_1
    const-string v0, "\ub178\ud2b8 \ucc3e\uae30"

    :goto_1
    const-string v1, ""

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2, v2}, Lkr/memorynotes/MainActivity;->shell(Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 38
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v4, 0x41400000    # 12.0f

    invoke-virtual {v3, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v6, 0x41000000    # 8.0f

    invoke-virtual {v5, v6}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    iget-object v6, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v6, v4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    iget-object v6, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v7, 0x40c00000    # 6.0f

    invoke-virtual {v6, v7}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v6

    invoke-virtual {v0, v3, v5, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v4, "\uac80\uc0c9\uc5b4"

    invoke-virtual {v3, v0, v4, v1, v2}, Lkr/memorynotes/Ui;->edit(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;I)Landroid/widget/EditText;

    move-result-object v2

    const-string v3, "search.query"

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    new-instance v3, Lkr/memorynotes/FilterControls;

    iget-object v4, p0, Lkr/memorynotes/MainActivity;->subjectFilter:Ljava/lang/String;

    invoke-direct {v3, p0, v0, v4, p1}, Lkr/memorynotes/FilterControls;-><init>(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Z)V

    .line 39
    iget-object p1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v0, v0, Lkr/memorynotes/Ui;->green:I

    const/16 v4, 0xe

    invoke-virtual {p1, v1, v4, v0}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v10

    const-string p1, "search.count"

    invoke-virtual {v10, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 40
    iget-object p1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p1}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object p1

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v4, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda48;

    invoke-direct {v4, p0, v3, v2}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda48;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/FilterControls;Landroid/widget/EditText;)V

    const-string v5, "\uc120\ud0dd \ubcf5\uc2b5"

    invoke-virtual {v1, v5, v4}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v4, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda49;

    invoke-direct {v4, p0, v3, v2}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda49;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/FilterControls;Landroid/widget/EditText;)V

    const-string v5, "\u25b6 \uc77d\uae30"

    invoke-virtual {v1, v5, v4}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v4, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda50;

    invoke-direct {v4, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda50;-><init>(Lkr/memorynotes/MainActivity;)V

    const-string v5, "\uff0b \uc0c8 \ub178\ud2b8"

    invoke-virtual {v1, v5, v4}, Lkr/memorynotes/Ui;->primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 41
    iget-object p1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->scrollingNotes(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v7

    new-instance p1, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda51;

    move-object v5, p1

    move-object v6, p0

    move-object v8, v3

    move-object v9, v2

    invoke-direct/range {v5 .. v10}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda51;-><init>(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Lkr/memorynotes/FilterControls;Landroid/widget/EditText;Landroid/widget/TextView;)V

    iput-object p1, v3, Lkr/memorynotes/FilterControls;->changed:Ljava/lang/Runnable;

    invoke-static {p1}, Lkr/memorynotes/MainActivity;->watcher(Ljava/lang/Runnable;)Landroid/text/TextWatcher;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 42
    return-void
.end method

.method meta(Lkr/memorynotes/Note;)Ljava/lang/String;
    .locals 4

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "subjects"

    iget-object v2, p1, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Lkr/memorynotes/MainActivity;->groupName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p1, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "\ub2e8\uc6d0 \uc5c6\uc74c"

    goto :goto_0

    :cond_0
    const-string v2, "chapters"

    iget-object v3, p1, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    invoke-virtual {p0, v2, v3}, Lkr/memorynotes/MainActivity;->groupName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p1, p1, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method nameDialog(Ljava/lang/String;Ljava/lang/String;Lkr/memorynotes/MainActivity$NameAction;)V
    .locals 2

    .line 34
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/widget/EditText;->setSingleLine()V

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\ucde8\uc18c"

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\uc800\uc7a5"

    invoke-virtual {p1, p2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    new-instance p2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda30;

    invoke-direct {p2, p1, v0, p3}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda30;-><init>(Landroid/app/AlertDialog;Landroid/widget/EditText;Lkr/memorynotes/MainActivity$NameAction;)V

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method noteCard(Landroid/widget/LinearLayout;Lkr/memorynotes/Note;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lkr/memorynotes/Dashboard;->card(Lkr/memorynotes/MainActivity;Landroid/widget/LinearLayout;Lkr/memorynotes/Note;)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 68
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, -0x1

    if-ne p2, v0, :cond_a

    if-nez p3, :cond_0

    goto/16 :goto_5

    :cond_0
    const/16 p2, 0xa

    if-ne p1, p2, :cond_6

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    const/4 p2, 0x0

    if-nez p1, :cond_1

    :try_start_0
    invoke-virtual {p0, p2}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "draft"

    const-string v1, ""

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lkr/memorynotes/Note;->from(Lorg/json/JSONObject;)Lkr/memorynotes/Note;

    move-result-object p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->edit(Lkr/memorynotes/Note;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :cond_1
    :goto_0
    iget-object p1, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    if-nez p1, :cond_2

    return-void

    :cond_2
    iget-object p1, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v1

    if-eqz v1, :cond_4

    :goto_1
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ClipData;->getItemCount()I

    move-result v1

    if-lt p2, v1, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_4
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-eqz p2, :cond_5

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5
    :goto_2
    const-string p2, "\uc0ac\uc9c4\uc744 \uac00\uc838\uc624\ub294 \uc911\uc785\ub2c8\ub2e4\u2026"

    invoke-virtual {p0, p2}, Lkr/memorynotes/MainActivity;->startBusy(Ljava/lang/String;)V

    new-instance p2, Ljava/lang/Thread;

    new-instance p3, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda36;

    invoke-direct {p3, p0, v0, p1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda36;-><init>(Lkr/memorynotes/MainActivity;Ljava/util/ArrayList;Lkr/memorynotes/NoteEditor;)V

    invoke-direct {p2, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    :goto_3
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    goto :goto_5

    :cond_6
    const/16 p2, 0x14

    if-eq p1, p2, :cond_7

    const/16 v0, 0x15

    if-ne p1, v0, :cond_a

    :cond_7
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p3

    if-eqz p3, :cond_a

    iget-boolean v0, p0, Lkr/memorynotes/MainActivity;->busy:Z

    if-eqz v0, :cond_8

    goto :goto_5

    :cond_8
    if-ne p1, p2, :cond_9

    const-string p2, "\ubc31\uc5c5 \uc800\uc7a5 \uc911\u2026"

    goto :goto_4

    :cond_9
    const-string p2, "\ubc31\uc5c5 \uac80\uc0ac \ubc0f \ubcf5\uc6d0 \uc911\u2026"

    :goto_4
    invoke-virtual {p0, p2}, Lkr/memorynotes/MainActivity;->startBusy(Ljava/lang/String;)V

    new-instance p2, Ljava/lang/Thread;

    new-instance v0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda37;

    invoke-direct {v0, p0, p1, p3}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda37;-><init>(Lkr/memorynotes/MainActivity;ILandroid/net/Uri;)V

    invoke-direct {p2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    goto :goto_3

    :cond_a
    :goto_5
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 70
    iget-boolean v0, p0, Lkr/memorynotes/MainActivity;->busy:Z

    if-eqz v0, :cond_0

    const-string v0, "\uc791\uc5c5\uc744 \ub9c8\uce60 \ub54c\uae4c\uc9c0 \uc7a0\uc2dc \uae30\ub2e4\ub824\uc8fc\uc138\uc694."

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_0
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    invoke-virtual {v0}, Lkr/memorynotes/NoteEditor;->leave()V

    return-void

    :cond_1
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    const/4 v1, 0x0

    iput-object v1, p0, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_2
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    const-string v1, "\ud648"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0, v1}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 9
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 7
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance v0, Lkr/memorynotes/NoteDb;

    invoke-direct {v0, p0}, Lkr/memorynotes/NoteDb;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    new-instance v0, Lkr/memorynotes/Ui;

    invoke-direct {v0, p0}, Lkr/memorynotes/Ui;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    if-eqz p1, :cond_0

    const-string v0, "page"

    const-string v1, "\ud648"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    const-string v0, "subject"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lkr/memorynotes/MainActivity;->subjectFilter:Ljava/lang/String;

    :cond_0
    iget-object p1, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 11
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechReader;->detach()V

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 1

    .line 10
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    invoke-virtual {v0}, Lkr/memorynotes/NoteEditor;->persistDraft()V

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 8
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "page"

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "subject"

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->subjectFilter:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_0

    invoke-static {p0}, Lkr/memorynotes/WindowChrome;->apply(Lkr/memorynotes/MainActivity;)V

    :cond_0
    return-void
.end method

.method openEditor(Lkr/memorynotes/Note;)V
    .locals 1

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->review:Lkr/memorynotes/ReviewScreen;

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    new-instance v0, Lkr/memorynotes/NoteEditor;

    invoke-direct {v0, p0, p1}, Lkr/memorynotes/NoteEditor;-><init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    invoke-virtual {p1}, Lkr/memorynotes/NoteEditor;->show()V

    return-void
.end method

.method rating(Lkr/memorynotes/Note;)Ljava/lang/String;
    .locals 3

    .line 18
    iget v0, p1, Lkr/memorynotes/Note;->rating:I

    if-gez v0, :cond_0

    const-string p1, "\uc0c8 \ub178\ud2b8"

    goto :goto_0

    :cond_0
    const-string v0, "\ud5f7\uac08\ub9bc"

    const-string v1, "\uc678\uc6e0\uc74c"

    const-string v2, "\ubaa8\ub984"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iget p1, p1, Lkr/memorynotes/Note;->rating:I

    aget-object p1, v0, p1

    :goto_0
    return-object p1
.end method

.method scrollingNotes(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 6

    .line 21
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const-string v1, "note.list"

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setTag(Ljava/lang/Object;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setScrollbarFadingEnabled(Z)V

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v2}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v2

    const-string v3, "note.results"

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v1, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v2
.end method

.method settings()V
    .locals 12

    .line 66
    const-string v0, "\ub0b4 \uacf5\ubd80 \uc124\uc815"

    const-string v1, "\ud3b8\ud558\uac8c \uc77d\uace0, \uc548\uc804\ud558\uac8c \ubcf4\uad00\ud558\uc138\uc694."

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lkr/memorynotes/MainActivity;->shell(Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v3, v3, Lkr/memorynotes/Ui;->ink:I

    const-string v4, "\ud654\uba74"

    const/16 v5, 0x13

    invoke-virtual {v1, v4, v5, v3}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/Switch;

    invoke-direct {v1, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    const-string v3, "\ub2e4\ud06c\ubaa8\ub4dc"

    invoke-virtual {v1, v3}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v3, v3, Lkr/memorynotes/Ui;->ink:I

    invoke-virtual {v1, v3}, Landroid/widget/Switch;->setTextColor(I)V

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v6, "dark"

    invoke-interface {v4, v6, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/Switch;->setChecked(Z)V

    invoke-virtual {v1}, Landroid/widget/Switch;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_0

    const v4, 0x10100a0

    filled-new-array {v4}, [I

    move-result-object v4

    new-array v6, v3, [I

    filled-new-array {v4, v6}, [[I

    move-result-object v4

    new-instance v6, Landroid/content/res/ColorStateList;

    iget-object v7, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v7, v7, Lkr/memorynotes/Ui;->green:I

    iget-object v8, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v8, v8, Lkr/memorynotes/Ui;->muted:I

    filled-new-array {v7, v8}, [I

    move-result-object v7

    invoke-direct {v6, v4, v7}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v1, v6}, Landroid/widget/Switch;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    new-instance v6, Landroid/content/res/ColorStateList;

    const-string v7, "#395A55"

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    iget-object v8, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v8, v8, Lkr/memorynotes/Ui;->line:I

    filled-new-array {v7, v8}, [I

    move-result-object v7

    invoke-direct {v6, v4, v7}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v1, v6}, Landroid/widget/Switch;->setTrackTintList(Landroid/content/res/ColorStateList;)V

    :cond_0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda38;

    invoke-direct {v4, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda38;-><init>(Lkr/memorynotes/MainActivity;)V

    invoke-virtual {v1, v4}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-virtual {p0, v3}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v4, "font"

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-interface {v1, v4, v6}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v1

    iget-object v4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const-string v7, "\ud06c\uac8c"

    const-string v8, "\uc544\uc8fc \ud06c\uac8c"

    const-string v9, "\uae30\ubcf8"

    filled-new-array {v9, v7, v8}, [Ljava/lang/String;

    move-result-object v7

    float-to-double v8, v1

    const-wide v10, 0x3ff3333333333333L    # 1.2

    cmpl-double v8, v8, v10

    const/4 v9, 0x2

    if-lez v8, :cond_1

    move v2, v9

    goto :goto_0

    :cond_1
    cmpl-float v1, v1, v6

    if-lez v1, :cond_2

    goto :goto_0

    :cond_2
    move v2, v3

    :goto_0
    const-string v1, "\uae00\uc790 \ud06c\uae30"

    invoke-virtual {v4, v0, v1, v7, v2}, Lkr/memorynotes/Ui;->spinner(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v0

    new-instance v1, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda39;

    invoke-direct {v1, p0, v0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda39;-><init>(Lkr/memorynotes/MainActivity;Landroid/widget/Spinner;)V

    invoke-static {v1}, Lkr/memorynotes/MainActivity;->listener(Ljava/lang/Runnable;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->ink:I

    const-string v3, "\ubc31\uc5c5 \u00b7 \ubcf5\uc6d0"

    invoke-virtual {v1, v3, v5, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->muted:I

    const-string v3, "\ub178\ud2b8, \uc0ac\uc9c4, \uac00\ub9bc \uc601\uc5ed, \ubcf5\uc2b5 \uae30\ub85d\uc744 \ud568\uaed8 \ubcf4\uad00\ud569\ub2c8\ub2e4. \uc571 \uc0ad\uc81c \uc804 \ubc31\uc5c5 \ud30c\uc77c\uc744 \ubcc4\ub3c4\ub85c \uc800\uc7a5\ud558\uc138\uc694."

    const/16 v4, 0xe

    invoke-virtual {v1, v3, v4, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda40;

    invoke-direct {v2, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda40;-><init>(Lkr/memorynotes/MainActivity;)V

    const-string v3, "\ubc31\uc5c5 \ud30c\uc77c \uc800\uc7a5"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda41;

    invoke-direct {v2, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda41;-><init>(Lkr/memorynotes/MainActivity;)V

    const-string v3, "\ubc31\uc5c5\uc5d0\uc11c \ubcf5\uc6d0"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->ink:I

    const-string v3, "\ud559\uc2b5 \ud1b5\uacc4"

    invoke-virtual {v1, v3, v5, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v2, ""

    invoke-virtual {v1, v2}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v3, "subjects"

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5}, Lkr/memorynotes/NoteDb;->groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const-string v5, "\uac1c"

    const-string v6, "  "

    if-nez v3, :cond_6

    const/4 v2, -0x1

    :goto_2
    if-le v2, v9, :cond_4

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/16 v2, 0xa

    invoke-virtual {v1, v0, v2}, Lkr/memorynotes/Ui;->gap(Landroid/widget/LinearLayout;I)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->ink:I

    const-string v3, "\ucd5c\uadfc 30\uac1c \ud559\uc2b5\uc77c \u00b7 \ubcf5\uc2b5 \ud69f\uc218"

    invoke-virtual {v1, v3, v4, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {v1}, Lkr/memorynotes/NoteDb;->history()Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->muted:I

    const-string v3, "\uc554\uae30\ub178\ud2b8 1.8.4 \u00b7 \uc624\ud504\ub77c\uc778 \uac1c\uc778 \ud559\uc2b5\n\uc0ac\uc9c4 \uac00\ub9ac\uae30\uc640 \ube48\uce78\uc740 \uc9c1\uc811 \uc9c0\uc815\ud569\ub2c8\ub2e4."

    const/16 v4, 0xc

    invoke-virtual {v1, v3, v4, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "   "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "\ud68c"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v5, v5, Lkr/memorynotes/Ui;->muted:I

    invoke-virtual {v2, v1, v4, v5}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_3

    :cond_4
    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v7, Ljava/lang/StringBuilder;

    if-gez v2, :cond_5

    const-string v8, "\uc0c8 \ub178\ud2b8"

    goto :goto_4

    :cond_5
    const-string v8, "\ud5f7\uac08\ub9bc"

    const-string v10, "\uc678\uc6e0\uc74c"

    const-string v11, "\ubaa8\ub984"

    filled-new-array {v11, v8, v10}, [Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v2

    :goto_4
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    move-result-object v8

    new-instance v10, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda43;

    invoke-direct {v10, v2}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda43;-><init>(I)V

    invoke-interface {v8, v10}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/stream/Stream;->count()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v8, v8, Lkr/memorynotes/Ui;->muted:I

    invoke-virtual {v3, v7, v4, v8}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_2

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    iget-object v7, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    move-result-object v8

    new-instance v10, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda42;

    invoke-direct {v10, v3}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda42;-><init>(Ljava/util/Map$Entry;)V

    invoke-interface {v8, v10}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/stream/Stream;->count()J

    move-result-wide v10

    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v5, v5, Lkr/memorynotes/Ui;->ink:I

    const/16 v6, 0xf

    invoke-virtual {v7, v3, v6, v5}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_1
.end method

.method shell(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 12
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lkr/memorynotes/MainActivity;->shell(Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method shell(Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 7

    invoke-static {p0}, Lkr/memorynotes/NoteSwipe;->clear(Lkr/memorynotes/MainActivity;)V

    .line 13
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechReader;->close()V

    :cond_0
    new-instance v0, Lkr/memorynotes/Ui;

    invoke-direct {v0, p0}, Lkr/memorynotes/Ui;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v1, v1, Lkr/memorynotes/Ui;->bg:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v1, v1, Lkr/memorynotes/Ui;->bg:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "dark"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v1

    goto :goto_0

    :cond_1
    const/16 v2, 0x2000

    :goto_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->bg:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    new-instance v2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda12;

    invoke-direct {v2}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda12;-><init>()V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->setContentView(Landroid/view/View;)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v0}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v3, 0x41b00000    # 22.0f

    invoke-virtual {v2, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v5, 0x41600000    # 14.0f

    invoke-virtual {v4, v5}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v5, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v3

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v6, 0x40800000    # 4.0f

    invoke-virtual {v5, v6}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v5

    invoke-virtual {v0, v2, v4, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    if-nez p3, :cond_2

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v3, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda13;

    invoke-direct {v3, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda13;-><init>(Lkr/memorynotes/MainActivity;)V

    const-string v4, "\u2039 \ub3cc\uc544\uac00\uae30"

    invoke-virtual {v2, v4, v3}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_2
    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v3, v3, Lkr/memorynotes/Ui;->green:I

    const-string v4, "MEMORY NOTE"

    const/16 v5, 0xb

    invoke-virtual {v2, v4, v5, v3}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v2, p1}, Lkr/memorynotes/Ui;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->muted:I

    const/16 v3, 0xe

    invoke-virtual {p1, p2, v3, v2}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_3
    iget-object p1, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p1}, Lkr/memorynotes/Ui;->col()Landroid/widget/LinearLayout;

    move-result-object p1

    iput-object p1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object p2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v0, 0x41a00000    # 20.0f

    invoke-virtual {p2, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p2

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v3, 0x40c00000    # 6.0f

    invoke-virtual {v2, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    iget-object v4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v4, v0}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v0

    iget-object v4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v5, 0x41200000    # 10.0f

    invoke-virtual {v4, v5}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v4

    invoke-virtual {p1, p2, v2, v0, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/high16 p1, 0x3f800000    # 1.0f

    const/4 p2, -0x1

    const/4 v0, 0x1

    if-eqz p4, :cond_4

    iget-object p4, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, p2, v1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p4, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    :cond_4
    new-instance p4, Landroid/widget/ScrollView;

    invoke-direct {p4, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p4, v0}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    invoke-virtual {p4, v0}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    invoke-virtual {p4, v1}, Landroid/widget/ScrollView;->setScrollbarFadingEnabled(Z)V

    invoke-virtual {p4, v0}, Landroid/widget/ScrollView;->setSmoothScrollingEnabled(Z)V

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {p4, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, p2, v1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, p4, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_1
    if-eqz p3, :cond_7

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p1}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object p1

    iget-object p2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p2, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p2

    iget-object p3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 p4, 0x40a00000    # 5.0f

    invoke-virtual {p3, p4}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p3

    iget-object p4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p4, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result p4

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    const/high16 v3, 0x40e00000    # 7.0f

    invoke-virtual {v2, v3}, Lkr/memorynotes/Ui;->dp(F)I

    move-result v2

    invoke-virtual {p1, p2, p3, p4, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object p2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget p2, p2, Lkr/memorynotes/Ui;->surface:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const-string p2, "\uac80\uc0c9"

    const-string p3, "\uc124\uc815"

    const-string p4, "\ud648"

    const-string v2, "\uacfc\ubaa9"

    const-string v3, "\uc624\ub2f5"

    filled-new-array {p4, v2, v3, p2, p3}, [Ljava/lang/String;

    move-result-object p2

    :goto_2
    const/4 p3, 0x5

    if-lt v1, p3, :cond_5

    iget-object p2, p0, Lkr/memorynotes/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_3

    :cond_5
    aget-object p3, p2, v1

    iget-object p4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    new-instance v3, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda14;

    invoke-direct {v3, p0, p3}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda14;-><init>(Lkr/memorynotes/MainActivity;Ljava/lang/String;)V

    invoke-virtual {p4, p3, v2, v3}, Lkr/memorynotes/Ui;->navigation(Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p4

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v2, v2, Lkr/memorynotes/Ui;->scale:F

    const/high16 v3, 0x41400000    # 12.0f

    mul-float/2addr v2, v3

    invoke-virtual {p4, v2}, Landroid/widget/Button;->setTextSize(F)V

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_6

    const/4 p3, 0x0

    invoke-virtual {p4, p3, v0}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_6
    iget-object p3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {p3, p1, p4}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_7
    :goto_3
    invoke-static {p0}, Lkr/memorynotes/WindowChrome;->apply(Lkr/memorynotes/MainActivity;)V

    return-void
.end method

.method show(Ljava/lang/String;)V
    .locals 1

    invoke-static {p0}, Lkr/memorynotes/ReviewActions;->clear(Lkr/memorynotes/MainActivity;)V

    .line 15
    const/4 v0, 0x0

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->editor:Lkr/memorynotes/NoteEditor;

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->review:Lkr/memorynotes/ReviewScreen;

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->backAction:Ljava/lang/Runnable;

    iput-object p1, p0, Lkr/memorynotes/MainActivity;->page:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :goto_0
    goto :goto_2

    :sswitch_0
    const-string v0, "\uc624\ub2f5"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    goto :goto_1

    :sswitch_1
    const-string v0, "\uacfc\ubaa9"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->subjects()V

    goto :goto_3

    :sswitch_2
    const-string v0, "\uac80\uc0c9"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_1
    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->listPage(Z)V

    goto :goto_3

    :sswitch_3
    const-string v0, "\ud648"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->home()V

    goto :goto_3

    :goto_2
    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->settings()V

    :goto_3
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0xd648 -> :sswitch_3
        0x15a449 -> :sswitch_2
        0x15ad2d -> :sswitch_1
        0x18b151 -> :sswitch_0
    .end sparse-switch
.end method

.method startBusy(Ljava/lang/String;)V
    .locals 1

    .line 5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lkr/memorynotes/MainActivity;->busy:Z

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lkr/memorynotes/MainActivity;->busyDialog:Landroid/app/AlertDialog;

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->busyDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method startListening(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;)V"
        }
    .end annotation

    .line 14
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    invoke-virtual {v0}, Lkr/memorynotes/SpeechReader;->close()V

    :cond_0
    new-instance v0, Lkr/memorynotes/SpeechReader;

    invoke-direct {v0, p0}, Lkr/memorynotes/SpeechReader;-><init>(Lkr/memorynotes/MainActivity;)V

    iput-object v0, p0, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->speech:Lkr/memorynotes/SpeechReader;

    invoke-virtual {v0, p1}, Lkr/memorynotes/SpeechReader;->open(Ljava/util/ArrayList;)V

    return-void
.end method

.method startReview(ZLjava/lang/String;)V
    .locals 1

    .line 64
    new-instance v0, Lkr/memorynotes/NoteFilter;

    invoke-direct {v0}, Lkr/memorynotes/NoteFilter;-><init>()V

    iput-object p2, v0, Lkr/memorynotes/NoteFilter;->subject:Ljava/lang/String;

    iput-boolean p1, v0, Lkr/memorynotes/NoteFilter;->dueOnly:Z

    iget-object p1, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string p2, ""

    invoke-virtual {p1, p2}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object p2

    invoke-virtual {p2}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lkr/memorynotes/NoteFilter;->select(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->beginReview(Ljava/util/ArrayList;)V

    return-void
.end method

.method subjects()V
    .locals 9

    .line 32
    const-string v0, "\uacf5\uc870\ub0c9\ub3d9\ubd80\ud130 \uc0c8\ub85c\uc6b4 \uacf5\ubd80\uae4c\uc9c0"

    const/4 v1, 0x1

    const-string v2, "\uacfc\ubaa9\ubcc4 \ub178\ud2b8"

    invoke-virtual {p0, v2, v0, v1}, Lkr/memorynotes/MainActivity;->shell(Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v2, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda31;

    invoke-direct {v2, p0}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda31;-><init>(Lkr/memorynotes/MainActivity;)V

    const-string v3, "\uff0b \uacfc\ubaa9 \ucd94\uac00"

    invoke-virtual {v1, v3, v2}, Lkr/memorynotes/Ui;->primary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v1, "subjects"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/NoteDb;->groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    iget-object v2, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Lkr/memorynotes/Ui;->card(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v2

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->db:Lkr/memorynotes/NoteDb;

    const-string v4, ""

    invoke-virtual {v3, v4}, Lkr/memorynotes/NoteDb;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    move-result-object v3

    new-instance v4, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda32;

    invoke-direct {v4, v1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda32;-><init>(Ljava/util/Map$Entry;)V

    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/stream/Stream;->count()J

    move-result-wide v3

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iget-object v7, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v7, v7, Lkr/memorynotes/Ui;->ink:I

    const/16 v8, 0x15

    invoke-virtual {v5, v6, v8, v7}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\uac1c\uc758 \ub178\ud2b8"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget v4, v4, Lkr/memorynotes/Ui;->muted:I

    const/16 v6, 0xd

    invoke-virtual {v5, v3, v6, v4}, Lkr/memorynotes/Ui;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v4, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda33;

    invoke-direct {v4, p0, v1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda33;-><init>(Lkr/memorynotes/MainActivity;Ljava/util/Map$Entry;)V

    const-string v5, "\ub178\ud2b8 \ubcf4\uae30 \u2192"

    invoke-virtual {v3, v5, v4}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v3, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    invoke-virtual {v3}, Lkr/memorynotes/Ui;->row()Landroid/widget/LinearLayout;

    move-result-object v3

    iget-object v4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v6, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda34;

    invoke-direct {v6, p0, v1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda34;-><init>(Lkr/memorynotes/MainActivity;Ljava/util/Map$Entry;)V

    const-string v7, "\ub2e8\uc6d0 \uad00\ub9ac"

    invoke-virtual {v5, v7, v6}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v4, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget-object v5, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    new-instance v6, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda35;

    invoke-direct {v6, p0, v1}, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda35;-><init>(Lkr/memorynotes/MainActivity;Ljava/util/Map$Entry;)V

    const-string v1, "\uc774\ub984 \ubcc0\uacbd"

    invoke-virtual {v5, v1, v6}, Lkr/memorynotes/Ui;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v4, v3, v1}, Lkr/memorynotes/Ui;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_0
.end method
