.class public final synthetic Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/NoteEditor;

.field public final synthetic f$1:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/NoteEditor;Lorg/json/JSONObject;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda7;->f$0:Lkr/memorynotes/NoteEditor;

    iput-object p2, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda7;->f$1:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda7;->f$0:Lkr/memorynotes/NoteEditor;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda7;->f$1:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, p1, p2}, Lkr/memorynotes/NoteEditor;->lambda$19$kr-memorynotes-NoteEditor(Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V

    return-void
.end method
