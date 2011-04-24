From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Debian/m68k kernel (preview)
Date: Sun, 24 Apr 2011 20:07:31 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1104242000490.8787@herc.mirbsd.org>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>
 <BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com>
 <BANLkTikSRStQO6cyE+L2vHHe0TnkoBe8=A@mail.gmail.com>
 <BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com>
 <BANLkTin4=QFyQUT95d7eoXXrdkNJc=T9Tw@mail.gmail.com>
 <Pine.BSM.4.64L.1104231534340.3979@herc.mirbsd.org>  <20110423185725.GA16947@chumley.earth.sol>
  <Pine.BSM.4.64L.1104232054070.3979@herc.mirbsd.org> <1303617602.3032.86.camel@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:25319 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757603Ab1DXUIg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Apr 2011 16:08:36 -0400
In-Reply-To: <1303617602.3032.86.camel@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, Debian Kernel Team <debian-kernel@lists.debian.org>

(Michael, Geert, please read below for action item.)


=46inn Thain dixit:

>Most of the relevant mac patches were merged into the mainline prior t=
o=20
>the 2.6.34 release and by 2.6.37 all of them were merged.

Thanks for the information.


Ben Hutchings dixit:

>You don't need to unset ECONET or X25 in debian/config/m68k/config; th=
ey

I=E2=80=99ve addressed that now. Here is another preview.

Changes from the previous one:
* forgot one changelog entry
* used SLUB fix from thread on linux-mm: <4DB3840F.3060503@gmail.com>
  Re: [patch] m68k, mm: set all online nodes in N_NORMAL_MEMORY
* added a patch to reserve some ST-RAM early, which fixes usability
  of the atari framebuffer console on machines with a lot of FastRAM
  (the patch is accepted by the m68k subsystem maintainer; we=E2=80=99l=
l work
  on getting it into 2.6.40)
