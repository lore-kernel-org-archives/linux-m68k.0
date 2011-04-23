From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Fix for SLUB? (was: Fwd: [PATCH v3] mm: make expand_downwards
 symmetrical to expand_upwards)
Date: Sat, 23 Apr 2011 13:31:30 +1200
Message-ID: <BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:37475 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757118Ab1DWBbc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 22 Apr 2011 21:31:32 -0400
Received: by vws1 with SMTP id 1so746329vws.19
        for <linux-m68k@vger.kernel.org>; Fri, 22 Apr 2011 18:31:31 -0700 (PDT)
In-Reply-To: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>

I'll check this out - might well be the correct fix for our problems.

Cheers,

  Michael


On Thu, Apr 21, 2011 at 8:19 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> ---------- Forwarded message ----------
> From: David Rientjes <rientjes@google.com>
> Date: Thu, Apr 21, 2011 at 01:12
> Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to expa=
nd_upwards
> To: James Bottomley <James.Bottomley@hansenpartnership.com>
> Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Pekka Enberg
> <penberg@kernel.org>, Christoph Lameter <cl@linux.com>, Michal Hocko
> <mhocko@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Hugh
> Dickins <hughd@google.com>, linux-mm@kvack.org, LKML
> <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Ingo
> Molnar <mingo@elte.hu>, x86 maintainers <x86@kernel.org>
>
>
> On Wed, 20 Apr 2011, James Bottomley wrote:
>
>> > This is probably because the parisc's DISCONTIGMEM memory ranges d=
on't
>> > have bits set in N_NORMAL_MEMORY.
>> >
>> > diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
>> > --- a/arch/parisc/mm/init.c
>> > +++ b/arch/parisc/mm/init.c
>> > @@ -266,8 +266,10 @@ static void __init setup_bootmem(void)
>> > =A0 =A0 }
>> > =A0 =A0 memset(pfnnid_map, 0xff, sizeof(pfnnid_map));
>> >
>> > - =A0 for (i =3D 0; i < npmem_ranges; i++)
>> > + =A0 for (i =3D 0; i < npmem_ranges; i++) {
>> > + =A0 =A0 =A0 =A0 =A0 node_set_state(i, N_NORMAL_MEMORY);
>> > =A0 =A0 =A0 =A0 =A0 =A0 node_set_online(i);
>> > + =A0 }
>> > =A0#endif
>>
>> Yes, this seems to be the missing piece that gets it to boot. =A0We =
really
>> need this in generic code, unless someone wants to run through all t=
he
>> other arch's doing it ...
>>
>
> Looking at all other architectures that allow ARCH_DISCONTIGMEM_ENABL=
E, we
> already know x86 is fine, avr32 disables ARCH_DISCONTIGMEM_ENABLE ent=
irely
> because its code only brings online node 0, and tile already sets the=
 bit
