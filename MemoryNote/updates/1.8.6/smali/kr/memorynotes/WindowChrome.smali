.class public final Lkr/memorynotes/WindowChrome;
.super Ljava/lang/Object;
.source "WindowChrome.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static appearance(ZI)I
    .registers 5

    .line 9
    const/4 v0, 0x0

    if-eqz p0, :cond_5

    move v1, v0

    goto :goto_7

    :cond_5
    const/16 v1, 0x18

    :goto_7
    const/16 v2, 0x23

    if-lt p1, v2, :cond_12

    if-eqz p0, :cond_e

    goto :goto_10

    :cond_e
    const/16 v0, 0x100

    :goto_10
    or-int/lit16 v0, v0, 0x80

    :cond_12
    or-int p0, v1, v0

    return p0
.end method

.method public static apply(Lkr/memorynotes/MainActivity;)V
    .registers 6

    .line 11
    iget-object v0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    if-nez v0, :cond_5

    return-void

    .line 12
    :cond_5
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkr/memorynotes/MainActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "dark"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 13
    invoke-virtual {p0}, Lkr/memorynotes/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    .line 14
    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    iget-object p0, p0, Lkr/memorynotes/MainActivity;->u:Lkr/memorynotes/Ui;

    iget p0, p0, Lkr/memorynotes/Ui;->bg:I

    invoke-direct {v4, p0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v4}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 15
    invoke-static {v1}, Lkr/memorynotes/WindowChrome;->legacyFlags(Z)I

    move-result p0

    invoke-virtual {v3, p0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 16
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1d

    if-lt p0, v3, :cond_34

    invoke-virtual {v2, v0}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    .line 17
    :cond_34
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1e

    if-lt p0, v3, :cond_5e

    invoke-virtual {v2}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object p0

    if-eqz p0, :cond_5e

    .line 18
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v1, v2}, Lkr/memorynotes/WindowChrome;->appearance(ZI)I

    move-result v1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x23

    if-lt v2, v3, :cond_4e

    const/16 v0, 0x180

    :cond_4e
    or-int/lit8 v0, v0, 0x18

    invoke-interface {p0, v1, v0}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    .line 19
    const/4 v0, 0x2

    invoke-interface {p0, v0}, Landroid/view/WindowInsetsController;->setSystemBarsBehavior(I)V

    .line 20
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    move-result v0

    invoke-interface {p0, v0}, Landroid/view/WindowInsetsController;->hide(I)V

    .line 22
    :cond_5e
    return-void
.end method

.method static legacyFlags(Z)I
    .registers 1

    .line 8
    if-eqz p0, :cond_4

    const/4 p0, 0x0

    goto :goto_6

    :cond_4
    const/16 p0, 0x2010

    :goto_6
    or-int/lit16 p0, p0, 0x1002

    return p0
.end method
