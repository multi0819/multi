.class Lkr/memorynotes/InlineImages$Picture;
.super Landroid/text/style/ImageSpan;
.source "InlineImages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/InlineImages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Picture"
.end annotation


# direct methods
.method constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    return-void
.end method