* reduced diff of debian/config/**

Except for the two patches listed above, all others are accepted and
merged by Linus for 2.6.39 already.


Michael Schmitz: I=E2=80=99ve changed one line in your ST-RAM patch
to avoid a trigraph (changed "??)" to "?)"). Geert, can you
please update the patch in your git? I=E2=80=99ve also added signoff
or tested-by lines to both the ST-RAM and SLUB patches, in
case that=E2=80=99s relevant to someone, based on my previous expe-
rience with these two patches. I will, of course, mail back
when I actually submit these to the Debian Kernel Team.


+++ linux-2.6-2.6.38/debian/changelog

+  [ Thorsten Glaser ]
+  * [m68k] Disable staging drivers (taken from Debian 2.6.32)
+  * [m68k] atari: Enable and compile in generic RTC
+  * [m68k] Backport the most urgent fixes from 2.6.39
+  * [m68k] Add patch from queue fixing atarifb console output on
+    machines with a lot of FastRAM by reserving some ST-RAM early
+  * [m68k] Add patch from mm mailing list to fix SLUB breakage

diff -u linux-2.6-2.6.38/debian/config/m68k/config.atari linux-2.6-2.6.=
38/debian/config/m68k/config.atari
--- linux-2.6-2.6.38/debian/config/m68k/config.atari
+++ linux-2.6-2.6.38/debian/config/m68k/config.atari
@@ -38,8 +38,8 @@
 # CONFIG_LP_CONSOLE is not set
 # CONFIG_PPDEV is not set
 CONFIG_NVRAM=3Dy
-CONFIG_RTC=3Dm
-CONFIG_GEN_RTC=3Dm
+CONFIG_RTC=3Dy
+CONFIG_GEN_RTC=3Dy
=20
 ##
 ## file: drivers/ide/Kconfig
@@ -107,6 +107,7 @@
 ## file: drivers/rtc/Kconfig
 ##
 CONFIG_RTC_CLASS=3Dy
+CONFIG_RTC_DRV_GENERIC=3Dy
=20
 ##
 ## file: drivers/scsi/Kconfig
diff -u linux-2.6-2.6.38/debian/config/m68k/config linux-2.6-2.6.38/deb=
ian/config/m68k/config
--- linux-2.6-2.6.38/debian/config/m68k/config
+++ linux-2.6-2.6.38/debian/config/m68k/config
@@ -130,7 +130,7 @@
 ##
 ## file: drivers/staging/Kconfig
 ##
-# CONFIG_STAGING is not set
+CONFIG_STAGING=3Dn
=20
 ##
 ## file: drivers/telephony/Kconfig
only in patch2:
unchanged:
--- linux-2.6-2.6.38.orig/debian/patches/series/4+m68k.3
+++ linux-2.6-2.6.38/debian/patches/series/4+m68k.3
@@ -0,0 +1,12 @@
+# merged by Linus for 2.6.39
++ bugfix/m68k/0001-m68k-Add-helper-function-handle_kernel_fault.patch
++ bugfix/m68k/0002-m68k-Use-base_trap_init-to-initialize-vectors.patch
++ bugfix/m68k/0003-m68k-Allow-all-kernel-traps-to-be-handled-via-excep=
t.patch
++ bugfix/m68k/0004-m68k-atari-Initial-ARAnyM-support.patch
++ bugfix/m68k/0005-m68k-atari-ARAnyM-Add-support-for-block-access.patc=
h
++ bugfix/m68k/0006-m68k-atari-ARAnyM-Add-support-for-console-access.pa=
tch
++ bugfix/m68k/0007-m68k-atari-ARAnyM-Add-support-for-network-access.pa=
tch
+# from m68k subsystem maintainer's patch queue, probably in 2.6.40
++ bugfix/m68k/0008-m68k-atari-Reserve-some-ST-RAM-early-on-for-device-=
b.patch
+# from http://thread.gmane.org/gmane.linux.kernel.mm/61328/focus=3D219=
0
++ bugfix/m68k/0009-m68k-mm-set-all-online-nodes-in-N_NORMAL_MEMORY.pat=
ch
only in patch2:
unchanged:
--- linux-2.6-2.6.38.orig/debian/patches/bugfix/m68k/0009-m68k-mm-set-a=
ll-online-nodes-in-N_NORMAL_MEMORY.patch
+++ linux-2.6-2.6.38/debian/patches/bugfix/m68k/0009-m68k-mm-set-all-on=
line-nodes-in-N_NORMAL_MEMORY.patch
@@ -0,0 +1,64 @@
+From 678cf05cb8031c762644a393b7c943e7a9d2c288 Mon Sep 17 00:00:00 2001
+From: Michael Schmitz <schmitzmic@googlemail.com>
+Date: Sun, 24 Apr 2011 13:59:43 +1200
+Subject: [PATCH 9/9] m68k, mm: set all online nodes in N_NORMAL_MEMORY
+
+David Rientjes wrote:
+> For m68k, N_NORMAL_MEMORY represents all nodes that have present mem=
ory
+> since it does not support HIGHMEM.  This patch sets the bit at the t=
ime
+> the node is brought online.
+>
+> If N_NORMAL_MEMORY is not accurate, slub may encounter errors since =
it
+> uses this nodemask to setup per-cache kmem_cache_node data structure=
s.
+>
+> Signed-off-by: David Rientjes <rientjes@google.com>
+> ---
+>  arch/m68k/mm/init_mm.c |    2 ++
+>  1 files changed, 2 insertions(+), 0 deletions(-)
+>
+> diff --git a/arch/m68k/mm/init_mm.c b/arch/m68k/mm/init_mm.c
+> --- a/arch/m68k/mm/init_mm.c
+> +++ b/arch/m68k/mm/init_mm.c
+> @@ -59,6 +59,8 @@ void __init m68k_setup_node(int node)
+>  	}
+>  #endif
+>  	pg_data_map[node].bdata =3D bootmem_node_data + node;
+> +	if (node_present_pages(node))
+> +		node_set_state(node, N_NORMAL_MEMORY);
+>  	node_set_online(node);
+>  }
+>
+>
+As Andreas pointed out, node_present_pages is set in free_area_init_no=
de
+which only gets called at the very end of m68k mm paging_init.
+
+The correct patch would be something like this - the need for the
+conditional is perhaps debatable, seeing as we set the pages present
+just before node_set_state.
+
+Tested on my ARAnyM test setup so far. I'd like to wait for an
+independent kernel image built by Thorsten before I test on the actual
+hardware. Sorry but you'll have to restart your build Thorsten :-)
+
+Signed-off-by: Michael Schmitz <schmitz@debian.org>
+Tested-by: Thorsten Glaser <tg@debian.org>
+---
+ arch/m68k/mm/motorola.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
+index 02b7a03..8b3db1c 100644
+--- a/arch/m68k/mm/motorola.c
++++ b/arch/m68k/mm/motorola.c
+@@ -300,6 +300,8 @@ void __init paging_init(void)
+ 		zones_size[ZONE_DMA] =3D m68k_memory[i].size >> PAGE_SHIFT;
+ 		free_area_init_node(i, zones_size,
+ 				    m68k_memory[i].addr >> PAGE_SHIFT, NULL);
++		if (node_present_pages(i))
++			node_set_state(i, N_NORMAL_MEMORY);
+ 	}
+ }
+=20
+--=20
+1.7.4.4
+
only in patch2:
unchanged:
--- linux-2.6-2.6.38.orig/debian/patches/bugfix/m68k/0005-m68k-atari-AR=
AnyM-Add-support-for-block-access.patch
+++ linux-2.6-2.6.38/debian/patches/bugfix/m68k/0005-m68k-atari-ARAnyM-=
Add-support-for-block-access.patch
@@ -0,0 +1,250 @@
+From b17808612628b0504e4b7edcbf87683da4e6e83f Mon Sep 17 00:00:00 2001
+From: Roman Zippel <zippel@linux-m68k.org>
+Date: Tue, 18 Nov 2008 21:02:19 +0100
+Subject: [PATCH 5/9] m68k/atari: ARAnyM - Add support for block access
+
+[geert: Cleanups and updates]
+
+Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+Acked-by: Petr Stehlik <pstehlik@sophics.cz>
+---
+ arch/m68k/Kconfig       |    8 ++
+ arch/m68k/emu/Makefile  |    2 +
+ arch/m68k/emu/nfblock.c |  195 ++++++++++++++++++++++++++++++++++++++=
+++++++++
+ 3 files changed, 205 insertions(+), 0 deletions(-)
+ create mode 100644 arch/m68k/emu/nfblock.c
+
+diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
+index 16a1e20..c3047d7 100644
+--- a/arch/m68k/Kconfig
++++ b/arch/m68k/Kconfig
+@@ -249,6 +249,14 @@ config NATFEAT
+ 	  This option enables support for ARAnyM native features, such as
+ 	  access to a disk image as /dev/hda.
+=20
++config NFBLOCK
++	tristate "NatFeat block device support"
++	depends on BLOCK && NATFEAT
++	help
++	  Say Y to include support for the ARAnyM NatFeat block device
++	  which allows direct access to the hard drives without using
++	  the hardware emulation.
++
+ comment "Processor type"
+=20
+ config M68020
+diff --git a/arch/m68k/emu/Makefile b/arch/m68k/emu/Makefile
+index 34cfa34..fc4f77a 100644
+--- a/arch/m68k/emu/Makefile
++++ b/arch/m68k/emu/Makefile
+@@ -3,3 +3,5 @@
+ #
+=20
+ obj-y			+=3D natfeat.o
++
++obj-$(CONFIG_NFBLOCK)	+=3D nfblock.o
+diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
+new file mode 100644
+index 0000000..48e50f8
+--- /dev/null
++++ b/arch/m68k/emu/nfblock.c
+@@ -0,0 +1,195 @@
++/*
++ * ARAnyM block device driver
++ *
++ * This file is subject to the terms and conditions of the GNU Genera=
l Public
++ * License.  See the file COPYING in the main directory of this archi=
ve
++ * for more details.
++ */
++
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/init.h>
++
++#include <linux/kernel.h>
++#include <linux/errno.h>
++#include <linux/types.h>
++#include <linux/genhd.h>
++#include <linux/blkdev.h>
++#include <linux/hdreg.h>
++#include <linux/slab.h>
++
++#include <asm/natfeat.h>
++
++static long nfhd_id;
++
++enum {
++	/* emulation entry points */
++	NFHD_READ_WRITE =3D 10,
++	NFHD_GET_CAPACITY =3D 14,
++
++	/* skip ACSI devices */
++	NFHD_DEV_OFFSET =3D 8,
++};
++
++static inline s32 nfhd_read_write(u32 major, u32 minor, u32 rwflag, u=
32 recno,
++				  u32 count, u32 buf)
++{
++	return nf_call(nfhd_id + NFHD_READ_WRITE, major, minor, rwflag, recn=
o,
++		       count, buf);
++}
++
++static inline s32 nfhd_get_capacity(u32 major, u32 minor, u32 *blocks=
,
++				    u32 *blocksize)
++{
++	return nf_call(nfhd_id + NFHD_GET_CAPACITY, major, minor, blocks,
++		       blocksize);
++}
++
++static LIST_HEAD(nfhd_list);
++
++static int major_num;
++module_param(major_num, int, 0);
++
++struct nfhd_device {
++	struct list_head list;
++	int id;
++	u32 blocks, bsize;
++	int bshift;
++	struct request_queue *queue;
++	struct gendisk *disk;
++};
++
++static int nfhd_make_request(struct request_queue *queue, struct bio =
*bio)
++{
++	struct nfhd_device *dev =3D queue->queuedata;
++	struct bio_vec *bvec;
++	int i, dir, len, shift;
++	sector_t sec =3D bio->bi_sector;
++
++	dir =3D bio_data_dir(bio);
++	shift =3D dev->bshift;
++	bio_for_each_segment(bvec, bio, i) {
++		len =3D bvec->bv_len;
++		len >>=3D 9;
++		nfhd_read_write(dev->id, 0, dir, sec >> shift, len >> shift,
++				bvec_to_phys(bvec));
++		sec +=3D len;
++	}
++	bio_endio(bio, 0);
++	return 0;
++}
++
++static int nfhd_getgeo(struct block_device *bdev, struct hd_geometry =
*geo)
++{
++	struct nfhd_device *dev =3D bdev->bd_disk->private_data;
++
++	geo->cylinders =3D dev->blocks >> (6 - dev->bshift);
++	geo->heads =3D 4;
++	geo->sectors =3D 16;
++
++	return 0;
++}
++
++static const struct block_device_operations nfhd_ops =3D {
++	.owner	=3D THIS_MODULE,
++	.getgeo	=3D nfhd_getgeo,
++};
++
++static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
++{
++	struct nfhd_device *dev;
++	int dev_id =3D id - NFHD_DEV_OFFSET;
++
++	pr_info("nfhd%u: found device with %u blocks (%u bytes)\n", dev_id,
++		blocks, bsize);
++
++	if (bsize < 512 || (bsize & (bsize - 1))) {
++		pr_warn("nfhd%u: invalid block size\n", dev_id);
++		return -EINVAL;
++	}
++
++	dev =3D kmalloc(sizeof(struct nfhd_device), GFP_KERNEL);
++	if (!dev)
++		goto out;
++
++	dev->id =3D id;
++	dev->blocks =3D blocks;
++	dev->bsize =3D bsize;
++	dev->bshift =3D ffs(bsize) - 10;
++
++	dev->queue =3D blk_alloc_queue(GFP_KERNEL);
++	if (dev->queue =3D=3D NULL)
++		goto free_dev;
++
++	dev->queue->queuedata =3D dev;
++	blk_queue_make_request(dev->queue, nfhd_make_request);
++	blk_queue_logical_block_size(dev->queue, bsize);
++
++	dev->disk =3D alloc_disk(16);
++	if (!dev->disk)
++		goto free_queue;
++
++	dev->disk->major =3D major_num;
++	dev->disk->first_minor =3D dev_id * 16;
++	dev->disk->fops =3D &nfhd_ops;
++	dev->disk->private_data =3D dev;
++	sprintf(dev->disk->disk_name, "nfhd%u", dev_id);
++	set_capacity(dev->disk, (sector_t)blocks * (bsize / 512));
++	dev->disk->queue =3D dev->queue;
++
++	add_disk(dev->disk);
++
++	list_add_tail(&dev->list, &nfhd_list);
++
++	return 0;
++
++free_queue:
++	blk_cleanup_queue(dev->queue);
++free_dev:
++	kfree(dev);
++out:
++	return -ENOMEM;
++}
++
++static int __init nfhd_init(void)
++{
++	u32 blocks, bsize;
++	int i;
++
++	nfhd_id =3D nf_get_id("XHDI");
++	if (!nfhd_id)
++		return -ENODEV;
++
++	major_num =3D register_blkdev(major_num, "nfhd");
++	if (major_num <=3D 0) {
++		pr_warn("nfhd: unable to get major number\n");
++		return major_num;
++	}
++
++	for (i =3D NFHD_DEV_OFFSET; i < 24; i++) {
++		if (nfhd_get_capacity(i, 0, &blocks, &bsize))
++			continue;
++		nfhd_init_one(i, blocks, bsize);
++	}
++
++	return 0;
++}
++
++static void __exit nfhd_exit(void)
++{
++	struct nfhd_device *dev, *next;
++
++	list_for_each_entry_safe(dev, next, &nfhd_list, list) {
++		list_del(&dev->list);
++		del_gendisk(dev->disk);
++		put_disk(dev->disk);
++		blk_cleanup_queue(dev->queue);
++		kfree(dev);
++	}
++	unregister_blkdev(major_num, "nfhd");
++}
++
++module_init(nfhd_init);
++module_exit(nfhd_exit);
++
++MODULE_LICENSE("GPL");
+--=20
+1.7.4.4
+
only in patch2:
unchanged:
--- linux-2.6-2.6.38.orig/debian/patches/bugfix/m68k/0008-m68k-atari-Re=
serve-some-ST-RAM-early-on-for-device-b.patch
+++ linux-2.6-2.6.38/debian/patches/bugfix/m68k/0008-m68k-atari-Reserve=
-some-ST-RAM-early-on-for-device-b.patch
@@ -0,0 +1,209 @@
+From 87f4d0a511a647dbb32d2e105a613584c5d8f4a4 Mon Sep 17 00:00:00 2001
+From: Michael Schmitz <schmitzmic@googlemail.com>
+Date: Mon, 1 Nov 2010 18:54:00 +0100
+Subject: [PATCH 8/9] m68k/atari: Reserve some ST-RAM early on for devi=
ce
+ buffer use
+
+Signed-off-by: Michael Schmitz <schmitz@debian.org>
+[Andreas Schwab <schwab@linux-m68k.org>: Use memparse()]
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+[Thorsten Glaser <tg@debian.org>: avoid trigraph]
+Signed-off-by: Thorsten Glaser <tg@debian.org>
+---
+ arch/m68k/atari/stram.c |  117 ++++++++++++++++++++++++++++++++++++++=
+++++----
+ 1 files changed, 107 insertions(+), 10 deletions(-)
+
+diff --git a/arch/m68k/atari/stram.c b/arch/m68k/atari/stram.c
+index 6ec3b7f..bb6df5c 100644
+--- a/arch/m68k/atari/stram.c
++++ b/arch/m68k/atari/stram.c
+@@ -68,6 +68,23 @@
+  * no provision now for freeing ST-Ram buffers. It seems that isn't
+  * really needed.
+  *
++ * MSch 22/10/10: Because mem_init is now called before device init,
++ * devices that rely on ST-RAM may find all ST-RAM already allocated =
to
++ * other users by the time device init happens. In particular, a larg=
e
++ * initrd RAM disk may use up enough of ST-RAM to cause stram_alloc t=
o
++ * resort to get_dma_pages allocation.
++ * In the current state of Atari memory management, all of RAM is mar=
ked
++ * DMA capable, so get_dma_pages may well return RAM that is not in a=
ctual
++ * fact DMA capable. Using this for frame buffer or SCSI DMA buffer c=
auses
++ * subtle failure.
++ *
++ * The ST-RAM allocator has been changed to allocate memory from a po=
ol of
++ * reserved ST-RAM of configurable size, set aside on ST-RAM init (i.=
e.
++ * before mem_init). As long as this pool is not exhausted, allocatio=
n of
++ * real ST-RAM can be guaranteed.
++ * Currently, pool ST-RAM freed is not returned to the pool free list=
 so
