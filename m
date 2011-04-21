From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Fix for SLUB? (was: Fwd: [PATCH v3] mm: make expand_downwards
 symmetrical to expand_upwards)
Date: Thu, 21 Apr 2011 10:19:44 +0200
Message-ID: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:36562 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753696Ab1DUITq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Apr 2011 04:19:46 -0400
Received: by bwz15 with SMTP id 15so1228015bwz.19
        for <linux-m68k@vger.kernel.org>; Thu, 21 Apr 2011 01:19:45 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>, Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

---------- Forwarded message ----------
=46rom: David Rientjes <rientjes@google.com>
Date: Thu, Apr 21, 2011 at 01:12
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to expand=
_upwards
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Pekka Enberg
<penberg@kernel.org>, Christoph Lameter <cl@linux.com>, Michal Hocko
<mhocko@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Hugh
Dickins <hughd@google.com>, linux-mm@kvack.org, LKML
<linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Ingo
Molnar <mingo@elte.hu>, x86 maintainers <x86@kernel.org>


On Wed, 20 Apr 2011, James Bottomley wrote:

> > This is probably because the parisc's DISCONTIGMEM memory ranges do=
n't
> > have bits set in N_NORMAL_MEMORY.
> >
> > diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> > --- a/arch/parisc/mm/init.c
> > +++ b/arch/parisc/mm/init.c
> > @@ -266,8 +266,10 @@ static void __init setup_bootmem(void)
> > =C2=A0 =C2=A0 }
> > =C2=A0 =C2=A0 memset(pfnnid_map, 0xff, sizeof(pfnnid_map));
> >
> > - =C2=A0 for (i =3D 0; i < npmem_ranges; i++)
> > + =C2=A0 for (i =3D 0; i < npmem_ranges; i++) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node_set_state(i, N_NORMAL_MEM=
ORY);
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node_set_online(i);
> > + =C2=A0 }
> > =C2=A0#endif
>
> Yes, this seems to be the missing piece that gets it to boot. =C2=A0W=
e really
> need this in generic code, unless someone wants to run through all th=
e
> other arch's doing it ...
>

Looking at all other architectures that allow ARCH_DISCONTIGMEM_ENABLE,=
 we
already know x86 is fine, avr32 disables ARCH_DISCONTIGMEM_ENABLE entir=
ely
because its code only brings online node 0, and tile already sets the b=
it
in N_NORMAL_MEMORY correctly when bringing a node online, probably beca=
use
it was introduced after the various node state masks were added in
7ea1530ab3fd back in October 2007.

So we're really only talking about alpha, ia64, m32r, m68k, and mips an=
d
it only seems to matter when using CONFIG_SLUB, which isn't surprising
when greping for it:

