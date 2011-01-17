From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Mon, 17 Jan 2011 19:50:49 +1300
Message-ID: <AANLkTik0jvV3E36ndp-StHSi0hi83yE-Q-hDbuSbeXPh@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:46220 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751316Ab1AQGuv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2011 01:50:51 -0500
Received: by wwa36 with SMTP id 36so5092459wwa.1
        for <linux-m68k@vger.kernel.org>; Sun, 16 Jan 2011 22:50:50 -0800 (PST)
In-Reply-To: <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Hi Thorsten,

>> -1~experimental.1) plus for-linus and m68k-queue of yesterday. I als=
o
>> discovered @Stephen that staging drivers are built again. In case yo=
u
>> are interested in the progress: preliminary deb source package is at
>> https://www.freewrt.org/~tg/debs68k/tmp/linux-2.6/
>
> Ouch, just had a peek at the atari kernel which was built overnight
> (it=92s working on bvme now) and got this:

I get a different stack trace but it's basically the same type of OOM
error. Incidentially, this one happens in skb_free_datagram, and hence
looks a lot more like the one my former colleagues reported (Intel
hardware, virtual machine running a mail server there).

ARAnyM 0.9.9-1 here, 256 MB FastRam configured.

Can you try building from Geert's git source, using the same .config
as for the broken build?

Cheers,

  Michael


[   10.610000] Unable to handle kernel NULL pointer dereference at
virtual address   (null)
[   10.610000] Oops: 00000000
[   10.610000] Modules linked in:
[   10.610000] PC: [<00090d4a>] __slab_free+0x5a/0xd0
[   10.610000] SR: 2700  SP: 00d47c50  a2: 00bd4e70
[   10.610000] d0: 0000001d    d1: 00000007    d2: 00000001    d3: 0000=
00a2
[   10.610000] d4: 00000000    d5: 00d47e0c    a0: 00000000    a1: 0074=
406c
[   10.610000] Process udevd (pid: 89, task=3D00bd4e70)
[   10.610000] Frame format=3D7 eff addr=3D00000000 ssw=3D0505 faddr=3D=
00000000
[   10.610000] wb 1 stat/addr/data: 0000 00000000 00000000
[   10.610000] wb 2 stat/addr/data: 0000 00000000 00000000
[   10.610000] wb 3 stat/addr/data: 0000 00000000 8000bf58
[   10.610000] push data: 00000000 00000000 00000000 00000000
[   10.610000] Stack from 00d47cb8:
[   10.610000]         00002300 00639120 00802510 00c11908 00091b80
00802510 00639120 10c04000
[   10.610000]         001f3330 00000000 00c118f0 00d47f6c 001f3330
10c04000 00c118f0 00b19200
[   10.610000]         001f6024 00c118f0 00b19200 0020fdb0 00b19200
00c118f0 00d47f6c 00001000
[   10.610000]         00000000 00d47e90 eff22744 eff2272c 00813e70
00d47e0c 00813e70 00d47e14
[   10.610000]         00c118f0 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   10.610000]         00000040 00000000 002759a4 00000000 00d47e4c
001ec4c8 00d47d9e 00813e70
[   10.610000] Call Trace: [<00002300>] name_to_dev_t+0x48/0x2c8
[   10.610000]  [<00091b80>] kfree+0x92/0xc6
[   10.610000]  [<001f3330>] __kfree_skb+0x12/0x84
[   10.610000]  [<001f3330>] __kfree_skb+0x12/0x84
[   10.610000]  [<001f6024>] skb_free_datagram+0x10/0x36
[   10.610000]  [<0020fdb0>] netlink_recvmsg+0xfa/0x39c
[   10.610000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[   10.610000]  [<001ec4c8>] sock_recvmsg+0xb0/0xd2
[   10.610000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[   10.610000]  [<000200da>] _060_fpsp_effadd+0xb8ca/0xd518
[   10.610000]  [<00020000>] _060_fpsp_effadd+0xb7f0/0xd518
[   10.610000]  [<0001ffff>] _060_fpsp_effadd+0xb7ef/0xd518
[   10.610000]  [<00001774>] kernel_pg_dir+0x774/0x1000
[   10.610000]  [<0006ee38>] __alloc_pages_nodemask+0x0/0x546
[   10.610000]  [<0006eee0>] __alloc_pages_nodemask+0xa8/0x546
[   10.610000]  [<000200da>] _060_fpsp_effadd+0xb8ca/0xd518
[   10.610000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[   10.610000]  [<001f5590>] verify_iovec+0x4e/0xca
[   10.610000]  [<001ec2d0>] __sys_recvmsg+0xca/0x15e
[   10.610000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[   10.610000]  [<00100000>] ext2_write_failed+0x4/0x5a
[   10.610000]  [<000718dc>] put_page+0x0/0x15c
[   10.610000]  [<0007d32a>] do_wp_page+0x236/0x764
[   10.610000]  [<00029f5c>] check_preempt_wakeup+0xfc/0x214
[   10.610000]  [<0007e844>] handle_mm_fault+0x260/0x704
[   10.610000]  [<000076a6>] do_page_fault+0xa8/0x21a
[   10.610000]  [<001ec64c>] sockfd_lookup_light+0x1c/0x60
[   10.610000]  [<001ec8ea>] sys_recvmsg+0x34/0x70
[   10.610000]  [<001eded0>] sys_socketcall+0x10c/0x2ee
[   10.610000]  [<0000269c>] syscall+0x8/0xc
[   10.610000]
[   10.610000] Code: 4cdf 3804 4e75 103c 001d e0aa 2074 2c66 <5290>
49eb 0018 2268 0008 214c 0008 5888 2748 0018 2749 001c 228c 4cdf 3804
4e75
