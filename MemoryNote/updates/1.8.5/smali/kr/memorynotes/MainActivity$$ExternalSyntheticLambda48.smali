.class public final synthetic Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda48;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/MainActivity;

.field public final synthetic f$1:Lkr/memorynotes/FilterControls;

.field public final synthetic f$2:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/MainActivity;Lkr/memorynotes/FilterControls;Landroid/widget/EditText;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda48;->f$0:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda48;->f$1:Lkr/memorynotes/FilterControls;

    iput-object p3, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda48;->f$2:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda48;->f$0:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda48;->f$1:Lkr/memorynotes/FilterControls;

    iget-object v2, p0, Lkr/memorynotes/MainActivity$$ExternalSyntheticLambda48;->f$2:Landroid/widget/EditText;

    invoke-virtual {v0, v1, v2}, Lkr/memorynotes/MainActivity;->lambda$25$kr-memorynotes-MainActivity(Lkr/memorynotes/FilterControls;Landroid/widget/EditText;)V

    return-void
.end method
