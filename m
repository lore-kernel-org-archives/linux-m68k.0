Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C279DC10F19
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 19:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345912AbjHPTkM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 15:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345907AbjHPTkJ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 15:40:09 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A85AF2710
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 12:40:07 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bc5acc627dso47240905ad.1
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 12:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692214807; x=1692819607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zTUEzwRXDbCLvAA6XIEptw4OejExzarlWVByHaAUJfQ=;
        b=X3S6mgzY3AEmnwQaRTh0d6FyjE+RRducOUBClFBExsyYkohGw8TUoTlPMYCWunpPwZ
         QGXxnX7ab7qKXFhv5QdsnkFH4YBWhVbt3aKwyG2hcthvKSQ5fREOmyV+VabpcHjcIkmy
         lyNPH0YA0/fgYB8NNrBphWKT0rm46LUzwey/6AhWNIXWdYlvdU7eMsaFnBRKe66FBy+L
         3JHLCQiLKfdQdmvS4Eeitv66tTVidJ4aX8SsVmw88i4uHGXenQ+Lf1IdPeCHid0KCGCM
         ibRjAsVI9is7uC1ciXDx9NE5pKpSNuL6m4vAy6w3B4Q/qd9ufKlsYn37Tr3TAWbc36zj
         kRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692214807; x=1692819607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTUEzwRXDbCLvAA6XIEptw4OejExzarlWVByHaAUJfQ=;
        b=RoIqf3WqG7OW0pc+V2U5KegO3mZQK1k++OyMNn+Jo9U2TKNI3XQCkUpli6oqTuz9aX
         ZCOeQeUp+zrHaNdRbFLTdTjgVMNSCkisnxyUQLv5JDyUjyU3yDR+ulwUIad/k0fl+wFg
         /IHGNWynPjhFDoPytJCFnnr1GHXaeaswxC1z/wtpkngLbu2wspA8FPkta4N9vu1J7SB6
         IX21ttgNpVNvMLjWz6Z7FlCSqr4M75g0u/SQuJxGftOYPUvvAw8DAOzNzANGgPUW84AH
         objt5y1On6EprLqonWfDmWJFOJ2Hm/QZ4VQmb+HC6sFt5MfaGaVhRIxtVkZKe6cnEBdn
         71/w==
X-Gm-Message-State: AOJu0YyHp2ezoQENWwKDwPZQQ7sKuR3bBnudEO9lbONBFyA3Qv9cyEaP
        qx0JKoIlrIuN0MbUlyVAGCctT7/8PGs=
X-Google-Smtp-Source: AGHT+IErVIcBRx3eZ7Gylf1BINXeWfp4Zsg0OB5v49E95wBgWqNOjeAMMXf3pRJxiTLvtjIAKeEM4Q==
X-Received: by 2002:a17:902:e852:b0:1bb:bc6d:45a with SMTP id t18-20020a170902e85200b001bbbc6d045amr3411029plg.28.1692214806890;
        Wed, 16 Aug 2023 12:40:06 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:b0b4:608:ab08:6ead? ([2001:df0:0:200c:b0b4:608:ab08:6ead])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902d21200b001bde65894d5sm6084780ply.109.2023.08.16.12.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 12:40:06 -0700 (PDT)
Message-ID: <fb17ace4-b808-43c1-f7b2-97c2fcca0a4a@gmail.com>
Date:   Thu, 17 Aug 2023 07:40:00 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in
 pata_falcon.c
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        Finn Thain <fthain@linux-m68k.org>
References: <20230815223212.13620-1-schmitzmic@gmail.com>
 <CAMuHMdVELQnd9RFvv3jApUpm9jd2vMYqJhZxVNZ4soBnYF_odA@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVELQnd9RFvv3jApUpm9jd2vMYqJhZxVNZ4soBnYF_odA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

thanks for reviewing this!

