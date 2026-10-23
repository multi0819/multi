.class Lkr/memorynotes/ReviewActions$1;
.super Ljava/lang/Object;
.source "ReviewActions.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkr/memorynotes/ReviewActions;->addRevealControl(Lkr/memorynotes/MainActivity;Lkr/memorynotes/ReviewScreen;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$r:Lkr/memorynotes/ReviewScreen;


# direct methods
.method constructor <init>(Lkr/memorynotes/ReviewScreen;)V
    .registers 2

    .line 9
    iput-object p1, p0, Lkr/memorynotes/ReviewActions$1;->val$r:Lkr/memorynotes/ReviewScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 9
    iget-object v0, p0, Lkr/memorynotes/ReviewActions$1;->val$r:Lkr/memorynotes/ReviewScreen;

    invoke-static {v0}, Lkr/memorynotes/ReviewFlow;->revealPhrases(Lkr/memorynotes/ReviewScreen;)V

    iget-object v0, p0, Lkr/memorynotes/ReviewActions$1;->val$r:Lkr/memorynotes/ReviewScreen;

    invoke-virtual {v0}, Lkr/memorynotes/ReviewScreen;->show()V

    return-void
.end method
