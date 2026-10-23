.class public final synthetic Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/NoteEditor;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/NoteEditor;Lorg/json/JSONObject;I)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda9;->f$0:Lkr/memorynotes/NoteEditor;

    iput-object p2, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda9;->f$1:Lorg/json/JSONObject;

    iput p3, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda9;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda9;->f$0:Lkr/memorynotes/NoteEditor;

    iget-object v1, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda9;->f$1:Lorg/json/JSONObject;

    iget v2, p0, Lkr/memorynotes/NoteEditor$$ExternalSyntheticLambda9;->f$2:I

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/NoteEditor;->lambda$26$kr-memorynotes-NoteEditor(Lorg/json/JSONObject;I)V

    return-void
.end method
