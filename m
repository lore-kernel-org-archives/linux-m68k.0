Return-Path: <SRS0=riIg=B6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13EDC433DF
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Aug 2020 22:29:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A323C207DF
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Aug 2020 22:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uJGsaKta"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgHTW3X (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Aug 2020 18:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbgHTW3U (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Aug 2020 18:29:20 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46D3C061385
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Aug 2020 15:29:19 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id d4so61159pjx.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Aug 2020 15:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Qiz86v5l/BmZrwwWsph8kyJM1hacLVm452BNIq0ED/I=;
        b=uJGsaKtabSuemTHnO2NSSX52+5qKhBpjPkMTjqmPzHdB9y49XVYF6sxgidv3a3vE7a
         RS8CC109cGEVye394MkNRkTMVRDogfg7mEM4s6h1ogQKoKkckaOcqz3Fuy/qGapcwRsi
         wwsQh/teBVVczKq1U945ms7FMDj2HqrDiZRNhDkOOaif5b9Pi7Zfh0wJgR0Wipz8vMKw
         N391WwW2abVq2+0A2GCZyRKQjJoyDXVCmSvitp2NTtfe3O8JCRQTqNsHpcJNt6aHsKSI
         bEa/25kW+nmClnEgprD9LwFHqJIcHmAAc9srdVGBvhOGmQYjRGG93teV7I6ulZd1E3AD
         sKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Qiz86v5l/BmZrwwWsph8kyJM1hacLVm452BNIq0ED/I=;
        b=FsSSF92e0p88y5W85Dcxov7S7txfCrtJCScFNmzb0LqFlCo2bNrI2KdRpCE/gfSlQ9
         JlDR/VkYGRV9SHqihT2rB7qekL+WvjwTdwCbNmTiVaS16kaRGZERiXmSeW5HoQK7Ag/2
         15ZmLgI/mG6glU0ynFptw+iby/vW3J+Wl4JcdPuMTKyiArBDJI97IVGge4VI5l2ZtdUJ
         NpIC0rqNW21yl1tL5OIU30q9wGac95UKHUZ7fvrhwjY6vmz5tgEj6+VtmLwSqI+0nKov
         /NTuHB/lb4J/7nCrs1WMndnqk9goJ+cnaKMn3jqHHVjbtw55zOvMCdzZi+Bc+u45gCwT
         QNbw==
X-Gm-Message-State: AOAM5309gZUmkvkMeE3EBgesODvvZByaD+ShTrHiZiMJDRMVUMvrlaZf
        w0JDMGQhQoZOdwNugaber0g=
X-Google-Smtp-Source: ABdhPJz4c7URMJbjsDQqI1P3F5GriRlMZ7Bj5ewK1DoYxOxIGv7AB3LNPeWK4se8XNYxZDfRJqvIww==
X-Received: by 2002:a17:90a:a401:: with SMTP id y1mr12401pjp.199.1597962559167;
        Thu, 20 Aug 2020 15:29:19 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:c83a:1a0e:7c2f:65bb? ([2001:df0:0:200c:c83a:1a0e:7c2f:65bb])
        by smtp.gmail.com with ESMTPSA id 207sm72881pfz.203.2020.08.20.15.29.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 15:29:18 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
To:     Mike Rapoport <rppt@kernel.org>, linux-m68k@lists.linux-m68k.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Mike Rapoport <rppt@linux.ibm.com>
References: <20200718162651.26538-1-rppt@kernel.org>
 <20200820160334.GA752365@kernel.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5d16d058-a544-5f69-07e9-59da5ffafaf2@gmail.com>
Date:   Fri, 21 Aug 2020 10:29:13 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200820160334.GA752365@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

Sorry, I had seen those but didn't get around to test in time.

Applying your patch series to Geert's v5.9-rc1, I get this:

>   CC      kernel/bounds.s
>   CC      arch/m68k/kernel/asm-offsets.s
> In file included from ./include/linux/mmzone.h:19,
>                  from ./include/linux/topology.h:33,
>                  from ./include/linux/irq.h:19,
>                  from ./include/asm-generic/hardirq.h:13,
>                  from ./arch/m68k/include/generated/asm/hardirq.h:1,
>                  from ./include/linux/hardirq.h:10,
>                  from ./include/linux/interrupt.h:11,
>                  from ./include/linux/kernel_stat.h:9,
>                  from arch/m68k/kernel/asm-offsets.c:16:
> ./include/linux/page-flags-layout.h:28:10: fatal error: 
> asm/sparsemem.h: No such file or directory
>  #include <asm/sparsemem.h>
>           ^~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [arch/m68k/kernel/asm-offsets.s] Error 1
> make[1]: *** [prepare0] Error 2
> make: *** [__sub-make] Error 2

