From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Mon, 31 Jan 2011 19:28:41 +1300
Message-ID: <4D465699.6090108@gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>	<AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>	<Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>	<AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>	<4D44F92C.2050707@gmail.com> <AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com> <4D461512.8080609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:41119 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752231Ab1AaG2q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Jan 2011 01:28:46 -0500
Received: by pva4 with SMTP id 4so786912pva.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Jan 2011 22:28:46 -0800 (PST)
In-Reply-To: <4D461512.8080609@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Geert,
>>
>> If switching from SLUB to SLAB fixes the problem, please enable
>> CONFIG_SLUB_DEBUG and bring it up on lkml/with the SLUB people.
>>   
> Can do that - I'll try and collect debug data from another case I know 
> has had trouble with SLUB. I'll probably have to build a custom kernel 
> for them and test that on the live mail server. Fun ... :-)
Done that with a fresh kernel as well as with the original one and 
slub_debug in the kernel options - there's no debug info in the logs, 
just the panic messages.

Booting with init=/bin/sh and running slabinfo -v results in:

> [   56.590000] Unable to handle kernel NULL pointer dereference at 
> virtual address 00000014
> [   56.590000] Oops: 00000000
> [   56.590000] Modules linked in:
> [   56.590000] PC: [<00075d84>] add_full+0x12/0x24
> [   56.590000] SR: 2714  SP: 00aa9cfc  a2: 00c16ca0
> [   56.590000] d0: 00000001    d1: 00010000    d2: 000000d0    d3: 
> 000000d0
> [   56.590000] d4: ffffffff    d5: 0008af80    a0: 006040a8    a1: 
> 00000014
> [   56.590000] Process slabinfo (pid: 29, task=00c16ca0)
> [   56.590000] Frame format=7 eff addr=00000014 ssw=0505 faddr=00000014
> [   56.590000] wb 1 stat/addr/data: 0000 00000000 00000000
> [   56.590000] wb 2 stat/addr/data: 0000 00000000 00000000
> [   56.590000] wb 3 stat/addr/data: 0000 00000014 00003339
> [   56.590000] push data: 00000000 00000000 00000000 00000000
> [   56.590000] Stack from 00aa9d64:
> [   56.590000]         00000000 00076602 00000000 00604090 00604090 
> 0007667c 00810000 00604090
> [   56.590000]         00000001 0060f24c 00000000 00810000 00076954 
> 00810000 0060f24c 00002300
> [   56.590000]         000000d0 008128f0 00000024 00000000 00810000 
> 006711c4 00076a5c 00810000
> [   56.590000]         000000d0 ffffffff 0008af80 0060f24c 000007bf 
> 006a0690 006a0690 006a0690
> [   56.590000]         0008af80 00810000 000000d0 006a0690 00d45108 
> 0008bab8 006a0690 000007bf
> [   56.590000]         006711c4 00d45108 10c012d0 0008bdd0 006a0690 
> 006711c4 000007bf 00ad7204
> [   56.590000] Call Trace: [<00076602>] unfreeze_slab+0x4a/0x7c
> [   56.590000]  [<0007667c>] deactivate_slab+0x48/0x52
> [   56.590000]  [<00076954>] __slab_alloc+0xa0/0x150
> [   56.590000]  [<00002300>] name_to_dev_t+0x14/0x250
> [   56.590000]  [<00076a5c>] kmem_cache_alloc+0x58/0x6a
> [   56.590000]  [<0008af80>] alloc_inode+0x6e/0x7e
> [   56.590000]  [<0008af80>] alloc_inode+0x6e/0x7e
> [   56.590000]  [<0008bab8>] get_new_inode_fast+0x16/0xa2
> [   56.590000]  [<0008bdd0>] iget_locked+0x3c/0x4a
> [   56.590000]  [<000bd7de>] sysfs_get_inode+0x16/0x3a
> [   56.590000]  [<000bedb0>] sysfs_lookup+0x58/0xe4
> [   56.590000]  [<0008273c>] d_alloc_and_lookup+0x40/0x66
> [   56.590000]  [<00082816>] do_lookup+0xb4/0x118
> [   56.590000]  [<00083d3a>] do_last+0x62/0x384
> [   56.590000]  [<0008287a>] link_path_walk+0x0/0x8be
> [   56.590000]  [<0008419c>] do_filp_open+0x140/0x42c
> [   56.590000]  [<0007692a>] __slab_alloc+0x76/0x150
> [   56.590000]  [<00076a5c>] kmem_cache_alloc+0x58/0x6a
> [   56.590000]  [<0008d214>] alloc_fd+0x7a/0x13e
> [   56.590000]  [<0007a9ac>] do_sys_open+0x4a/0xde
> [   56.590000]  [<0007aa56>] sys_open+0x16/0x1c
> [   56.590000]  [<00002630>] syscall+0x8/0xc
> [   56.590000]
> [   56.590000] Code: 307c 0018 d1ef 000c 327c 0014 d3ef 0008 <2651> 
> 2748 0004 208b 2149 0004 2288 265f 4e75 2f0b 206f 0008 2028 0004 0280 0001
> [   56.590000] Disabling lock debugging due to kernel taint

Similar panic in unfreeze_slab when running slabinfo -a. Previous traces 
had reference to 060 emulation in them so I disabled 060 support. Same 
result really.

add_full is only used in slab debugging, so we see some effect of 
debugging here.

Looking at unfreeze slab (debug printk added by me):

> static void unfreeze_slab(struct kmem_cache *s, struct page *page, int 
> tail)
>         __releases(bitlock)
> {
>         struct kmem_cache_node *n = get_node(s, page_to_nid(page));
>
>         if (!n)
>                printk(KERN_INFO "unfreeze slab: zero node for cache %p 
> page %p\n", s, page);
>
>         __ClearPageSlubFrozen(page);
>         if (page->inuse) {
>
>                 if (page->freelist) {
>                         add_partial(n, page, tail);
>                         stat(s, tail ? DEACTIVATE_TO_TAIL : 
> DEACTIVATE_TO_HEAD)
>                 } else {
>                         stat(s, DEACTIVATE_FULL);
>                         if (kmem_cache_debug(s) && (s->flags & 
> SLAB_STORE_USER)
>                                 add_full(n, page);
>                 }
>                 slab_unlock(page);

I do in fact see the expected message warning that the node pointer n is 
NULL right before the crash.

The whole problem seems to be exacerbated by a larger kernel or larger 
size of reserved ST-RAM pool. Using my own .config (tailored to keep the 
compressed kernel image smaller than 1.4 MB) I can boot the kernel using 
init=/bin/sh and run slabinfo without problems. Booting into runlevel 2 
either produces the same panic after initializing network interfaces, or 
throws the kernel into a tight loop there (still responding to keyboard 
but not progressing beyond the 'initializing network interfaces' message 
for minutes). Still no debug messages from the SLUB code though.

Any ideas? Is the reserved bootmem area being used by the SLUB allocator 
some way? I.e. does the allocator pass out memory that is already in use 
by the kernel?

Confused,

  Michael
