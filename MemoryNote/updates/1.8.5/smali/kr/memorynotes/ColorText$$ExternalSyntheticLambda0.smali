.class public final synthetic Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/Note;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:I

.field public final synthetic f$4:I

.field public final synthetic f$5:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;IILjava/lang/Runnable;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$0:Lkr/memorynotes/Note;

    iput-object p2, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$2:Landroid/widget/EditText;

    iput p4, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$3:I

    iput p5, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$4:I

    iput-object p6, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$5:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 11

    .line 0
    iget-object v0, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$0:Lkr/memorynotes/Note;

    iget-object v1, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$2:Landroid/widget/EditText;

    iget v3, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$3:I

    iget v4, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$4:I

    iget-object v5, p0, Lkr/memorynotes/ColorText$$ExternalSyntheticLambda0;->f$5:Ljava/lang/Runnable;

    move-object v6, p1

    move v7, p2

    invoke-static/range {v0 .. v7}, Lkr/memorynotes/ColorText;->lambda$0(Lkr/memorynotes/Note;Ljava/lang/String;Landroid/widget/EditText;IILjava/lang/Runnable;Landroid/content/DialogInterface;I)V

    return-void
.end method