=C2=A0 =C2=A0 =C2=A0 =C2=A0$ grep -r N_NORMAL_MEMORY mm/*
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/memcontrol.c: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if (!node_state(node, N_NORMAL_MEMORY))
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/memcontrol.c: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!node_state(node, N_NORMAL_MEMORY))
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/page_alloc.c: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
[N_NORMAL_MEMORY] =3D { { [0] =3D 1UL } },
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/page_alloc.c:
node_set_state(zone_to_nid(zone), N_NORMAL_MEMORY);
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/slub.c: =C2=A0 =C2=A0 =C2=A0for_each_node=
_state(node, N_NORMAL_MEMORY) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/slub.c: =C2=A0 =C2=A0 =C2=A0for_each_node=
_state(node, N_NORMAL_MEMORY) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/slub.c: =C2=A0 =C2=A0 =C2=A0for_each_node=
_state(node, N_NORMAL_MEMORY) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/slub.c: =C2=A0 =C2=A0 =C2=A0for_each_node=
_state(node, N_NORMAL_MEMORY) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/slub.c: =C2=A0 =C2=A0 =C2=A0for_each_node=
_state(node, N_NORMAL_MEMORY) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/slub.c: =C2=A0 =C2=A0 =C2=A0for_each_node=
_state(node, N_NORMAL_MEMORY) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/slub.c: =C2=A0 =C2=A0 =C2=A0for_each_node=
_state(node, N_NORMAL_MEMORY) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/slub.c: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0for_each_node_state(node, N_NORMAL_MEMORY) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/slub.c: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0for_each_node_state(node, N_NORMAL_MEMORY) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0mm/slub.c: =C2=A0 =C2=A0 =C2=A0for_each_node=
_state(node, N_NORMAL_MEMORY)

Those memory controller occurrences only result in it passing a node id=
 of
-1 to kmalloc_node() which means no specific node target, and that's fi=
ne
for DISCONTIGMEM since we don't care about any proximity between memory
ranges.

This should fix the remaining architectures so they can use CONFIG_SLUB=
,
but I hope it can be tested by the individual arch maintainers like you
did for parisc.

diff --git a/arch/alpha/mm/numa.c b/arch/alpha/mm/numa.c
--- a/arch/alpha/mm/numa.c
+++ b/arch/alpha/mm/numa.c
@@ -245,6 +245,7 @@ setup_memory_node(int nid, void *kernel_end)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bootmap_size, BOOTMEM_DEFAULT);
=C2=A0 =C2=A0 =C2=A0 =C2=A0printk(" reserving pages %ld:%ld\n", bootmap=
_start,
bootmap_start+PFN_UP(bootmap_size));

+ =C2=A0 =C2=A0 =C2=A0 node_set_state(nid, N_NORMAL_MEMORY);
=C2=A0 =C2=A0 =C2=A0 =C2=A0node_set_online(nid);
=C2=A0}

diff --git a/arch/ia64/mm/discontig.c b/arch/ia64/mm/discontig.c
--- a/arch/ia64/mm/discontig.c
+++ b/arch/ia64/mm/discontig.c
@@ -573,6 +573,8 @@ void __init find_memory(void)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map>>PAGE_SHIFT,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bdp->node_min_pfn,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bdp->node_low_pfn);
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (node_present_pag=
es(node))
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 node_set_state(node, N_NORMAL_MEMORY);
=C2=A0 =C2=A0 =C2=A0 =C2=A0}

=C2=A0 =C2=A0 =C2=A0 =C2=A0efi_memmap_walk(filter_rsvd_memory, free_nod=
e_bootmem);
diff --git a/arch/m32r/kernel/setup.c b/arch/m32r/kernel/setup.c
--- a/arch/m32r/kernel/setup.c
+++ b/arch/m32r/kernel/setup.c
@@ -247,7 +247,9 @@ void __init setup_arch(char **cmdline_p)

=C2=A0#ifdef CONFIG_DISCONTIGMEM
=C2=A0 =C2=A0 =C2=A0 =C2=A0nodes_clear(node_online_map);
+ =C2=A0 =C2=A0 =C2=A0 node_set_state(0, N_NORMAL_MEMORY); =C2=A0 =C2=A0=
 /* always has memory */
=C2=A0 =C2=A0 =C2=A0 =C2=A0node_set_online(0);
+ =C2=A0 =C2=A0 =C2=A0 node_set_state(1, N_NORMAL_MEMORY); =C2=A0 =C2=A0=
 /* always has memory */
=C2=A0 =C2=A0 =C2=A0 =C2=A0node_set_online(1);
=C2=A0#endif /* CONFIG_DISCONTIGMEM */

diff --git a/arch/m68k/mm/init_mm.c b/arch/m68k/mm/init_mm.c
--- a/arch/m68k/mm/init_mm.c
+++ b/arch/m68k/mm/init_mm.c
@@ -59,6 +59,8 @@ void __init m68k_setup_node(int node)
=C2=A0 =C2=A0 =C2=A0 =C2=A0}
=C2=A0#endif
=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_data_map[node].bdata =3D bootmem_node_dat=
a + node;
+ =C2=A0 =C2=A0 =C2=A0 if (node_present_pages(node))
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node_set_state(node,=
 N_NORMAL_MEMORY);
=C2=A0 =C2=A0 =C2=A0 =C2=A0node_set_online(node);
=C2=A0}

diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27=
-memory.c
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -471,6 +471,8 @@ void __init paging_init(void)

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (end_pfn > ma=
x_low_pfn)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0max_low_pfn =3D end_pfn;
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (end_pfn > start_=
pfn)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 node_set_state(node, N_NORMAL_MEMORY);
=C2=A0 =C2=A0 =C2=A0 =C2=A0}
=C2=A0 =C2=A0 =C2=A0 =C2=A0zones_size[ZONE_NORMAL] =3D max_low_pfn;
=C2=A0 =C2=A0 =C2=A0 =C2=A0free_area_init_nodes(zones_size);
--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.html
Please read the FAQ at =C2=A0http://www.tux.org/lkml/



--=20
Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
