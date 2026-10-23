.class Lkr/memorynotes/ImageMaskView$1;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "ImageMaskView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/ImageMaskView;-><init>(Landroid/content/Context;Lorg/json/JSONObject;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkr/memorynotes/ImageMaskView;


# direct methods
.method constructor <init>(Lkr/memorynotes/ImageMaskView;)V
    .registers 2

    .line 5
    iput-object p1, p0, Lkr/memorynotes/ImageMaskView$1;->this$0:Lkr/memorynotes/ImageMaskView;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 4

    .line 5
    iget-object v0, p0, Lkr/memorynotes/ImageMaskView$1;->this$0:Lkr/memorynotes/ImageMaskView;

    iget-object v1, p0, Lkr/memorynotes/ImageMaskView$1;->this$0:Lkr/memorynotes/ImageMaskView;

    iget v1, v1, Lkr/memorynotes/ImageMaskView;->zoom:F

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result p1

    mul-float/2addr v1, p1

    const/high16 p1, 0x40a00000    # 5.0f

    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, v0, Lkr/memorynotes/ImageMaskView;->zoom:F

    iget-object p1, p0, Lkr/memorynotes/ImageMaskView$1;->this$0:Lkr/memorynotes/ImageMaskView;

    invoke-virtual {p1}, Lkr/memorynotes/ImageMaskView;->invalidate()V

    const/4 p1, 0x1

    return p1
.end method
