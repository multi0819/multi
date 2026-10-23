.class public Lkr/memorynotes/Note;
.super Ljava/lang/Object;
.source "Note.java"


# instance fields
.field public answer:Ljava/lang/String;

.field public body:Ljava/lang/String;

.field public caution:Ljava/lang/String;

.field public chapter:Ljava/lang/String;

.field public due:Ljava/lang/String;

.field public favorite:Z

.field public id:Ljava/lang/String;

.field public images:Lorg/json/JSONArray;

.field public ink:Lorg/json/JSONArray;

.field public mine:Ljava/lang/String;

.field public question:Ljava/lang/String;

.field public rating:I

.field public reason:Ljava/lang/String;

.field public streak:I

.field public subject:Ljava/lang/String;

.field public tags:Ljava/lang/String;

.field public textColors:Lorg/json/JSONObject;

.field public title:Ljava/lang/String;

.field public type:Ljava/lang/String;

.field public updated:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/Note;->mine:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/Note;->reason:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/Note;->caution:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/Note;->tags:Ljava/lang/String;

    const-string v1, "\uc77c\ubc18 \ub178\ud2b8"

    iput-object v1, p0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    iput-object v0, p0, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    .line 6
    const/4 v0, 0x0

    iput-boolean v0, p0, Lkr/memorynotes/Note;->favorite:Z

    const/4 v1, -0x1

    iput v1, p0, Lkr/memorynotes/Note;->rating:I

    iput v0, p0, Lkr/memorynotes/Note;->streak:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lkr/memorynotes/Note;->updated:J

    .line 7
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lkr/memorynotes/Note;->textColors:Lorg/json/JSONObject;

    .line 4
    return-void
.end method

.method public static from(Lorg/json/JSONObject;)Lkr/memorynotes/Note;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 12
    new-instance v0, Lkr/memorynotes/Note;

    invoke-direct {v0}, Lkr/memorynotes/Note;-><init>()V

    const-string v1, "id"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    const-string v1, "subject"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    const-string v1, "chapter"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    const-string v1, "title"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    const-string v1, "body"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    const-string v1, "question"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    const-string v1, "answer"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    const-string v1, "mine"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->mine:Ljava/lang/String;

    const-string v1, "reason"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->reason:Ljava/lang/String;

    const-string v1, "caution"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->caution:Ljava/lang/String;

    const-string v1, "tags"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->tags:Ljava/lang/String;

    const-string v1, "type"

    const-string v2, "\uc77c\ubc18 \ub178\ud2b8"

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    const-string v1, "due"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    const-string v1, "favorite"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, v0, Lkr/memorynotes/Note;->favorite:Z

    const-string v1, "rating"

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lkr/memorynotes/Note;->rating:I

    const-string v1, "streak"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lkr/memorynotes/Note;->streak:I

    const-string v1, "updated"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v0, Lkr/memorynotes/Note;->updated:J

    const-string v1, "images"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    iget-object v1, v0, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    if-nez v1, :cond_a3

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, v0, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    :cond_a3
    const-string v1, "ink"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, v0, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    iget-object v1, v0, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    if-nez v1, :cond_b6

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, v0, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    :cond_b6
    const-string v1, "textColors"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    iput-object p0, v0, Lkr/memorynotes/Note;->textColors:Lorg/json/JSONObject;

    iget-object p0, v0, Lkr/memorynotes/Note;->textColors:Lorg/json/JSONObject;

    if-nez p0, :cond_c9

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    iput-object p0, v0, Lkr/memorynotes/Note;->textColors:Lorg/json/JSONObject;

    :cond_c9
    return-object v0
.end method

.method public static requireComplete(Lorg/json/JSONObject;)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 15
    const-string v11, "type"

    const-string v12, "due"

    const-string v0, "id"

    const-string v1, "subject"

    const-string v2, "chapter"

    const-string v3, "title"

    const-string v4, "body"

    const-string v5, "question"

    const-string v6, "answer"

    const-string v7, "mine"

    const-string v8, "reason"

    const-string v9, "caution"

    const-string v10, "tags"

    filled-new-array/range {v0 .. v12}, [Ljava/lang/String;

    move-result-object v0

    .line 16
    const/4 v1, 0x0

    move v2, v1

    :goto_20
    const/16 v3, 0xd

    if-lt v2, v3, :cond_75

    .line 17
    const-string v0, "streak"

    const-string v2, "updated"

    const-string v3, "rating"

    filled-new-array {v3, v0, v2}, [Ljava/lang/String;

    move-result-object v3

    :goto_2e
    const/4 v0, 0x3

    if-lt v1, v0, :cond_4e

    .line 18
    const-string v0, "favorite"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_46

    const-string v0, "images"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lorg/json/JSONArray;

    if-eqz p0, :cond_46

    .line 19
    return-void

    .line 18
    :cond_46
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "\ud544\uc218 \ub178\ud2b8 \uc815\ubcf4\uac00 \uc5c6\uc2b5\ub2c8\ub2e4"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 17
    :cond_4e
    aget-object v0, v3, v1

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    instance-of v4, v2, Ljava/lang/Integer;

    if-nez v4, :cond_72

    instance-of v2, v2, Ljava/lang/Long;

    if-eqz v2, :cond_5d

    goto :goto_72

    :cond_5d
    new-instance p0, Lorg/json/JSONException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\uc798\ubabb\ub41c \uc22b\uc790 \ud544\ub4dc: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_72
    :goto_72
    add-int/lit8 v1, v1, 0x1

    goto :goto_2e

    .line 16
    :cond_75
    aget-object v3, v0, v2

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Ljava/lang/String;

    if-eqz v4, :cond_82

    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    :cond_82
    new-instance p0, Lorg/json/JSONException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\uc798\ubabb\ub41c \ub178\ud2b8 \ud544\ub4dc: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public json()Lorg/json/JSONObject;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 9
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "id"

    iget-object v2, p0, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "subject"

    iget-object v2, p0, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "chapter"

    iget-object v2, p0, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "title"

    iget-object v2, p0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "body"

    iget-object v2, p0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "question"

    iget-object v2, p0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "answer"

    iget-object v2, p0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "mine"

    iget-object v2, p0, Lkr/memorynotes/Note;->mine:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "reason"

    iget-object v2, p0, Lkr/memorynotes/Note;->reason:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "caution"

    iget-object v2, p0, Lkr/memorynotes/Note;->caution:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "tags"

    iget-object v2, p0, Lkr/memorynotes/Note;->tags:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "type"

    iget-object v2, p0, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "due"

    iget-object v2, p0, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "favorite"

    iget-boolean v2, p0, Lkr/memorynotes/Note;->favorite:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v1, "rating"

    iget v2, p0, Lkr/memorynotes/Note;->rating:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "streak"

    iget v2, p0, Lkr/memorynotes/Note;->streak:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "updated"

    iget-wide v2, p0, Lkr/memorynotes/Note;->updated:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v1, "images"

    iget-object v2, p0, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "ink"

    iget-object v2, p0, Lkr/memorynotes/Note;->ink:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "textColors"

    iget-object v2, p0, Lkr/memorynotes/Note;->textColors:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-object v0
.end method

.method public searchable()Ljava/lang/String;
    .registers 4

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lkr/memorynotes/Note;->question:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lkr/memorynotes/Note;->mine:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lkr/memorynotes/Note;->reason:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lkr/memorynotes/Note;->caution:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lkr/memorynotes/Note;->tags:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
