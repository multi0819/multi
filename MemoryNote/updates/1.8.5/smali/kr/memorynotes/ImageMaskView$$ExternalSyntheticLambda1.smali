.class public final synthetic Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/json/JSONObject;

.field public final synthetic f$1:Lkr/memorynotes/ImageMaskView;

.field public final synthetic f$2:Lkr/memorynotes/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Lkr/memorynotes/ImageMaskView;Lkr/memorynotes/MainActivity;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda1;->f$0:Lorg/json/JSONObject;

    iput-object p2, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda1;->f$1:Lkr/memorynotes/ImageMaskView;

    iput-object p3, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda1;->f$2:Lkr/memorynotes/MainActivity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda1;->f$0:Lorg/json/JSONObject;

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda1;->f$1:Lkr/memorynotes/ImageMaskView;

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda1;->f$2:Lkr/memorynotes/MainActivity;

    invoke-static {v0, v1, v2}, Lkr/memorynotes/ImageMaskView;->lambda$4(Lorg/json/JSONObject;Lkr/memorynotes/ImageMaskView;Lkr/memorynotes/MainActivity;)V

    return-void
.end method
