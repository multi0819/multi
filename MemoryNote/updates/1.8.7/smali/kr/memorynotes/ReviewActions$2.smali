.class Lkr/memorynotes/ReviewActions$2;
.super Ljava/lang/Object;
.source "ReviewActions.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/ReviewActions;->addEdit(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$a:Lkr/memorynotes/MainActivity;

.field private final synthetic val$r:Lkr/memorynotes/ReviewScreen;


# direct methods
.method constructor <init>(Lkr/memorynotes/ReviewScreen;Lkr/memorynotes/MainActivity;)V
    .registers 3

    .line 12
    iput-object p1, p0, Lkr/memorynotes/ReviewActions$2;->val$r:Lkr/memorynotes/ReviewScreen;

    iput-object p2, p0, Lkr/memorynotes/ReviewActions$2;->val$a:Lkr/memorynotes/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 12
    :try_start_0
    iget-object v0, p0, Lkr/memorynotes/ReviewActions$2;->val$r:Lkr/memorynotes/ReviewScreen;

    iget-object v0, v0, Lkr/memorynotes/ReviewScreen;->notes:Ljava/util/ArrayList;

    iget-object v1, p0, Lkr/memorynotes/ReviewActions$2;->val$r:Lkr/memorynotes/ReviewScreen;

    iget v1, v1, Lkr/memorynotes/ReviewScreen;->index:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkr/memorynotes/Note;

    invoke-virtual {v0}, Lkr/memorynotes/Note;->json()Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Lkr/memorynotes/Note;->from(Lorg/json/JSONObject;)Lkr/memorynotes/Note;

    move-result-object v0

    # getter for: Lkr/memorynotes/ReviewActions;->editing:Ljava/util/WeakHashMap;
    invoke-static {}, Lkr/memorynotes/ReviewActions;->access$0()Ljava/util/WeakHashMap;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/ReviewActions$2;->val$a:Lkr/memorynotes/MainActivity;

    iget-object v3, p0, Lkr/memorynotes/ReviewActions$2;->val$r:Lkr/memorynotes/ReviewScreen;

    invoke-virtual {v1, v2, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lkr/memorynotes/ReviewActions$2;->val$a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v1, v0}, Lkr/memorynotes/MainActivity;->edit(Lkr/memorynotes/Note;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_26} :catch_27

    goto :goto_36

    :catch_27
    move-exception v0

    # getter for: Lkr/memorynotes/ReviewActions;->editing:Ljava/util/WeakHashMap;
    invoke-static {}, Lkr/memorynotes/ReviewActions;->access$0()Ljava/util/WeakHashMap;

    move-result-object v1

    iget-object v2, p0, Lkr/memorynotes/ReviewActions$2;->val$a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v1, v2}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lkr/memorynotes/ReviewActions$2;->val$a:Lkr/memorynotes/MainActivity;

    invoke-virtual {v1, v0}, Lkr/memorynotes/MainActivity;->error(Ljava/lang/Exception;)V

    :goto_36
    return-void
.end method
