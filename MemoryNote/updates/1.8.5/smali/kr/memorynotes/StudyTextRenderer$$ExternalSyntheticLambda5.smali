.class public final synthetic Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/Ui;

.field public final synthetic f$1:Landroid/widget/TextView;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Z

.field public final synthetic f$4:Z

.field public final synthetic f$5:Ljava/util/Set;

.field public final synthetic f$6:Lorg/json/JSONArray;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/Ui;Landroid/widget/TextView;Ljava/lang/String;ZZLjava/util/Set;Lorg/json/JSONArray;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$0:Lkr/memorynotes/Ui;

    iput-object p2, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$1:Landroid/widget/TextView;

    iput-object p3, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    iput-boolean p4, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$3:Z

    iput-boolean p5, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$4:Z

    iput-object p6, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$5:Ljava/util/Set;

    iput-object p7, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$6:Lorg/json/JSONArray;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    .line 0
    iget-object v0, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$0:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$1:Landroid/widget/TextView;

    iget-object v2, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    iget-boolean v3, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$3:Z

    iget-boolean v4, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$4:Z

    iget-object v5, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$5:Ljava/util/Set;

    iget-object v6, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda5;->f$6:Lorg/json/JSONArray;

    invoke-static/range {v0 .. v6}, Lkr/memorynotes/StudyTextRenderer;->lambda$0(Lkr/memorynotes/Ui;Landroid/widget/TextView;Ljava/lang/String;ZZLjava/util/Set;Lorg/json/JSONArray;)V

    return-void
.end method
