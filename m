Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9F0C77B7C
	for <linux-m68k@archiver.kernel.org>; Sat,  6 May 2023 01:07:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjEFBHt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 May 2023 21:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjEFBHs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 May 2023 21:07:48 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E7010E6
        for <linux-m68k@lists.linux-m68k.org>; Fri,  5 May 2023 18:07:47 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id E67153200077;
        Fri,  5 May 2023 21:07:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 21:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683335263; x=1683421663; bh=luWvPg5r6O6Ze
        jGA6+klytSURVrrNqvY78IHPiF/nMI=; b=hmGpXBTLu+FFkYBUkp9WB8mvQoiTN
        lvO/kaCYN3CMEHLh6Oj22MINiqKapaO8Iqn26tSqa9K7UH0fSUbJmvKQX31eYlB+
        aGK0di7bYOojqCbTwwaQHnvJJgcQeW3nvHf52Xg8PIboG3yE5gBFHXO3AkhMc2bx
        5PgQSE1pZXx9J3Y4fM0YIGPBhYfRpwoVGgEevh49cyZMh5M5RzQ1+2A5LynzKz3f
        kHiY7WSVk8dKSIKtJFn5eTx+sokkwEgBntI/t0zr9qR8kvdp4lvf/3bvKL514Wss
        9VjDoxQNRIIhblVOZUDDLhJAQk8VhZxxZtrVw+QaKmht+YetsGPhAHdlg==
X-ME-Sender: <xms:X6hVZO2KXkN_lUP6QGTepbKAspwX1Rwr-P1JBE5Z20j9y0K5IA5NtA>
    <xme:X6hVZBExhIDJPkSC72Pk1tNfkQ3E90JSFRIiMI486MxzdeUzK6Is0tG6RxSd_TQlM
    fzEzSY-e8CkGt5BHq0>
X-ME-Received: <xmr:X6hVZG6Cam0Rd24ztuh9WjNtZD--lfZiImlxsOJP5FGsgbabOnNAjkEbqIzNkjKZpTModLUZxifRdtaiEG6XwePK7z4nwfnaR0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeffedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:X6hVZP3I0y1TDaLFcdSDZ1QLStHtrroeyS367hjFHZZA3XVJFriXVQ>
    <xmx:X6hVZBGmP7W4td3ynYgpAioipLqTaMUe-lTs18fT62uiGHFAH5m2oQ>
    <xmx:X6hVZI-X37F32fnpaZ1WGSjwmYHFZRjUV4kZOVExraGq8Bae1RpeaQ>
    <xmx:X6hVZPMWCr0tzQUfpJIE_DhR-YiKZN_FYsRxoujhXWkMkqHbPIM1Lg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 21:07:40 -0400 (EDT)
Date:   Sat, 6 May 2023 11:11:32 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery following
 an address error
In-Reply-To: <f393d20f-3067-885e-8f26-6d3b13bd9811@gmail.com>
Message-ID: <e381cbf7-ac16-6ba8-cc47-90504ccbdaf3@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org> <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org> <f4280683-9044-3858-3262-16080e584c96@gmail.com> <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
 <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com> <79fa24d5-ab04-0750-5dd4-eae6db212a71@linux-m68k.org> <c4ed63f4-6aea-2a1c-56b4-80fd64274cef@gmail.com> <b57967eb-8021-a4c3-9171-973252529194@linux-m68k.org> <4e20d336-1215-bf66-14b1-a142a2960d70@gmail.com>
 <f393d20f-3067-885e-8f26-6d3b13bd9811@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 6 May 2023, Michael Schmitz wrote:

> > I'm trying to find out whether patch 2 mitigates the effect of patch 
> > 1.
> 
> It didn't - hung without printing an Oops message, on the first stress 
> iteration using the --stack 2 --stack-fill stressor.
> 

When I run that under stock v6.3, one of the stress-ng-stack processes 
gets killed by the OOM killer, followed by a soft lockup.

So I'd say the failure you saw was not related to the patches you used.

