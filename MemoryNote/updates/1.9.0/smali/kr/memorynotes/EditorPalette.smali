.class public final Lkr/memorynotes/EditorPalette;
.super Ljava/lang/Object;
.source "EditorPalette.java"


# static fields
.field public static final ANSWER:I = 0x2

.field public static final CAUTION:I = 0x5

.field public static final CLOZE:I = 0x3

.field private static final DARK_BG:[I

.field private static final DARK_FG:[I

.field public static final IMAGE:I = 0x4

.field private static final LIGHT_BG:[I

.field private static final LIGHT_FG:[I

.field public static final NEUTRAL:I = 0x0

.field public static final SAVE:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 6
    const/4 v0, 0x6

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Lkr/memorynotes/EditorPalette;->DARK_BG:[I

    .line 7
    new-array v1, v0, [I

    fill-array-data v1, :array_1

    sput-object v1, Lkr/memorynotes/EditorPalette;->DARK_FG:[I

    .line 8
    new-array v1, v0, [I

    fill-array-data v1, :array_2

    sput-object v1, Lkr/memorynotes/EditorPalette;->LIGHT_BG:[I

    .line 9
    new-array v0, v0, [I

    fill-array-data v0, :array_3

    sput-object v0, Lkr/memorynotes/EditorPalette;->LIGHT_FG:[I

    return-void

    :array_0
    .array-data 4
        -0xd4cfc8
        -0xdbacc1
        -0xdbc1a0
        -0xa7bfdb
        -0xbbcca2
        -0xa9cec3
    .end array-data

    :array_1
    .array-data 4
        -0x1a1611
        -0x3a0c28
        -0x3a2201
        -0x2056
        -0x1b2c01
        -0x2c21
    .end array-data

    :array_2
    .array-data 4
        -0x120f0c
        -0xdb98b9
        -0x191001
        -0x1231
        -0x101901
        -0x1912
    .end array-data

    :array_3
    .array-data 4
        -0xcbbeac
        -0x1
        -0xdfb070
        -0x87bc00    # -3.3000162E38f
        -0x9fc966
        -0x76ccb3
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static background(ZI)I
    .locals 0

    .line 10
    if-eqz p0, :cond_0

    sget-object p0, Lkr/memorynotes/EditorPalette;->DARK_BG:[I

    goto :goto_0

    :cond_0
    sget-object p0, Lkr/memorynotes/EditorPalette;->LIGHT_BG:[I

    :goto_0
    aget p0, p0, p1

    return p0
.end method

.method public static foreground(ZI)I
    .locals 0

    .line 11
    if-eqz p0, :cond_0

    sget-object p0, Lkr/memorynotes/EditorPalette;->DARK_FG:[I

    goto :goto_0

    :cond_0
    sget-object p0, Lkr/memorynotes/EditorPalette;->LIGHT_FG:[I

    :goto_0
    aget p0, p0, p1

    return p0
.end method

.method public static initiallyOpen(Ljava/lang/CharSequence;)Z
    .locals 0

    .line 12
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
