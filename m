Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2082EC5320E
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 19:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354671AbjHQTW0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 15:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354708AbjHQTWM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Aug 2023 15:22:12 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D406C30F3
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 12:22:02 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bf1935f6c2so1208845ad.1
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 12:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692300122; x=1692904922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mDkQnUp2wXrEdu6awXFYvOGW1ULLmTYG0rqQgqNiA+w=;
        b=G7UDDZ1J2a6ck1MCTLPNI6JFIFKb1wDWgVbhgN980NZby1l1PbzlDGSUw5eEalDAe2
         3fYGkrobrCBkpju2snpIbIRBziIT85UbbXTqA7HXWByRPPMmRGLixHFSAZTTAqfXr+V3
         j58B7i0s/XLUw86CxBdBL39UzGg3UG+nqtW/qsKJh4v8m3sZloiQkjRSHnwLODSuVIds
         yTPqp9dkjRESi0WLcfob7epp8nfiG3tT0aYgejKhx4J8zCGd8rX1BptM9iMIxsgo3O1y
         utHdB+UbTnAySyP5tZCo0Ndm3/AQ59ZBCgOhuZOf2j41FVMpho8/75SQWYz8RuIDTQwk
         e6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692300122; x=1692904922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDkQnUp2wXrEdu6awXFYvOGW1ULLmTYG0rqQgqNiA+w=;
        b=PWmb51rJNt9x8Taosf7iQhMSmGuxaTz29yA1yOca6xLP/bK7iGpEK27inOIaaVQdWr
         5DfOULzfF/m1TwwC8revtuuEW6Y3fa36pfklmWzDkH4QUh1CGDWT1bDxYcWjDBH3k46L
         JYcJTrPG+naXL8s2HHq05mgMmpnUOpmQTckljJp/iAYO5by1oxNEXcnDsIWd4ixbTsIE
         iZ0HGnIf4BUc7XaCkHYfpDrhzerjxcd8AdjnTYzGkZsURm6pevxgWNvRLDli6NeKT00e
         +U+4JHXJcCArD8obbU2Zc6V8halXUbELWD4TidmMKFjIRoKuELpv5ErnMfOSU9q9Gf5S
         GJ+Q==
X-Gm-Message-State: AOJu0YzxfzBviqzKD7X4oUFg17LeLJvfJkrDMQKePOfEUQZpTDu5Yp9Z
        5OcMMVCRTcXLRmxlh7FT3dE=
X-Google-Smtp-Source: AGHT+IHPosKULL0xUtMDtYhmt/sf9rI4uSYy5H27sxM6kNG4K6/QKzoFa+eguhYJs6vky181XPcQ9w==
X-Received: by 2002:a17:902:e847:b0:1bc:7e37:e832 with SMTP id t7-20020a170902e84700b001bc7e37e832mr4877166plg.19.1692300122196;
        Thu, 17 Aug 2023 12:22:02 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:e51d:7e20:1b6c:6331? ([2001:df0:0:200c:e51d:7e20:1b6c:6331])
        by smtp.gmail.com with ESMTPSA id o4-20020a170902bcc400b001b88da737c6sm134431pls.54.2023.08.17.12.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 12:22:01 -0700 (PDT)
Message-ID: <8bf4980e-f269-48d2-5b77-3fd6c7270bef@gmail.com>
Date:   Fri, 18 Aug 2023 07:21:56 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org
References: <20230817035001.8400-1-schmitzmic@gmail.com>
 <20230817035001.8400-3-schmitzmic@gmail.com>
 <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org>
 <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 17/08/23 23:47, Geert Uytterhoeven wrote:
