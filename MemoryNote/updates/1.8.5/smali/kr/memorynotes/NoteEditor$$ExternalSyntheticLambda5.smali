.class public final synthetic Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/NoteEditor;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/NoteEditor;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda5;->f$0:Lkr/memorynotes/NoteEditor;

    iput-object p2, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda5;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda5;->f$2:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda5;->f$0:Lkr/memorynotes/NoteEditor;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda5;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda5;->f$2:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2, p1, p2}, Lkr/memorynotes/NoteEditor;->lambda$18$kr-memorynotes-NoteEditor(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V

    return-void
.end method
