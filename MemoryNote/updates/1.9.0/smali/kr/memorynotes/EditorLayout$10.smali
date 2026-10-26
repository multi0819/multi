.class Lkr/memorynotes/EditorLayout$10;
.super Ljava/lang/Object;
.source "EditorLayout.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/EditorLayout;->foldField(Landroid/widget/EditText;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/EditorLayout;

.field final synthetic val$field:Landroid/widget/EditText;

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$toggle:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lkr/memorynotes/EditorLayout;Landroid/widget/EditText;Landroid/widget/Button;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 154
    iput-object p1, p0, Lkr/memorynotes/EditorLayout$10;->this$0:Lkr/memorynotes/EditorLayout;

    iput-object p2, p0, Lkr/memorynotes/EditorLayout$10;->val$field:Landroid/widget/EditText;

    iput-object p3, p0, Lkr/memorynotes/EditorLayout$10;->val$toggle:Landroid/widget/Button;

    iput-object p4, p0, Lkr/memorynotes/EditorLayout$10;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 154
    iget-object p1, p0, Lkr/memorynotes/EditorLayout$10;->val$field:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getVisibility()I

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    iget-object v1, p0, Lkr/memorynotes/EditorLayout$10;->val$field:Landroid/widget/EditText;

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/16 v0, 0x8

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setVisibility(I)V

    iget-object v0, p0, Lkr/memorynotes/EditorLayout$10;->val$toggle:Landroid/widget/Button;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lkr/memorynotes/EditorLayout$10;->val$name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p1, :cond_2

    const-string p1, "  \u25be"

    goto :goto_2

    :cond_2
    const-string p1, "  \u25b8"

    :goto_2
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
