Received: from omr-01.pc5.atmailcloud.com (omr-01.pc5.atmailcloud.com [103.150.252.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3793DC878;
	Thu, 25 Jun 2026 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391371; cv=none; b=OB57fxa1NJzEmuxoRXc6rMHtlmwzskoBpUUIV9xRjspElvpbKhLLil+LjxPIQTw7vtPDg1+RC7p4kklQQV1GDdDDlOehWF0aZWHdqvZD17MNbl4sXrJiaFICfeok9ZIZhhooHX0KFciECinSt187WaujUkDMjO9p03hAS+3C9aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391371; c=relaxed/simple;
	bh=Ktvht5O/X4OqB6Dc4LTLlglcZoV/YqHTRKteB5BvJX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CppzIGltY//gDATtLtPRGabK1MvFqar3xBrXhjjkbN4eeSpA6G4E5LDyKax8gnGnTiV/+6abKFMwgOIOJ6gSXjmMNOFD3juEdDxo4lXpS59D3GB4S5eltKCpQelFHCFDIFBmZuBfbHM4aoM0dMopRFRkcme4vxeW7EEuS+Manwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=westnet.com.au; spf=pass smtp.mailfrom=westnet.com.au; dkim=pass (2048-bit key) header.d=westnet.com.au header.i=@westnet.com.au header.b=pGM9UuEU; arc=none smtp.client-ip=103.150.252.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=westnet.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westnet.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westnet.com.au header.i=@westnet.com.au header.b="pGM9UuEU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=westnet.com.au; s=202309; h=Content-Type:From:To:Subject:MIME-Version:Date:
	Message-ID; bh=e+PIk+O4rHlHF2NbSeeY/XhTt4M1wzTZ7x5xk7qadZA=; b=pGM9UuEUPAkLRA
	mJQlySdg44zWHWJItpz58o2akdr/SXkO3v7bmssXxd7XiDry83HduKyIyOU1Rw/pOhtGwY0FL31fs
	AxSm8Cbw+SPvboDjiUopfby0TzsoDhY4ScLexJMRj77RkkTK2svgFcINLP40Xs48ITj/SfMDLbZ2R
	9qBhTY8xBXQrSUX8G1+5bEwtgPqPq0h7bkI2ZLq5DFmZOH7mLPnVkkc0s/lDK5aWPKV4rRerFnDYQ
	GVbwUZFzh6JbLSvTnleP0bKeJst5OJ4hBGC1vQgtn+8PekP9Tb1jINvv/09tEiz0kbqbz3Ot2GVuE
	izQ1zTrBPKmYv61Wv8jA==;
Received: from cmr-kakadu04.internal.pc5.atmailcloud.com (cmr-kakadu04.internal.pc5.atmailcloud.com [192.168.1.6]) 
	by omr-01.pc5.atmailcloud.com (Exim/cmr-kakadu04.i-0c20fa12ae284b9bc) with ESMTPS
	(envelope-from <gregungerer@westnet.com.au>)
	id 1wcisN-00000005dSo-45tT ;
	Thu, 25 Jun 2026 12:08:11 +0000
Received: from [115.130.81.87] (helo=[192.168.0.22])
	 by cmr-kakadu04.i-0c20fa12ae284b9bc with esmtpsa
	(envelope-from <gregungerer@westnet.com.au>)
	id 1wcisE-000000014x2-0SzC;
	Thu, 25 Jun 2026 12:08:09 +0000
Message-ID: <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
Date: Thu, 25 Jun 2026 22:07:50 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
To: Arnd Bergmann <arnd@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
References: <20260526103227.3152003-1-arnd@kernel.org>
 <20260526103227.3152003-2-arnd@kernel.org>
Content-Language: en-US
From: Greg Ungerer <gregungerer@westnet.com.au>
In-Reply-To: <20260526103227.3152003-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Atmail-Id: gregungerer@westnet.com.au
X-atmailcloud-spam-action: 
X-AVAS-Report: RCVD_TLS_ALL(0.00) FROM_HAS_DN(0.00) FROM_EQ_ENVFROM(0.00) BAYES_HAM(-0.21) CLOUDMARK_NOT_SPAM(-5.00) TO_MATCH_ENVRCPT_ALL(0.00) KNOWN_SENDER(-1.00) MIME_GOOD(-0.10) MID_RHS_MATCH_FROM(0.00) RCPT_COUNT_SEVEN(0.00) RCVD_VIA_SMTP_AUTH(0.00) ARC_NA(0.00) CYREN_UNKNOWN(0.00) RCVD_COUNT_ONE(0.00) MIME_TRACE(0.00) ASN_FAIL(0.00) FREEMAIL_FROM(0.00) TO_DN_SOME(0.00) FREEMAIL_ENVFROM(0.00) 
X-atmailcloud-route: unknown

Hi Arnd,

On 26/5/26 20:32, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Rather than using platform data or DT properties, the configuration
> for this mtd map driver used to be passed through the global
> uclinux_ram_map structure, but the last instance was removed in
> commit 4ba66a976072 ("arch: remove blackfin port") in 2018.
> 
> After commit 251f26c9e828 ("mtd: maps: Make uclinux_ram_map static"),
> it became impossible to configure it at all, even with out-of-tree
> platform code.
> 
> Clearly nobody is using it, so remove it.

It is used on some ColdFire platforms, and was working all the way up
to being removed in the current merge window.

The ColdFire platform startup code (arch/m68k/coldfire/head.S) has a
somewhat unusual setup that can copy an attached filesystem blob to
_bss_stop, and this is one of the places the uclinux.c map driver can
use as the filesystem memory address. From uclinux.c

     static int __init uclinux_mtd_init(void)
     {
         struct mtd_info *mtd;
         struct map_info *mapp;

         mapp = &uclinux_ram_map;

         if (physaddr == -1)
                 mapp->phys = (resource_size_t)__bss_stop;
         else
                 mapp->phys = physaddr;

No out of tree code is required. Most of the ColdFire defconfigs have
CONFIG_MTD_UCLINUX enabled, since it is commonly used.

Can we get this reverted?

Regards
Greg



> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/mtd/maps/Kconfig   |   6 --
>   drivers/mtd/maps/Makefile  |   1 -
>   drivers/mtd/maps/uclinux.c | 118 -------------------------------------
>   3 files changed, 125 deletions(-)
>   delete mode 100644 drivers/mtd/maps/uclinux.c
> 
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index 784dba14e908..1e8f2b518ddd 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -284,12 +284,6 @@ config MTD_PCMCIA_ANONYMOUS
>   
>   	  If unsure, say N.
>   
> -config MTD_UCLINUX
> -	bool "Generic uClinux RAM/ROM filesystem support"
> -	depends on (MTD_RAM=y || MTD_ROM=y) && (!MMU || COLDFIRE)
> -	help
> -	  Map driver to support image based filesystems for uClinux.
> -
>   config MTD_PLATRAM
>   	tristate "Map driver for platform device RAM (mtd-ram)"
>   	select MTD_RAM
> diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
> index 157f911f86d8..eff28fc0b60e 100644
> --- a/drivers/mtd/maps/Makefile
> +++ b/drivers/mtd/maps/Makefile
> @@ -31,7 +31,6 @@ obj-$(CONFIG_MTD_SCx200_DOCFLASH)+= scx200_docflash.o
>   obj-$(CONFIG_MTD_SOLUTIONENGINE)+= solutionengine.o
>   obj-$(CONFIG_MTD_PCI)		+= pci.o
>   obj-$(CONFIG_MTD_IMPA7)		+= impa7.o
> -obj-$(CONFIG_MTD_UCLINUX)	+= uclinux.o
>   obj-$(CONFIG_MTD_SCB2_FLASH)	+= scb2_flash.o
>   obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
>   obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> deleted file mode 100644
> index de4c46318abb..000000000000
> --- a/drivers/mtd/maps/uclinux.c
> +++ /dev/null
> @@ -1,118 +0,0 @@
> -/****************************************************************************/
> -
> -/*
> - *	uclinux.c -- generic memory mapped MTD driver for uclinux
> - *
> - *	(C) Copyright 2002, Greg Ungerer (gerg@snapgear.com)
> - *
> - *      License: GPL
> - */
> -
> -/****************************************************************************/
> -
> -#include <linux/moduleparam.h>
> -#include <linux/types.h>
> -#include <linux/init.h>
> -#include <linux/kernel.h>
> -#include <linux/fs.h>
> -#include <linux/mm.h>
> -#include <linux/major.h>
> -#include <linux/mtd/mtd.h>
> -#include <linux/mtd/map.h>
> -#include <linux/mtd/partitions.h>
> -#include <asm/io.h>
> -#include <asm/sections.h>
> -
> -/****************************************************************************/
> -
> -#ifdef CONFIG_MTD_ROM
> -#define MAP_NAME "rom"
> -#else
> -#define MAP_NAME "ram"
> -#endif
> -
> -static struct map_info uclinux_ram_map = {
> -	.name = MAP_NAME,
> -	.size = 0,
> -};
> -
> -static unsigned long physaddr = -1;
> -module_param(physaddr, ulong, S_IRUGO);
> -
> -static struct mtd_info *uclinux_ram_mtdinfo;
> -
> -/****************************************************************************/
> -
> -static const struct mtd_partition uclinux_romfs[] = {
> -	{ .name = "ROMfs" }
> -};
> -
> -#define	NUM_PARTITIONS	ARRAY_SIZE(uclinux_romfs)
> -
> -/****************************************************************************/
> -
> -static int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
> -	size_t *retlen, void **virt, resource_size_t *phys)
> -{
> -	struct map_info *map = mtd->priv;
> -	*virt = map->virt + from;
> -	if (phys)
> -		*phys = map->phys + from;
> -	*retlen = len;
> -	return(0);
> -}
> -
> -/****************************************************************************/
> -
> -static int __init uclinux_mtd_init(void)
> -{
> -	struct mtd_info *mtd;
> -	struct map_info *mapp;
> -
> -	mapp = &uclinux_ram_map;
> -
> -	if (physaddr == -1)
> -		mapp->phys = (resource_size_t)__bss_stop;
> -	else
> -		mapp->phys = physaddr;
> -
> -	if (!mapp->size)
> -		mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
> -	mapp->bankwidth = 4;
> -
> -	printk("uclinux[mtd]: probe address=0x%x size=0x%x\n",
> -	       	(int) mapp->phys, (int) mapp->size);
> -
> -	/*
> -	 * The filesystem is guaranteed to be in direct mapped memory. It is
> -	 * directly following the kernels own bss region. Following the same
> -	 * mechanism used by architectures setting up traditional initrds we
> -	 * use phys_to_virt to get the virtual address of its start.
> -	 */
> -	mapp->virt = phys_to_virt(mapp->phys);
> -
> -	if (mapp->virt == 0) {
> -		printk("uclinux[mtd]: no virtual mapping?\n");
> -		return(-EIO);
> -	}
> -
> -	simple_map_init(mapp);
> -
> -	mtd = do_map_probe("map_" MAP_NAME, mapp);
> -	if (!mtd) {
> -		printk("uclinux[mtd]: failed to find a mapping?\n");
> -		return(-ENXIO);
> -	}
> -
> -	mtd->owner = THIS_MODULE;
> -	mtd->_point = uclinux_point;
> -	mtd->priv = mapp;
> -
> -	uclinux_ram_mtdinfo = mtd;
> -	mtd_device_register(mtd, uclinux_romfs, NUM_PARTITIONS);
> -
> -	return(0);
> -}
> -device_initcall(uclinux_mtd_init);
> -
> -/****************************************************************************/

