From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Thu, 17 Feb 2011 20:22:13 +1300
Message-ID: <4D5CCCA5.1000106@gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de> <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de> <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com> <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com> <Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org> <AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com> <Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org> <AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com> <4D44F92C.2050707@gmail.com> <AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com> <4D461512.8080609@gmail.com> <alpine.LNX.2.00.1101311424100.6256@nippy.intranet> <Pine.BSM.4.64L.1102052339100.22476@herc.mirbsd.org> <4D575F50.1020601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:42869 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751160Ab1BQHWZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Feb 2011 02:22:25 -0500
Received: by iyj8 with SMTP id 8so2066187iyj.19
        for <linux-m68k@vger.kernel.org>; Wed, 16 Feb 2011 23:22:24 -0800 (PST)
In-Reply-To: <4D575F50.1020601@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Michael Schmitz wrote:
> Thorsten Glaser wrote:
>> Finn Thain dixit:
>>
>>  
>>> The introduction of the SLUB allocator was 2.6.22, but I can't help 
>>> you bisect because I don't recall that it worked ever (?)
>>>     
>>
>> It _appears_ to work well with 2.6.32 Debian though...
>>   
> It does indeed. slabinfo -v (run from an init=/bin/sh shell) does not 
> crash, nor does it report anything fishy. This kernel even survives 
> running e2fsck.
>
> Output of slabinfo -l and slabinfo -T attached for both, FWIW.
>
> I'll bisect this if I've got a bit of time, unless someone else beats 
> me to it.
Result:
 
7340cc84141d5236c5dd003359ee921513cd9b84 is the first bad commit
commit 7340cc84141d5236c5dd003359ee921513cd9b84
Author: Christoph Lameter <cl@linux.com>
Date:   Tue Sep 28 08:10:26 2010 -0500

    slub: reduce differences between SMP and NUMA
   
    Reduce the #ifdefs and simplify bootstrap by making SMP and NUMA as 
much alike
    as possible. This means that there will be an additional indirection 
to get to
    the kmem_cache_node field under SMP.
   
    Acked-by: David Rientjes <rientjes@google.com>
    Signed-off-by: Christoph Lameter <cl@linux.com>
    Signed-off-by: Pekka Enberg <penberg@kernel.org>

:040000 040000 689fb80a8015b41b68c41cfee356fe1bf1dd4f7b 
d7521accc03ea626f42b87a47830ea838085cad8 M    include
:040000 040000 d28f8440eee90f257bd7b522d4e688874b4449ae 
8eb57f33c45989c68e64d16be5523cdecb29899b M    mm

Diff in question - can anyone guess at what the problem may be?:

diff --git a/include/linux/slub_def.h b/include/linux/slub_def.h
index b33c0f2..a6c43ec 100644
--- a/include/linux/slub_def.h
+++ b/include/linux/slub_def.h
@@ -96,8 +96,11 @@ struct kmem_cache {
      * Defragmentation by allocating from a remote node.
      */
     int remote_node_defrag_ratio;
-#endif
     struct kmem_cache_node *node[MAX_NUMNODES];
+#else
+    /* Avoid an extra cache line for UP */
+    struct kmem_cache_node local_node;
+#endif
 };
 
 /*
diff --git a/mm/slub.c b/mm/slub.c
index 064bda2..7e1fe66 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -233,7 +233,11 @@ int slab_is_available(void)
 
 static inline struct kmem_cache_node *get_node(struct kmem_cache *s, 
int node)
 {
+#ifdef CONFIG_NUMA
     return s->node[node];
+#else
+    return &s->local_node;
+#endif
 }
 
 /* Verify that a pointer has an address that is valid within a slab page */
@@ -867,7 +871,7 @@ static inline void inc_slabs_node(struct kmem_cache 
*s, int node, int objects)
      * dilemma by deferring the increment of the count during
      * bootstrap (see early_kmem_cache_node_alloc).
      */
-    if (n) {
+    if (!NUMA_BUILD || n) {
         atomic_long_inc(&n->nr_slabs);
         atomic_long_add(objects, &n->total_objects);
     }
@@ -2108,6 +2112,7 @@ static inline int alloc_kmem_cache_cpus(struct 
kmem_cache *s)
     return s->cpu_slab != NULL;
 }
 
+#ifdef CONFIG_NUMA
 static struct kmem_cache *kmem_cache_node;
 
 /*
@@ -2197,6 +2202,17 @@ static int init_kmem_cache_nodes(struct 
kmem_cache *s)
     }
     return 1;
 }
+#else
+static void free_kmem_cache_nodes(struct kmem_cache *s)
+{
+}
+
+static int init_kmem_cache_nodes(struct kmem_cache *s)
+{
+    init_kmem_cache_node(&s->local_node, s);
+    return 1;
+}
+#endif
 
 static void set_min_partial(struct kmem_cache *s, unsigned long min)
 {
@@ -3007,6 +3023,8 @@ void __init kmem_cache_init(void)
     int caches = 0;
     struct kmem_cache *temp_kmem_cache;
     int order;
+
+#ifdef CONFIG_NUMA
     struct kmem_cache *temp_kmem_cache_node;
     unsigned long kmalloc_size;
 
@@ -3030,6 +3048,12 @@ void __init kmem_cache_init(void)
         0, SLAB_HWCACHE_ALIGN | SLAB_PANIC, NULL);
 
     hotplug_memory_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
+#else
+    /* Allocate a single kmem_cache from the page allocator */
+    kmem_size = sizeof(struct kmem_cache);
+    order = get_order(kmem_size);
+    kmem_cache = (void *)__get_free_pages(GFP_NOWAIT, order);
+#endif
 
     /* Able to allocate the per node structures */
     slab_state = PARTIAL;
@@ -3040,6 +3064,7 @@ void __init kmem_cache_init(void)
     kmem_cache = kmem_cache_alloc(kmem_cache, GFP_NOWAIT);
     memcpy(kmem_cache, temp_kmem_cache, kmem_size);
 
+#ifdef CONFIG_NUMA
     /*
      * Allocate kmem_cache_node properly from the kmem_cache slab.
      * kmem_cache_node is separately allocated so no need to
@@ -3053,6 +3078,18 @@ void __init kmem_cache_init(void)
     kmem_cache_bootstrap_fixup(kmem_cache_node);
 
     caches++;
+#else
+    /*
+     * kmem_cache has kmem_cache_node embedded and we moved it!
+     * Update the list heads
+     */
+    INIT_LIST_HEAD(&kmem_cache->local_node.partial);
+    list_splice(&temp_kmem_cache->local_node.partial, 
&kmem_cache->local_node.partial);
+#ifdef CONFIG_SLUB_DEBUG
+    INIT_LIST_HEAD(&kmem_cache->local_node.full);
+    list_splice(&temp_kmem_cache->local_node.full, 
&kmem_cache->local_node.full);
+#endif
+#endif
     kmem_cache_bootstrap_fixup(kmem_cache);
     caches++;
     /* Free temporary boot structure */
