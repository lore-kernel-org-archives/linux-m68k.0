Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C65C27C53
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 23:04:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347197AbjHPXDa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 19:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347147AbjHPXDK (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 19:03:10 -0400
X-Greylist: delayed 1575 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 16 Aug 2023 16:03:06 PDT
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DAA2712
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 16:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=c7w75hW5VkiIFE/ZRekeJx0bpPhVEMtUASh4ByDqcm8=; b=Xi+Fz5CEmon2KgbfgAyGH5zmh7
        71Nbjfq1maruAL+zB/Mfu14EJgAujUcVT0YnSbAy2EMAuADiCRb7EGfmK0BDcICRMDNryW4KYUJpv
        +1hvru/sLzOedQSfQayvpEVPhCkTOkMt7Ijnmt6eJ622d+95MyCxLUAZ9sSMc7bZaX5RHdXh2M3lu
        +PSj1Ce4a2jn5v5zmB3U3IM1R0a+iWVkfl58/Jd6FiamfsAtFynM81J2/jJAvffYQKs7PSnZJOCTN
        3EUiy33xmLuJpPNtjRS8p1+KxtAcxhXYF8vVNPvruuVT+FwxS6yb9bPZBsFQRysNx4zNaZ77DJFXg
        CjRMPAOg==;
Received: from [2001:8b0:3b1:cafe:2292:e7dd:dea3:4ff6] (helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qWP8C-000a1G-0B;
        Wed, 16 Aug 2023 23:36:48 +0100
Date:   Wed, 16 Aug 2023 23:36:47 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org, Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in
 pata_falcon.c
Message-ID: <ZN1PfyTMh9mjCm3+@sowerbutts.com>
References: <20230815223212.13620-1-schmitzmic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815223212.13620-1-schmitzmic@gmail.com>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

I tested this patch

[    1.540000] atari-falcon-ide atari-falcon-ide.0: Atari Falcon and Q40/Q60 PATA controller
[    1.570000] scsi host0: pata_falcon
[    1.580000] ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
[    1.590000] atari-falcon-ide atari-falcon-ide.1: Atari Falcon and Q40/Q60 PATA controller
[    1.630000] scsi host1: pata_falcon
[    1.640000] ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15

[    1.840000] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[    1.840000] Oops: 00000000
[    1.840000] Modules linked in:
[    1.840000] PC: [<00211a82>] pata_falcon_data_xfer+0x2e/0x220
[    1.840000] SR: 2700  SP: (ptrval)  a2: 00853070
[    1.840000] d0: 00915ea0    d1: 000010a0    d2: 000000b0    d3: 00000ea0
[    1.840000] d4: 00000160    d5: 00000000    a0: 0091549a    a1: 00915d60
[    1.840000] Process kworker/0:1 (pid: 14, task=(ptrval))
[    1.840000] Frame format=7 eff addr=00859e64 ssw=0505 faddr=00000000
[    1.840000] wb 1 stat/addr/data: 0005 00306b70 004666b4
[    1.840000] wb 2 stat/addr/data: 0005 00032934 00466b22
[    1.840000] wb 3 stat/addr/data: 0005 00859e44 00000000
[    1.840000] push data: 004666b4 00032a56 00464982 00000003
[    1.840000] Stack from 00859e44:
[    1.840000]         00000000 00000ea0 00915658 00000001 00000000 004caff4 00914000 002109b0
[    1.840000]         0020ff74 00000000 002109ec 0091549a 00915ea0 00000160 00000000 004caff4
[    1.840000]         0091549a 00210ae8 0091549a 004caff4 00000ea0 00000160 00915458 00000008
[    1.840000]         0091549a 00914000 00915550 00211072 0091549a 00915458 00000008 0091549a
[    1.840000]         00914000 00211564 0091549a 0091549a 00211084 0031bcfa 00203eb4 00000000
[    1.840000]         007ca5e0 0091405e 00914000 00915550 0020ff74 0000a7c6 0091549a 0091405e
[    1.840000] Call Trace: [<002109b0>] ata_pio_xfer+0x0/0x8c
[    1.840000]  [<0020ff74>] ata_sff_busy_wait+0x0/0x42
[    1.840000]  [<002109ec>] ata_pio_xfer+0x3c/0x8c
[    1.840000]  [<00210ae8>] ata_pio_sector+0xac/0x112
[    1.840000]  [<00211072>] ata_pio_sectors+0x94/0xa6
[    1.840000]  [<00211564>] ata_sff_hsm_move+0x4e0/0x56e
[    1.840000]  [<00211084>] ata_sff_hsm_move+0x0/0x56e
[    1.840000]  [<0031bcfa>] warn_slowpath_fmt+0x0/0x62
[    1.840000]  [<00203eb4>] ata_msleep+0x0/0xa2
[    1.840000]  [<0020ff74>] ata_sff_busy_wait+0x0/0x42
[    1.840000]  [<0000a7c6>] ATANSM+0x62/0x70
[    1.840000]  [<002116ea>] ata_sff_pio_task+0xf8/0x104
[    1.840000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.840000]  [<00024f36>] process_one_work+0x12a/0x1b2
[    1.840000]  [<00022fc2>] worker_clr_flags+0x0/0x72
[    1.840000]  [<00025406>] worker_thread+0x230/0x292
[    1.840000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.840000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.840000]  [<000251d6>] worker_thread+0x0/0x292
[    1.840000]  [<00029668>] kthread+0x96/0xa0
[    1.840000]  [<000295d2>] kthread+0x0/0xa0
[    1.840000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.840000]
[    1.840000] Code: 286d 0024 2c6d 24e8 2404 e28a 2a68 0008 <2055> 2068 00ac 2228 00fc 7601 c684 7001 b0a9 0108 6742 7007 c082 4a85 6700 0090
[    1.840000] Disabling lock debugging due to kernel taint
[    1.840000] note: kworker/0:1[14] exited with irqs disabled

This line is the problem: 

>+	int dev_id = cmd->device->sdev_target->id;

I changed this to 'dev_id = dev->devno' instead, which fixed it.

I confirmed that the byte swapping on/off feature works.

Will


On Wed, Aug 16, 2023 at 10:32:12AM +1200, Michael Schmitz wrote:
>With commit 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver
>with pata_falcon and falconide"), the Q40 IDE driver was
>replaced by pata_falcon.c (and the later obsoleted
>falconide.c).
>
>Both IO and memory resources were defined for the Q40 IDE
>platform device, but definition of the IDE register addresses
>was modeled after the Falcon case, both in use of the memory
>resources and in including register scale and byte vs. word
>offset in the address.
>
>This was correct for the Falcon case, which does not apply
>any address translation to the register addresses. In the
>Q40 case, all of device base address, byte access offset
>and register scaling is included in the platform specific
>ISA access translation (in asm/mm_io.h).
>
>As a consequence, such address translation gets applied
>twice, and register addresses are mangled.
>
>Use the device base address from the platform IO resource,
>and use standard register offsets from that base in order
>to calculate register addresses (the IO address translation
>will then apply the correct ISA window base and scaling).
>
>Encode PIO_OFFSET into IO port addresses for all registers
>except the data transfer register. Encode the MMIO offset
>there (pata_falcon_data_xfer() directly uses raw IO with
>no address translation).
>
>Add module parameter 'data_swap' to allow connecting drives
>with non-native data byte order. Drives selected by the
>data_swap bit mask will have their user data swapped to host
>byte order, i.e. 'pata_falcon.data_swap=2' will swap all user
>data on drive B, leaving data on drive A in native order.
>
>Reported-by: William R Sowerbutts <will@sowerbutts.com>
>Closes: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
>Link: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
>Fixes: 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver with pata_falcon and falconide")
>Cc: Finn Thain <fthain@linux-m68k.org>
>Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>
>---
>
>Changes from v2:
>
>- add driver parameter 'data_swap' as bit mask for drives to swap
>
>Changes from v1:
>
>Finn Thain:
>- take care to supply IO address suitable for ioread8/iowrite8
>- use MMIO address for data transfer
>---
> drivers/ata/pata_falcon.c | 90 ++++++++++++++++++++++++++++++---------
> 1 file changed, 69 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
>index 996516e64f13..e6038eca39d6 100644
>--- a/drivers/ata/pata_falcon.c
>+++ b/drivers/ata/pata_falcon.c
>@@ -33,6 +33,16 @@
> #define DRV_NAME "pata_falcon"
> #define DRV_VERSION "0.1.0"
> 
>+static int pata_falcon_swap_mask = 0; 
>+
>+module_param_named(data_swap, pata_falcon_swap_mask, int, 0444);
>+MODULE_PARM_DESC(data_swap, "Data byte swap enable/disable (0x1==drive1, 0x2==drive2, default==0)");
>+
>+struct pata_falcon_priv {
>+	unsigned int swap_mask;
>+	bool swap_data;
>+};
>+
> static const struct scsi_host_template pata_falcon_sht = {
> 	ATA_PIO_SHT(DRV_NAME),
> };
>@@ -44,13 +54,15 @@ static unsigned int pata_falcon_data_xfer(struct ata_queued_cmd *qc,
> 	struct ata_device *dev = qc->dev;
> 	struct ata_port *ap = dev->link->ap;
> 	void __iomem *data_addr = ap->ioaddr.data_addr;
>+	struct pata_falcon_priv *priv = ap->private_data;
> 	unsigned int words = buflen >> 1;
> 	struct scsi_cmnd *cmd = qc->scsicmd;
>+	int dev_id = cmd->device->sdev_target->id;
> 	bool swap = 1;
> 
> 	if (dev->class == ATA_DEV_ATA && cmd &&
> 	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
>-		swap = 0;
>+		swap = priv->swap_data && (priv->swap_mask & 1<<dev_id);
> 
> 	/* Transfer multiple of 2 bytes */
> 	if (rw == READ) {
>@@ -123,6 +135,7 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
> 	struct resource *base_res, *ctl_res, *irq_res;
> 	struct ata_host *host;
> 	struct ata_port *ap;
>+	struct pata_falcon_priv *priv;
> 	void __iomem *base;
> 	int irq = 0;
> 
>@@ -165,26 +178,61 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
> 	ap->pio_mask = ATA_PIO4;
> 	ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
> 
>-	base = (void __iomem *)base_mem_res->start;
>-	/* N.B. this assumes data_addr will be used for word-sized I/O only */
>-	ap->ioaddr.data_addr		= base + 0 + 0 * 4;
>-	ap->ioaddr.error_addr		= base + 1 + 1 * 4;
>-	ap->ioaddr.feature_addr		= base + 1 + 1 * 4;
>-	ap->ioaddr.nsect_addr		= base + 1 + 2 * 4;
>-	ap->ioaddr.lbal_addr		= base + 1 + 3 * 4;
>-	ap->ioaddr.lbam_addr		= base + 1 + 4 * 4;
>-	ap->ioaddr.lbah_addr		= base + 1 + 5 * 4;
>-	ap->ioaddr.device_addr		= base + 1 + 6 * 4;
>-	ap->ioaddr.status_addr		= base + 1 + 7 * 4;
>-	ap->ioaddr.command_addr		= base + 1 + 7 * 4;
>-
>-	base = (void __iomem *)ctl_mem_res->start;
>-	ap->ioaddr.altstatus_addr	= base + 1;
>-	ap->ioaddr.ctl_addr		= base + 1;
>-
>-	ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
>-		      (unsigned long)base_mem_res->start,
>-		      (unsigned long)ctl_mem_res->start);
>+	priv = devm_kzalloc(&pdev->dev,
>+		sizeof(struct pata_falcon_priv), GFP_KERNEL);
>+
>+	if (!priv)
>+		return -ENOMEM;
>+
>+	ap->private_data = priv;
>+
>+	priv->swap_mask = pata_falcon_swap_mask;
>+	if (priv->swap_mask)
>+		priv->swap_data = 1;
>+
>+	if (MACH_IS_Q40) {
>+		base = (void __iomem *)base_mem_res->start;
>+		ap->ioaddr.data_addr		= base + 0;
>+		base = (void __iomem *)base_res->start;
>+		ap->ioaddr.error_addr		= base + 0x10000 + 1;
>+		ap->ioaddr.feature_addr		= base + 0x10000 + 1;
>+		ap->ioaddr.nsect_addr		= base + 0x10000 + 2;
>+		ap->ioaddr.lbal_addr		= base + 0x10000 + 3;
>+		ap->ioaddr.lbam_addr		= base + 0x10000 + 4;
>+		ap->ioaddr.lbah_addr		= base + 0x10000 + 5;
>+		ap->ioaddr.device_addr		= base + 0x10000 + 6;
>+		ap->ioaddr.status_addr		= base + 0x10000 + 7;
>+		ap->ioaddr.command_addr		= base + 0x10000 + 7;
>+
>+		base = (void __iomem *)ctl_res->start;
>+		ap->ioaddr.altstatus_addr	= base + 0x10000;
>+		ap->ioaddr.ctl_addr		= base + 0x10000;
>+
>+		ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
>+			      (unsigned long)base_res->start,
>+			      (unsigned long)ctl_res->start);
>+	} else {
>+		base = (void __iomem *)base_mem_res->start;
>+		/* N.B. this assumes data_addr will be used for word-sized I/O only */
>+		ap->ioaddr.data_addr		= base + 0 + 0 * 4;
>+		ap->ioaddr.error_addr		= base + 1 + 1 * 4;
>+		ap->ioaddr.feature_addr		= base + 1 + 1 * 4;
>+		ap->ioaddr.nsect_addr		= base + 1 + 2 * 4;
>+		ap->ioaddr.lbal_addr		= base + 1 + 3 * 4;
>+		ap->ioaddr.lbam_addr		= base + 1 + 4 * 4;
>+		ap->ioaddr.lbah_addr		= base + 1 + 5 * 4;
>+		ap->ioaddr.device_addr		= base + 1 + 6 * 4;
>+		ap->ioaddr.status_addr		= base + 1 + 7 * 4;
>+		ap->ioaddr.command_addr		= base + 1 + 7 * 4;
>+
>+		base = (void __iomem *)ctl_mem_res->start;
>+		ap->ioaddr.altstatus_addr	= base + 1;
>+		ap->ioaddr.ctl_addr		= base + 1;
>+
>+		ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
>+			      (unsigned long)base_mem_res->start,
>+			      (unsigned long)ctl_mem_res->start);
>+	}
> 
> 	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> 	if (irq_res && irq_res->start > 0) {
>-- 
>2.17.1
>

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  