Your patch announcement blurb hat sparsemem.h listed among the changed 
files, but none of the three patches stats reference that file. Am I 
missing a prerequisite here?

Cheers,

     Michael


On 21/08/20 4:03 AM, Mike Rapoport wrote:
> Gentle ping :)
>
> On Sat, Jul 18, 2020 at 07:26:48PM +0300, Mike Rapoport wrote:
>> From: Mike Rapoport <rppt@linux.ibm.com>
>>
>> Hi,
>>
>> It took me a while to get back to this, but better late than never :)
>>
>> These patches replace DISCONTIGMEM with SPARSEMEM on m68k for systems with
>> !SINGLE_MEMORY_CHUNK set.
>>
>> With SPARSEMEM there is a single node for the entire physical memory and to
>> cope with holes in the physical address space it is divided to sections of
>> several megabytes.
>>
>> Each section has it's own memory map which size depends on actual populated
>> memory.
>>
>> The section size of 16M was chosen pretty much arbitrarily as I couldn't
>> find specs for systems with e.g. Zorro memory extensions.
>> Yet, we cannot use smaller sections and still be able to address the entire
>> 4G of the physical memory because the section number is encoded in the page
>> flags and there are only 8 bits available.
>>
>> For systems with several small memory chunks and with small (several megs)
>> holes between them, 16M section size would cause wasted parts in the memory
>> map and it is desirable to allow smaller section size at the expense of
>> limiting the addressable memory.
>>
>> I've hesitated between adding Kconfig option as Finn suggested [1] and
>> other options like SPARSE_VMEMMAP or ARCH_HAS_HOLES_MEMORYMODEL. In the
>> end, I think Kconfig is the simplest one from the implementation point of
>> view and would work fine for people that run mainline kernels on vintage
>> hardware.
>>
>> For the systems with ST-RAM and FastRAM, the switch to SPARSEMEM does not
>> change the limitation that if the kernel is loaded into the FastRam the
>> ST-RAM remains unmapped. It only ensures that if the kernel is loaded in
>> ST-RAM, the memory map is allocated from high physical addresses and then
>> atari/stram.c is able to reserve the frame buffer memory. If the kernel is
>> loaded to FastRAM, the ST-RAM remains unmapped as with DISCONTIGMEM and the
>> atari/stram.c maps it as IOMEM.
>>
>> [1] https://marc.info/?l=linux-m68k&m=156309170500921&w=2
>>
>> v3 changes:
>> * rebase on the current upstream
>> * alias ARCH_PFN_BASE to m68k_memory[0].addr
>> * add configuration option to allow two variants of section size.
>>
>> v2 changes:
>> * rebase on the current upstream
>> * make ColdFire MMU select SINGLE_MEMORY_CHUNK in Kconfig.cpu
>>
>> Mike Rapoport (3):
>>    m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
>>    m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM
>>    m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
>>
>>   arch/m68k/Kconfig.cpu               | 14 ++++++--
>>   arch/m68k/include/asm/page.h        |  2 ++
>>   arch/m68k/include/asm/page_mm.h     |  6 +++-
>>   arch/m68k/include/asm/q.h   |  8 +++++
>>   arch/m68k/include/asm/virtconvert.h |  2 +-
>>   arch/m68k/mm/init.c                 |  8 ++---
>>   arch/m68k/mm/motorola.c             | 64 ++++++++++++++++++++++++++++++-------
>>   7 files changed, 84 insertions(+), 20 deletions(-)
>>   create mode 100644 arch/m68k/include/asm/sparsemem.h
>>
>> -- 
>> 2.7.4
>>
>>
>> *** BLURB HERE ***
>>
>> Mike Rapoport (3):
>>    m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
>>    m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM
>>    m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
>>
>>   arch/m68k/Kconfig.cpu               | 23 ++++++++++++++---
>>   arch/m68k/include/asm/page.h        |  2 ++
>>   arch/m68k/include/asm/page_mm.h     |  7 +++++-
>>   arch/m68k/include/asm/virtconvert.h |  2 +-
>>   arch/m68k/mm/init.c                 |  8 +++---
>>   arch/m68k/mm/motorola.c             | 39 ++++++++++++++++++++++++++---
>>   6 files changed, 69 insertions(+), 12 deletions(-)
>>
>> -- 
>> 2.26.2
>>
