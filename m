Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3FEC001B0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 07:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240063AbjHPH2R (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 03:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242412AbjHPH1q (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 03:27:46 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B37DC1
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 00:27:44 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-565f58f4db5so217938a12.0
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 00:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692170864; x=1692775664;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoG5YQAOf8ZjbkoIPZF6uot594ROkBP+DeTfXIH3rAU=;
        b=P+a+NyXCpiJAajEg6UR6KYRGTk/U+h3BnBeRsdMrbHg/COGjTE6RPdhyrFLXPwHXog
         hDycaWFcBbzx6HGBhnuSliFQSz2rZhztLRh3l1Bulecz3U02o3sqLwLg1kW6+I8i2Dr5
         GYsf2Cs0rqnmSu3Sem/OOL3e1ODEbY5uAqwCvqp7lhREz8mZuw6fCnJnkPIxyDrHmNuI
         JVZHHNHcPyKt3XAhx4PRV6AoyHImp1AHnz4LtaK22XhyGNIKRBokBDP78wJVjprWB5Ew
         /Hw1sqMMxHAvqbPyqlptRK/gmUNNQncKAC/7u+p38qDAF407sRTT8A+DMkhlGOcDpDEr
         G9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692170864; x=1692775664;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BoG5YQAOf8ZjbkoIPZF6uot594ROkBP+DeTfXIH3rAU=;
        b=bjt/IU9jz9moARoLSlYDkolp/VvlFl3wzpp7xkmxolnRNNZCFlfZs1looDxeTgqLa0
         /iEYY30aC8IG/4szw/bHedKz/KS8J1g1NfP5tldRWHvt3a5YoX/VMVruWABIv10mLYRk
         eBPS4e54gbJvvO9vPT38ytAO3brR6SNjLVjz+MuwgzVfWno75GYzLLcTguFpX8UtTyVV
         WNuOEendagXwHmJpO93wHufYaKsUpNKv1Pnzoy8uBiIu/2NDRUhs1niNOIMlen9jZEOt
         jjiC5WV9noqzqvnFmsgVSeS66Na/b+L5Px8Xqqwsgpk/e/VqjW3S02z8wsH1NPm7yV+V
         R/nw==
X-Gm-Message-State: AOJu0YyoCnTlT/AgVw1gIP6GOgPh3O5sdiaS7ZNcwBksmxtbNKh1ZWr7
        1MyAZVU5jxqf1/+J8Y3fITKjmFbf1Jk=
X-Google-Smtp-Source: AGHT+IFUBhSX6usDGrC59s/PTUWFKh2UJ7fkcxZXHmwle8JXjZpWEhbztYbay7CQELyWqFf7FUjcSg==
X-Received: by 2002:a05:6a20:12d3:b0:13f:7c0e:dc6c with SMTP id v19-20020a056a2012d300b0013f7c0edc6cmr1428273pzg.38.1692170863869;
        Wed, 16 Aug 2023 00:27:43 -0700 (PDT)
Received: from [10.1.1.24] (122-62-141-252-fibre.sparkbb.co.nz. [122.62.141.252])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7820d000000b0068783a2dfdasm10386528pfi.104.2023.08.16.00.27.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Aug 2023 00:27:43 -0700 (PDT)
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in
 pata_falcon.c
To:     Finn Thain <fthain@linux-m68k.org>
References: <20230815223212.13620-1-schmitzmic@gmail.com>
 <29964423-b09e-662f-7fcc-1a33e33e2139@linux-m68k.org>
 <df430e28-9bca-4453-2c81-c50edbbf4f9e@gmail.com>
 <2371f714-e0a2-7c0e-d811-5b7ea7a6684f@linux-m68k.org>
Cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <ee28d9d6-6e5f-2876-4cc2-0edf76f5b7d9@gmail.com>
Date:   Wed, 16 Aug 2023 19:27:37 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <2371f714-e0a2-7c0e-d811-5b7ea7a6684f@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 16.08.2023 um 17:29 schrieb Finn Thain:
>
> On Wed, 16 Aug 2023, Michael Schmitz wrote:
>
>>
>> Right - I also wonder whether using priv->swap_data to skip the bit test in
>> the most likely case (no byte swapping) is actually worth it.
>>
>
> Given it's a platform device that's only ever instantiated once, you could
> just use the module-scope variable rather than device-scope.

The Q40 platform device data specify two possible sets of IO and memory 
resources, that might mean you can have up to two IDE interfaces on Q40. 
Is that correct, Richard?

I'd have to change the probe logic to assign bits 1 and 2 to the first 
interface, and 3 and 4 to the second to make full use of the 
device-scope bitmasks.

>
> BTW, the patch description could state some of the implications for the
> default setting i.e. interoperability with the vendor operating system
> (and IDE disks from Atari Falcon I guess) as opposed to interoperability
> with everyone else.

I'll add that to the commit message.

>
>> I'll split this into bugfix and byte swap parts
>>
>> Where should this go - linux-ide for sure, but is Bartlomiej still the
>> correct maintainer?
>>
>
> The latest MAINTAINERS file says,
>
> $ scripts/get_maintainer.pl -f drivers/ata/pata_falcon.c
> Sergey Shtylyov <s.shtylyov@omp.ru> (reviewer:LIBATA PATA DRIVERS)
> Damien Le Moal <dlemoal@kernel.org> (maintainer:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers))
> linux-ide@vger.kernel.org (open list:LIBATA PATA DRIVERS)
> linux-kernel@vger.kernel.org (open list)
>
> See also c4f9c8bbcc24 and fd86194aca1f.

Thanks.

Cheers,

	Michael


