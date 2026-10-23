.class public final synthetic Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/TextView;

.field public final synthetic f$1:Lkr/memorynotes/Ui;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Lkr/memorynotes/Ui;Z)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda0;->f$0:Landroid/widget/TextView;

    iput-object p2, p0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda0;->f$1:Lkr/memorynotes/Ui;

    iput-boolean p3, p0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda0;->f$2:Z

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 23

    .line 0
    move-object v0, p0

    iget-object v1, v0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda0;->f$0:Landroid/widget/TextView;

    iget-object v2, v0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda0;->f$1:Lkr/memorynotes/Ui;

    iget-boolean v3, v0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda0;->f$2:Z

    move-object v4, p1

    move v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    move/from16 v12, p9

    invoke-static/range {v1 .. v12}, Lkr/memorynotes/InlineImages;->lambda$2(Landroid/widget/TextView;Lkr/memorynotes/Ui;ZLandroid/view/View;IIIIIIII)V

    return-void
.end method
