.class Lkr/memorynotes/ColorText$Tint;
.super Landroid/text/style/CharacterStyle;
.source "ColorText.java"

# interfaces
.implements Landroid/text/style/UpdateAppearance;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/ColorText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Tint"
.end annotation


# instance fields
.field final color:I


# direct methods
.method constructor <init>(I)V
    .registers 2

    .line 6
    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

    iput p1, p0, Lkr/memorynotes/ColorText$Tint;->color:I

    return-void
.end method


# virtual methods
.method public updateDrawState(Landroid/text/TextPaint;)V
    .registers 3

    .line 6
    iget v0, p0, Lkr/memorynotes/ColorText$Tint;->color:I

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    return-void
.end method
