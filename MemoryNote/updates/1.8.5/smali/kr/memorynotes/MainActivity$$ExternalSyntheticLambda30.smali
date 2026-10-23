.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda30;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Landroid/app/AlertDialog;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:Lkr/memorynotes/MainActivity$NameAction;


# direct methods
.method public synthetic constructor <init>(Landroid/app/AlertDialog;Landroid/widget/EditText;Lkr/memorynotes/MainActivity$NameAction;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda30;->f$0:Landroid/app/AlertDialog;

    iput-object p2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda30;->f$1:Landroid/widget/EditText;

    iput-object p3, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda30;->f$2:Lkr/memorynotes/MainActivity$NameAction;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .registers 5

    .line 0
    iget-object v0, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda30;->f$0:Landroid/app/AlertDialog;

    iget-object v1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda30;->f$1:Landroid/widget/EditText;

    iget-object v2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda30;->f$2:Lkr/memorynotes/MainActivity$NameAction;

    invoke-static {v0, v1, v2, p1}, Lkr/memorynotes/MainActivity;->lambda$18(Landroid/app/AlertDialog;Landroid/widget/EditText;Lkr/memorynotes/MainActivity$NameAction;Landroid/content/DialogInterface;)V

    return-void
.end method