++ * it will be lost. Code to move such freed ST-RAM from alloc_list to
++ * stram_free_list may be added if needed.
+  */
+=20
+ /* Start and end (virtual) of ST-RAM */
+@@ -91,11 +108,15 @@ typedef struct stram_block {
+ /* values for flags field */
+ #define BLOCK_FREE	0x01	/* free structure in the BLOCKs pool */
+ #define BLOCK_KMALLOCED	0x02	/* structure allocated by kmalloc() */
++#define BLOCK_POOL	0x04	/* block allocated from static pool */
+ #define BLOCK_GFP	0x08	/* block allocated with __get_dma_pages() */
+=20
+ /* list of allocated blocks */
+ static BLOCK *alloc_list;
+=20
++static BLOCK *stram_free_list;
++static unsigned long stram_pool, stram_pool_start, stram_pool_end;
++
+ /* We can't always use kmalloc() to allocate BLOCK structures, since
+  * stram_alloc() can be called rather early. So we need some pool of
+  * statically allocated structures. 20 of them is more than enough, s=
o in most
+@@ -116,6 +137,19 @@ static int remove_region( BLOCK *block );
+ /*							   Public Interface								*/
+ /* ------------------------------------------------------------------=
------ */
+=20
++static int pool_size =3D 1024*1024;
++
++static int __init atari_stram_setup(char *arg)
++{
++	if (!MACH_IS_ATARI)
++		return 0;
++
++	pool_size =3D memparse(arg, NULL);
++	return 0;
++}
++
++early_param("stram_pool", atari_stram_setup);
++
+ /*
+  * This init function is called very early by atari/config.c
+  * It initializes some internal variables needed for stram_alloc()
+@@ -156,6 +190,11 @@ void __init atari_stram_reserve_pages(void *start=
_mem)
+ 	if (!kernel_in_stram)
+ 		reserve_bootmem(0, PAGE_SIZE, BOOTMEM_DEFAULT);
+=20
++	stram_pool       =3D (unsigned long) alloc_bootmem_low(pool_size);
++	stram_pool_start =3D stram_pool;
++	stram_pool_end   =3D stram_pool + pool_size - 1;
++	DPRINTK("atari_stram pool: size=3D%d bytes, start=3D%08lx, end=3D%08=
lx\n",
++		pool_size, stram_pool, stram_pool_end);
+ }
+=20
+ void atari_stram_mem_init_hook (void)
+@@ -163,6 +202,38 @@ void atari_stram_mem_init_hook (void)
+ 	mem_init_done =3D 1;
+ }
+=20
++/* find a region (by size) in the free list */
++static void *find_free_stram(long size)
++{
++	BLOCK *p, *q, *r;
++	unsigned long item;
++
++	q =3D NULL;
++	r =3D stram_free_list;
++	for (p =3D stram_free_list; p; p =3D p->next) {
++		if (p->size >=3D size) {
++			q =3D p;
++			break;
++		}
++		r =3D p;
++	}
++
++	/* remove from free list */
++	if (q) {
++		item =3D (unsigned long) q->start;
++		r->next =3D q->next;
++		return (void *) item;
++	}
++	/* nothing found on free list? take from pool */
++	if ((stram_pool_end - stram_pool) > size) {
++		item =3D stram_pool;
++		stram_pool +=3D size;
++		return (void *) item;
++	}
++
++	return NULL;
++}
++
+=20
+ /*
+  * This is main public interface: somehow allocate a ST-RAM block
+@@ -184,16 +255,34 @@ void *atari_stram_alloc(long size, const char *o=
wner)
+ 	BLOCK *block;
+ 	int flags;
+=20
+-	DPRINTK("atari_stram_alloc(size=3D%08lx,owner=3D%s)\n", size, owner)=
;
++	DPRINTK("atari_stram_alloc(size=3D%08lx,owner=3D%s) ... ", size, own=
er);
+=20
+ 	if (!mem_init_done)
++		/*
++		 * This will trigger a section mismatch warning which is
++		 * actually harmless:
++		 * once mem_init has run (before free_initdata), we will not
++		 * call this code path anymore
++		 */
+ 		return alloc_bootmem_low(size);
+ 	else {
+-		/* After mem_init(): can only resort to __get_dma_pages() */
+-		addr =3D (void *)__get_dma_pages(GFP_KERNEL, get_order(size));
+-		flags =3D BLOCK_GFP;
+-		DPRINTK( "atari_stram_alloc: after mem_init, "
+-				 "get_pages=3D%p\n", addr );
++		/*
++		 * After mem_init(): can only resort to allocating from
++		 * reserved pool ...
++		 */
++		addr =3D find_free_stram(size);
++		if (addr) {
++			flags =3D BLOCK_POOL;
++			DPRINTK("after mem_init, allocating from pool, "
++				"find_free_stram=3D%p\n", addr);
++		} else {
++			/* or resort to __get_dma_pages() !! */
++			addr =3D (void *)__get_dma_pages(GFP_KERNEL,
++						       get_order(size));
++			flags =3D BLOCK_GFP;
++			DPRINTK("after mem_init, allocating dma pages, "
++				"get_dma_pages=3D%p\n", addr);
++		}
+ 	}
+=20
+ 	if (addr) {
+@@ -226,12 +315,18 @@ void atari_stram_free( void *addr )
+ 	DPRINTK( "atari_stram_free: found block (%p): size=3D%08lx, owner=3D=
%s, "
+ 			 "flags=3D%02x\n", block, block->size, block->owner, block->flags =
);
+=20
+-	if (!(block->flags & BLOCK_GFP))
++	if (!(block->flags & BLOCK_GFP || block->flags & BLOCK_POOL))
+ 		goto fail;
+=20
+ 	DPRINTK("atari_stram_free: is kmalloced, order_size=3D%d\n",
+ 		get_order(block->size));
+-	free_pages((unsigned long)addr, get_order(block->size));
++
++	/*
++	 * pages allocated from stram pool cannot be freed - only pages
++	 * allocated by get_free_pages can
++	 */
++	if ((block->flags & BLOCK_GFP))
++		free_pages((unsigned long)addr, get_order(block->size));
+ 	remove_region( block );
+ 	return;
+=20
+@@ -339,9 +434,11 @@ static int stram_proc_show(struct seq_file *m, vo=
id *v)
+ 			   virt_to_phys(p->start+p->size-1),
+ 			   p->owner);
+ 		if (p->flags & BLOCK_GFP)
+-			PRINT_PROC( "page-alloced)\n" );
++			PRINT_PROC("page-alloced)\n");
++		else if (p->flags & BLOCK_POOL)
++			PRINT_PROC("pool-alloced)\n");
+ 		else
+-			PRINT_PROC( "??)\n" );
++			PRINT_PROC("?)\n");
+ 	}
+=20
+ 	return 0;
+--=20
+1.7.4.4
+
only in patch2:
unchanged:
--- linux-2.6-2.6.38.orig/debian/patches/bugfix/m68k/0006-m68k-atari-AR=
AnyM-Add-support-for-console-access.patch
+++ linux-2.6-2.6.38/debian/patches/bugfix/m68k/0006-m68k-atari-ARAnyM-=
Add-support-for-console-access.patch
@@ -0,0 +1,273 @@
+From c154e95234fab43dd5dd03602bd19ac203200e89 Mon Sep 17 00:00:00 2001
+From: Roman Zippel <zippel@linux-m68k.org>
+Date: Tue, 18 Nov 2008 21:02:19 +0100
+Subject: [PATCH 6/9] m68k/atari: ARAnyM - Add support for console acce=
ss
+
+[geert: Cleanups and updates]
+
+Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+Acked-by: Petr Stehlik <pstehlik@sophics.cz>
+---
+ arch/m68k/Kconfig       |    8 +++
+ arch/m68k/emu/Makefile  |    1 +
+ arch/m68k/emu/natfeat.c |   38 -----------
+ arch/m68k/emu/nfcon.c   |  162 ++++++++++++++++++++++++++++++++++++++=
+++++++++
+ 4 files changed, 171 insertions(+), 38 deletions(-)
+ create mode 100644 arch/m68k/emu/nfcon.c
+
+diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
+index c3047d7..9490731 100644
+--- a/arch/m68k/Kconfig
++++ b/arch/m68k/Kconfig
+@@ -257,6 +257,14 @@ config NFBLOCK
+ 	  which allows direct access to the hard drives without using
+ 	  the hardware emulation.
+=20
++config NFCON
++	tristate "NatFeat console driver"
++	depends on NATFEAT
++	help
++	  Say Y to include support for the ARAnyM NatFeat console driver
++	  which allows the console output to be redirected to the stderr
++	  output of ARAnyM.
++
+ comment "Processor type"
+=20
+ config M68020
+diff --git a/arch/m68k/emu/Makefile b/arch/m68k/emu/Makefile
+index fc4f77a..a83ef1e 100644
+--- a/arch/m68k/emu/Makefile
++++ b/arch/m68k/emu/Makefile
+@@ -5,3 +5,4 @@
+ obj-y			+=3D natfeat.o
+=20
+ obj-$(CONFIG_NFBLOCK)	+=3D nfblock.o
++obj-$(CONFIG_NFCON)	+=3D nfcon.o
+diff --git a/arch/m68k/emu/natfeat.c b/arch/m68k/emu/natfeat.c
+index 987d773..2291a7d 100644
+--- a/arch/m68k/emu/natfeat.c
++++ b/arch/m68k/emu/natfeat.c
+@@ -35,24 +35,6 @@ asm("\n"
+ EXPORT_SYMBOL_GPL(nf_get_id);
+ EXPORT_SYMBOL_GPL(nf_call);
+=20
+-static int stderr_id;
+-
+-static void nf_write(struct console *co, const char *str, unsigned in=
t count)
+-{
+-	char buf[68];
+-
+-	buf[64] =3D 0;
+-	while (count > 64) {
+-		memcpy(buf, str, 64);
+-		nf_call(stderr_id, buf);
+-		str +=3D 64;
+-		count -=3D 64;
+-	}
+-	memcpy(buf, str, count);
+-	buf[count] =3D 0;
+-	nf_call(stderr_id, buf);
+-}
+-
+ void nfprint(const char *fmt, ...)
+ {
+ 	static char buf[256];
+@@ -65,26 +47,6 @@ void nfprint(const char *fmt, ...)
+ 	va_end(ap);
+ }
+=20
+-static struct console nf_console_driver =3D {
+-	.name	=3D "debug",
+-	.write	=3D nf_write,
+-	.flags	=3D CON_PRINTBUFFER,
+-	.index	=3D -1,
+-};
+-
+-static int __init nf_debug_setup(char *arg)
+-{
+-	if (strcmp(arg, "emu"))
+-		return 0;
+-
+-	stderr_id =3D nf_get_id("NF_STDERR");
+-	if (stderr_id)
+-		register_console(&nf_console_driver);
+-	return 0;
+-}
+-
+-early_param("debug", nf_debug_setup);
+-
+ static void nf_poweroff(void)
+ {
+ 	long id =3D nf_get_id("NF_SHUTDOWN");
+diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
+new file mode 100644
+index 0000000..ab20dc0
+--- /dev/null
++++ b/arch/m68k/emu/nfcon.c
+@@ -0,0 +1,162 @@
++/*
++ * ARAnyM console driver
++ *
++ * This file is subject to the terms and conditions of the GNU Genera=
l Public
++ * License.  See the file COPYING in the main directory of this archi=
ve
++ * for more details.
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/console.h>
++#include <linux/tty.h>
++#include <linux/tty_driver.h>
++#include <linux/tty_flip.h>
++#include <linux/slab.h>
++#include <linux/err.h>
++#include <linux/uaccess.h>
++
++#include <asm/natfeat.h>
++
++static int stderr_id;
++static struct tty_driver *nfcon_tty_driver;
++
++static void nfputs(const char *str, unsigned int count)
++{
++	char buf[68];
++
++	buf[64] =3D 0;
++	while (count > 64) {
++		memcpy(buf, str, 64);
++		nf_call(stderr_id, buf);
++		str +=3D 64;
++		count -=3D 64;
++	}
++	memcpy(buf, str, count);
++	buf[count] =3D 0;
++	nf_call(stderr_id, buf);
++}
++
++static void nfcon_write(struct console *con, const char *str,
++			unsigned int count)
++{
++	nfputs(str, count);
++}
++
++static struct tty_driver *nfcon_device(struct console *con, int *inde=
x)
++{
++	*index =3D 0;
++	return (con->flags & CON_ENABLED) ? nfcon_tty_driver : NULL;
++}
++
++static struct console nf_console =3D {
++	.name	=3D "nfcon",
++	.write	=3D nfcon_write,
++	.device	=3D nfcon_device,
++	.flags	=3D CON_PRINTBUFFER,
++	.index	=3D -1,
++};
++
++
++static int nfcon_tty_open(struct tty_struct *tty, struct file *filp)
++{
++	return 0;
++}
++
++static void nfcon_tty_close(struct tty_struct *tty, struct file *filp=
)
++{
++}
++
++static int nfcon_tty_write(struct tty_struct *tty, const unsigned cha=
r *buf,
++			   int count)
++{
++	nfputs(buf, count);
++	return count;
++}
++
++static int nfcon_tty_put_char(struct tty_struct *tty, unsigned char c=
h)
++{
++	char temp[2] =3D { ch, 0 };
++
++	nf_call(stderr_id, temp);
++	return 1;
++}
++
++static int nfcon_tty_write_room(struct tty_struct *tty)
++{
++	return 64;
++}
++
++static const struct tty_operations nfcon_tty_ops =3D {
++	.open		=3D nfcon_tty_open,
++	.close		=3D nfcon_tty_close,
++	.write		=3D nfcon_tty_write,
++	.put_char	=3D nfcon_tty_put_char,
++	.write_room	=3D nfcon_tty_write_room,
++};
++
++#ifndef MODULE
++
++static int __init nf_debug_setup(char *arg)
++{
++	if (strcmp(arg, "nfcon"))
++		return 0;
++
++	stderr_id =3D nf_get_id("NF_STDERR");
++	if (stderr_id) {
++		nf_console.flags |=3D CON_ENABLED;
++		register_console(&nf_console);
++	}
++
++	return 0;
++}
++
++early_param("debug", nf_debug_setup);
++
++#endif /* !MODULE */
++
++static int __init nfcon_init(void)
++{
++	int res;
++
++	stderr_id =3D nf_get_id("NF_STDERR");
++	if (!stderr_id)
++		return -ENODEV;
++
++	nfcon_tty_driver =3D alloc_tty_driver(1);
++	if (!nfcon_tty_driver)
++		return -ENOMEM;
++
++	nfcon_tty_driver->owner =3D THIS_MODULE;
++	nfcon_tty_driver->driver_name =3D "nfcon";
++	nfcon_tty_driver->name =3D "nfcon";
++	nfcon_tty_driver->type =3D TTY_DRIVER_TYPE_SYSTEM;
++	nfcon_tty_driver->subtype =3D SYSTEM_TYPE_TTY;
++	nfcon_tty_driver->init_termios =3D tty_std_termios;
++	nfcon_tty_driver->flags =3D TTY_DRIVER_REAL_RAW;
++
++	tty_set_operations(nfcon_tty_driver, &nfcon_tty_ops);
++	res =3D tty_register_driver(nfcon_tty_driver);
++	if (res) {
++		pr_err("failed to register nfcon tty driver\n");
++		put_tty_driver(nfcon_tty_driver);
++		return res;
++	}
++
++	if (!(nf_console.flags & CON_ENABLED))
++		register_console(&nf_console);
++
++	return 0;
++}
++
++static void __exit nfcon_exit(void)
++{
++	unregister_console(&nf_console);
++	tty_unregister_driver(nfcon_tty_driver);
++	put_tty_driver(nfcon_tty_driver);
++}
++
++module_init(nfcon_init);
++module_exit(nfcon_exit);
++
++MODULE_LICENSE("GPL");
+--=20
+1.7.4.4
+
only in patch2:
unchanged:
--- linux-2.6-2.6.38.orig/debian/patches/bugfix/m68k/0002-m68k-Use-base=
_trap_init-to-initialize-vectors.patch
+++ linux-2.6-2.6.38/debian/patches/bugfix/m68k/0002-m68k-Use-base_trap=
_init-to-initialize-vectors.patch
@@ -0,0 +1,51 @@
+From 2a36e907a8bb57c90a3addd94993f4e73b571ada Mon Sep 17 00:00:00 2001
+From: Roman Zippel <zippel@linux-m68k.org>
+Date: Tue, 18 Nov 2008 21:25:17 +0100
+Subject: [PATCH 2/9] m68k: Use base_trap_init() to initialize vectors
+
+So basic initialization is all in one place.
+
+Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+---
+ arch/m68k/kernel/traps.c |   10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
+index ada4f4c..cd802d4 100644
+--- a/arch/m68k/kernel/traps.c
++++ b/arch/m68k/kernel/traps.c
+@@ -48,10 +48,7 @@ asmlinkage void nmihandler(void);
+ asmlinkage void fpu_emu(void);
+ #endif
+=20
+-e_vector vectors[256] =3D {
+-	[VEC_BUSERR]	=3D buserr,
+-	[VEC_SYS]	=3D system_call,
+-};
++e_vector vectors[256];
+=20
+ /* nmi handler for the Amiga */
+ asm(".text\n"
+@@ -64,7 +61,7 @@ asm(".text\n"
+  */
+ void __init base_trap_init(void)
+ {
+-	if(MACH_IS_SUN3X) {
++	if (MACH_IS_SUN3X) {
+ 		extern e_vector *sun3x_prom_vbr;
+=20
+ 		__asm__ volatile ("movec %%vbr, %0" : "=3Dr" (sun3x_prom_vbr));
+@@ -79,6 +76,9 @@ void __init base_trap_init(void)
+=20
+ 		vectors[VEC_UNIMPII] =3D unimp_vec;
+ 	}
++
++	vectors[VEC_BUSERR] =3D buserr;
++	vectors[VEC_SYS] =3D system_call;
+ }
+=20
+ void __init trap_init (void)
+--=20
+1.7.4.4
+
only in patch2:
unchanged:
--- linux-2.6-2.6.38.orig/debian/patches/bugfix/m68k/0004-m68k-atari-In=
itial-ARAnyM-support.patch
+++ linux-2.6-2.6.38/debian/patches/bugfix/m68k/0004-m68k-atari-Initial=
-ARAnyM-support.patch
@@ -0,0 +1,242 @@
+From 62acf39a5ab025b65cce080a0bc21b547b32119b Mon Sep 17 00:00:00 2001
+From: Petr Stehlik <pstehlik@sophics.cz>
+Date: Tue, 18 Nov 2008 21:02:18 +0100
+Subject: [PATCH 4/9] m68k/atari: Initial ARAnyM support
+
+Add improved support for running under the ARAnyM emulator
+(Atari Running on Any Machine - http://aranym.org/).
+
+[michael, geert: Cleanups and updates]
+
+Signed-off-by: Petr Stehlik <pstehlik@sophics.cz>
+Signed-off-by: Michael Schmitz <schmitz@debian.org>
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+---
+ arch/m68k/Kconfig               |    7 ++
+ arch/m68k/Makefile              |    1 +
+ arch/m68k/emu/Makefile          |    5 ++
+ arch/m68k/emu/natfeat.c         |  116 ++++++++++++++++++++++++++++++=
+++++++++
+ arch/m68k/include/asm/natfeat.h |   22 +++++++
+ arch/m68k/kernel/setup.c        |    5 ++
+ 6 files changed, 156 insertions(+), 0 deletions(-)
+ create mode 100644 arch/m68k/emu/Makefile
+ create mode 100644 arch/m68k/emu/natfeat.c
+ create mode 100644 arch/m68k/include/asm/natfeat.h
+
+diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
+index bc9271b..16a1e20 100644
+--- a/arch/m68k/Kconfig
++++ b/arch/m68k/Kconfig
+@@ -242,6 +242,13 @@ config SUN3
+=20
+ 	  If you don't want to compile a kernel exclusively for a Sun 3, say=
 N.
+=20
++config NATFEAT
++	bool "ARAnyM emulator support"
++	depends on ATARI
++	help
++	  This option enables support for ARAnyM native features, such as
++	  access to a disk image as /dev/hda.
++
+ comment "Processor type"
+=20
+ config M68020
+diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
+index b06a7e3..b793163 100644
+--- a/arch/m68k/Makefile
++++ b/arch/m68k/Makefile
+@@ -76,6 +76,7 @@ core-$(CONFIG_MVME16x)		+=3D arch/m68k/mvme16x/
+ core-$(CONFIG_BVME6000)		+=3D arch/m68k/bvme6000/
+ core-$(CONFIG_SUN3X)		+=3D arch/m68k/sun3x/	arch/m68k/sun3/
+ core-$(CONFIG_SUN3)		+=3D arch/m68k/sun3/	arch/m68k/sun3/prom/
++core-$(CONFIG_NATFEAT)		+=3D arch/m68k/emu/
+ core-$(CONFIG_M68040)		+=3D arch/m68k/fpsp040/
+ core-$(CONFIG_M68060)		+=3D arch/m68k/ifpsp060/
+ core-$(CONFIG_M68KFPU_EMU)	+=3D arch/m68k/math-emu/
+diff --git a/arch/m68k/emu/Makefile b/arch/m68k/emu/Makefile
+new file mode 100644
+index 0000000..34cfa34
+--- /dev/null
++++ b/arch/m68k/emu/Makefile
+@@ -0,0 +1,5 @@
++#
++# Makefile for Linux arch/m68k/emu source directory
++#
++
++obj-y			+=3D natfeat.o
+diff --git a/arch/m68k/emu/natfeat.c b/arch/m68k/emu/natfeat.c
+new file mode 100644
+index 0000000..987d773
+--- /dev/null
++++ b/arch/m68k/emu/natfeat.c
+@@ -0,0 +1,116 @@
++/*
++ * natfeat.c - ARAnyM hardware support via Native Features (natfeats)
++ *
++ * Copyright (c) 2005 Petr Stehlik of ARAnyM dev team
++ *
++ * Reworked for Linux by Roman Zippel <zippel@linux-m68k.org>
++ *
++ * This software may be used and distributed according to the terms o=
f
++ * the GNU General Public License (GPL), incorporated herein by refer=
ence.
++ */
++
++#include <linux/types.h>
++#include <linux/console.h>
++#include <linux/string.h>
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/io.h>
++#include <asm/machdep.h>
++#include <asm/natfeat.h>
++
++asm("\n"
++"	.global nf_get_id,nf_call\n"
++"nf_get_id:\n"
++"	.short	0x7300\n"
++"	rts\n"
++"nf_call:\n"
++"	.short	0x7301\n"
++"	rts\n"
++"1:	moveq.l	#0,%d0\n"
++"	rts\n"
++"	.section __ex_table,\"a\"\n"
++"	.long	nf_get_id,1b\n"
++"	.long	nf_call,1b\n"
++"	.previous");
++EXPORT_SYMBOL_GPL(nf_get_id);
++EXPORT_SYMBOL_GPL(nf_call);
++
++static int stderr_id;
++
++static void nf_write(struct console *co, const char *str, unsigned in=
t count)
++{
++	char buf[68];
++
++	buf[64] =3D 0;
++	while (count > 64) {
++		memcpy(buf, str, 64);
++		nf_call(stderr_id, buf);
++		str +=3D 64;
++		count -=3D 64;
++	}
++	memcpy(buf, str, count);
++	buf[count] =3D 0;
++	nf_call(stderr_id, buf);
++}
++
++void nfprint(const char *fmt, ...)
++{
++	static char buf[256];
++	va_list ap;
++	int n;
++
++	va_start(ap, fmt);
++	n =3D vsnprintf(buf, 256, fmt, ap);
++	nf_call(nf_get_id("NF_STDERR"), buf);
++	va_end(ap);
++}
++
++static struct console nf_console_driver =3D {
++	.name	=3D "debug",
++	.write	=3D nf_write,
++	.flags	=3D CON_PRINTBUFFER,
++	.index	=3D -1,
++};
++
++static int __init nf_debug_setup(char *arg)
++{
++	if (strcmp(arg, "emu"))
++		return 0;
++
++	stderr_id =3D nf_get_id("NF_STDERR");
++	if (stderr_id)
++		register_console(&nf_console_driver);
++	return 0;
++}
++
++early_param("debug", nf_debug_setup);
++
++static void nf_poweroff(void)
++{
++	long id =3D nf_get_id("NF_SHUTDOWN");
++
++	if (id)
++		nf_call(id);
++}
++
++void nf_init(void)
++{
++	unsigned long id, version;
++	char buf[256];
++
++	id =3D nf_get_id("NF_VERSION");
++	if (!id)
++		return;
++	version =3D nf_call(id);
++
++	id =3D nf_get_id("NF_NAME");
++	if (!id)
++		return;
++	nf_call(id, buf, 256);
++	buf[255] =3D 0;
++
++	pr_info("NatFeats found (%s, %lu.%lu)\n", buf, version >> 16,
++		version & 0xffff);
++
++	mach_power_off =3D nf_poweroff;
++}
+diff --git a/arch/m68k/include/asm/natfeat.h b/arch/m68k/include/asm/n=
atfeat.h
+new file mode 100644
+index 0000000..a3521b8
+--- /dev/null
++++ b/arch/m68k/include/asm/natfeat.h
+@@ -0,0 +1,22 @@
++/*
++ * ARAnyM hardware support via Native Features (natfeats)
++ *
++ * Copyright (c) 2005 Petr Stehlik of ARAnyM dev team
++ *
++ * This software may be used and distributed according to the terms o=
f
++ * the GNU General Public License (GPL), incorporated herein by refer=
ence.
++ */
++
++#ifndef _NATFEAT_H
++#define _NATFEAT_H
++
++long nf_get_id(const char *feature_name);
++long nf_call(long id, ...);
++
++void nf_init(void);
++void nf_shutdown(void);
++
++void nfprint(const char *fmt, ...)
++	__attribute__ ((format (printf, 1, 2)));
++
++# endif /* _NATFEAT_H */
+diff --git a/arch/m68k/kernel/setup.c b/arch/m68k/kernel/setup.c
+index b3963ab..334d836 100644
+--- a/arch/m68k/kernel/setup.c
++++ b/arch/m68k/kernel/setup.c
+@@ -42,6 +42,7 @@
+ #ifdef CONFIG_SUN3X
+ #include <asm/dvma.h>
+ #endif
++#include <asm/natfeat.h>
+=20
+ #if !FPSTATESIZE || !NR_IRQS
+ #warning No CPU/platform type selected, your kernel will not work!
+@@ -324,6 +325,10 @@ void __init setup_arch(char **cmdline_p)
+ 		panic("No configuration setup");
+ 	}
+=20
++#ifdef CONFIG_NATFEAT
++	nf_init();
++#endif
++
+ 	paging_init();
+=20
+ #ifndef CONFIG_SUN3
+--=20
+1.7.4.4
+
only in patch2:
unchanged:
--- linux-2.6-2.6.38.orig/debian/patches/bugfix/m68k/0001-m68k-Add-help=
er-function-handle_kernel_fault.patch
+++ linux-2.6-2.6.38/debian/patches/bugfix/m68k/0001-m68k-Add-helper-fu=
nction-handle_kernel_fault.patch
@@ -0,0 +1,116 @@
+From b8d10d8540e1d2eece5f2e8d629e0a8c3368965a Mon Sep 17 00:00:00 2001
+From: Roman Zippel <zippel@linux-m68k.org>
+Date: Tue, 18 Nov 2008 21:25:17 +0100
+Subject: [PATCH 1/9] m68k: Add helper function handle_kernel_fault()
+
+Add helper function handle_kernel_fault() in signal.c, so frame_extra_=
sizes
+can become static, and to avoid future code duplication.
+
+Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+---
+ arch/m68k/include/asm/processor.h |    2 ++
+ arch/m68k/kernel/signal.c         |   24 +++++++++++++++++++++++-
+ arch/m68k/mm/fault.c              |   16 +---------------
+ 3 files changed, 26 insertions(+), 16 deletions(-)
+
+diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm=
/processor.h
+index 278c69b..f111b02 100644
+--- a/arch/m68k/include/asm/processor.h
++++ b/arch/m68k/include/asm/processor.h
+@@ -113,6 +113,8 @@ static inline void start_thread(struct pt_regs * r=
egs, unsigned long pc,
+ 	wrusp(usp);
+ }
+=20
++extern int handle_kernel_fault(struct pt_regs *regs);
++
+ #else
+=20
+ /*
+diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
+index d12c3b0..a0afc23 100644
+--- a/arch/m68k/kernel/signal.c
++++ b/arch/m68k/kernel/signal.c
+@@ -42,6 +42,7 @@
+ #include <linux/personality.h>
+ #include <linux/tty.h>
+ #include <linux/binfmts.h>
++#include <linux/module.h>
+=20
+ #include <asm/setup.h>
+ #include <asm/uaccess.h>
+@@ -51,7 +52,7 @@
+=20
+ #define _BLOCKABLE (~(sigmask(SIGKILL) | sigmask(SIGSTOP)))
+=20
+-const int frame_extra_sizes[16] =3D {
++static const int frame_extra_sizes[16] =3D {
+   [1]	=3D -1, /* sizeof(((struct frame *)0)->un.fmt1), */
+   [2]	=3D sizeof(((struct frame *)0)->un.fmt2),
+   [3]	=3D sizeof(((struct frame *)0)->un.fmt3),
+@@ -69,6 +70,27 @@ const int frame_extra_sizes[16] =3D {
+   [15]	=3D -1, /* sizeof(((struct frame *)0)->un.fmtf), */
+ };
+=20
++int handle_kernel_fault(struct pt_regs *regs)
++{
++	const struct exception_table_entry *fixup;
++	struct pt_regs *tregs;
++
++	/* Are we prepared to handle this kernel fault? */
++	fixup =3D search_exception_tables(regs->pc);
++	if (!fixup)
++		return 0;
++
++	/* Create a new four word stack frame, discarding the old one. */
++	regs->stkadj =3D frame_extra_sizes[regs->format];
++	tregs =3D	(struct pt_regs *)((long)regs + regs->stkadj);
++	tregs->vector =3D regs->vector;
++	tregs->format =3D 0;
++	tregs->pc =3D fixup->fixup;
++	tregs->sr =3D regs->sr;
++
++	return 1;
++}
++
+ /*
+  * Atomically swap in the new signal mask, and wait for a signal.
+  */
+diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
+index a96394a..2db6099 100644
+--- a/arch/m68k/mm/fault.c
++++ b/arch/m68k/mm/fault.c
+@@ -18,7 +18,6 @@
+ #include <asm/pgalloc.h>
+=20
+ extern void die_if_kernel(char *, struct pt_regs *, long);
+-extern const int frame_extra_sizes[]; /* in m68k/kernel/signal.c */
+=20
+ int send_fault_sig(struct pt_regs *regs)
+ {
+@@ -35,21 +34,8 @@ int send_fault_sig(struct pt_regs *regs)
+ 		force_sig_info(siginfo.si_signo,
+ 			       &siginfo, current);
+ 	} else {
+-		const struct exception_table_entry *fixup;
+-
+-		/* Are we prepared to handle this kernel fault? */
+-		if ((fixup =3D search_exception_tables(regs->pc))) {
+-			struct pt_regs *tregs;
+-			/* Create a new four word stack frame, discarding the old
+-			   one.  */
+-			regs->stkadj =3D frame_extra_sizes[regs->format];
+-			tregs =3D	(struct pt_regs *)((ulong)regs + regs->stkadj);
+-			tregs->vector =3D regs->vector;
+-			tregs->format =3D 0;
+-			tregs->pc =3D fixup->fixup;
+-			tregs->sr =3D regs->sr;
++		if (handle_kernel_fault(regs))
+ 			return -1;
+-		}
+=20
+ 		//if (siginfo.si_signo =3D=3D SIGBUS)
+ 		//	force_sig_info(siginfo.si_signo,
+--=20
+1.7.4.4
+
only in patch2:
unchanged:
--- linux-2.6-2.6.38.orig/debian/patches/bugfix/m68k/0007-m68k-atari-AR=
AnyM-Add-support-for-network-access.patch
+++ linux-2.6-2.6.38/debian/patches/bugfix/m68k/0007-m68k-atari-ARAnyM-=
Add-support-for-network-access.patch
@@ -0,0 +1,327 @@
+From cfb6fef8b8c8380d75b71f13b25084736172b7ed Mon Sep 17 00:00:00 2001
+From: Milan Jurik <milan.jurik@xylab.cz>
+Date: Tue, 18 Nov 2008 21:02:18 +0100
+Subject: [PATCH 7/9] m68k/atari: ARAnyM - Add support for network acce=
ss
+
+[petr: Second author]
+[michael, geert: Cleanups and updates]
+
+Signed-off-by: Milan Jurik <milan.jurik@xylab.cz>
+Signed-off-by: Petr Stehlik <pstehlik@sophics.cz>
+Signed-off-by: Michael Schmitz <schmitz@debian.org>
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+Cc: netdev@vger.kernel.org
+---
+ arch/m68k/Kconfig      |    8 ++
+ arch/m68k/emu/Makefile |    1 +
+ arch/m68k/emu/nfeth.c  |  270 +++++++++++++++++++++++++++++++++++++++=
+++++++++
+ 3 files changed, 279 insertions(+), 0 deletions(-)
+ create mode 100644 arch/m68k/emu/nfeth.c
+
+diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
+index 9490731..2238c1d 100644
+--- a/arch/m68k/Kconfig
++++ b/arch/m68k/Kconfig
+@@ -265,6 +265,14 @@ config NFCON
+ 	  which allows the console output to be redirected to the stderr
+ 	  output of ARAnyM.
+=20
++config NFETH
++	tristate "NatFeat Ethernet support"
++	depends on NET_ETHERNET && NATFEAT
++	help
++	  Say Y to include support for the ARAnyM NatFeat network device
++	  which will emulate a regular ethernet device while presenting an
++	  ethertap device to the host system.
++
+ comment "Processor type"
+=20
+ config M68020
+diff --git a/arch/m68k/emu/Makefile b/arch/m68k/emu/Makefile
+index a83ef1e..7dc2010 100644
+--- a/arch/m68k/emu/Makefile
++++ b/arch/m68k/emu/Makefile
+@@ -6,3 +6,4 @@ obj-y			+=3D natfeat.o
+=20
+ obj-$(CONFIG_NFBLOCK)	+=3D nfblock.o
+ obj-$(CONFIG_NFCON)	+=3D nfcon.o
++obj-$(CONFIG_NFETH)	+=3D nfeth.o
+diff --git a/arch/m68k/emu/nfeth.c b/arch/m68k/emu/nfeth.c
+new file mode 100644
+index 0000000..8b6e201
+--- /dev/null
++++ b/arch/m68k/emu/nfeth.c
+@@ -0,0 +1,270 @@
++/*
++ * atari_nfeth.c - ARAnyM ethernet card driver for GNU/Linux
++ *
++ * Copyright (c) 2005 Milan Jurik, Petr Stehlik of ARAnyM dev team
++ *
++ * Based on ARAnyM driver for FreeMiNT written by Standa Opichal
++ *
++ * This software may be used and distributed according to the terms o=
f
++ * the GNU General Public License (GPL), incorporated herein by refer=
ence.
++ */
++
++#define DRV_VERSION	"0.3"
++#define DRV_RELDATE	"10/12/2005"
++
++#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
++
++#include <linux/netdevice.h>
++#include <linux/etherdevice.h>
++#include <linux/module.h>
++#include <asm/natfeat.h>
++#include <asm/virtconvert.h>
++
++enum {
++	GET_VERSION =3D 0,/* no parameters, return NFAPI_VERSION in d0 */
++	XIF_INTLEVEL,	/* no parameters, return Interrupt Level in d0 */
++	XIF_IRQ,	/* acknowledge interrupt from host */
++	XIF_START,	/* (ethX), called on 'ifup', start receiver thread */
++	XIF_STOP,	/* (ethX), called on 'ifdown', stop the thread */
++	XIF_READLENGTH,	/* (ethX), return size of network data block to read=
 */
++	XIF_READBLOCK,	/* (ethX, buffer, size), read block of network data *=
/
++	XIF_WRITEBLOCK,	/* (ethX, buffer, size), write block of network data=
 */
++	XIF_GET_MAC,	/* (ethX, buffer, size), return MAC HW addr in buffer *=
/
++	XIF_GET_IPHOST,	/* (ethX, buffer, size), return IP address of host *=
/
++	XIF_GET_IPATARI,/* (ethX, buffer, size), return IP address of atari =
*/
++	XIF_GET_NETMASK	/* (ethX, buffer, size), return IP netmask */
++};
++
++#define MAX_UNIT	8
++
++/* These identify the driver base version and may not be removed. */
++static const char version[] __devinitdata =3D
++	KERN_INFO KBUILD_MODNAME ".c:v" DRV_VERSION " " DRV_RELDATE
++	" S.Opichal, M.Jurik, P.Stehlik\n"
++	KERN_INFO " http://aranym.org/\n";
++
++MODULE_AUTHOR("Milan Jurik");
++MODULE_DESCRIPTION("Atari NFeth driver");
++MODULE_LICENSE("GPL");
++/*
++MODULE_PARM(nfeth_debug, "i");
++MODULE_PARM_DESC(nfeth_debug, "nfeth_debug level (1-2)");
++*/
++
++
++static long nfEtherID;
++static int nfEtherIRQ;
++
++struct nfeth_private {
++	int ethX;
++};
++
++static struct net_device *nfeth_dev[MAX_UNIT];
++
++static int nfeth_open(struct net_device *dev)
++{
++	struct nfeth_private *priv =3D netdev_priv(dev);
++	int res;
++
++	res =3D nf_call(nfEtherID + XIF_START, priv->ethX);
++	netdev_dbg(dev, "%s: %d\n", __func__, res);
++
++	/* Ready for data */
++	netif_start_queue(dev);
++
++	return 0;
++}
++
++static int nfeth_stop(struct net_device *dev)
++{
++	struct nfeth_private *priv =3D netdev_priv(dev);
++
++	/* No more data */
++	netif_stop_queue(dev);
++
++	nf_call(nfEtherID + XIF_STOP, priv->ethX);
++
++	return 0;
++}
++
++/*
++ * Read a packet out of the adapter and pass it to the upper layers
++ */
++static inline void recv_packet(struct net_device *dev)
++{
++	struct nfeth_private *priv =3D netdev_priv(dev);
++	unsigned short pktlen;
++	struct sk_buff *skb;
++
++	/* read packet length (excluding 32 bit crc) */
++	pktlen =3D nf_call(nfEtherID + XIF_READLENGTH, priv->ethX);
++
++	netdev_dbg(dev, "%s: %u\n", __func__, pktlen);
++
++	if (!pktlen) {
++		netdev_dbg(dev, "%s: pktlen =3D=3D 0\n", __func__);
++		dev->stats.rx_errors++;
++		return;
++	}
++
++	skb =3D dev_alloc_skb(pktlen + 2);
++	if (!skb) {
++		netdev_dbg(dev, "%s: out of mem (buf_alloc failed)\n",
++			   __func__);
++		dev->stats.rx_dropped++;
++		return;
++	}
++
++	skb->dev =3D dev;
++	skb_reserve(skb, 2);		/* 16 Byte align  */
++	skb_put(skb, pktlen);		/* make room */
++	nf_call(nfEtherID + XIF_READBLOCK, priv->ethX, virt_to_phys(skb->dat=
a),
++		pktlen);
++
++	skb->protocol =3D eth_type_trans(skb, dev);
++	netif_rx(skb);
++	dev->last_rx =3D jiffies;
++	dev->stats.rx_packets++;
++	dev->stats.rx_bytes +=3D pktlen;
++
++	/* and enqueue packet */
++	return;
++}
++
++static irqreturn_t nfeth_interrupt(int irq, void *dev_id)
++{
++	int i, m, mask;
++
++	mask =3D nf_call(nfEtherID + XIF_IRQ, 0);
++	for (i =3D 0, m =3D 1; i < MAX_UNIT; m <<=3D 1, i++) {
++		if (mask & m && nfeth_dev[i]) {
++			recv_packet(nfeth_dev[i]);
++			nf_call(nfEtherID + XIF_IRQ, m);
++		}
++	}
++	return IRQ_HANDLED;
++}
++
++static int nfeth_xmit(struct sk_buff *skb, struct net_device *dev)
++{
++	unsigned int len;
++	char *data, shortpkt[ETH_ZLEN];
++	struct nfeth_private *priv =3D netdev_priv(dev);
++
++	data =3D skb->data;
++	len =3D skb->len;
++	if (len < ETH_ZLEN) {
++		memset(shortpkt, 0, ETH_ZLEN);
++		memcpy(shortpkt, data, len);
++		data =3D shortpkt;
++		len =3D ETH_ZLEN;
++	}
++
++	netdev_dbg(dev, "%s: send %u bytes\n", __func__, len);
++	nf_call(nfEtherID + XIF_WRITEBLOCK, priv->ethX, virt_to_phys(data),
++		len);
++
++	dev->stats.tx_packets++;
++	dev->stats.tx_bytes +=3D len;
++
++	dev_kfree_skb(skb);
++	return 0;
++}
++
++static void nfeth_tx_timeout(struct net_device *dev)
++{
++	dev->stats.tx_errors++;
++	netif_wake_queue(dev);
++}
++
++static const struct net_device_ops nfeth_netdev_ops =3D {
++	.ndo_open		=3D nfeth_open,
++	.ndo_stop		=3D nfeth_stop,
++	.ndo_start_xmit		=3D nfeth_xmit,
++	.ndo_tx_timeout		=3D nfeth_tx_timeout,
++	.ndo_validate_addr	=3D eth_validate_addr,
++	.ndo_change_mtu		=3D eth_change_mtu,
++	.ndo_set_mac_address	=3D eth_mac_addr,
++};
++
++static struct net_device * __init nfeth_probe(int unit)
++{
++	struct net_device *dev;
++	struct nfeth_private *priv;
++	char mac[ETH_ALEN], host_ip[32], local_ip[32];
++	int err;
++
++	if (!nf_call(nfEtherID + XIF_GET_MAC, unit, mac, ETH_ALEN))
++		return NULL;
++
++	dev =3D alloc_etherdev(sizeof(struct nfeth_private));
++	if (!dev)
++		return NULL;
++
++	dev->irq =3D nfEtherIRQ;
++	dev->netdev_ops =3D &nfeth_netdev_ops;
++
++	dev->flags |=3D NETIF_F_NO_CSUM;
++	memcpy(dev->dev_addr, mac, ETH_ALEN);
++
++	priv =3D netdev_priv(dev);
++	priv->ethX =3D unit;
++
++	err =3D register_netdev(dev);
++	if (err) {
++		free_netdev(dev);
++		return NULL;
++	}
++
++	nf_call(nfEtherID + XIF_GET_IPHOST, unit,
++		host_ip, sizeof(host_ip));
++	nf_call(nfEtherID + XIF_GET_IPATARI, unit,
++		local_ip, sizeof(local_ip));
++
++	netdev_info(dev, KBUILD_MODNAME " addr:%s (%s) HWaddr:%pM\n", host_i=
p,
++		    local_ip, mac);
++
++	return dev;
++}
++
++static int __init nfeth_init(void)
++{
++	long ver;
++	int error, i;
++
++	nfEtherID =3D nf_get_id("ETHERNET");
++	if (!nfEtherID)
++		return -ENODEV;
++
++	ver =3D nf_call(nfEtherID + GET_VERSION);
++	pr_info("API %lu\n", ver);
++
++	nfEtherIRQ =3D nf_call(nfEtherID + XIF_INTLEVEL);
++	error =3D request_irq(nfEtherIRQ, nfeth_interrupt, IRQF_SHARED,
++			    "eth emu", nfeth_interrupt);
++	if (error) {
++		pr_err("request for irq %d failed %d", nfEtherIRQ, error);
++		return error;
++	}
++
++	for (i =3D 0; i < MAX_UNIT; i++)
++		nfeth_dev[i] =3D nfeth_probe(i);
++
++	return 0;
++}
++
++static void __exit nfeth_cleanup(void)
++{
++	int i;
++
++	for (i =3D 0; i < MAX_UNIT; i++) {
++		if (nfeth_dev[i]) {
++			unregister_netdev(nfeth_dev[0]);
++			free_netdev(nfeth_dev[0]);
++		}
++	}
++	free_irq(nfEtherIRQ, nfeth_interrupt);
++}
++
++module_init(nfeth_init);
++module_exit(nfeth_cleanup);
+--=20
+1.7.4.4
+
only in patch2:
unchanged:
--- linux-2.6-2.6.38.orig/debian/patches/bugfix/m68k/0003-m68k-Allow-al=
l-kernel-traps-to-be-handled-via-except.patch
+++ linux-2.6-2.6.38/debian/patches/bugfix/m68k/0003-m68k-Allow-all-ker=
nel-traps-to-be-handled-via-except.patch
@@ -0,0 +1,53 @@
+From 94ff3996418310cc2109a70ff50a57e3532a661e Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Tue, 18 Nov 2008 21:25:17 +0100
+Subject: [PATCH 3/9] m68k: Allow all kernel traps to be handled via ex=
ception
+ fixups
+
+This will be needed by the ARAnyM Native Feature initialization code.
+Also document that the VEC_TRACE check is needed for 68020/30.
+
+Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+---
+ arch/m68k/kernel/traps.c |   10 +++++++---
+ 1 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
+index cd802d4..4022bbc 100644
+--- a/arch/m68k/kernel/traps.c
++++ b/arch/m68k/kernel/traps.c
+@@ -58,6 +58,7 @@ asm(".text\n"
+ /*
+  * this must be called very early as the kernel might
+  * use some instruction that are emulated on the 060
++ * and so we're prepared for early probe attempts (e.g. nf_init).
+  */
+ void __init base_trap_init(void)
+ {
+@@ -78,6 +79,7 @@ void __init base_trap_init(void)
+ 	}
+=20
+ 	vectors[VEC_BUSERR] =3D buserr;
++	vectors[VEC_ILLEGAL] =3D trap;
+ 	vectors[VEC_SYS] =3D system_call;
+ }
+=20
+@@ -1055,9 +1057,11 @@ asmlinkage void trap_c(struct frame *fp)
+ 	siginfo_t info;
+=20
+ 	if (fp->ptregs.sr & PS_S) {
+-		if ((fp->ptregs.vector >> 2) =3D=3D VEC_TRACE) {
+-			/* traced a trapping instruction */
+-		} else
++		if (fp->ptregs.vector =3D=3D VEC_TRACE << 2) {
++			/* traced a trapping instruction on a 68020/30,
++			 * real exception will be executed afterwards.
++			 */
++		} else if (!handle_kernel_fault(&fp->ptregs))
+ 			bad_super_trap(fp);
+ 		return;
+ 	}
+--=20
+1.7.4.4
+
