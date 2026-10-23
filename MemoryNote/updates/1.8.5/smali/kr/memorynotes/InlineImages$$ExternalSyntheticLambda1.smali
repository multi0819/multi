.class public final synthetic Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/Ui;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/Ui;Lorg/json/JSONObject;Z)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda1;->f$0:Lkr/memorynotes/Ui;

    iput-object p2, p0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda1;->f$1:Lorg/json/JSONObject;

    iput-boolean p3, p0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda1;->f$2:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda1;->f$0:Lkr/memorynotes/Ui;

    iget-object v1, p0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda1;->f$1:Lorg/json/JSONObject;

    iget-boolean v2, p0, Lkr/memorynotes/InlineImages$$ExternalSyntheticLambda1;->f$2:Z

    invoke-static {v0, v1, v2}, Lkr/memorynotes/InlineImages;->lambda$0(Lkr/memorynotes/Ui;Lorg/json/JSONObject;Z)V

    return-void
.end method
