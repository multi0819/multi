.class public final synthetic Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;

.field public final synthetic f$1:Lkr/memorynotes/Ui;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Lkr/memorynotes/Ui;Z)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda1;->f$0:Landroid/widget/EditText;

    iput-object p2, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda1;->f$1:Lkr/memorynotes/Ui;

    iput-boolean p3, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda1;->f$2:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda1;->f$0:Landroid/widget/EditText;

    iget-object v1, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda1;->f$1:Lkr/memorynotes/Ui;

    iget-boolean v2, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda1;->f$2:Z

    invoke-static {v0, v1, v2}, Lkr/memorynotes/StudyTextRenderer;->lambda$5(Landroid/widget/EditText;Lkr/memorynotes/Ui;Z)V

    return-void
.end method