> On Thu, Aug 17, 2023 at 12:15 PM Finn Thain <fthain@linux-m68k.org> wrote:
>> On Thu, 17 Aug 2023, Michael Schmitz wrote:
>>> Some users of pata_falcon on Q40 have IDE disks in classic
>>> little endian byte order, whereas legacy disks use native
>>> big-endian byte order as on the Atari Falcon.
>>>
>>> Add module parameter 'data_swab' to allow connecting drives
>>> with non-native data byte order.  Drives selected by the
>>> data_swap bit mask will have their user data byte-swapped to
>>> host byte order, i.e. 'pata_falcon.data_swab=2' will byte-swap
>>> all user data on drive B, leaving data on drive A in native
>>> byte order. On Q40, drives on a second IDE interface may be
>>> added to the bit mask as bits 3 and 4.
>> Many would say that's off by one, as it's popular to number the LSB as bit
>> zero.
>>
>>> Default setting is no byte swapping, i.e. compatibility with
>>> the native Falcon or Q40 operating system disk format.
>>>
>>> Cc: William R Sowerbutts <will@sowerbutts.com>
>>> Cc: Finn Thain <fthain@linux-m68k.org>
>>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>>> --- a/drivers/ata/pata_falcon.c
>>> +++ b/drivers/ata/pata_falcon.c
>>> @@ -165,10 +178,20 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>>>        ap->pio_mask = ATA_PIO4;
>>>        ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
>>>
>>> +     priv = devm_kzalloc(&pdev->dev,
>>> +             sizeof(struct pata_falcon_priv), GFP_KERNEL);
>>> +     if (!priv)
>>> +             return -ENOMEM;
>>> +
>>> +     ap->private_data = priv;
>>> +
>>>        /* N.B. this assumes data_addr will be used for word-sized I/O only */
>>>        ap->ioaddr.data_addr = (void __iomem *)base_mem_res->start;
>>>
>>>        if (base_res) {         /* only Q40 has IO resources */
>>> +             if (pdev->id)
>>> +                     pata_falcon_swap_mask >>= 2;
> Although this driver uses module_platform_driver_probe(), and thus
> does not support unbind/rebind, shifting a global variable is still
> fragile, and depends on probe order (what if the second interface is
> probed first?).
True - I had worried about that but forgot to change it.
>
>>> +             priv->swap_mask = pata_falcon_swap_mask;
> priv->swap_mask = pata_falcon_swap_mask >> (2 * pdev->id);

The Atari platform driver data is registered with pdev->id=-1. That'll 
break here.

(Not sure why that choice of pdev->id, and whether it can be changed to 
0 easily)

Cheers,

     Michael


>
>> --- a/drivers/ata/pata_falcon.c
>> +++ b/drivers/ata/pata_falcon.c
>> @@ -33,6 +33,11 @@
>>   #define DRV_NAME "pata_falcon"
>>   #define DRV_VERSION "0.1.0"
>>
>> +static int pata_falcon_data_swab;
>> +
>> +module_param_named(data_swab, pata_falcon_data_swab, int, 0444);
>> +MODULE_PARM_DESC(data_swab, "Data byte swap enable/disable bitmap (0x1==drive1, 0x2==drive2, 0x4==drive3, 0x8==drive4, default: 0)");
>> +
>>   static const struct scsi_host_template pata_falcon_sht = {
>>          ATA_PIO_SHT(DRV_NAME),
>>   };
>> @@ -50,7 +55,7 @@ static unsigned int pata_falcon_data_xfer(struct ata_queued_cmd *qc,
>>
>>          if (dev->class == ATA_DEV_ATA && cmd &&
>>              !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
>> -               swap = 0;
>> +               swap = (int)ap->private_data & BIT(dev->devno);
> "(uintptr_t)", to make it 64-bit clean.
>
> Yeah, we don't support COMPILE_TEST=y yet for PATA_FALCON.
> BTW, looks like we don't need any of the following anymore:
>
>      #include <asm/setup.h>
>      #include <asm/atarihw.h>
>      #include <asm/atariints.h>
>      #include <asm/atari_stdma.h>
>
> That leaves us with <asm/ide.h>, (which does not exist on most
> architectures, and seems to be mostly obsolete), for the (indirectly
> included) definitions of raw_{in,out}sw_{,swapw}()....
>
>>          /* Transfer multiple of 2 bytes */
>>          if (rw == READ) {
>> @@ -199,6 +204,8 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>>          ap->ioaddr.altstatus_addr       = ctl_base + io_offset;
>>          ap->ioaddr.ctl_addr             = ctl_base + io_offset;
>>
>> +       ap->private_data = (void *)((pata_falcon_data_swab >> (2 * pdev->id)) & 3);
> "(void *)(uintptr_t)", to make it 64-bit clean.
>
>> +
>>          irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>>          if (irq_res && irq_res->start > 0) {
>>                  irq = irq_res->start;
> Gr{oetje,eeting}s,
>
>                          Geert
>
