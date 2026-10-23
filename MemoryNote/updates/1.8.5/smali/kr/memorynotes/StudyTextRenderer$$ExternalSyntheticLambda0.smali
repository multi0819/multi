.class public final synthetic Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/LinearLayout;

.field public final synthetic f$1:Lkr/memorynotes/Ui;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Z

.field public final synthetic f$4:Z

.field public final synthetic f$5:Ljava/util/Set;

.field public final synthetic f$6:[Ljava/lang/Runnable;

.field public final synthetic f$7:Lorg/json/JSONArray;

.field public final synthetic f$8:I


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Lkr/memorynotes/Ui;Ljava/lang/String;ZZLjava/util/Set;[Ljava/lang/Runnable;Lorg/json/JSONArray;I)V
    .registers 10

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$0:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$1:Lkr/memorynotes/Ui;

    iput-object p3, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iput-boolean p4, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$3:Z

    iput-boolean p5, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$4:Z

    iput-object p6, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$5:Ljava/util/Set;

    iput-object p7, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$6:[Ljava/lang/Runnable;

    iput-object p8, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$7:Lorg/json/JSONArray;

    iput p9, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$8:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 10

    .line 0
    iget-object v0, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$0:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$1:Lkr/memorynotes/Ui;

    iget-object v2, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iget-boolean v3, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$3:Z

    iget-boolean v4, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$4:Z

    iget-object v5, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$5:Ljava/util/Set;

    iget-object v6, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$6:[Ljava/lang/Runnable;

    iget-object v7, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$7:Lorg/json/JSONArray;

    iget v8, p0, Lkr/memorynotes/StudyTextRenderer$$ExternalSyntheticLambda0;->f$8:I

    invoke-static/range {v0 .. v8}, Lkr/memorynotes/StudyTextRenderer;->lambda$1(Landroid/widget/LinearLayout;Lkr/memorynotes/Ui;Ljava/lang/String;ZZLjava/util/Set;[Ljava/lang/Runnable;Lorg/json/JSONArray;I)V

    return-void
.end method
