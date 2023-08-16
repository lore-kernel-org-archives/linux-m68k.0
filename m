Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41FFC0015E
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 00:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239534AbjHPAXP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Aug 2023 20:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240795AbjHPAXH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 15 Aug 2023 20:23:07 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D013F2109
        for <linux-m68k@vger.kernel.org>; Tue, 15 Aug 2023 17:23:05 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 6690232009D8;
        Tue, 15 Aug 2023 20:23:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 15 Aug 2023 20:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692145381; x=1692231781; bh=VyJ+QoSp8Zvoo
        bDsDxErBlJVk5Op4WMqBcuVAs6fOnQ=; b=EQubVrZ3aXnn4KK5unD71MB4KvQHy
        3xceBWwLdNQ6JL2bSb1GYCTMebiQ0TW6U8+HBAkbVEWbK8wTYs6iNmAoSBSqp1Yg
        xI4IQYWVB9mNi9Ms7FrjNuhWFDSrBRRvfUqFAyRukBPUkm1B7f2n8+LsAeM6ZTiB
        JJLNEHur9v/8r82w0H9a4aFs7IOPPnjlfOYUIcvgGzRhtbrt+U5827NegYlmckaC
        tRS4Zg20z2GMlVHkRfhz1HrE0Iv5kA9tDRvnbvL5GpYF/WnqTXD9zm1773a2xKdm
        8OiIFA7jjHAJc/emJW6f6or9l6bBFbs6ZttOhCiJ8XZzeT3LAtilkflYg==
X-ME-Sender: <xms:5BbcZOj5UFQb2n4HW_FdXFixs6F6XNdYld7-9GH7hEbyfqT802368Q>
    <xme:5BbcZPDz1oCzz4TU1Fjr2UgWQziZURuUzjKRDm9Kwjqt9uGuNbvtJDf5dYIJT_eFH
    yJtW5KriZCZqF4zir4>
X-ME-Received: <xmr:5BbcZGHVT_MZStB6TWM6Cp9iOEWeUf9EWMzYMg6_LgqCwyzIrDcB8pKaGiED0GZwN8RHCP7R8m_LMO5mPrNTAuZpa0lFX4qSOn4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtkedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeefieehjedvtefgiedtudethfekieelhfevhefgvddtkeekvdekhefftdek
    vedvueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieek
    khdrohhrgh
X-ME-Proxy: <xmx:5BbcZHRsAms8iq7Yjw5l8O8C5mohKYglKKMKpKVlRyOPi8ZOhfEv_w>
    <xmx:5BbcZLwprIwFXK6FHlWFnkfiUu6TPI9xylCdJM8eAqkShKOHVswAsg>
    <xmx:5BbcZF5JA5XWaB9wDzhvr3Mkwb93oKTuZ-0rGYoG0Misl0GhZ3SnRw>
    <xmx:5RbcZG8yFJnwqdPER9glFt_ofAw8s0S3K9SIVHQv6Ph75N-a6rakkA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Aug 2023 20:22:57 -0400 (EDT)
Date:   Wed, 16 Aug 2023 10:23:07 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in
 pata_falcon.c
In-Reply-To: <20230815223212.13620-1-schmitzmic@gmail.com>
Message-ID: <29964423-b09e-662f-7fcc-1a33e33e2139@linux-m68k.org>
References: <20230815223212.13620-1-schmitzmic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

Thanks for fixing this.

On Wed, 16 Aug 2023, Michael Schmitz wrote:

> With commit 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver
> with pata_falcon and falconide"), the Q40 IDE driver was
> replaced by pata_falcon.c (and the later obsoleted
> falconide.c).

"the latter also made falconide obsolete".

> 
> Both IO and memory resources were defined for the Q40 IDE
> platform device, but definition of the IDE register addresses
> was modeled after the Falcon case, both in use of the memory
> resources and in including register scale and byte vs. word
> offset in the address.
> 
> This was correct for the Falcon case, which does not apply
> any address translation to the register addresses. In the
> Q40 case, all of device base address, byte access offset
> and register scaling is included in the platform specific
> ISA access translation (in asm/mm_io.h).
> 
> As a consequence, such address translation gets applied
> twice, and register addresses are mangled.
> 
> Use the device base address from the platform IO resource,
> and use standard register offsets from that base in order
> to calculate register addresses (the IO address translation
> will then apply the correct ISA window base and scaling).
> 
> Encode PIO_OFFSET into IO port addresses for all registers
> except the data transfer register. Encode the MMIO offset
> there (pata_falcon_data_xfer() directly uses raw IO with
> no address translation).
> 
> Add module parameter 'data_swap' to allow connecting drives

How about "data_swab"? A "data swap" could be anything, and a byte swap 
could be a number of things depending on the size of a word. Here we are 
swapping every pair of bytes, which is called "swab" according to dd's and 
libc's terminology.

> with non-native data byte order. Drives selected by the
> data_swap bit mask will have their user data swapped to host
> byte order, i.e. 'pata_falcon.data_swap=2' will swap all user
> data on drive B, leaving data on drive A in native order.
> 
> Reported-by: William R Sowerbutts <will@sowerbutts.com>
> Closes: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
> Link: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
> Fixes: 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver with pata_falcon and falconide")
> Cc: Finn Thain <fthain@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> 
> ---
> 
> Changes from v2:
> 
> - add driver parameter 'data_swap' as bit mask for drives to swap
> 
> Changes from v1:
> 
> Finn Thain:
> - take care to supply IO address suitable for ioread8/iowrite8
> - use MMIO address for data transfer
> ---
>  drivers/ata/pata_falcon.c | 90 ++++++++++++++++++++++++++++++---------
>  1 file changed, 69 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
> index 996516e64f13..e6038eca39d6 100644
> --- a/drivers/ata/pata_falcon.c
> +++ b/drivers/ata/pata_falcon.c
> @@ -33,6 +33,16 @@
>  #define DRV_NAME "pata_falcon"
>  #define DRV_VERSION "0.1.0"
>  
> +static int pata_falcon_swap_mask = 0; 
> +

Looks like you need to run checkpatch (static variable initialized to 0).

> +module_param_named(data_swap, pata_falcon_swap_mask, int, 0444);
> +MODULE_PARM_DESC(data_swap, "Data byte swap enable/disable (0x1==drive1, 0x2==drive2, default==0)");

The help string does not mention that this is a bit mask (bit 0 = drive 1,
etc.)

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
> +	int dev_id = cmd->device->sdev_target->id;
>  	bool swap = 1;
>  
>  	if (dev->class == ATA_DEV_ATA && cmd &&
>  	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
> -		swap = 0;
> +		swap = priv->swap_data && (priv->swap_mask & 1<<dev_id);

I suggest writing that as priv->swap_mask & BIT(dev_id). (I wonder why 
checkpatch does not ask for whitespace around the << operator...)
