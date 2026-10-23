.class public Lkr/memorynotes/NoteDb;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "NoteDb.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    .line 9
    const/4 v0, 0x0

    const/4 v1, 0x1

    const-string v2, "memorynotes.db"

    invoke-direct {p0, p1, v2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    invoke-virtual {p0}, Lkr/memorynotes/NoteDb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    return-void
.end method

.method static synthetic lambda$0(Lkr/memorynotes/Note;Lkr/memorynotes/Note;)I
    .registers 4

    .line 26
    iget-wide v0, p1, Lkr/memorynotes/Note;->updated:J

    iget-wide p0, p0, Lkr/memorynotes/Note;->updated:J

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method


# virtual methods
.method public addGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 23
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "id"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "name"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_1e

    const-string p2, "subject"

    invoke-virtual {v1, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1e
    invoke-virtual {p0}, Lkr/memorynotes/NoteDb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {p2, p1, p3, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    return-object v0
.end method

.method public delete(Lkr/memorynotes/Note;)V
    .registers 6

    .line 27
    invoke-virtual {p0}, Lkr/memorynotes/NoteDb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_7
    const-string v1, "notes"

    const-string v2, "id=?"

    iget-object v3, p1, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    const-string v1, "history"

    const-string v2, "note=?"

    iget-object p1, p1, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, v2, p1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_24
    .catchall {:try_start_7 .. :try_end_24} :catchall_28

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-void

    :catchall_28
    move-exception p1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1
.end method

.method public groups(Ljava/lang/String;Ljava/lang/String;)Ljava/util/LinkedHashMap;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 20
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 21
    const/4 v1, 0x0

    :try_start_6
    invoke-virtual {p0}, Lkr/memorynotes/NoteDb;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "id"

    const-string v4, "name"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v4

    if-nez p2, :cond_16

    move-object v5, v1

    goto :goto_19

    :cond_16
    const-string v3, "subject=?"

    move-object v5, v3

    :goto_19
    if-nez p2, :cond_1d

    move-object v6, v1

    goto :goto_22

    :cond_1d
    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    move-object v6, p2

    :goto_22
    const-string v9, "rowid"

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, p1

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_2b
    .catchall {:try_start_6 .. :try_end_2b} :catchall_4d

    :goto_2b
    :try_start_2b
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result p2
    :try_end_2f
    .catchall {:try_start_2b .. :try_end_2f} :catchall_45

    if-nez p2, :cond_37

    if-eqz p1, :cond_36

    :try_start_33
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_4d

    :cond_36
    return-object v0

    :cond_37
    const/4 p2, 0x0

    :try_start_38
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    const/4 v2, 0x1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p2, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_44
    .catchall {:try_start_38 .. :try_end_44} :catchall_45

    goto :goto_2b

    :catchall_45
    move-exception p2

    move-object v1, p2

    if-eqz p1, :cond_4c

    :try_start_49
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_4c
    throw v1
    :try_end_4d
    .catchall {:try_start_49 .. :try_end_4d} :catchall_4d

    :catchall_4d
    move-exception p1

    if-eqz v1, :cond_56

    if-eq v1, p1, :cond_55

    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_55
    move-object p1, v1

    :cond_56
    throw p1
.end method

.method public history()Ljava/util/LinkedHashMap;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 31
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const/4 v1, 0x0

    :try_start_6
    invoke-virtual {p0}, Lkr/memorynotes/NoteDb;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "SELECT day,COUNT(*) FROM history GROUP BY day ORDER BY day DESC LIMIT 30"

    invoke-virtual {v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_10
    .catchall {:try_start_6 .. :try_end_10} :catchall_36

    :goto_10
    :try_start_10
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3
    :try_end_14
    .catchall {:try_start_10 .. :try_end_14} :catchall_2e

    if-nez v3, :cond_1c

    if-eqz v2, :cond_1b

    :try_start_18
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_36

    :cond_1b
    return-object v0

    :cond_1c
    const/4 v3, 0x0

    :try_start_1d
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2d
    .catchall {:try_start_1d .. :try_end_2d} :catchall_2e

    goto :goto_10

    :catchall_2e
    move-exception v0

    move-object v1, v0

    if-eqz v2, :cond_35

    :try_start_32
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_35
    throw v1
    :try_end_36
    .catchall {:try_start_32 .. :try_end_36} :catchall_36

    :catchall_36
    move-exception v0

    if-eqz v1, :cond_3f

    if-eq v1, v0, :cond_3e

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3e
    move-object v0, v1

    :cond_3f
    throw v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 11

    .line 11
    const-string v0, "CREATE TABLE subjects(id TEXT PRIMARY KEY,name TEXT NOT NULL)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 12
    const-string v0, "CREATE TABLE chapters(id TEXT PRIMARY KEY,subject TEXT NOT NULL,name TEXT NOT NULL)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 13
    const-string v0, "CREATE TABLE notes(id TEXT PRIMARY KEY,data TEXT NOT NULL)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 14
    const-string v0, "CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT,note TEXT NOT NULL,day TEXT NOT NULL,rating INTEGER NOT NULL)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 15
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "id"

    const-string v2, "hvac"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "\uacf5\uc870\ub0c9\ub3d9"

    const-string v4, "name"

    invoke-virtual {v0, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "subjects"

    const/4 v5, 0x0

    invoke-virtual {p1, v3, v5, v0}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 16
    const-string v0, "\uacf5\uae30\uc870\ud654"

    const-string v3, "\ubc30\uad00\u00b7\uc124\ube44"

    const-string v6, "\ub0c9\ub3d9\uacf5\ud559"

    filled-new-array {v6, v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    :goto_38
    const/4 v6, 0x3

    if-lt v3, v6, :cond_3c

    .line 17
    return-void

    .line 16
    :cond_3c
    aget-object v6, v0, v3

    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v1, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "subject"

    invoke-virtual {v7, v8, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "chapters"

    invoke-virtual {p1, v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    add-int/lit8 v3, v3, 0x1

    goto :goto_38
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 4

    .line 18
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Unsupported schema"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public query(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lkr/memorynotes/Note;",
            ">;"
        }
    .end annotation

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :try_start_6
    invoke-virtual {p0}, Lkr/memorynotes/NoteDb;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "SELECT data FROM notes ORDER BY rowid DESC"

    invoke-virtual {v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_10
    .catchall {:try_start_6 .. :try_end_10} :catchall_63

    :cond_10
    :goto_10
    :try_start_10
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3
    :try_end_14
    .catchall {:try_start_10 .. :try_end_14} :catchall_5b

    if-nez v3, :cond_24

    if-eqz v2, :cond_1b

    :try_start_18
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_63

    :cond_1b
    new-instance p1, Lkr/memorynotes/NoteDb$$ExternalSyntheticLambda0;

    invoke-direct {p1}, Lkr/memorynotes/NoteDb$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    return-object v0

    :cond_24
    :try_start_24
    new-instance v3, Lorg/json/JSONObject;

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lkr/memorynotes/Note;->from(Lorg/json/JSONObject;)Lkr/memorynotes/Note;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4e

    invoke-virtual {v3}, Lkr/memorynotes/Note;->searchable()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_10

    :cond_4e
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_51
    .catch Lorg/json/JSONException; {:try_start_24 .. :try_end_51} :catch_52
    .catchall {:try_start_24 .. :try_end_51} :catchall_5b

    goto :goto_10

    :catch_52
    move-exception p1

    :try_start_53
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\ub178\ud2b8\ub97c \uc77d\uc744 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4"

    invoke-direct {v0, v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
    :try_end_5b
    .catchall {:try_start_53 .. :try_end_5b} :catchall_5b

    :catchall_5b
    move-exception p1

    move-object v1, p1

    if-eqz v2, :cond_62

    :try_start_5f
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_62
    throw v1
    :try_end_63
    .catchall {:try_start_5f .. :try_end_63} :catchall_63

    :catchall_63
    move-exception p1

    if-eqz v1, :cond_6c

    if-eq v1, p1, :cond_6b

    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6b
    move-object p1, v1

    :cond_6c
    throw p1
.end method

.method public renameGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 24
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "name"

    invoke-virtual {v0, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lkr/memorynotes/NoteDb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p3

    const-string v1, "id=?"

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p1, v0, v1, p2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public restore(Lorg/json/JSONObject;)V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 37
    invoke-virtual {p0}, Lkr/memorynotes/NoteDb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_7
    const-string v1, "history"

    const-string v2, "notes"

    const-string v3, "chapters"

    const-string v4, "subjects"

    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :goto_15
    const/4 v4, 0x4

    if-lt v3, v4, :cond_1f

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1b
    .catchall {:try_start_7 .. :try_end_1b} :catchall_70

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 38
    return-void

    .line 37
    :cond_1f
    :try_start_1f
    aget-object v4, v1, v3

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    move v7, v2

    :goto_2a
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lt v7, v8, :cond_33

    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    :cond_33
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {v8}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v10

    :goto_40
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_4c

    invoke-virtual {v0, v4, v5, v9}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    add-int/lit8 v7, v7, 0x1

    goto :goto_2a

    :cond_4c
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    instance-of v13, v12, Ljava/lang/Number;

    if-eqz v13, :cond_68

    check-cast v12, Ljava/lang/Number;

    invoke-virtual {v12}, Ljava/lang/Number;->longValue()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_40

    :cond_68
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6f
    .catchall {:try_start_1f .. :try_end_6f} :catchall_70

    goto :goto_40

    :catchall_70
    move-exception p1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1
.end method

.method public review(Lkr/memorynotes/Note;I)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 29
    invoke-virtual {p0}, Lkr/memorynotes/NoteDb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_b
    iget v2, p1, Lkr/memorynotes/Note;->streak:I

    invoke-static {v1, p2, v2}, Lkr/memorynotes/ReviewScheduler;->next(Ljava/time/LocalDate;II)Ljava/time/LocalDate;

    move-result-object v2

    invoke-virtual {v2}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lkr/memorynotes/Note;->due:Ljava/lang/String;

    iget v2, p1, Lkr/memorynotes/Note;->streak:I

    invoke-static {p2, v2}, Lkr/memorynotes/ReviewScheduler;->streak(II)I

    move-result v2

    iput v2, p1, Lkr/memorynotes/Note;->streak:I

    iput p2, p1, Lkr/memorynotes/Note;->rating:I

    invoke-virtual {p0, p1}, Lkr/memorynotes/NoteDb;->save(Lkr/memorynotes/Note;)V

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "note"

    iget-object p1, p1, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "day"

    invoke-virtual {v1}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, p1, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "rating"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v2, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p1, "history"

    const/4 p2, 0x0

    invoke-virtual {v0, p1, p2, v2}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4b
    .catchall {:try_start_b .. :try_end_4b} :catchall_4f

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 30
    return-void

    .line 29
    :catchall_4f
    move-exception p1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1
.end method

.method public save(Lkr/memorynotes/Note;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p1, Lkr/memorynotes/Note;->updated:J

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "id"

    iget-object v2, p1, Lkr/memorynotes/Note;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lkr/memorynotes/Note;->json()Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "data"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lkr/memorynotes/NoteDb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const/4 v1, 0x0

    const/4 v2, 0x5

    const-string v3, "notes"

    invoke-virtual {p1, v3, v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    return-void
.end method

.method public snapshot()Lorg/json/JSONObject;
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 33
    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/NoteDb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 34
    :try_start_7
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "version"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v2, "subjects"

    const-string v4, "chapters"

    const-string v5, "notes"

    const-string v6, "history"

    filled-new-array {v2, v4, v5, v6}, [Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    move v5, v4

    :goto_20
    const/4 v6, 0x4

    if-lt v5, v6, :cond_2a

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_26
    .catchall {:try_start_7 .. :try_end_26} :catchall_96

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object v0

    :cond_2a
    :try_start_2a
    aget-object v6, v2, v5

    new-instance v15, Lorg/json/JSONArray;

    invoke-direct {v15}, Lorg/json/JSONArray;-><init>()V
    :try_end_31
    .catchall {:try_start_2a .. :try_end_31} :catchall_96

    const/16 v16, 0x0

    :try_start_33
    invoke-virtual/range {p0 .. p0}, Lkr/memorynotes/NoteDb;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v8, v6

    invoke-virtual/range {v7 .. v14}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7
    :try_end_42
    .catchall {:try_start_33 .. :try_end_42} :catchall_88

    :goto_42
    :try_start_42
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8
    :try_end_46
    .catchall {:try_start_42 .. :try_end_46} :catchall_7f

    if-nez v8, :cond_53

    if-eqz v7, :cond_4d

    :try_start_4a
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_4d
    .catchall {:try_start_4a .. :try_end_4d} :catchall_88

    :cond_4d
    :try_start_4d
    invoke-virtual {v0, v6, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_50
    .catchall {:try_start_4d .. :try_end_50} :catchall_96

    add-int/lit8 v5, v5, 0x1

    goto :goto_20

    :cond_53
    :try_start_53
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    move v9, v4

    :goto_59
    invoke-interface {v7}, Landroid/database/Cursor;->getColumnCount()I

    move-result v10

    if-lt v9, v10, :cond_63

    invoke-virtual {v15, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_42

    :cond_63
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v9}, Landroid/database/Cursor;->getType(I)I

    move-result v11

    if-ne v11, v3, :cond_75

    invoke-interface {v7, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    invoke-virtual {v8, v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_7c

    :cond_75
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7c
    .catchall {:try_start_53 .. :try_end_7c} :catchall_7f

    :goto_7c
    add-int/lit8 v9, v9, 0x1

    goto :goto_59

    :catchall_7f
    move-exception v0

    move-object/from16 v16, v0

    if-eqz v7, :cond_87

    :try_start_84
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_87
    throw v16
    :try_end_88
    .catchall {:try_start_84 .. :try_end_88} :catchall_88

    :catchall_88
    move-exception v0

    move-object v2, v0

    move-object/from16 v0, v16

    if-eqz v0, :cond_94

    if-eq v0, v2, :cond_95

    :try_start_90
    invoke-virtual {v0, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_95

    :cond_94
    move-object v0, v2

    :cond_95
    :goto_95
    throw v0
    :try_end_96
    .catchall {:try_start_90 .. :try_end_96} :catchall_96

    :catchall_96
    move-exception v0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
.end method
