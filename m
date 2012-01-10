From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Atari TT (next 2)
Date: Tue, 10 Jan 2012 23:33:35 +0000
Message-ID: <4F0CCACF.3090701@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:42465 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932128Ab2AJXds (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jan 2012 18:33:48 -0500
Received: from localhost (unknown [127.0.0.1])
	by fairlite.demon.co.uk (Postfix) with ESMTP id 77F8D222354
	for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2012 23:33:36 +0000 (UTC)
Received: from fairlite.demon.co.uk ([127.0.0.1])
	by localhost (server.demon.co.uk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZk8BF0lO5NV for <linux-m68k@vger.kernel.org>;
	Tue, 10 Jan 2012 23:33:35 +0000 (GMT)
Received: from [192.168.0.50] (jetpack.demon.co.uk [192.168.0.50])
	by fairlite.demon.co.uk (Postfix) with ESMTP id 6841B22212C
	for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2012 23:33:35 +0000 (GMT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

O.k. I just upgraded the TT-RAM from 128MB to 256MB and now the kernel
crashes with this.

Notice that node_mem_map is 00000000 for the TT-RAM now.

Any ideas ?

Alan.

Linux version 3.2.0-atari-12913-g35c175f-dirty (root@server) (gc
c version 4.5.3 (Gentoo 4.5.3-r1 p1.0, pie-0.4.5) ) #43 Tue Jan 10
12:31:31 GMT
2012
console [debug0] enabled
Atari hardware found: TT_SHIFTER ST_MFP TT_MFP TT_SCSI_DMA TT_SCSI
YM2149 PCM SC
C_DMA SCC VME SCU MICROWIRE TT_CLK FDC_SPEED ACSI
On node 0 totalpages: 1024
free_area_init_node: node 0, pgdat 00211380, node_mem_map 00241000
  DMA zone: 9 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 1015 pages, LIFO batch:0
On node 1 totalpages: 65536
free_area_init_node: node 1, pgdat 00211d10, node_mem_map 00000000
  DMA zone: 576 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 64960 pages, LIFO batch:15
Data read fault at 0x00000000 in Super Data (pc=0x237828)
BAD KERNEL BUSERR
Oops: 00000000
Modules linked in:
PC: [<00237828>] memmap_init_zone+0x94/0x11a
SR: 2704  SP: 001ffe74  a2: 002002e0
d0: 00000000    d1: 00000000    d2: 00001000    d3: 00000000
d4: 00000000    d5: 00000001    a0: 00211d10    a1: 00211f40
Process swapper (pid: 0, task=002002e0)
Frame format=B ssw=074d isc=0281 isb=07ff daddr=00000000 dobuf=00000000
baddr=0023782c dibuf=00000022 ver=f
Stack from 001ffefc:
        00000000 00010000 00001000 00000000 00211f18 00000230 00211d10
00000000
        0018aba4 00000000 0022b720 00010000 00000001 00000000 00001000
00000000
        00000001 001fffa4 00001000 11000000 00091af8 00085c28 00210d10
00212680
        0022b414 001fffb0 00211d10 0000000c 001fffa8 00000001 00228dc4
00000001
        001fffa4 00001000 00000000 00228f8c 000e07a2 00000000 00000000
0023c0ac
        0018aba4 00210d04 00010000 00000000 00000000 001fffd0 00228156
0023b0ae
Call Trace: [<00010000>] tblpre+0x10c/0x780
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<0018aba4>] printk+0x0/0x1c
 [<0022b720>] free_area_init_node+0x30c/0x328
 [<00010000>] tblpre+0x10c/0x780
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<00091af8>] __blockdev_direct_IO+0x1d62/0x25b0
 [<00085c28>] wb_writeback+0x72/0x170
 [<0022b414>] free_area_init_node+0x0/0x328
 [<00228dc4>] paging_init+0x2ac/0x2dc
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<00228f8c>] atari_parse_bootinfo+0x0/0x2e
 [<000e07a2>] strlcpy+0x0/0x46
 [<0018aba4>] printk+0x0/0x1c
 [<00010000>] tblpre+0x10c/0x780
 [<00228156>] setup_arch+0x1a0/0x268
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<00225d4c>] start_kernel+0x6a/0x36e
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<0022531e>] _sinittext+0x31e/0x9c0
