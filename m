Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116E5C27C7A
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 10:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345204AbjHQKQg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 06:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350071AbjHQKQ3 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Aug 2023 06:16:29 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F9135AA
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 03:16:02 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id D86BB320094D;
        Thu, 17 Aug 2023 06:15:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 17 Aug 2023 06:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692267344; x=1692353744; bh=kD5UDhIfVT8QL
        wY4qmbyifGECKCDpWI/eFbILvy1uJQ=; b=2VIxNRDW/O4ZGj4kcrNcO5E/40apH
        aQBP0///2rApe7K06T4CjEHss4QDhhQYkZj0ohTUrwKzSxXoBASiwV0xjzrU0zZ0
        xzPzvwo6lNg7i/y81ituZH6sLt7SpAwy5r794iclPbuuTbqTM1CtbxzNjQKwo/+C
        3KTG+93IE0HIawpPw+X3Q5VRfY3lX7lcN8qYT1qe/ugQ5so3hqkk0Cw1eWVUdfLU
        NqeVRWzwT5Pr7cKIZN9+md0YI6BPIGOVFxWZeXbbnWbJ6F2qDFRy9yZ4R/j3cI2Q
        mZu3KoQYDcgosoYLCcWpz5I44mYXe6Gvj4Tj8q21P3dnLvyFs9ywPtyEw==
X-ME-Sender: <xms:T_PdZEaiFZSxOdChHjhtmn28B11oSjBYXQTY45D0rx8Lw0QXdb3Cqw>
    <xme:T_PdZPYXfxHFxJcWeW4Fw--Np6EgEMg4vQO-nOt7r91uOp8y0xLvtmCeea3CwkzZq
    ZnAOst2Vc3JiaNXqZ4>
X-ME-Received: <xmr:T_PdZO-PzARlTGMsiuI1_QGSJowvDkxUxp6x6WFDaVdjiCof2zWxpm0go6fneNbimmT81s1vVA6skCOQ53cuW3iSQ6cumlw2e3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:T_PdZOpuoQvlkJPT6KZXsYnLO7C0i_SQMKpgh902rY4Kbt0m79g-7w>
    <xmx:T_PdZPo5XmXD7spF84XXKe6dCI0dSx3DiwmdmIhI5bp8SYh6S6F1AQ>
    <xmx:T_PdZMTnk5CdHdGjF4QhkjDp4zGaaMnXGq1f3Yp1BeyHBEWIFousWg>
    <xmx:UPPdZG3MFPtrqQqEmtqPORhcd26iCs_yg4kItx2Nt0AIyxEJSx5liA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Aug 2023 06:15:42 -0400 (EDT)
Date:   Thu, 17 Aug 2023 20:15:55 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
In-Reply-To: <20230817035001.8400-3-schmitzmic@gmail.com>
Message-ID: <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org>
References: <20230817035001.8400-1-schmitzmic@gmail.com> <20230817035001.8400-3-schmitzmic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Thu, 17 Aug 2023, Michael Schmitz wrote:

> Some users of pata_falcon on Q40 have IDE disks in classic
> little endian byte order, whereas legacy disks use native
> big-endian byte order as on the Atari Falcon.
> 
> Add module parameter 'data_swab' to allow connecting drives
> with non-native data byte order.  Drives selected by the
> data_swap bit mask will have their user data byte-swapped to
> host byte order, i.e. 'pata_falcon.data_swab=2' will byte-swap
> all user data on drive B, leaving data on drive A in native
> byte order. On Q40, drives on a second IDE interface may be
> added to the bit mask as bits 3 and 4.

Many would say that's off by one, as it's popular to number the LSB as bit 
zero.

