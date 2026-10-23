.class Lkr/memorynotes/Dashboard$Symbol;
.super Landroid/view/View;
.source "Dashboard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkr/memorynotes/Dashboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Symbol"
.end annotation


# instance fields
.field final d:Lkr/memorynotes/Dashboard$SymbolDrawable;


# direct methods
.method constructor <init>(Landroid/content/Context;Lkr/memorynotes/Ui;Ljava/lang/String;I)V
    .registers 5

    .line 53
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Lkr/memorynotes/Dashboard$SymbolDrawable;

    invoke-direct {p1, p2, p3, p4}, Lkr/memorynotes/Dashboard$SymbolDrawable;-><init>(Lkr/memorynotes/Ui;Ljava/lang/String;I)V

    iput-object p1, p0, Lkr/memorynotes/Dashboard$Symbol;->d:Lkr/memorynotes/Dashboard$SymbolDrawable;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 6

    .line 53
    iget-object v0, p0, Lkr/memorynotes/Dashboard$Symbol;->d:Lkr/memorynotes/Dashboard$SymbolDrawable;

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard$Symbol;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lkr/memorynotes/Dashboard$Symbol;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Lkr/memorynotes/Dashboard$SymbolDrawable;->setBounds(IIII)V

    iget-object v0, p0, Lkr/memorynotes/Dashboard$Symbol;->d:Lkr/memorynotes/Dashboard$SymbolDrawable;

    invoke-virtual {v0, p1}, Lkr/memorynotes/Dashboard$SymbolDrawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method
