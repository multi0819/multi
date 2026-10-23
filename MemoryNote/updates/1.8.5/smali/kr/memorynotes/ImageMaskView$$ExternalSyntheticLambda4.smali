.class public final synthetic Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/MainActivity;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:Lkr/memorynotes/ImageMaskView;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;Lkr/memorynotes/ImageMaskView;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda4;->f$0:Lkr/memorynotes/MainActivity;

    iput-object p2, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda4;->f$1:Lorg/json/JSONObject;

    iput-object p3, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda4;->f$2:Lkr/memorynotes/ImageMaskView;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda4;->f$0:Lkr/memorynotes/MainActivity;

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda4;->f$1:Lorg/json/JSONObject;

    iget-object v2, p0, Lkr/memorynotes/ImageMaskView$$ExternalSyntheticLambda4;->f$2:Lkr/memorynotes/ImageMaskView;

    invoke-static {v0, v1, v2}, Lkr/memorynotes/ImageMaskView;->lambda$3(Lkr/memorynotes/MainActivity;Lorg/json/JSONObject;Lkr/memorynotes/ImageMaskView;)V

    return-void
.end method
