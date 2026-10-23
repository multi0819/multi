.class public final synthetic Lkr/memorynotes/InkPage$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkr/memorynotes/InkPage;


# direct methods
.method public synthetic constructor <init>(Lkr/memorynotes/InkPage;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkr/memorynotes/InkPage$$ExternalSyntheticLambda7;->f$0:Lkr/memorynotes/InkPage;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lkr/memorynotes/InkPage$$ExternalSyntheticLambda7;->f$0:Lkr/memorynotes/InkPage;

    invoke-virtual {v0}, Lkr/memorynotes/InkPage;->clear()V

    return-void
.end method
