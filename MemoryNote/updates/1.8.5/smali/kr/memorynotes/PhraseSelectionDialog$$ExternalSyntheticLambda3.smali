.class public final synthetic Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/PhraseSelectionDialog;

.field public final synthetic f$1:Lkr/memorynotes/PhraseSelection$Range;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/PhraseSelectionDialog;Lkr/memorynotes/PhraseSelection$Range;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda3;->f$0:Lkr/memorynotes/PhraseSelectionDialog;

    iput-object p2, p0, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda3;->f$1:Lkr/memorynotes/PhraseSelection$Range;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5

    .line 0
    iget-object v0, p0, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda3;->f$0:Lkr/memorynotes/PhraseSelectionDialog;

    iget-object v1, p0, Lkr/memorynotes/PhraseSelectionDialog$$ExternalSyntheticLambda3;->f$1:Lkr/memorynotes/PhraseSelection$Range;

    invoke-virtual {v0, v1, p1, p2}, Lkr/memorynotes/PhraseSelectionDialog;->lambda$3$kr-memorynotes-PhraseSelectionDialog(Lkr/memorynotes/PhraseSelection$Range;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
