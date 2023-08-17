Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC44C64EAE
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 21:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355350AbjHQV2j (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 17:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355356AbjHQV2W (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Aug 2023 17:28:22 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D1C8E
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 14:28:21 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso2142055ad.1
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 14:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692307701; x=1692912501;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kz0DrmHdT3rgSwQhzbvWtYa8lzMZlNiuwMkPZvf2cV8=;
        b=lILh0eX+PvCcLhleC/SbXGrbTChQLREAaSAMaAlkVlj5qu3hRsUcV6n+zcAcMTIWXH
         nCtJ9GjG9QLtlGQL/TxMIe74zN4weKirR93lokNKDiETiVENVj+2ZYa+2IOa4szaT4Qj
         OBHY1WWk+gAQjFSkR/ifc7FYXxQG45NWiw8EQGQ8jKFLI1xxEFjDdc0RlwkQmkk4ieB0
         tOMsl7EHB58lXv9gQJsj0o8EcIUhFSzjRsXcAELK2179bPkiKcU6syTjR5lvBIk8Hni0
         sX3NCXPTB6XFObS/tYnrB7ly6n4htfxwbLLOPYI4GM0HwSUfW5UpPZFwzPUppuLChpIg
         vrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692307701; x=1692912501;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz0DrmHdT3rgSwQhzbvWtYa8lzMZlNiuwMkPZvf2cV8=;
        b=HWPhicMXvOUxC09SQDugnRx2QiXRxqY4yNThXDH2E1oElGLoUbeey0bdjpYtSmo3vz
         f0rQEHGAkuu4zn7QdRXQESPAfSjAC5zyqI8HozbgEFFah6bv7znYvaDgIZtT0QGDE4zI
         EKj6Ix4OAizkT01sAx6L2OOLWEfbsr+odogNpPmHMzRMYEDoF+4pmEqy9Ui6SxRzxrAu
         mIRvppGysb5UzHOagcIXUbews+ckMCPV8+TDv2oqZNP+KnAmYE9VMLVBWntZrOAK0Tmp
         bVNY09Z/LFBNDPtIIcvj0xp4qbecLdSUyWKg+340vX5iote3PDpmwPg+y+xousyq9gFZ
         fScw==
X-Gm-Message-State: AOJu0YwLcXZC0yvP4huqk8+GZVm0Dxv3bYvKqMiTtn3WxSJrDPbs59NY
        KycNwyiNQ4mmrgFBY9xZO/4JykTKe8E=
X-Google-Smtp-Source: AGHT+IEKuxfpae7Wfhzs25imqRPv6EvDmk2CqoEjA9ZsIPbj4lKK3rZxnWOWi2axzx7dZLpnkRsMsw==
X-Received: by 2002:a17:902:c3c5:b0:1b8:9b17:f63d with SMTP id j5-20020a170902c3c500b001b89b17f63dmr630041plj.23.1692307701212;
        Thu, 17 Aug 2023 14:28:21 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:e51d:7e20:1b6c:6331? ([2001:df0:0:200c:e51d:7e20:1b6c:6331])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001b89c313185sm220185plf.205.2023.08.17.14.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 14:28:20 -0700 (PDT)
Message-ID: <fd7cd3b9-3f86-feb4-e9ce-aafaea272840@gmail.com>
Date:   Fri, 18 Aug 2023 09:28:15 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
Content-Language: en-US
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org
References: <20230817035001.8400-1-schmitzmic@gmail.com>
 <20230817035001.8400-3-schmitzmic@gmail.com>
 <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org>
 <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com>
 <8bf4980e-f269-48d2-5b77-3fd6c7270bef@gmail.com>
In-Reply-To: <8bf4980e-f269-48d2-5b77-3fd6c7270bef@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 18/08/23 07:21, Michael Schmitz wrote:
>
>>>> +             priv->swap_mask = pata_falcon_swap_mask;
>> priv->swap_mask = pata_falcon_swap_mask >> (2 * pdev->id);
>
> The Atari platform driver data is registered with pdev->id=-1. That'll 
> break here.
Confirmed.
>
> (Not sure why that choice of pdev->id, and whether it can be changed 
> to 0 easily)
Seems to work OK with ID set to 0, so I'll simplify that as you suggest.

Cheers,

     Michael


> Cheers,
>
>     Michael
>
>
>>
>>> --- a/drivers/ata/pata_falcon.c
>>> +++ b/drivers/ata/pata_falcon.c
>>> @@ -33,6 +33,11 @@
>>>   #define DRV_NAME "pata_falcon"
>>>   #define DRV_VERSION "0.1.0"
>>>
>>> +static int pata_falcon_data_swab;
>>> +
>>> +module_param_named(data_swab, pata_falcon_data_swab, int, 0444);
>>> +MODULE_PARM_DESC(data_swab, "Data byte swap enable/disable bitmap 
>>> (0x1==drive1, 0x2==drive2, 0x4==drive3, 0x8==drive4, default: 0)");
>>> +
>>>   static const struct scsi_host_template pata_falcon_sht = {
>>>          ATA_PIO_SHT(DRV_NAME),
>>>   };
>>> @@ -50,7 +55,7 @@ static unsigned int pata_falcon_data_xfer(struct 
>>> ata_queued_cmd *qc,
>>>
>>>          if (dev->class == ATA_DEV_ATA && cmd &&
>>>              !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
>>> -               swap = 0;
>>> +               swap = (int)ap->private_data & BIT(dev->devno);
>> "(uintptr_t)", to make it 64-bit clean.
>>
>> Yeah, we don't support COMPILE_TEST=y yet for PATA_FALCON.
>> BTW, looks like we don't need any of the following anymore:
>>
>>      #include <asm/setup.h>
>>      #include <asm/atarihw.h>
>>      #include <asm/atariints.h>
>>      #include <asm/atari_stdma.h>
>>
>> That leaves us with <asm/ide.h>, (which does not exist on most
>> architectures, and seems to be mostly obsolete), for the (indirectly
>> included) definitions of raw_{in,out}sw_{,swapw}()....
>>
>>>          /* Transfer multiple of 2 bytes */
>>>          if (rw == READ) {
>>> @@ -199,6 +204,8 @@ static int __init pata_falcon_init_one(struct 
>>> platform_device *pdev)
>>>          ap->ioaddr.altstatus_addr       = ctl_base + io_offset;
>>>          ap->ioaddr.ctl_addr             = ctl_base + io_offset;
>>>
>>> +       ap->private_data = (void *)((pata_falcon_data_swab >> (2 * 
>>> pdev->id)) & 3);
>> "(void *)(uintptr_t)", to make it 64-bit clean.
>>
>>> +
>>>          irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>>>          if (irq_res && irq_res->start > 0) {
>>>                  irq = irq_res->start;
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
