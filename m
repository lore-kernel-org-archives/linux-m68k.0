From: Reid Lindsay <reidlindsay@rallycraft.com>
Subject: Issues with vmalloc and ebtables on ColdFire V4e
Date: Sat, 11 Jun 2016 05:54:41 +0000 (UTC)
Message-ID: <loom.20160611T070345-553@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:48678 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751354AbcFKGAI (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 11 Jun 2016 02:00:08 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1bBbxl-0000IU-DK
	for linux-m68k@vger.kernel.org; Sat, 11 Jun 2016 08:00:06 +0200
Received: from 34.122.233.220.static.exetel.com.au ([220.233.122.34])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sat, 11 Jun 2016 08:00:05 +0200
Received: from reidlindsay by 34.122.233.220.static.exetel.com.au with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sat, 11 Jun 2016 08:00:05 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

We are having some stability issues on our ColdFire V4e based board and hope
this forum can provide some advice on how to track the issue down.

The CPU is the 54415 running a 2.6.38 kernel with BSP patches and bug fixes
provided by Freescale. 64MiB SRAM and 64MiB NAND Flash. The compiler is GCC
4.4.1-cs4.4-54.

The problem is that when modifying the ebtables structures by
adding/flushing the rules, sooner or later a segfault occurs in a (seemingly
random) userspace process, with the faulting address within a region of
memory vmalloc'ed by ebtables (for our BSP, the vmalloc region is
0xc0000000-0xcfffffff). The fault does not occur right after modifying the
rules, it occurs some time (sometimes up to hours) later.

I was able to avoid the segfaults by replacing all vmalloc/vfree calls with
kmalloc/kfree in net/bridge/netfilter/ebtables.c.

Although other kernel subsystems make use of vmalloc, these regions seem to
be allocated once and never free'd during runtime.

For example:

cat /proc/vmallocinfo

0xc0026000-0xc0048000  139264 ubi_attach_mtd_dev+0x436/0x9d0 pages=16
pfn=41891 vmalloc
0xc004a000-0xc006c000  139264 ubi_attach_mtd_dev+0x44a/0x9d0 pages=16
pfn=4188e vmalloc
0xc006e000-0xc0076000   32768 ubi_read_volume+0x612/0x9cc pages=3 pfn=418b4
vmalloc
0xc009a000-0xc00ac000   73728 lzo_init+0x10/0x28 pages=8 pfn=418bf vmalloc
0xc00ae000-0xc00f2000  278528 deflate_init+0x1e/0xea pages=33 pfn=418d7 vmalloc
0xc00f4000-0xc0116000  139264 ubifs_mount+0x808/0x145a pages=16 pfn=418c5
vmalloc
0xc0118000-0xc013a000  139264 ubifs_mount+0x9a0/0x145a pages=16 pfn=41911
vmalloc
0xc013c000-0xc0140000   16384 ubifs_lpt_init+0x6a/0x446 pages=1 pfn=41922
vmalloc
0xc0148000-0xc014c000   16384 ubifs_lpt_init+0x3c/0x446 pages=1 pfn=41924
vmalloc
0xc014e000-0xc0170000  139264 ubifs_lpt_init+0x142/0x446 pages=16 pfn=41925
vmalloc
0xc0172000-0xc0194000  139264 ubifs_mount_orphans+0x360/0x434 pages=16
pfn=41935 vmalloc
0xc05f2000-0xc05f6000   16384 T.727+0x9a/0x17a pages=1 pfn=41ac9 vmalloc
0xc05f8000-0xc05fc000   16384 T.727+0xae/0x17a pages=1 pfn=41a40 vmalloc
<--- ebtables
0xc064c000-0xc0650000   16384 T.727+0x9a/0x17a pages=1 pfn=419b6 vmalloc
0xc0652000-0xc0656000   16384 T.727+0xae/0x17a pages=1 pfn=41a46 vmalloc

Just prior to the userspace segfault I captured the following in the
do_page_fault handler:

pc 0x402cc286, mmusr 0x0, complainingAddress 0xc05f8024
pc 0x60012b7e, mmusr 0x0, complainingAddress 0xc05f8024
do_page_fault: if (!vma)
regs->sr=0x18, regs->pc=0x60012b7e, address=0xc05f8024, signo=SIGSEGV,
code=SEGV_MAPERR

I appreciate any comments or advice on narrowing this issue down. Let me
know if more information is needed.

Thanks and regards
Reid Lindsay