> 
> Default setting is no byte swapping, i.e. compatibility with
> the native Falcon or Q40 operating system disk format.
> 
> Cc: William R Sowerbutts <will@sowerbutts.com>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> 
> ---
> 
> Changes since v3:
> 
> - split off this byte swap handling into separate patch
> 
> - add hint regarding third and fourth drive on Q40
> 
> Finn Thain:
> - rename module parameter to 'data_swab' to better reflect its use
> 
> William Sowerbutts:
> - correct IDE drive number used in data swap conditional
> ---
>  drivers/ata/pata_falcon.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
> index 346259e3bbc8..cec3c3a6eed9 100644
> --- a/drivers/ata/pata_falcon.c
> +++ b/drivers/ata/pata_falcon.c
> @@ -33,6 +33,16 @@
>  #define DRV_NAME "pata_falcon"
>  #define DRV_VERSION "0.1.0"
>  
> +static int pata_falcon_swap_mask;
> +
> +module_param_named(data_swab, pata_falcon_swap_mask, int, 0444);
> +MODULE_PARM_DESC(data_swab, "Data byte swap enable/disable bitmap (0x1==drive1, 0x2==drive2, 0x4==drive3, 0x8==drive4, default==0)");
> +
> +struct pata_falcon_priv {
> +	unsigned int swap_mask;
> +	bool swap_data;
> +};
> +
>  static const struct scsi_host_template pata_falcon_sht = {
>  	ATA_PIO_SHT(DRV_NAME),
>  };
> @@ -44,13 +54,15 @@ static unsigned int pata_falcon_data_xfer(struct ata_queued_cmd *qc,
>  	struct ata_device *dev = qc->dev;
>  	struct ata_port *ap = dev->link->ap;
>  	void __iomem *data_addr = ap->ioaddr.data_addr;
> +	struct pata_falcon_priv *priv = ap->private_data;
>  	unsigned int words = buflen >> 1;
>  	struct scsi_cmnd *cmd = qc->scsicmd;
> +	int dev_id = dev->devno;
>  	bool swap = 1;
>  
>  	if (dev->class == ATA_DEV_ATA && cmd &&
>  	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
> -		swap = 0;
> +		swap = priv->swap_data && (priv->swap_mask & BIT(dev_id));
>  
>  	/* Transfer multiple of 2 bytes */
>  	if (rw == READ) {
> @@ -123,6 +135,7 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>  	struct resource *base_res, *ctl_res, *irq_res;
>  	struct ata_host *host;
>  	struct ata_port *ap;
> +	struct pata_falcon_priv *priv;
>  	void __iomem *base, *ctl_base;
>  	int irq = 0, io_offset = 1, reg_scale = 4;
>  
> @@ -165,10 +178,20 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>  	ap->pio_mask = ATA_PIO4;
>  	ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
>  
> +	priv = devm_kzalloc(&pdev->dev,
> +		sizeof(struct pata_falcon_priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ap->private_data = priv;
> +
>  	/* N.B. this assumes data_addr will be used for word-sized I/O only */
>  	ap->ioaddr.data_addr = (void __iomem *)base_mem_res->start;
>  
>  	if (base_res) {		/* only Q40 has IO resources */
> +		if (pdev->id)
> +			pata_falcon_swap_mask >>= 2;
> +		priv->swap_mask = pata_falcon_swap_mask;
>  		io_offset = 0x10000;
>  		reg_scale = 1;
>  		base = (void __iomem *)base_res->start;
> @@ -178,6 +201,7 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>  			      &base_res->start,
>  			      &ctl_res->start);
>  	} else {
> +		priv->swap_mask = pata_falcon_swap_mask;
>  		base = (void __iomem *)base_mem_res->start;
>  		ctl_base = (void __iomem *)ctl_mem_res->start;
>  
> @@ -199,6 +223,9 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>  	ap->ioaddr.altstatus_addr	= ctl_base + io_offset;
>  	ap->ioaddr.ctl_addr		= ctl_base + io_offset;
>  
> +	if (priv->swap_mask)
> +		priv->swap_data = 1;
> +
>  	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>  	if (irq_res && irq_res->start > 0) {
>  		irq = irq_res->start;
> 

I think the patch could be simplified by dropping the dynamic memory 
allocation...

diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
index 346259e3bbc8..d057f11ec02d 100644
--- a/drivers/ata/pata_falcon.c
+++ b/drivers/ata/pata_falcon.c
@@ -33,6 +33,11 @@
 #define DRV_NAME "pata_falcon"
 #define DRV_VERSION "0.1.0"
 
+static int pata_falcon_data_swab;
+
+module_param_named(data_swab, pata_falcon_data_swab, int, 0444);
+MODULE_PARM_DESC(data_swab, "Data byte swap enable/disable bitmap (0x1==drive1, 0x2==drive2, 0x4==drive3, 0x8==drive4, default: 0)");
+
 static const struct scsi_host_template pata_falcon_sht = {
 	ATA_PIO_SHT(DRV_NAME),
 };
@@ -50,7 +55,7 @@ static unsigned int pata_falcon_data_xfer(struct ata_queued_cmd *qc,
 
 	if (dev->class == ATA_DEV_ATA && cmd &&
 	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
-		swap = 0;
+		swap = (int)ap->private_data & BIT(dev->devno);
 
 	/* Transfer multiple of 2 bytes */
 	if (rw == READ) {
@@ -199,6 +204,8 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
 	ap->ioaddr.altstatus_addr	= ctl_base + io_offset;
 	ap->ioaddr.ctl_addr		= ctl_base + io_offset;
 
+	ap->private_data = (void *)((pata_falcon_data_swab >> (2 * pdev->id)) & 3);
+
 	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (irq_res && irq_res->start > 0) {
 		irq = irq_res->start;
