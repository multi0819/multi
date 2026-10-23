.class Lkr/memorynotes/ColorText$1;
.super Ljava/lang/Object;
.source "ColorText.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/ColorText;->bind(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;Ljava/lang/Runnable;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$field:Landroid/widget/EditText;

.field private final synthetic val$key:Ljava/lang/String;

.field private final synthetic val$n:Lkr/memorynotes/Note;


# direct methods
.method constructor <init>(Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;)V
    .registers 4

    .line 11
    iput-object p1, p0, Lkr/memorynotes/ColorText$1;->val$n:Lkr/memorynotes/Note;

    iput-object p2, p0, Lkr/memorynotes/ColorText$1;->val$key:Ljava/lang/String;

    iput-object p3, p0, Lkr/memorynotes/ColorText$1;->val$field:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 4

    .line 11
    invoke-static {p1}, Lkr/memorynotes/ColorText;->refresh(Landroid/text/Editable;)V

    iget-object p1, p0, Lkr/memorynotes/ColorText$1;->val$n:Lkr/memorynotes/Note;

    iget-object v0, p0, Lkr/memorynotes/ColorText$1;->val$key:Ljava/lang/String;

    iget-object v1, p0, Lkr/memorynotes/ColorText$1;->val$field:Landroid/widget/EditText;

    invoke-static {p1, v0, v1}, Lkr/memorynotes/ColorText;->collect(Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;)V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 11
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 11
    return-void
.end method
