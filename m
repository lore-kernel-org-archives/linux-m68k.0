Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7841AC41513
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 19:15:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbjHQTP1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 15:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354672AbjHQTPG (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Aug 2023 15:15:06 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D3730F7
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 12:15:04 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bb84194bf3so1125265ad.3
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692299704; x=1692904504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Te6nvrbTLbzwQipAo4YzDoHRvYeCS/ooWJLHNEUVzjM=;
        b=cGoD1QoxgylxbgDac62ukVsxweURngEZrcnKSUJ8Vz/eQ0MkOE1P5DN5iZZd153upD
         nhIydHc48LIuBDW91E2A35rMM8RuNV2qeTT6LQn+OM/1fBxCnwN+mLiDW44sV/HDmH6U
         kcNWTJKMwgB5VQVOKU91+qceqM0h6Dm8WLJExb+73jwi/SuxrjphUXSxbQH+6ptQUTbY
         1B7V5SS/kgUOKXdvmpNyoFT7I/1uUJdbYHQnrZz/28eSvTiGk9XHgwxGiSJG8jN4Ds0j
         cYHwEMWbT6mTrjPqIhailJRfiyQR3SwC0lw1g6u7z+2chzY/8lNVohGAeuV0pYdEPyIs
         ANSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692299704; x=1692904504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Te6nvrbTLbzwQipAo4YzDoHRvYeCS/ooWJLHNEUVzjM=;
        b=blGXXxsET6fw4ZPYiRNrnoSzEZFlLAZzbbXdNNzG9glkCplG4QuZpp3FMwxUP7R5bz
         KzSLMzrojVZRc0bSyw+wmQjelXTEO+aj29QjToIq/UW7gNoDdFMcp1dUwGxpQUaEQIM3
         QgFFs7eql6Ty3xje4HTp8P/+NS3M2COmhVba5ccOvke69tzmP7Uc5Cj37woL55C4hatD
         s3GY+ePPVQlGP2qZ7S4zmSb2NDYVZm+5MYWjfYzhVdmXeU26+gzV+hNs6MYJGgctxw0Y
         b8m/Fr7gFLPzpPbIK/0RkaKQv1brPtmoeKOdi2rLVoIkJmD4pye8/NQO3v8JwTfDYwNL
         jANw==
X-Gm-Message-State: AOJu0Yys69Iws6qmkFiriRtQ028ebqZDrz7g+Hnx5FcL9wsMuiHxfCVn
        qv+atW3SutGidDfuIdTje3iIYOmj3I8=
X-Google-Smtp-Source: AGHT+IFc33YraS/9KU7DCjmAuWijUrvK98XH+yu7AsBoU/d4MZOxd0BRre88TqE0x0MXhx/VbUZngA==
X-Received: by 2002:a17:902:ef89:b0:1be:e8d4:19ae with SMTP id iz9-20020a170902ef8900b001bee8d419aemr295073plb.36.1692299703732;
        Thu, 17 Aug 2023 12:15:03 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:e51d:7e20:1b6c:6331? ([2001:df0:0:200c:e51d:7e20:1b6c:6331])
        by smtp.gmail.com with ESMTPSA id m14-20020a170902db0e00b001bdd7579b5dsm109079plx.240.2023.08.17.12.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 12:15:03 -0700 (PDT)
Message-ID: <46d8fe18-5d82-6dcf-3be7-ae78642ce3af@gmail.com>
Date:   Fri, 18 Aug 2023 07:14:56 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
References: <20230817035001.8400-1-schmitzmic@gmail.com>
 <20230817035001.8400-3-schmitzmic@gmail.com>
 <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn.

On 17/08/23 22:15, Finn Thain wrote:
> On Thu, 17 Aug 2023, Michael Schmitz wrote:
>
>> Some users of pata_falcon on Q40 have IDE disks in classic
>> little endian byte order, whereas legacy disks use native
>> big-endian byte order as on the Atari Falcon.
>>
>> Add module parameter 'data_swab' to allow connecting drives
>> with non-native data byte order.  Drives selected by the
>> data_swap bit mask will have their user data byte-swapped to
>> host byte order, i.e. 'pata_falcon.data_swab=2' will byte-swap
>> all user data on drive B, leaving data on drive A in native
>> byte order. On Q40, drives on a second IDE interface may be
>> added to the bit mask as bits 3 and 4.
> Many would say that's off by one, as it's popular to number the LSB as bit
> zero.

Old FORTRAN programmers never die. They just cause havoc in C.

I'll fix that.

>
>> Default setting is no byte swapping, i.e. compatibility with
>> the native Falcon or Q40 operating system disk format.
>>
>> Cc: William R Sowerbutts <will@sowerbutts.com>
>> Cc: Finn Thain <fthain@linux-m68k.org>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>>
>> ---
>>
>> Changes since v3:
>>
>> - split off this byte swap handling into separate patch
>>
>> - add hint regarding third and fourth drive on Q40
>>
>> Finn Thain:
>> - rename module parameter to 'data_swab' to better reflect its use
>>
>> William Sowerbutts:
>> - correct IDE drive number used in data swap conditional
>> ---
>>   drivers/ata/pata_falcon.c | 29 ++++++++++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
>> index 346259e3bbc8..cec3c3a6eed9 100644
>> --- a/drivers/ata/pata_falcon.c
>> +++ b/drivers/ata/pata_falcon.c
>> @@ -33,6 +33,16 @@
>>   #define DRV_NAME "pata_falcon"
>>   #define DRV_VERSION "0.1.0"
>>   
>> +static int pata_falcon_swap_mask;
>> +
>> +module_param_named(data_swab, pata_falcon_swap_mask, int, 0444);
>> +MODULE_PARM_DESC(data_swab, "Data byte swap enable/disable bitmap (0x1==drive1, 0x2==drive2, 0x4==drive3, 0x8==drive4, default==0)");
>> +
>> +struct pata_falcon_priv {
>> +	unsigned int swap_mask;
>> +	bool swap_data;
>> +};
>> +
>>   static const struct scsi_host_template pata_falcon_sht = {
>>   	ATA_PIO_SHT(DRV_NAME),
>>   };
>> @@ -44,13 +54,15 @@ static unsigned int pata_falcon_data_xfer(struct ata_queued_cmd *qc,
>>   	struct ata_device *dev = qc->dev;
>>   	struct ata_port *ap = dev->link->ap;
>>   	void __iomem *data_addr = ap->ioaddr.data_addr;
>> +	struct pata_falcon_priv *priv = ap->private_data;
>>   	unsigned int words = buflen >> 1;
>>   	struct scsi_cmnd *cmd = qc->scsicmd;
>> +	int dev_id = dev->devno;
>>   	bool swap = 1;
>>   
>>   	if (dev->class == ATA_DEV_ATA && cmd &&
>>   	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
>> -		swap = 0;
>> +		swap = priv->swap_data && (priv->swap_mask & BIT(dev_id));
>>   
>>   	/* Transfer multiple of 2 bytes */
>>   	if (rw == READ) {
>> @@ -123,6 +135,7 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>>   	struct resource *base_res, *ctl_res, *irq_res;
>>   	struct ata_host *host;
>>   	struct ata_port *ap;
>> +	struct pata_falcon_priv *priv;
>>   	void __iomem *base, *ctl_base;
>>   	int irq = 0, io_offset = 1, reg_scale = 4;
>>   
>> @@ -165,10 +178,20 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>>   	ap->pio_mask = ATA_PIO4;
>>   	ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
>>   
>> +	priv = devm_kzalloc(&pdev->dev,
>> +		sizeof(struct pata_falcon_priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	ap->private_data = priv;
>> +
>>   	/* N.B. this assumes data_addr will be used for word-sized I/O only */
>>   	ap->ioaddr.data_addr = (void __iomem *)base_mem_res->start;
>>   
>>   	if (base_res) {		/* only Q40 has IO resources */
>> +		if (pdev->id)
>> +			pata_falcon_swap_mask >>= 2;
>> +		priv->swap_mask = pata_falcon_swap_mask;
>>   		io_offset = 0x10000;
>>   		reg_scale = 1;
>>   		base = (void __iomem *)base_res->start;
>> @@ -178,6 +201,7 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>>   			      &base_res->start,
>>   			      &ctl_res->start);
>>   	} else {
>> +		priv->swap_mask = pata_falcon_swap_mask;
>>   		base = (void __iomem *)base_mem_res->start;
>>   		ctl_base = (void __iomem *)ctl_mem_res->start;
>>   
>> @@ -199,6 +223,9 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>>   	ap->ioaddr.altstatus_addr	= ctl_base + io_offset;
>>   	ap->ioaddr.ctl_addr		= ctl_base + io_offset;
>>   
>> +	if (priv->swap_mask)
>> +		priv->swap_data = 1;
>> +
>>   	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>>   	if (irq_res && irq_res->start > 0) {
>>   		irq = irq_res->start;
>>
> I think the patch could be simplified by dropping the dynamic memory
> allocation...

If using a private data pointer field for an int bitmask is acceptable 
use ...

I'll see if I can find any performance impact from the additional 
swap_data flag. If there's none, your solution may be cleaner.

Cheers,

     Michael


>
> diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
> index 346259e3bbc8..d057f11ec02d 100644
> --- a/drivers/ata/pata_falcon.c
> +++ b/drivers/ata/pata_falcon.c
> @@ -33,6 +33,11 @@
>   #define DRV_NAME "pata_falcon"
>   #define DRV_VERSION "0.1.0"
>   
> +static int pata_falcon_data_swab;
> +
> +module_param_named(data_swab, pata_falcon_data_swab, int, 0444);
> +MODULE_PARM_DESC(data_swab, "Data byte swap enable/disable bitmap (0x1==drive1, 0x2==drive2, 0x4==drive3, 0x8==drive4, default: 0)");
> +
>   static const struct scsi_host_template pata_falcon_sht = {
>   	ATA_PIO_SHT(DRV_NAME),
>   };
> @@ -50,7 +55,7 @@ static unsigned int pata_falcon_data_xfer(struct ata_queued_cmd *qc,
>   
>   	if (dev->class == ATA_DEV_ATA && cmd &&
>   	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
> -		swap = 0;
> +		swap = (int)ap->private_data & BIT(dev->devno);
>   
>   	/* Transfer multiple of 2 bytes */
>   	if (rw == READ) {
> @@ -199,6 +204,8 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>   	ap->ioaddr.altstatus_addr	= ctl_base + io_offset;
>   	ap->ioaddr.ctl_addr		= ctl_base + io_offset;
>   
> +	ap->private_data = (void *)((pata_falcon_data_swab >> (2 * pdev->id)) & 3);
> +
>   	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>   	if (irq_res && irq_res->start > 0) {
>   		irq = irq_res->start;
