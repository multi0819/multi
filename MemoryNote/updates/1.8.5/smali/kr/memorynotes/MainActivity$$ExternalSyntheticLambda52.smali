.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda52;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;

.field public final synthetic f$1:Lkr/memorynotes/MainActivity$NameAction;

.field public final synthetic f$2:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Lkr/memorynotes/MainActivity$NameAction;Landroid/app/AlertDialog;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda52;->f$0:Landroid/widget/EditText;

    iput-object p2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda52;->f$1:Lkr/memorynotes/MainActivity$NameAction;

    iput-object p3, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda52;->f$2:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda52;->f$0:Landroid/widget/EditText;

    iget-object v1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda52;->f$1:Lkr/memorynotes/MainActivity$NameAction;

    iget-object v2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda52;->f$2:Landroid/app/AlertDialog;

    invoke-static {v0, v1, v2, p1}, Lkr/memorynotes/MainActivity;->lambda$19(Landroid/widget/EditText;Lkr/memorynotes/MainActivity$NameAction;Landroid/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
