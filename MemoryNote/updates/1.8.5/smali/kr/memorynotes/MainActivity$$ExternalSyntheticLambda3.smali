.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/MainActivity;

.field public final synthetic f$1:Lkr/memorynotes/Note;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda3;->f$0:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda3;->f$1:Lkr/memorynotes/Note;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda3;->f$0:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda3;->f$1:Lkr/memorynotes/Note;

    invoke-virtual {v0, v1, p1, p2}, Lkr/memorynotes/MainActivity;->lambda$30$kr-memorynotes-MainActivity(Lkr/memorynotes/Note;Landroid/content/DialogInterface;I)V

    return-void
.end method