On 16/08/23 20:07, Geert Uytterhoeven wrote:
>
>> -       ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
>> -                     (unsigned long)base_mem_res->start,
>> -                     (unsigned long)ctl_mem_res->start);
>> +       priv = devm_kzalloc(&pdev->dev,
>> +               sizeof(struct pata_falcon_priv), GFP_KERNEL);
>> +
> Please drop this blank line.
OK/
>
>> +       if (!priv)
>> +               return -ENOMEM;
>> +
>> +       ap->private_data = priv;
>> +
>> +       priv->swap_mask = pata_falcon_swap_mask;
>> +       if (priv->swap_mask)
>> +               priv->swap_data = 1;
>> +
>> +       if (MACH_IS_Q40) {
> Please do not use MACH_IS_xx() checks in a modern platform driver.
> The proper way is to either pass parameters through platform_data, or
> to use a different platform driver name to match against (i.e. populate
> platform_driver.id_table with an array containing name/driver_data
> pairs).
>
> However, here you can just use the presence or absence
> of base_res and ctl_res (which were unused before) to distinguish.
Will do.
>
>> +               base = (void __iomem *)base_mem_res->start;
> Any specific reason this is still using base_mem_res and not
> base_res?
Yes - data transfers don't use ioread8()/iowrite8() and need neither IO 
port token added nor ISA address translation applied. We can use the 
final address (as would be calculated by the ISA address translation) 
directly.
>
>> +               ap->ioaddr.data_addr            = base + 0;
> This is the same on Q40 and Falcon, so it can be factored out.

Right - needs a slight rewrite because I overwrite 'base' in the next 
line but since most of the other register definitions can be 
generalized, it'll look much cleaner.

>
>> +               base = (void __iomem *)base_res->start;
>> +               ap->ioaddr.error_addr           = base + 0x10000 + 1;
>> +               ap->ioaddr.feature_addr         = base + 0x10000 + 1;
>> +               ap->ioaddr.nsect_addr           = base + 0x10000 + 2;
>> +               ap->ioaddr.lbal_addr            = base + 0x10000 + 3;
>> +               ap->ioaddr.lbam_addr            = base + 0x10000 + 4;
>> +               ap->ioaddr.lbah_addr            = base + 0x10000 + 5;
>> +               ap->ioaddr.device_addr          = base + 0x10000 + 6;
>> +               ap->ioaddr.status_addr          = base + 0x10000 + 7;
>> +               ap->ioaddr.command_addr         = base + 0x10000 + 7;
> Compared to Falcon, different base, banksize, and regsize, so e.g.
>
>      ap->ioaddr.error_addr = base + 1 * banksize + 1 * regsize;

Yes, we could phrase it that way.

The 0x10000 isn't a bank size but the IO port token that's stripped in 
ioread8()/iowrite8() before the remainder is passed to inb()/outb() 
where address translation happens.

The alternative would be to hide this in our ioport_map() (for the Q40 
case only). Or use CONFIG_HAS_IOPORT_MAP and the generic port mapping 
code. Meant to try that, but William now reports this works OK (for Q40).

>> +
>> +               base = (void __iomem *)ctl_res->start;
>> +               ap->ioaddr.altstatus_addr       = base + 0x10000;
>> +               ap->ioaddr.ctl_addr             = base + 0x10000;
>> +
>> +               ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
>> +                             (unsigned long)base_res->start,
>> +                             (unsigned long)ctl_res->start);
> %pa and e.g. &base_res->start to avoid the cast.
OK.
>
>> +       } else {
>> +               base = (void __iomem *)base_mem_res->start;
>> +               /* N.B. this assumes data_addr will be used for word-sized I/O only */
>> +               ap->ioaddr.data_addr            = base + 0 + 0 * 4;
>> +               ap->ioaddr.error_addr           = base + 1 + 1 * 4;
>> +               ap->ioaddr.feature_addr         = base + 1 + 1 * 4;
>> +               ap->ioaddr.nsect_addr           = base + 1 + 2 * 4;
>> +               ap->ioaddr.lbal_addr            = base + 1 + 3 * 4;
>> +               ap->ioaddr.lbam_addr            = base + 1 + 4 * 4;
>> +               ap->ioaddr.lbah_addr            = base + 1 + 5 * 4;
>> +               ap->ioaddr.device_addr          = base + 1 + 6 * 4;
>> +               ap->ioaddr.status_addr          = base + 1 + 7 * 4;
>> +               ap->ioaddr.command_addr         = base + 1 + 7 * 4;
>> +
>> +               base = (void __iomem *)ctl_mem_res->start;
>> +               ap->ioaddr.altstatus_addr       = base + 1;
>> +               ap->ioaddr.ctl_addr             = base + 1;
>> +
>> +               ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
>> +                             (unsigned long)base_mem_res->start,
>> +                             (unsigned long)ctl_mem_res->start);
>> +       }
>>
>>          irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>>          if (irq_res && irq_res->start > 0) {

We still need to verify that CONFIG_HAS_IOPORT_MAP does not interfere 
with multiplatform kernels or Atari configuration, but for Q40 users 
with non-native disk byte order, pata_legacy might be the easier option,

Cheers,

     Michael


> Gr{oetje,eeting}s,
>
>                          Geert
>