# stress-ng -t 180 --stack 2 --stack-fill
stress-ng: info:  [43] setting to a 180 second (3 mins, 0.00 secs) run per stressor
stress-ng: info:  [43] dispatching hogs: 2 stack
[  162.400000] stress-ng-stack invoked oom-killer: gfp_mask=0x140cca(GFP_HIGHUSER_MOVABLE|__GFP_COMP), order=0, oom_score_adj=1000
[  162.420000] CPU: 0 PID: 47 Comm: stress-ng-stack Not tainted 6.3.0-mac #3
[  162.420000] Stack from 01465d68:
[  162.420000]         01465d68 004d72d8 004d72d8 fffffffd 7fffffff 01465d88 0040e286 004d72d8
[  162.420000]         01465db8 0040b74c fffffffd 7fffffff ffffffff 00000840 00000000 00000000
[  162.420000]         0092f520 01465e80 004e5560 0092f520 01465df0 0008a110 01465e80 0092f520
[  162.420000]         fffffffd 7fffffff ffffffff 00000840 00000000 00000000 01465e80 004e56aa
[  162.420000]         004e5560 01465e80 01465e1c 0008a6e0 01465e80 004ad402 00140cca 00000002
[  162.420000]         00000000 000c21b2 0050b376 00000000 00000000 01465ea4 000c373a 01465e80
[  162.420000] Call Trace: [<0040e286>] dump_stack+0x10/0x16
[  162.420000]  [<0040b74c>] dump_header+0x52/0x1be
[  162.420000]  [<0008a110>] oom_kill_process+0x3bc/0x3f8
[  162.420000]  [<0008a6e0>] out_of_memory+0x2e4/0x44c
[  162.420000]  [<00140cca>] proc_pid_status+0x16e/0x1370
[  162.420000]  [<000c21b2>] get_page_from_freelist+0x0/0xb76
[  162.420000]  [<000c373a>] __alloc_pages+0x734/0xb30
[  162.420000]  [<000b28fe>] find_vma+0x0/0x22
[  162.420000]  [<00410cf2>] down_read+0x0/0xd6
[  162.420000]  [<001408ca>] do_task_stat+0x1038/0x1224
[  162.420000]  [<00010000>] sm_dnrm+0x6/0x1a
[  162.420000]  [<00020000>] __release_region+0x54/0xc8
[  162.420000]  [<00140cca>] proc_pid_status+0x16e/0x1370
[  162.420000]  [<00001e70>] kernel_pg_dir+0xe70/0x1000
[  162.420000]  [<00002865>] calibrate_delay+0xd3/0x26a
[  162.420000]  [<000c3f38>] __folio_alloc+0x20/0x26
[  162.420000]  [<00140cca>] proc_pid_status+0x16e/0x1370
[  162.420000]  [<000aceea>] handle_mm_fault+0x904/0xb28
[  162.420000]  [<00100cca>] zero_user_segments+0x10e/0x12c
[  162.420000]  [<000ef3c7>] take_dentry_name_snapshot+0x47/0x64
[  162.420000]  [<000070ac>] do_page_fault+0xde/0x292
[  162.420000]  [<00006204>] buserr_c+0x2d6/0x6c4
[  162.420000]  [<00002000>] _start+0x0/0x8
[  162.420000]  [<00040000>] pick_next_task_dl+0x7c/0x8c
[  162.420000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[  162.420000]  [<00002aa4>] buserr+0x20/0x28
[  162.420000]  [<00002000>] _start+0x0/0x8
[  162.420000]  [<00040000>] pick_next_task_dl+0x7c/0x8c
[  162.420000]  [<0004c017>] irq_thread_dtor+0x7/0xd8
[  162.420000]  [<0020b289>] ioc_find_get_icq+0x107/0x246
[  162.420000] 
[  162.430000] Mem-Info:
[  162.440000] active_anon:5264 inactive_anon:1765 isolated_anon:0
[  162.440000]  active_file:0 inactive_file:0 isolated_file:0
[  162.440000]  unevictable:3 dirty:0 writeback:0
[  162.440000]  slab_reclaimable:71 slab_unreclaimable:331
[  162.440000]  mapped:564 shmem:560 pagetables:16
[  162.440000]  sec_pagetables:0 bounce:0
[  162.440000]  kernel_misc_reclaimable:0
[  162.440000]  free:176 free_pcp:0 free_cma:0
[  162.450000] Node 0 active_anon:21056kB inactive_anon:7060kB active_file:0kB inactive_file:0kB unevictable:12kB isolated(anon):0kB isolated(file):0kB mapped:2256kB dirty:0kB writeback:0kB shmem:2240kB writeback_tmp:0kB kernel_stack:280kB pagetables:64kB sec_pagetables:0kB all_unreclaimable? no
[  162.460000] DMA free:704kB boost:0kB min:704kB low:880kB high:1056kB reserved_highatomic:0KB active_anon:21056kB inactive_anon:7060kB active_file:0kB inactive_file:0kB unevictable:12kB writepending:0kB present:36864kB managed:31168kB mlocked:12kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
[  162.480000] lowmem_reserve[]: 0 0 0
[  162.490000] DMA: 0*4kB 0*8kB 0*16kB 0*32kB 1*64kB (M) 1*128kB (M) 2*256kB (M) 0*512kB 0*1024kB 0*2048kB 0*4096kB = 704kB
[  162.520000] 611 total pagecache pages
[  162.530000] 0 pages in swap cache
[  162.540000] Free swap  = 0kB
[  162.550000] Total swap = 0kB
[  162.560000] 9216 pages RAM
[  162.570000] 0 pages HighMem/MovableOnly
[  162.580000] 1424 pages reserved
[  162.590000] Tasks state (memory values in pages):
[  162.610000] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
[  162.620000] [     43]     0    43     5254      754    12032        0         -1000 stress-ng
[  162.630000] [     44]     0    44     5254      197     8448        0         -1000 stress-ng-stack
[  162.640000] [     45]     0    45     5254      197     8448        0         -1000 stress-ng-stack
[  162.650000] [     46]     0    46     8439     3336    21248        0          1000 stress-ng-stack
[  162.660000] [     47]     0    47     8375     3274    20992        0          1000 stress-ng-stack
[  162.670000] oom-kill:constraint=CONSTRAINT_NONE,nodemask=(null),task=stress-ng-stack,pid=46,uid=0
[  162.690000] Out of memory: Killed process 46 (stress-ng-stack) total-vm:33756kB, anon-rss:13336kB, file-rss:4kB, shmem-rss:4kB, UID:0 pgtables:20kB oom_score_adj:1000
[  220.440000] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kswapd0:20]
[  220.440000] Modules linked in:
[  220.440000] Format 00  Vector: 0064  PC: 0009310c  Status: 2004    Not tainted
[  220.440000] ORIG_D0: ffffffff  D0: 00000000  A2: 0085a530  A1: 0000029b
[  220.440000] A0: 0050b3f2  D5: 00000000  D4: 00000001
[  220.440000] D3: 00000002  D2: 0000001f  D1: 0000029c
[  244.440000] watchdog: BUG: soft lockup - CPU#0 stuck for 45s! [kswapd0:20]
[  244.440000] Modules linked in:
[  244.440000] Format 00  Vector: 0064  PC: 00207178  Status: 2000    Tainted: G             L    
[  244.440000] ORIG_D0: ffffffff  D0: 0000000c  A2: 0085a530  A1: 008e3f02
[  244.440000] A0: 008e3e48  D5: 00000000  D4: 00000001
[  244.440000] D3: 00000002  D2: 00000000  D1: 00000000
[  268.440000] watchdog: BUG: soft lockup - CPU#0 stuck for 68s! [kswapd0:20]
[  268.440000] Modules linked in:
[  268.440000] Format 00  Vector: 0064  PC: 00095a76  Status: 2000    Tainted: G             L    
[  268.440000] ORIG_D0: ffffffff  D0: 00000000  A2: 0085a530  A1: 0085a530
[  268.440000] A0: fffffff6  D5: 00000000  D4: 00000001
[  268.440000] D3: 00000002  D2: 0000001f  D1: 00000020
[  292.440000] watchdog: BUG: soft lockup - CPU#0 stuck for 90s! [kswapd0:20]
[  292.440000] Modules linked in:
[  292.440000] Format 00  Vector: 0064  PC: 000930d0  Status: 2000    Tainted: G             L    
[  292.440000] ORIG_D0: ffffffff  D0: 00000299  A2: 0085a530  A1: 0000029b
[  292.440000] A0: 0050b3f2  D5: 00000000  D4: 00000001
[  292.440000] D3: 00000002  D2: 0000001f  D1: 0000001f
[  316.450000] watchdog: BUG: soft lockup - CPU#0 stuck for 112s! [kswapd0:20]
[  316.450000] Modules linked in:
[  316.450000] Format 00  Vector: 0064  PC: 0009142a  Status: 2004    Tainted: G             L    
[  316.450000] ORIG_D0: ffffffff  D0: 0000000c  A2: 0085a530  A1: 008e3f02
[  316.450000] A0: 0050b376  D5: 00000000  D4: 00000001
[  316.450000] D3: 00000002  D2: 00000000  D1: 00000000
[  340.450000] watchdog: BUG: soft lockup - CPU#0 stuck for 135s! [kswapd0:20]
[  340.450000] Modules linked in:
[  340.450000] Format 00  Vector: 0064  PC: 00092cd2  Status: 2000    Tainted: G             L    
[  340.450000] ORIG_D0: ffffffff  D0: 0000000f  A2: 0085a530  A1: 000000b0
[  340.450000] A0: 00092c9e  D5: 008e3f94  D4: 00000002
[  340.450000] D3: 00044260  D2: 00000000  D1: 0050b3ae
[  364.450000] watchdog: BUG: soft lockup - CPU#0 stuck for 157s! [kswapd0:20]
[  364.450000] Modules linked in:
[  364.450000] Format 00  Vector: 0064  PC: 000b06de  Status: 2004    Tainted: G             L    
[  364.450000] ORIG_D0: ffffffff  D0: 0000000c  A2: 0085a530  A1: 008e3f02
[  364.450000] A0: 0050b376  D5: 00000000  D4: 00000001
[  364.450000] D3: 00000002  D2: 00000000  D1: 00000000
[  388.450000] watchdog: BUG: soft lockup - CPU#0 stuck for 179s! [kswapd0:20]
[  388.450000] Modules linked in:
[  388.450000] Format 00  Vector: 0064  PC: 000359da  Status: 2000    Tainted: G             L    
[  388.450000] ORIG_D0: ffffffff  D0: 00000003  A2: 0085a530  A1: 008e3f94
[  388.450000] A0: 008e3f88  D5: 008e3f94  D4: 00000001
[  388.450000] D3: 00000000  D2: 00000000  D1: 00000003
[  412.450000] watchdog: BUG: soft lockup - CPU#0 stuck for 202s! [kswapd0:20]
[  412.450000] Modules linked in:
[  412.450000] Format 00  Vector: 0064  PC: 00095ca6  Status: 2000    Tainted: G             L    
[  412.450000] ORIG_D0: ffffffff  D0: 0050b644  A2: 0085a530  A1: 008e3f44
[  412.450000] A0: 0085a530  D5: 00000000  D4: 00000001
[  412.450000] D3: 00000001  D2: 0000001f  D1: 00000000
[  436.450000] watchdog: BUG: soft lockup - CPU#0 stuck for 224s! [kswapd0:20]
[  436.450000] Modules linked in:
[  436.450000] Format 00  Vector: 0064  PC: 000359e2  Status: 2004    Tainted: G             L    
[  436.450000] ORIG_D0: ffffffff  D0: 00000000  A2: 0085a530  A1: 008e3f44
[  436.450000] A0: 008afe00  D5: 00000000  D4: 00000001
[  436.450000] D3: 00000001  D2: 00000000  D1: 00000000
[  460.460000] watchdog: BUG: soft lockup - CPU#0 stuck for 246s! [kswapd0:20]
[  460.460000] Modules linked in:
[  460.460000] Format 00  Vector: 0064  PC: 00092b30  Status: 2004    Tainted: G             L    
[  460.460000] ORIG_D0: ffffffff  D0: 008e3f44  A2: 0085a530  A1: 008e3f44
[  460.460000] A0: 0050b15c  D5: 00000000  D4: 00000001
[  460.460000] D3: 00000001  D2: 00000000  D1: 00000000
[  484.460000] watchdog: BUG: soft lockup - CPU#0 stuck for 269s! [kswapd0:20]
[  484.460000] Modules linked in:
[  484.460000] Format 00  Vector: 0064  PC: 000930c0  Status: 2000    Tainted: G             L    
[  484.460000] ORIG_D0: ffffffff  D0: 00000000  A2: 0085a530  A1: 008e3f02
[  484.460000] A0: 0050b3f2  D5: 00000000  D4: 00000001
[  484.460000] D3: 00000001  D2: 0000001f  D1: 0000001f
[  508.460000] watchdog: BUG: soft lockup - CPU#0 stuck for 291s! [kswapd0:20]
[  508.460000] Modules linked in:
[  508.460000] Format 00  Vector: 0064  PC: 00097f8c  Status: 2014    Tainted: G             L    
[  508.460000] ORIG_D0: ffffffff  D0: 00002014  A2: 0085a530  A1: 008e3f4c
[  508.460000] A0: 008e3f02  D5: 008e3f94  D4: 00000001
[  508.460000] D3: 00000001  D2: 00000000  D1: 00000048
[  532.460000] watchdog: BUG: soft lockup - CPU#0 stuck for 313s! [kswapd0:20]
[  532.460000] Modules linked in:
[  532.460000] Format 00  Vector: 0064  PC: 00095a5c  Status: 2008    Tainted: G             L    
[  532.460000] ORIG_D0: ffffffff  D0: fffffff6  A2: 0085a530  A1: 0085a530
[  532.460000] A0: fffffff6  D5: 00000000  D4: 00000001
[  532.460000] D3: 00000001  D2: 0000001f  D1: 00000020
