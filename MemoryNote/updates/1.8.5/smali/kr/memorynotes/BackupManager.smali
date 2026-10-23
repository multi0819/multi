.class public Lkr/memorynotes/BackupManager;
.super Ljava/lang/Object;
.source "BackupManager.java"


# static fields
.field public static final MAX_IMAGE:J = 0x1900000L

.field public static final MAX_META:J = 0x2000000L

.field public static final MAX_TOTAL:J = 0x20000000L


# instance fields
.field final context:Landroid/content/Context;

.field final db:Lkr/memorynotes/NoteDb;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lkr/memorynotes/NoteDb;)V
    .registers 3

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/BackupManager;->context:Landroid/content/Context;

    iput-object p2, p0, Lkr/memorynotes/BackupManager;->db:Lkr/memorynotes/NoteDb;

    return-void
.end method

.method public static checkExportLimits(JJI)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 7
    const-wide/32 v0, 0x2000000

    cmp-long v0, p0, v0

    if-gtz v0, :cond_14

    add-long/2addr p0, p2

    const-wide/32 p2, 0x20000000

    cmp-long p0, p0, p2

    if-gtz p0, :cond_14

    const/16 p0, 0x2710

    if-gt p4, p0, :cond_14

    return-void

    :cond_14
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\ubc31\uc5c5 \uc6a9\ub7c9 \uc81c\ud55c\uc744 \ucd08\uacfc\ud588\uc2b5\ub2c8\ub2e4. \uc0ac\uc9c4 \uc218 \ub610\ub294 \uc6a9\ub7c9\uc744 \uc904\uc5ec\uc8fc\uc138\uc694"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)J
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    const v0, 0x8000

    new-array v0, v0, [B

    const-wide/16 v1, 0x0

    :goto_7
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_f

    return-wide v1

    :cond_f
    int-to-long v4, v3

    add-long/2addr v1, v4

    cmp-long v4, v1, p2

    if-gtz v4, :cond_1a

    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_7

    :cond_1a
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\ubc31\uc5c5 \ud56d\ubaa9 \ud06c\uae30 \uc81c\ud55c\uc744 \ucd08\uacfc\ud588\uc2b5\ub2c8\ub2e4"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static varargs keys(Lorg/json/JSONObject;[Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    new-instance v0, Ljava/util/HashSet;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p0

    const/4 p1, 0x0

    :goto_e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_23

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result p0

    if-ne p1, p0, :cond_1b

    return-void

    :cond_1b
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\ud544\uc218 \ubc31\uc5c5 \ud544\ub4dc\uac00 \uc5c6\uc2b5\ub2c8\ub2e4"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    add-int/lit8 p1, p1, 0x1

    goto :goto_e

    :cond_30
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\uc54c \uc218 \uc5c6\ub294 \ubc31\uc5c5 \ud544\ub4dc\uc785\ub2c8\ub2e4"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static removeTree(Ljava/io/File;)V
    .registers 5

    .line 33
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_13

    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-lt v2, v1, :cond_b

    goto :goto_13

    :cond_b
    aget-object v3, v0, v2

    invoke-static {v3}, Lkr/memorynotes/BackupManager;->removeTree(Ljava/io/File;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_13
    :goto_13
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    return-void
.end method

.method static validate(Lorg/json/JSONObject;Ljava/util/Set;)V
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    move-object/from16 v0, p0

    const-string v1, "version"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_294

    .line 25
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 26
    const-string v6, "subjects"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-eqz v7, :cond_28c

    const/4 v7, 0x0

    move v8, v7

    :goto_2d
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v9

    const-string v10, "name"

    const-string v11, "id"

    if-lt v8, v9, :cond_251

    .line 27
    const-string v6, "chapters"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    move v8, v7

    :goto_3e
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-lt v8, v9, :cond_207

    .line 28
    const-string v3, "notes"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    move v6, v7

    :goto_4b
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v8

    const/4 v9, 0x2

    if-lt v6, v8, :cond_ab

    .line 29
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    const-string v2, "history"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    :goto_5d
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v7, v2, :cond_64

    .line 30
    return-void

    .line 29
    :cond_64
    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "note"

    const-string v5, "day"

    const-string v6, "rating"

    filled-new-array {v11, v3, v5, v6}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v2, v8}, Lkr/memorynotes/BackupManager;->keys(Lorg/json/JSONObject;[Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a3

    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a3

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    if-ltz v3, :cond_a3

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    if-gt v3, v9, :cond_a3

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/time/LocalDate;->parse(Ljava/lang/CharSequence;)Ljava/time/LocalDate;

    add-int/lit8 v7, v7, 0x1

    goto :goto_5d

    :cond_a3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\uc798\ubabb\ub41c \ubcf5\uc2b5 \uc815\ubcf4"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 28
    :cond_ab
    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const-string v10, "data"

    filled-new-array {v11, v10}, [Ljava/lang/String;

    move-result-object v12

    invoke-static {v8, v12}, Lkr/memorynotes/BackupManager;->keys(Lorg/json/JSONObject;[Ljava/lang/String;)V

    new-instance v12, Lorg/json/JSONObject;

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v12, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v12}, Lkr/memorynotes/Note;->requireComplete(Lorg/json/JSONObject;)V

    invoke-static {v12}, Lkr/memorynotes/Note;->from(Lorg/json/JSONObject;)Lkr/memorynotes/Note;

    move-result-object v10

    iget-object v12, v10, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_1ff

    iget-object v12, v10, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1ff

    iget-object v8, v10, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-interface {v4, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1ff

    iget-object v8, v10, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    invoke-interface {v1, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1ff

    iget-object v8, v10, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_102

    iget-object v8, v10, Lkr/memorynotes/Note;->subject:Ljava/lang/String;

    iget-object v12, v10, Lkr/memorynotes/Note;->chapter:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1ff

    :cond_102
    iget-object v8, v10, Lkr/memorynotes/Note;->title:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1ff

    iget v8, v10, Lkr/memorynotes/Note;->rating:I

    const/4 v12, -0x1

    if-lt v8, v12, :cond_1ff

    iget v8, v10, Lkr/memorynotes/Note;->rating:I

    if-gt v8, v9, :cond_1ff

    iget v8, v10, Lkr/memorynotes/Note;->streak:I

    if-ltz v8, :cond_1ff

    const-string v8, "\ubb38\ub2f5 \uce74\ub4dc"

    const-string v12, "\uc624\ub2f5\ub178\ud2b8"

    const-string v13, "\uc77c\ubc18 \ub178\ud2b8"

    filled-new-array {v13, v8, v12}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    iget-object v12, v10, Lkr/memorynotes/Note;->type:Ljava/lang/String;

    invoke-interface {v8, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1ff

    iget-object v8, v10, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_13e

    iget-object v8, v10, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    invoke-static {v8}, Ljava/time/LocalDate;->parse(Ljava/lang/CharSequence;)Ljava/time/LocalDate;

    :cond_13e
    move v8, v7

    :goto_13f
    iget-object v12, v10, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-lt v8, v12, :cond_14b

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_4b

    :cond_14b
    iget-object v12, v10, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v12, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    const-string v13, "file"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "images/"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lkr/memorynotes/ZipGuard;->checkName(Ljava/lang/String;)V

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v14, p1

    invoke-interface {v14, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1f7

    const-string v13, "masks"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    move v13, v7

    :goto_185
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-lt v13, v15, :cond_18e

    add-int/lit8 v8, v8, 0x1

    goto :goto_13f

    :cond_18e
    invoke-virtual {v12, v13}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v15

    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v9, 0x4

    if-ne v2, v9, :cond_1ef

    move v2, v7

    :goto_19a
    if-lt v2, v9, :cond_1c4

    invoke-virtual {v15, v7}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v18

    const/4 v2, 0x2

    invoke-virtual {v15, v2}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v20

    cmpl-double v9, v18, v20

    if-gez v9, :cond_1bc

    const/4 v9, 0x1

    invoke-virtual {v15, v9}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v16

    const/4 v2, 0x3

    invoke-virtual {v15, v2}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v19

    cmpl-double v2, v16, v19

    if-gez v2, :cond_1bc

    add-int/lit8 v13, v13, 0x1

    move v2, v9

    const/4 v9, 0x2

    goto :goto_185

    :cond_1bc
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\uc798\ubabb\ub41c \uc0ac\uc9c4 \uc601\uc5ed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1c4
    const/16 v16, 0x2

    const/16 v17, 0x1

    invoke-virtual {v15, v2}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Double;->isNaN(D)Z

    move-result v20

    if-nez v20, :cond_1e7

    invoke-static/range {v18 .. v19}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v20

    if-nez v20, :cond_1e7

    const-wide/16 v20, 0x0

    cmpg-double v20, v18, v20

    if-ltz v20, :cond_1e7

    const-wide/high16 v20, 0x3ff0000000000000L    # 1.0

    cmpl-double v18, v18, v20

    if-gtz v18, :cond_1e7

    add-int/lit8 v2, v2, 0x1

    goto :goto_19a

    :cond_1e7
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\uc798\ubabb\ub41c \uc0ac\uc9c4 \uc88c\ud45c"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1ef
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\uc798\ubabb\ub41c \uc0ac\uc9c4 \uac00\ub9bc \uc815\ubcf4"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1f7
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\uc0ac\uc9c4\uc774 \ub204\ub77d\ub41c \ubc31\uc5c5\uc785\ub2c8\ub2e4"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1ff
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\uc798\ubabb\ub41c \ub178\ud2b8 \uc815\ubcf4"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 27
    :cond_207
    move-object/from16 v14, p1

    move/from16 v17, v2

    invoke-virtual {v6, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v9, "subject"

    filled-new-array {v11, v9, v10}, [Ljava/lang/String;

    move-result-object v12

    invoke-static {v2, v12}, Lkr/memorynotes/BackupManager;->keys(Lorg/json/JSONObject;[Ljava/lang/String;)V

    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_249

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_249

    invoke-interface {v1, v9}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_249

    invoke-interface {v3, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_249

    invoke-interface {v5, v12, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v8, v8, 0x1

    move/from16 v2, v17

    goto/16 :goto_3e

    :cond_249
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\uc798\ubabb\ub41c \ub2e8\uc6d0 \uc815\ubcf4"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_251
    move-object/from16 v14, p1

    move/from16 v17, v2

    invoke-virtual {v6, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    filled-new-array {v11, v10}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Lkr/memorynotes/BackupManager;->keys(Lorg/json/JSONObject;[Ljava/lang/String;)V

    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_284

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_284

    invoke-interface {v1, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_284

    add-int/lit8 v8, v8, 0x1

    move/from16 v2, v17

    goto/16 :goto_2d

    :cond_284
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\uc798\ubabb\ub41c \uacfc\ubaa9 \uc815\ubcf4"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_28c
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\uacfc\ubaa9\uc774 \uc5c6\ub294 \ubc31\uc5c5\uc785\ub2c8\ub2e4"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 24
    :cond_294
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\uc9c0\uc6d0\ud558\uc9c0 \uc54a\ub294 \ubc31\uc5c5 \ubc84\uc804\uc785\ub2c8\ub2e4"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public exportTo(Ljava/io/OutputStream;)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 9
    iget-object v0, p0, Lkr/memorynotes/BackupManager;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {v0}, Lkr/memorynotes/NoteDb;->snapshot()Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    const-string v2, "notes"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    move v4, v3

    :goto_13
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lt v4, v5, :cond_122

    .line 10
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const-wide/16 v3, 0x0

    :goto_29
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const-wide/32 v6, 0x1900000

    const-string v8, "images"

    const-string v9, "images/"

    if-nez v5, :cond_df

    array-length v2, v0

    int-to-long v10, v2

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    invoke-static {v10, v11, v3, v4, v2}, Lkr/memorynotes/BackupManager;->checkExportLimits(JJI)V

    .line 11
    const/4 v2, 0x0

    :try_start_40
    new-instance v3, Ljava/util/zip/ZipOutputStream;

    new-instance v4, Ljava/io/BufferedOutputStream;

    invoke-direct {v4, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v3, v4}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_4a
    .catchall {:try_start_40 .. :try_end_4a} :catchall_d5

    :try_start_4a
    new-instance p1, Ljava/util/zip/ZipEntry;

    const-string v4, "notes.json"

    invoke-direct {p1, v4}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    invoke-virtual {v3, v0}, Ljava/util/zip/ZipOutputStream;->write([B)V

    invoke-virtual {v3}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0
    :try_end_62
    .catchall {:try_start_4a .. :try_end_62} :catchall_cf

    if-nez v0, :cond_68

    :try_start_64
    invoke-virtual {v3}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_67
    .catchall {:try_start_64 .. :try_end_67} :catchall_d5

    .line 12
    return-void

    .line 11
    :cond_68
    :try_start_68
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lkr/memorynotes/ZipGuard;->checkName(Ljava/lang/String;)V

    new-instance v1, Ljava/io/File;

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lkr/memorynotes/BackupManager;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v4, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_c7

    new-instance v4, Ljava/util/zip/ZipEntry;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V
    :try_end_a9
    .catchall {:try_start_68 .. :try_end_a9} :catchall_cf

    :try_start_a9
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_ae
    .catchall {:try_start_a9 .. :try_end_ae} :catchall_bd

    :try_start_ae
    invoke-static {v0, v3, v6, v7}, Lkr/memorynotes/BackupManager;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)J
    :try_end_b1
    .catchall {:try_start_ae .. :try_end_b1} :catchall_b8

    :try_start_b1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_b4
    .catchall {:try_start_b1 .. :try_end_b4} :catchall_bd

    :try_start_b4
    invoke-virtual {v3}, Ljava/util/zip/ZipOutputStream;->closeEntry()V
    :try_end_b7
    .catchall {:try_start_b4 .. :try_end_b7} :catchall_cf

    goto :goto_5e

    :catchall_b8
    move-exception v2

    :try_start_b9
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v2
    :try_end_bd
    .catchall {:try_start_b9 .. :try_end_bd} :catchall_bd

    :catchall_bd
    move-exception p1

    if-eqz v2, :cond_c6

    if-eq v2, p1, :cond_c5

    :try_start_c2
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_c5
    move-object p1, v2

    :cond_c6
    :goto_c6
    throw p1

    :cond_c7
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\ucca8\ubd80 \uc0ac\uc9c4\uc774 \uc5c6\uc5b4 \ubc31\uc5c5\uc744 \uc644\ub8cc\ud558\uc9c0 \ubabb\ud588\uc2b5\ub2c8\ub2e4"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_ce
    .catchall {:try_start_c2 .. :try_end_ce} :catchall_cf

    goto :goto_c6

    :catchall_cf
    move-exception p1

    move-object v2, p1

    :try_start_d1
    invoke-virtual {v3}, Ljava/util/zip/ZipOutputStream;->close()V

    throw v2
    :try_end_d5
    .catchall {:try_start_d1 .. :try_end_d5} :catchall_d5

    :catchall_d5
    move-exception p1

    if-eqz v2, :cond_de

    if-eq v2, p1, :cond_dd

    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_dd
    move-object p1, v2

    :cond_de
    throw p1

    .line 10
    :cond_df
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lkr/memorynotes/ZipGuard;->checkName(Ljava/lang/String;)V

    new-instance v9, Ljava/io/File;

    new-instance v10, Ljava/io/File;

    iget-object v11, p0, Lkr/memorynotes/BackupManager;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v11

    invoke-direct {v10, v11, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v9, v10, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_11a

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v10

    cmp-long v5, v10, v6

    if-gtz v5, :cond_11a

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v5

    add-long/2addr v3, v5

    goto/16 :goto_29

    :cond_11a
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\uc0ac\uc9c4\uc774 \uc5c6\uac70\ub098 \ud06c\uae30 \uc81c\ud55c\uc744 \ucd08\uacfc\ud588\uc2b5\ub2c8\ub2e4"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 9
    :cond_122
    new-instance v5, Lorg/json/JSONObject;

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "data"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Lkr/memorynotes/Note;->from(Lorg/json/JSONObject;)Lkr/memorynotes/Note;

    move-result-object v5

    move v6, v3

    :goto_136
    iget-object v7, v5, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lt v6, v7, :cond_142

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_13

    :cond_142
    iget-object v7, v5, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v7, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "file"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_136
.end method

.method public validateAndRestore(Ljava/io/InputStream;)V
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 14
    move-object/from16 v1, p0

    const-string v0, "file"

    const-string v2, "data"

    new-instance v3, Ljava/io/File;

    iget-object v4, v1, Lkr/memorynotes/BackupManager;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "restore-"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-eqz v4, :cond_2c5

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 16
    :try_start_2f
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V
    :try_end_34
    .catchall {:try_start_2f .. :try_end_34} :catchall_2ac

    :try_start_34
    new-instance v7, Ljava/util/zip/ZipInputStream;

    new-instance v8, Ljava/io/BufferedInputStream;

    move-object/from16 v9, p1

    invoke-direct {v8, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v7, v8}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_40
    .catchall {:try_start_34 .. :try_end_40} :catchall_2a0

    const-wide/16 v8, 0x0

    :goto_42
    :try_start_42
    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v10
    :try_end_46
    .catchall {:try_start_42 .. :try_end_46} :catchall_298

    const-wide/32 v13, 0x2000000

    const-string v15, "notes.json"

    if-nez v10, :cond_20d

    :try_start_4d
    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_50
    .catchall {:try_start_4d .. :try_end_50} :catchall_2a0

    .line 17
    :try_start_50
    invoke-interface {v5, v15}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7
    :try_end_54
    .catchall {:try_start_50 .. :try_end_54} :catchall_2ac

    if-eqz v7, :cond_205

    :try_start_56
    new-instance v7, Ljava/io/FileInputStream;

    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v3, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v7, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_60
    .catchall {:try_start_56 .. :try_end_60} :catchall_1f9

    :try_start_60
    new-instance v8, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v8}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-static {v7, v8, v13, v14}, Lkr/memorynotes/BackupManager;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)J

    const-string v9, "UTF-8"

    invoke-virtual {v8, v9}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8
    :try_end_6e
    .catchall {:try_start_60 .. :try_end_6e} :catchall_1f1

    :try_start_6e
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_71
    .catchall {:try_start_6e .. :try_end_71} :catchall_1f9

    :try_start_71
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v7, v5}, Lkr/memorynotes/BackupManager;->validate(Lorg/json/JSONObject;Ljava/util/Set;)V

    .line 18
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_7d
    :goto_7d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9
    :try_end_81
    .catchall {:try_start_71 .. :try_end_81} :catchall_2ac

    const-string v10, "images/"

    if-nez v9, :cond_18e

    .line 19
    :try_start_85
    new-instance v8, Ljava/io/File;

    iget-object v9, v1, Lkr/memorynotes/BackupManager;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v9

    const-string v14, "images"

    invoke-direct {v8, v9, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_a7

    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    move-result v9

    if-eqz v9, :cond_9f

    goto :goto_a7

    :cond_9f
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\uc0ac\uc9c4 \uc800\uc7a5 \uacf5\uac04\uc744 \ub9cc\ub4e4 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a7
    :goto_a7
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_b0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-nez v14, :cond_118

    .line 20
    const-string v5, "notes"

    invoke-virtual {v7, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    const/4 v6, 0x0

    :goto_bd
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lt v6, v8, :cond_cc

    iget-object v0, v1, Lkr/memorynotes/BackupManager;->db:Lkr/memorynotes/NoteDb;

    invoke-virtual {v0, v7}, Lkr/memorynotes/NoteDb;->restore(Lorg/json/JSONObject;)V
    :try_end_c8
    .catchall {:try_start_85 .. :try_end_c8} :catchall_2ac

    .line 21
    invoke-static {v3}, Lkr/memorynotes/BackupManager;->removeTree(Ljava/io/File;)V

    .line 22
    return-void

    .line 20
    :cond_cc
    :try_start_cc
    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    new-instance v10, Lorg/json/JSONObject;

    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v10}, Lkr/memorynotes/Note;->from(Lorg/json/JSONObject;)Lkr/memorynotes/Note;

    move-result-object v10

    const/4 v11, 0x0

    :goto_de
    iget-object v12, v10, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-lt v11, v12, :cond_104

    iget-object v11, v10, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    invoke-static {v11, v9}, Lkr/memorynotes/InlineImageText;->remap(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v10, Lkr/memorynotes/Note;->body:Ljava/lang/String;

    iget-object v11, v10, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-static {v11, v9}, Lkr/memorynotes/InlineImageText;->remap(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v10, Lkr/memorynotes/Note;->answer:Ljava/lang/String;

    invoke-virtual {v10}, Lkr/memorynotes/Note;->json()Lorg/json/JSONObject;

    move-result-object v10

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    add-int/lit8 v6, v6, 0x1

    goto :goto_bd

    :cond_104
    iget-object v12, v10, Lkr/memorynotes/Note;->images:Lorg/json/JSONArray;

    invoke-virtual {v12, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v9, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v12, v0, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    add-int/lit8 v11, v11, 0x1

    goto :goto_de

    .line 19
    :cond_118
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v14, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_125

    goto :goto_b0

    :cond_125
    const/4 v15, 0x7

    invoke-virtual {v14, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, ".img"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v8, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_149
    .catchall {:try_start_cc .. :try_end_149} :catchall_2ac

    :try_start_149
    new-instance v11, Ljava/io/FileInputStream;

    new-instance v12, Ljava/io/File;

    invoke-direct {v12, v3, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v11, v12}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_153
    .catchall {:try_start_149 .. :try_end_153} :catchall_182

    :try_start_153
    new-instance v12, Ljava/io/FileOutputStream;

    invoke-direct {v12, v13}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_158
    .catchall {:try_start_153 .. :try_end_158} :catchall_171

    const-wide/32 v13, 0x1900000

    :try_start_15b
    invoke-static {v11, v12, v13, v14}, Lkr/memorynotes/BackupManager;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)J
    :try_end_15e
    .catchall {:try_start_15b .. :try_end_15e} :catchall_169

    :try_start_15e
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V
    :try_end_161
    .catchall {:try_start_15e .. :try_end_161} :catchall_171

    :try_start_161
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_164
    .catchall {:try_start_161 .. :try_end_164} :catchall_182

    :try_start_164
    invoke-interface {v9, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_167
    .catchall {:try_start_164 .. :try_end_167} :catchall_2ac

    goto/16 :goto_b0

    :catchall_169
    move-exception v0

    move-object v6, v0

    :try_start_16b
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V

    throw v6
    :try_end_16f
    .catchall {:try_start_16b .. :try_end_16f} :catchall_16f

    :catchall_16f
    move-exception v0

    goto :goto_173

    :catchall_171
    move-exception v0

    const/4 v6, 0x0

    :goto_173
    if-eqz v6, :cond_17d

    if-eq v6, v0, :cond_17e

    :try_start_177
    invoke-virtual {v6, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_17e

    :catchall_17b
    move-exception v0

    goto :goto_184

    :cond_17d
    move-object v6, v0

    :cond_17e
    :goto_17e
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V

    throw v6
    :try_end_182
    .catchall {:try_start_177 .. :try_end_182} :catchall_17b

    :catchall_182
    move-exception v0

    const/4 v6, 0x0

    :goto_184
    if-eqz v6, :cond_18c

    if-eq v6, v0, :cond_18d

    :try_start_188
    invoke-virtual {v6, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_18d

    :cond_18c
    move-object v6, v0

    :cond_18d
    :goto_18d
    throw v6

    .line 18
    :cond_18e
    const-wide/32 v13, 0x1900000

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_7d

    new-instance v9, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v9}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v10, 0x1

    iput-boolean v10, v9, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v3, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11, v9}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget v11, v9, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v11, :cond_1e9

    iget v11, v9, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v11, :cond_1e9

    const/4 v11, 0x0

    iput-boolean v11, v9, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    :goto_1bc
    iget v11, v9, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v11, v10

    const/16 v12, 0x800

    if-gt v11, v12, :cond_1e6

    iget v11, v9, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr v11, v10

    if-gt v11, v12, :cond_1e6

    iput v10, v9, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v3, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v9}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v6

    if-eqz v6, :cond_1de

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    goto/16 :goto_7d

    :cond_1de
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\uc190\uc0c1\ub41c \uc0ac\uc9c4\uc774 \uc788\uc2b5\ub2c8\ub2e4"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_1e5
    throw v0

    :cond_1e6
    mul-int/lit8 v10, v10, 0x2

    goto :goto_1bc

    :cond_1e9
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\uc190\uc0c1\ub418\uac70\ub098 \uc9c0\uc6d0\ud558\uc9c0 \uc54a\ub294 \uc0ac\uc9c4\uc774 \uc788\uc2b5\ub2c8\ub2e4"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_1f0
    .catchall {:try_start_188 .. :try_end_1f0} :catchall_2ac

    goto :goto_1e5

    .line 17
    :catchall_1f1
    move-exception v0

    move-object v6, v0

    :try_start_1f3
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    throw v6
    :try_end_1f7
    .catchall {:try_start_1f3 .. :try_end_1f7} :catchall_1f7

    :catchall_1f7
    move-exception v0

    goto :goto_1fb

    :catchall_1f9
    move-exception v0

    const/4 v6, 0x0

    :goto_1fb
    if-eqz v6, :cond_203

    if-eq v6, v0, :cond_204

    :try_start_1ff
    invoke-virtual {v6, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_204

    :cond_203
    move-object v6, v0

    :cond_204
    :goto_204
    throw v6

    :cond_205
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\ub178\ud2b8 \uc815\ubcf4\uac00 \uc5c6\ub294 \ubc31\uc5c5\uc785\ub2c8\ub2e4"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_20d
    .catchall {:try_start_1ff .. :try_end_20d} :catchall_2ac

    .line 16
    :cond_20d
    const-wide/32 v11, 0x1900000

    :try_start_210
    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lkr/memorynotes/ZipGuard;->checkName(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v10

    if-nez v10, :cond_290

    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_290

    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v10

    const/16 v11, 0x2711

    if-gt v10, v11, :cond_288

    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v3, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_249

    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    move-result v11

    if-eqz v11, :cond_241

    goto :goto_249

    :cond_241
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\uc784\uc2dc \ud3f4\ub354\ub97c \ub9cc\ub4e4 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_248
    throw v0
    :try_end_249
    .catchall {:try_start_210 .. :try_end_249} :catchall_298

    :cond_249
    :goto_249
    :try_start_249
    new-instance v11, Ljava/io/FileOutputStream;

    invoke-direct {v11, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_24e
    .catchall {:try_start_249 .. :try_end_24e} :catchall_27c

    :try_start_24e
    invoke-virtual {v6, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_255

    goto :goto_258

    :cond_255
    const-wide/32 v13, 0x1900000

    :goto_258
    invoke-static {v7, v11, v13, v14}, Lkr/memorynotes/BackupManager;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)J

    move-result-wide v12
    :try_end_25c
    .catchall {:try_start_24e .. :try_end_25c} :catchall_274

    add-long/2addr v8, v12

    :try_start_25d
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_260
    .catchall {:try_start_25d .. :try_end_260} :catchall_27c

    const-wide/32 v10, 0x20000000

    cmp-long v6, v8, v10

    if-gtz v6, :cond_26c

    :try_start_267
    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    goto/16 :goto_42

    :cond_26c
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\ubc31\uc5c5\uc740 512MB\uae4c\uc9c0 \ubcf5\uc6d0\ud560 \uc218 \uc788\uc2b5\ub2c8\ub2e4"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_273
    .catchall {:try_start_267 .. :try_end_273} :catchall_298

    goto :goto_248

    :catchall_274
    move-exception v0

    move-object v6, v0

    :try_start_276
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V

    throw v6
    :try_end_27a
    .catchall {:try_start_276 .. :try_end_27a} :catchall_27a

    :catchall_27a
    move-exception v0

    goto :goto_27e

    :catchall_27c
    move-exception v0

    const/4 v6, 0x0

    :goto_27e
    if-eqz v6, :cond_286

    if-eq v6, v0, :cond_287

    :try_start_282
    invoke-virtual {v6, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_287

    :cond_286
    move-object v6, v0

    :cond_287
    :goto_287
    throw v6

    :cond_288
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\ubc31\uc5c5 \ud30c\uc77c \uc218\uac00 \ub108\ubb34 \ub9ce\uc2b5\ub2c8\ub2e4"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_248

    :cond_290
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\uc911\ubcf5 \ub610\ub294 \uc798\ubabb\ub41c \ubc31\uc5c5 \ud56d\ubaa9\uc785\ub2c8\ub2e4"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_297
    .catchall {:try_start_282 .. :try_end_297} :catchall_298

    goto :goto_248

    :catchall_298
    move-exception v0

    move-object v6, v0

    :try_start_29a
    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->close()V

    throw v6
    :try_end_29e
    .catchall {:try_start_29a .. :try_end_29e} :catchall_29e

    :catchall_29e
    move-exception v0

    goto :goto_2a2

    :catchall_2a0
    move-exception v0

    const/4 v6, 0x0

    :goto_2a2
    if-eqz v6, :cond_2aa

    if-eq v6, v0, :cond_2ab

    :try_start_2a6
    invoke-virtual {v6, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2ab

    :cond_2aa
    move-object v6, v0

    :cond_2ab
    :goto_2ab
    throw v6
    :try_end_2ac
    .catchall {:try_start_2a6 .. :try_end_2ac} :catchall_2ac

    .line 21
    :catchall_2ac
    move-exception v0

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2b1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2c1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    goto :goto_2b1

    :cond_2c1
    invoke-static {v3}, Lkr/memorynotes/BackupManager;->removeTree(Ljava/io/File;)V

    throw v0

    .line 14
    :cond_2c5
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\ubcf5\uc6d0 \uc784\uc2dc \uacf5\uac04\uc744 \ub9cc\ub4e4 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
