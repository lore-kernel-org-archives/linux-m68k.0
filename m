Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC070C001E0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 05:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241803AbjHPFAA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 01:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241802AbjHPE7f (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 00:59:35 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4A410DC
        for <linux-m68k@vger.kernel.org>; Tue, 15 Aug 2023 21:59:34 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bdf7086ae5so12768185ad.0
        for <linux-m68k@vger.kernel.org>; Tue, 15 Aug 2023 21:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692161974; x=1692766774;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlerldW6Zr9nxcUNCXs+rzLVSDvnXOGBa32L9NrkuOU=;
        b=VHDVLq5IqdrZcWyfJf3vlGZ57+qLVPBEciw4jtNrvZz/ZCWjfegRODX/1VObEBrxNk
         ko1hIJ71DNzXx7uU7LXdDjqzXZe20um0fTX+XSLYAZvCXfdg/zmtkLaaBMPczlm+W5u6
         tv47y/y2G+T6t6fddYeDAui8+NKY5oBRkOhdOEdUBi0BQZK3l554o5fwc3RyU3SDj3tY
         p48tvqscK2FirlgI5kqqXB5tHgmo2fe4spY6tiRvrSEcjUF942Uj2b9ZI39WaY3xUbMy
         aWSFe4va5m9zXL6/t/s09gj2yN/z7wA0qUsbaVrrog5NqKYhvxHpACju+VlKnKJ8WH29
         N8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692161974; x=1692766774;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NlerldW6Zr9nxcUNCXs+rzLVSDvnXOGBa32L9NrkuOU=;
        b=hFjdwdNpJJPUjALc9WOuNs56JcRed9ONGRCigT9oVZWtGO6WNm2LIPHT4O4zKx7Oe6
         QhBdKv0gKN+9do7hFjwkZqpcvNoI2j1JjfB7UJ0syFGk8fLknYuGu38IXTCNQ0ni+3mR
         hSA51hWrZ+AKvnpRobFSy+KxGO0pUCyj6HXL4HBRYf4ReNJBT7NCx0rA1pV46NXpneaZ
         IAvzdutCZrOmQU9h+RZGtpPk6JDWjOUUd0+pPWNkxVSA2SxkqTMxYhHSkTzWn5ylN+Nt
         9/LJwKgW2AZJt/JYrbauTLdjbrTx+voozrohncmm7E+dluw1cjwEHVUfqhmcc6hEf6ey
         mCTA==
X-Gm-Message-State: AOJu0YyBWG44VqlQwcse+0R126E5zWl3WZ+OsgZgPsVb8AKMYnstZVWh
        b2rHMascF3eU7pdtD6CWOXG+m+8QYOo=
X-Google-Smtp-Source: AGHT+IHpHq+fJqwyUJfCacYqyUoy1tiBVJZhAvocIS55Wz72ltfdHl1AWNWJ7xmEZAPJpWJlqvBNRg==
X-Received: by 2002:a17:902:e5cc:b0:1bc:5197:73c5 with SMTP id u12-20020a170902e5cc00b001bc519773c5mr1011550plf.54.1692161973965;
        Tue, 15 Aug 2023 21:59:33 -0700 (PDT)
Received: from [10.1.1.24] (122-62-141-252-fibre.sparkbb.co.nz. [122.62.141.252])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e5cf00b001adf6b21c77sm11973065plf.107.2023.08.15.21.59.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Aug 2023 21:59:33 -0700 (PDT)
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in
 pata_falcon.c
To:     Finn Thain <fthain@linux-m68k.org>
References: <20230815223212.13620-1-schmitzmic@gmail.com>
 <29964423-b09e-662f-7fcc-1a33e33e2139@linux-m68k.org>
Cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <df430e28-9bca-4453-2c81-c50edbbf4f9e@gmail.com>
Date:   Wed, 16 Aug 2023 16:59:27 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <29964423-b09e-662f-7fcc-1a33e33e2139@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

thanks for your review!

Am 16.08.2023 um 12:23 schrieb Finn Thain:
> Hi Michael,
>
> Thanks for fixing this.
>
> On Wed, 16 Aug 2023, Michael Schmitz wrote:
>
>> With commit 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver
>> with pata_falcon and falconide"), the Q40 IDE driver was
>> replaced by pata_falcon.c (and the later obsoleted
>> falconide.c).
>
> "the latter also made falconide obsolete".

I actually meant 'later' - the patch changed both falconide.c and 
pata_falcon.c, and falconide.c was later obsoleted.

That's now history, may as well drop mention of falconide.c!

>>
>> Both IO and memory resources were defined for the Q40 IDE
>> platform device, but definition of the IDE register addresses
>> was modeled after the Falcon case, both in use of the memory
>> resources and in including register scale and byte vs. word
>> offset in the address.
>>
>> This was correct for the Falcon case, which does not apply
>> any address translation to the register addresses. In the
>> Q40 case, all of device base address, byte access offset
>> and register scaling is included in the platform specific
>> ISA access translation (in asm/mm_io.h).
>>
>> As a consequence, such address translation gets applied
>> twice, and register addresses are mangled.
>>
>> Use the device base address from the platform IO resource,
>> and use standard register offsets from that base in order
>> to calculate register addresses (the IO address translation
>> will then apply the correct ISA window base and scaling).
>>
>> Encode PIO_OFFSET into IO port addresses for all registers
>> except the data transfer register. Encode the MMIO offset
>> there (pata_falcon_data_xfer() directly uses raw IO with
>> no address translation).
>>
>> Add module parameter 'data_swap' to allow connecting drives
>
> How about "data_swab"? A "data swap" could be anything, and a byte swap
> could be a number of things depending on the size of a word. Here we are
> swapping every pair of bytes, which is called "swab" according to dd's and
> libc's terminology.

Good point. I'll change that.

>> with non-native data byte order. Drives selected by the
>> data_swap bit mask will have their user data swapped to host
>> byte order, i.e. 'pata_falcon.data_swap=2' will swap all user
>> data on drive B, leaving data on drive A in native order.
>>
>> Reported-by: William R Sowerbutts <will@sowerbutts.com>
>> Closes: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
>> Link: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
>> Fixes: 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver with pata_falcon and falconide")
>> Cc: Finn Thain <fthain@linux-m68k.org>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>>
>> ---
>>
>> Changes from v2:
>>
>> - add driver parameter 'data_swap' as bit mask for drives to swap
>>
>> Changes from v1:
>>
>> Finn Thain:
>> - take care to supply IO address suitable for ioread8/iowrite8
>> - use MMIO address for data transfer
>> ---
>>  drivers/ata/pata_falcon.c | 90 ++++++++++++++++++++++++++++++---------
>>  1 file changed, 69 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
>> index 996516e64f13..e6038eca39d6 100644
>> --- a/drivers/ata/pata_falcon.c
>> +++ b/drivers/ata/pata_falcon.c
>> @@ -33,6 +33,16 @@
>>  #define DRV_NAME "pata_falcon"
>>  #define DRV_VERSION "0.1.0"
>>
>> +static int pata_falcon_swap_mask = 0;
>> +
>
> Looks like you need to run checkpatch (static variable initialized to 0).

Forgot to drop that after tests before I got the parameter to work.

>
>> +module_param_named(data_swap, pata_falcon_swap_mask, int, 0444);
>> +MODULE_PARM_DESC(data_swap, "Data byte swap enable/disable (0x1==drive1, 0x2==drive2, default==0)");
>
> The help string does not mention that this is a bit mask (bit 0 = drive 1,

Right -I'll add 'bit mask' there.

> etc.)
>
>> +
>> +struct pata_falcon_priv {
>> +	unsigned int swap_mask;
>> +	bool swap_data;
>> +};
>> +
>>  static const struct scsi_host_template pata_falcon_sht = {
>>  	ATA_PIO_SHT(DRV_NAME),
>>  };
>> @@ -44,13 +54,15 @@ static unsigned int pata_falcon_data_xfer(struct ata_queued_cmd *qc,
>>  	struct ata_device *dev = qc->dev;
>>  	struct ata_port *ap = dev->link->ap;
>>  	void __iomem *data_addr = ap->ioaddr.data_addr;
>> +	struct pata_falcon_priv *priv = ap->private_data;
>>  	unsigned int words = buflen >> 1;
>>  	struct scsi_cmnd *cmd = qc->scsicmd;
>> +	int dev_id = cmd->device->sdev_target->id;
>>  	bool swap = 1;
>>
>>  	if (dev->class == ATA_DEV_ATA && cmd &&
>>  	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
>> -		swap = 0;
>> +		swap = priv->swap_data && (priv->swap_mask & 1<<dev_id);
>
> I suggest writing that as priv->swap_mask & BIT(dev_id). (I wonder why
> checkpatch does not ask for whitespace around the << operator...)

Right - I also wonder whether using priv->swap_data to skip the bit test 
in the most likely case (no byte swapping) is actually worth it.

I'll split this into bugfix and byte swap parts

Where should this go - linux-ide for sure, but is Bartlomiej still the 
correct maintainer?

Cheers,

	Michael
