.class Lkr/memorynotes/EditorLayout$8;
.super Ljava/lang/Object;
.source "EditorLayout.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/EditorLayout;->setupGeneralTools()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/EditorLayout;

.field final synthetic val$shortcuts:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Lkr/memorynotes/EditorLayout;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 136
    iput-object p1, p0, Lkr/memorynotes/EditorLayout$8;->this$0:Lkr/memorynotes/EditorLayout;

    iput-object p2, p0, Lkr/memorynotes/EditorLayout$8;->val$shortcuts:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 136
    iget-object p1, p0, Lkr/memorynotes/EditorLayout$8;->val$shortcuts:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lkr/memorynotes/EditorLayout$8;->val$shortcuts:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x8

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 p1, 0x1

    return p1
.end method
