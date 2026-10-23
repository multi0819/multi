.class public final Lkr/memorynotes/ColorRanges;
.super Ljava/lang/Object;
.source "ColorRanges.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static add(Lorg/json/JSONArray;III)V
    .registers 6

    .line 10
    if-gt p2, p1, :cond_3

    return-void

    :cond_3
    :try_start_3
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "start"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p1, "end"

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p1, "color"

    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1a
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_1a} :catch_1b

    return-void

    :catch_1b
    move-exception p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static replace(Lorg/json/JSONArray;IILjava/lang/Integer;)Lorg/json/JSONArray;
    .registers 11

    .line 6
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    if-ltz p1, :cond_4e

    if-gt p2, p1, :cond_a

    goto :goto_4e

    .line 7
    :cond_a
    const/4 v1, 0x0

    :goto_b
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v1, v2, :cond_1b

    .line 8
    if-eqz p3, :cond_1a

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-static {v0, p1, p2, p0}, Lkr/memorynotes/ColorRanges;->add(Lorg/json/JSONArray;III)V

    :cond_1a
    return-object v0

    .line 7
    :cond_1b
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_22

    :cond_21
    goto :goto_4b

    :cond_22
    const-string v3, "start"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const-string v4, "end"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    if-le v4, p1, :cond_48

    if-lt v3, p2, :cond_33

    goto :goto_48

    :cond_33
    const-string v5, "color"

    if-ge v3, p1, :cond_3e

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    invoke-static {v0, v3, p1, v6}, Lkr/memorynotes/ColorRanges;->add(Lorg/json/JSONArray;III)V

    :cond_3e
    if-le v4, p2, :cond_21

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, p2, v4, v2}, Lkr/memorynotes/ColorRanges;->add(Lorg/json/JSONArray;III)V

    goto :goto_4b

    :cond_48
    :goto_48
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :goto_4b
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 6
    :cond_4e
    :goto_4e
    return-object p0
.end method
