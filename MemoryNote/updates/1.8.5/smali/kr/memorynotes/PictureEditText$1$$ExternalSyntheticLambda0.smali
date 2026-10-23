.class public final synthetic Lkr/memorynotes/PictureEditText$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Z

.field public final synthetic f$1:Landroid/view/inputmethod/InputContentInfo;


# direct methods
.method public synthetic constructor <init>(ZLandroid/view/inputmethod/InputContentInfo;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lkr/memorynotes/PictureEditText$1$$ExternalSyntheticLambda0;->f$0:Z

    iput-object p2, p0, Lkr/memorynotes/PictureEditText$1$$ExternalSyntheticLambda0;->f$1:Landroid/view/inputmethod/InputContentInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-boolean v0, p0, Lkr/memorynotes/PictureEditText$1$$ExternalSyntheticLambda0;->f$0:Z

    iget-object v1, p0, Lkr/memorynotes/PictureEditText$1$$ExternalSyntheticLambda0;->f$1:Landroid/view/inputmethod/InputContentInfo;

    invoke-static {v0, v1}, Lkr/memorynotes/PictureEditText$1;->lambda$0(ZLandroid/view/inputmethod/InputContentInfo;)V

    return-void
.end method