> in N_NORMAL_MEMORY correctly when bringing a node online, probably be=
cause
> it was introduced after the various node state masks were added in
> 7ea1530ab3fd back in October 2007.
>
> So we're really only talking about alpha, ia64, m32r, m68k, and mips =
and
> it only seems to matter when using CONFIG_SLUB, which isn't surprisin=
g
> when greping for it:
>
> =A0 =A0 =A0 =A0$ grep -r N_NORMAL_MEMORY mm/*
> =A0 =A0 =A0 =A0mm/memcontrol.c: =A0 =A0 =A0 =A0if (!node_state(node, =
N_NORMAL_MEMORY))
> =A0 =A0 =A0 =A0mm/memcontrol.c: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!n=
ode_state(node, N_NORMAL_MEMORY))
> =A0 =A0 =A0 =A0mm/page_alloc.c: =A0 =A0 =A0 =A0[N_NORMAL_MEMORY] =3D =
{ { [0] =3D 1UL } },
> =A0 =A0 =A0 =A0mm/page_alloc.c:
> node_set_state(zone_to_nid(zone), N_NORMAL_MEMORY);
> =A0 =A0 =A0 =A0mm/slub.c: =A0 =A0 =A0for_each_node_state(node, N_NORM=
AL_MEMORY) {
> =A0 =A0 =A0 =A0mm/slub.c: =A0 =A0 =A0for_each_node_state(node, N_NORM=
AL_MEMORY) {
> =A0 =A0 =A0 =A0mm/slub.c: =A0 =A0 =A0for_each_node_state(node, N_NORM=
AL_MEMORY) {
> =A0 =A0 =A0 =A0mm/slub.c: =A0 =A0 =A0for_each_node_state(node, N_NORM=
AL_MEMORY) {
> =A0 =A0 =A0 =A0mm/slub.c: =A0 =A0 =A0for_each_node_state(node, N_NORM=
AL_MEMORY) {
> =A0 =A0 =A0 =A0mm/slub.c: =A0 =A0 =A0for_each_node_state(node, N_NORM=
AL_MEMORY) {
> =A0 =A0 =A0 =A0mm/slub.c: =A0 =A0 =A0for_each_node_state(node, N_NORM=
AL_MEMORY) {
> =A0 =A0 =A0 =A0mm/slub.c: =A0 =A0 =A0 =A0 =A0 =A0 =A0for_each_node_st=
ate(node, N_NORMAL_MEMORY) {
> =A0 =A0 =A0 =A0mm/slub.c: =A0 =A0 =A0 =A0 =A0 =A0 =A0for_each_node_st=
ate(node, N_NORMAL_MEMORY) {
> =A0 =A0 =A0 =A0mm/slub.c: =A0 =A0 =A0for_each_node_state(node, N_NORM=
AL_MEMORY)
>
> Those memory controller occurrences only result in it passing a node =
id of
> -1 to kmalloc_node() which means no specific node target, and that's =
fine
> for DISCONTIGMEM since we don't care about any proximity between memo=
ry
> ranges.
>
> This should fix the remaining architectures so they can use CONFIG_SL=
UB,
> but I hope it can be tested by the individual arch maintainers like y=
ou
> did for parisc.
>
> diff --git a/arch/alpha/mm/numa.c b/arch/alpha/mm/numa.c
> --- a/arch/alpha/mm/numa.c
> +++ b/arch/alpha/mm/numa.c
> @@ -245,6 +245,7 @@ setup_memory_node(int nid, void *kernel_end)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bootmap_size, BOOTMEM_=
DEFAULT);
> =A0 =A0 =A0 =A0printk(" reserving pages %ld:%ld\n", bootmap_start,
> bootmap_start+PFN_UP(bootmap_size));
>
> + =A0 =A0 =A0 node_set_state(nid, N_NORMAL_MEMORY);
> =A0 =A0 =A0 =A0node_set_online(nid);
> =A0}
>
> diff --git a/arch/ia64/mm/discontig.c b/arch/ia64/mm/discontig.c
> --- a/arch/ia64/mm/discontig.c
> +++ b/arch/ia64/mm/discontig.c
> @@ -573,6 +573,8 @@ void __init find_memory(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ma=
p>>PAGE_SHIFT,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bd=
p->node_min_pfn,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bd=
p->node_low_pfn);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (node_present_pages(node))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 node_set_state(node, N_=
NORMAL_MEMORY);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0efi_memmap_walk(filter_rsvd_memory, free_node_bootmem)=
;
> diff --git a/arch/m32r/kernel/setup.c b/arch/m32r/kernel/setup.c
> --- a/arch/m32r/kernel/setup.c
> +++ b/arch/m32r/kernel/setup.c
> @@ -247,7 +247,9 @@ void __init setup_arch(char **cmdline_p)
>
> =A0#ifdef CONFIG_DISCONTIGMEM
> =A0 =A0 =A0 =A0nodes_clear(node_online_map);
> + =A0 =A0 =A0 node_set_state(0, N_NORMAL_MEMORY); =A0 =A0 /* always h=
as memory */
> =A0 =A0 =A0 =A0node_set_online(0);
> + =A0 =A0 =A0 node_set_state(1, N_NORMAL_MEMORY); =A0 =A0 /* always h=
as memory */
> =A0 =A0 =A0 =A0node_set_online(1);
> =A0#endif /* CONFIG_DISCONTIGMEM */
>
> diff --git a/arch/m68k/mm/init_mm.c b/arch/m68k/mm/init_mm.c
> --- a/arch/m68k/mm/init_mm.c
> +++ b/arch/m68k/mm/init_mm.c
> @@ -59,6 +59,8 @@ void __init m68k_setup_node(int node)
> =A0 =A0 =A0 =A0}
> =A0#endif
> =A0 =A0 =A0 =A0pg_data_map[node].bdata =3D bootmem_node_data + node;
> + =A0 =A0 =A0 if (node_present_pages(node))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 node_set_state(node, N_NORMAL_MEMORY);
> =A0 =A0 =A0 =A0node_set_online(node);
> =A0}
>
> diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip=
27-memory.c
> --- a/arch/mips/sgi-ip27/ip27-memory.c
> +++ b/arch/mips/sgi-ip27/ip27-memory.c
> @@ -471,6 +471,8 @@ void __init paging_init(void)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (end_pfn > max_low_pfn)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0max_low_pfn =3D end_pf=
n;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (end_pfn > start_pfn)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 node_set_state(node, N_=
NORMAL_MEMORY);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0zones_size[ZONE_NORMAL] =3D max_low_pfn;
> =A0 =A0 =A0 =A0free_area_init_nodes(zones_size);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
>
>
> --
> Gr{oetje,eeting}s,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 =A0=A0 -- =
Linus Torvalds
>
