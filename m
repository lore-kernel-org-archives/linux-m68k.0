From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: BUG() in 2.6.33-rc8
Date: Mon, 08 Mar 2010 02:35:37 +0100
Message-ID: <m2k4tn8uja.fsf@igel.home>
References: <m21vgkydpu.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:49615 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963Ab0CHBfk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 7 Mar 2010 20:35:40 -0500
In-Reply-To: <m21vgkydpu.fsf@igel.home> (Andreas Schwab's message of "Wed, 17
	Feb 2010 00:15:25 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>

Andreas Schwab <schwab@linux-m68k.org> writes:

> I'm getting this BUG() when running 2.6.33-rc8 in Aranym:
>
> ida_remove called for id=13 which is not allocated.
> BUG: Dentry 10433d14{i=f000004e,n=kmsg} still in use (1) [unmount of proc proc]
> kernel BUG at fs/dcache.c:670!
> *** TRAP #7 ***   FORMAT=0
> Current process id is 1014
> BAD KERNEL TRAP: 00000000
> Modules linked in: nfs lockd nfs_acl sunrpc ipv6 dm_snapshot dm_mirror dm_region_hash dm_log dm_mod
> PC: [<0007d56a>] shrink_dcache_for_umount_subtree+0x1ee/0x1f2
> SR: 2310  SP: 10977ec4  a2: 10951030
> d0: 00000022    d1: 0000145e    d2: 00000001    d3: 0024ca2e
> d4: 0007cc0a    d5: 0007f064    a0: 0028bdbc    a1: 0028bdc0
> Process pidof (pid: 1014, task=10951030)
> Frame format=0 
> Stack from 10977ef8:
>         00243288 0024b83b 0000029e 0024b847 10433d14 f000004e 10433d6c 00000001
>         0024ca2e 0080d33e 00000003 00000000 00000004 eff06a74 0080d200 0007d37c
>         00207834 eff069f8 0007d598 00a01694 0080d200 0028ecc6 0006fc7e 0080d200
>         0080d200 0028ecc6 c010d7a8 0006fd64 0080d200 10965f00 0007048a 0080d200
>         0080d23a 1082c4d0 10965f40 0006bdd6 0080d200 1082c4d0 10965f00 1082c4d0
>         10965f00 ffffffef 1082c4d0 10965f04 0006be54 1082c4d0 10965f00 80005650
> Call Trace: [<0007d37c>] shrink_dcache_for_umount_subtree+0x0/0x1f2
>  [<0007d598>] shrink_dcache_for_umount+0x2a/0x62
>  [<0006fc7e>] generic_shutdown_super+0x1a/0xb0
>  [<0006fd64>] kill_anon_super+0x18/0x3c
>  [<0007048a>] deactivate_super+0x5a/0x78
>  [<0006bdd6>] filp_close+0x72/0x90
>  [<0006be54>] sys_close+0x60/0x88
>  [<00002662>] syscall+0x8/0xc
>
> This is triggered by pidof when it close the file after reading one of
> the /proc/$pid/stat files.

Reverting 86acdca1b63e6890540fa19495cfc708beff3d8b (fix
autofs/afs/etc. magic mountpoint breakage) fixes that.

Any idea?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
