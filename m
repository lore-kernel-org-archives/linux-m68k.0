Return-Path: <SRS0=5siT=B7=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D43AC433DF
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Aug 2020 23:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8B77207C3
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Aug 2020 23:27:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t9SrU8TQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgHUX1c (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Aug 2020 19:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgHUX12 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Aug 2020 19:27:28 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3D0C061573
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Aug 2020 16:27:28 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id v15so1699392pgh.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Aug 2020 16:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=LrzFV+zyiXUGWg4TlpkH53h9k/IWj23O83vzi07w/Xs=;
        b=t9SrU8TQUGdWcJrg4l7K37TXEANo41bVO6fomHt9fbWci458id1vNZH+Jb9iZC55ib
         XKw/yZZQ0Jm/hi4VYoir0CRhrqPLpYwUE6A6nOnjASkM6M0Ja6Qv3ZdbpU+b7RJ1H5IO
         11Bklon3sJbXo+vX+2RdYuV2aKTWIgI1LMNXYXXpFZ4+gf6Jpyzxq5UefoarKFebyUiI
         8xFTDMRtDIRL8YbwB9o9ctuY9waIkwpbds49Lny9AiSrJ5OmA0d6I8szhkxSWATfqj4I
         anPHs4e4OnBJpOBzoPciOFIhRQLdNY+WZcu2tavl09NN9EgLQZsPeNpgeSjDV+v0jjpO
         kJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=LrzFV+zyiXUGWg4TlpkH53h9k/IWj23O83vzi07w/Xs=;
        b=uWaDqbrwnRQ0VB6pIAYnMYvNdyYJnKPUJ+DqrmnfQqlsjs7VseglSXjw3aqgk8WXeP
         VKaRRtK7wgUbLhfPHBjKPiiw2cn2Zk9aaGMVEjt4DP1njly6t4tgTL+cInKMbXoz4dUe
         XSGiJFUX1bvah4kIqEuvhiB2aDTv+rUjtuBkQ4wrzXd0B3GJ04eIFXm776GIlz2jp+6p
         RfbM6lVi3CTwLoP7rGcRIg2Tlh3aRpZ2b3umNtHV8tsUntwuIUCcpYgCInsWYe6hLQyZ
         0Diguq96IGvDpV5FoqVd0rGpVHL1YRwSsZGmGg3hSyOr3OK7emKBzTeP0nVHHDCfooqR
         7AsA==
X-Gm-Message-State: AOAM532TCnE4/lpuMZdlIXWSgeUG0WZYc3HQgeNtocKPIY5CzvH6mH+Q
        57T2+ZrbtrA8t5n3rwiMYHw=
X-Google-Smtp-Source: ABdhPJzLw9foW5I8EFg+l2eyu6Goo5wQ3R7oWrfjTrerld408AR7hD8g8Vt7cQRDKSm2hzNpajontA==
X-Received: by 2002:a63:5952:: with SMTP id j18mr3750255pgm.361.1598052447394;
        Fri, 21 Aug 2020 16:27:27 -0700 (PDT)
Received: from [192.168.1.101] (122-58-181-132-adsl.sparkbb.co.nz. [122.58.181.132])
        by smtp.gmail.com with ESMTPSA id f17sm2855895pjp.46.2020.08.21.16.27.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 16:27:26 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
To:     Mike Rapoport <rppt@kernel.org>
References: <20200718162651.26538-1-rppt@kernel.org>
 <20200820160334.GA752365@kernel.org>
 <5d16d058-a544-5f69-07e9-59da5ffafaf2@gmail.com>
 <20200821075636.GF752365@kernel.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Mike Rapoport <rppt@linux.ibm.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <9ea389e1-bd86-953b-8ae2-40278506e30a@gmail.com>
Date:   Sat, 22 Aug 2020 11:27:18 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200821075636.GF752365@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

only tested on ARAnyM, but appears to work (after adding sparsemem.h and 
changing memblocks_present() to non-static).

20 kB more total memory with sparsemem. Less memory used when booting to 
FastRAM, more used when booting to ST-RAM (checked right after boot on 
an idle system). The latter probably isn't significant.

Cheers,

	Michael


Am 21.08.2020 um 19:56 schrieb Mike Rapoport:
> On Fri, Aug 21, 2020 at 10:29:13AM +1200, Michael Schmitz wrote:
>> Hi Mike,
>>
>> Sorry, I had seen those but didn't get around to test in time.
>>
>> Applying your patch series to Geert's v5.9-rc1, I get this:
>>
>>>   CC      kernel/bounds.s
>>>   CC      arch/m68k/kernel/asm-offsets.s
>>> In file included from ./include/linux/mmzone.h:19,
>>>                  from ./include/linux/topology.h:33,
>>>                  from ./include/linux/irq.h:19,
>>>                  from ./include/asm-generic/hardirq.h:13,
>>>                  from ./arch/m68k/include/generated/asm/hardirq.h:1,
>>>                  from ./include/linux/hardirq.h:10,
>>>                  from ./include/linux/interrupt.h:11,
>>>                  from ./include/linux/kernel_stat.h:9,
>>>                  from arch/m68k/kernel/asm-offsets.c:16:
>>> ./include/linux/page-flags-layout.h:28:10: fatal error: asm/sparsemem.h:
>>> No such file or directory
>>>  #include <asm/sparsemem.h>
>>>           ^~~~~~~~~~~~~~~~~
>>> compilation terminated.
>>> make[2]: *** [arch/m68k/kernel/asm-offsets.s] Error 1
>>> make[1]: *** [prepare0] Error 2
>>> make: *** [__sub-make] Error 2
>>
>> Your patch announcement blurb hat sparsemem.h listed among the changed
>> files, but none of the three patches stats reference that file. Am I missing
>> a prerequisite here?
>
> Argh, I forgot to 'git add asm/sparsemem.h'.
> I'll resend a refreshed version in a couple of days.
>
>> Cheers,
>>
>>     Michael
>>
>>
>> On 21/08/20 4:03 AM, Mike Rapoport wrote:
>>> Gentle ping :)
>>>
>>> On Sat, Jul 18, 2020 at 07:26:48PM +0300, Mike Rapoport wrote:
>>>> From: Mike Rapoport <rppt@linux.ibm.com>
>>>>
>>>> Hi,
>>>>
>>>> It took me a while to get back to this, but better late than never :)
>>>>
>>>> These patches replace DISCONTIGMEM with SPARSEMEM on m68k for systems with
>>>> !SINGLE_MEMORY_CHUNK set.
>>>>
>>>> With SPARSEMEM there is a single node for the entire physical memory and to
>>>> cope with holes in the physical address space it is divided to sections of
>>>> several megabytes.
>>>>
>>>> Each section has it's own memory map which size depends on actual populated
>>>> memory.
>>>>
>>>> The section size of 16M was chosen pretty much arbitrarily as I couldn't
>>>> find specs for systems with e.g. Zorro memory extensions.
>>>> Yet, we cannot use smaller sections and still be able to address the entire
>>>> 4G of the physical memory because the section number is encoded in the page
>>>> flags and there are only 8 bits available.
>>>>
>>>> For systems with several small memory chunks and with small (several megs)
>>>> holes between them, 16M section size would cause wasted parts in the memory
>>>> map and it is desirable to allow smaller section size at the expense of
>>>> limiting the addressable memory.
>>>>
>>>> I've hesitated between adding Kconfig option as Finn suggested [1] and
>>>> other options like SPARSE_VMEMMAP or ARCH_HAS_HOLES_MEMORYMODEL. In the
>>>> end, I think Kconfig is the simplest one from the implementation point of
>>>> view and would work fine for people that run mainline kernels on vintage
>>>> hardware.
>>>>
>>>> For the systems with ST-RAM and FastRAM, the switch to SPARSEMEM does not
>>>> change the limitation that if the kernel is loaded into the FastRam the
>>>> ST-RAM remains unmapped. It only ensures that if the kernel is loaded in
>>>> ST-RAM, the memory map is allocated from high physical addresses and then
>>>> atari/stram.c is able to reserve the frame buffer memory. If the kernel is
>>>> loaded to FastRAM, the ST-RAM remains unmapped as with DISCONTIGMEM and the
>>>> atari/stram.c maps it as IOMEM.
>>>>
>>>> [1] https://marc.info/?l=linux-m68k&m=156309170500921&w=2
>>>>
>>>> v3 changes:
>>>> * rebase on the current upstream
>>>> * alias ARCH_PFN_BASE to m68k_memory[0].addr
>>>> * add configuration option to allow two variants of section size.
>>>>
>>>> v2 changes:
>>>> * rebase on the current upstream
>>>> * make ColdFire MMU select SINGLE_MEMORY_CHUNK in Kconfig.cpu
>>>>
>>>> Mike Rapoport (3):
>>>>    m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
>>>>    m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM
>>>>    m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
>>>>
>>>>   arch/m68k/Kconfig.cpu               | 14 ++++++--
>>>>   arch/m68k/include/asm/page.h        |  2 ++
>>>>   arch/m68k/include/asm/page_mm.h     |  6 +++-
>>>>   arch/m68k/include/asm/q.h   |  8 +++++
>>>>   arch/m68k/include/asm/virtconvert.h |  2 +-
>>>>   arch/m68k/mm/init.c                 |  8 ++---
>>>>   arch/m68k/mm/motorola.c             | 64 ++++++++++++++++++++++++++++++-------
>>>>   7 files changed, 84 insertions(+), 20 deletions(-)
>>>>   create mode 100644 arch/m68k/include/asm/sparsemem.h
>>>>
>>>> --
>>>> 2.7.4
>>>>
>>>>
>>>> *** BLURB HERE ***
>>>>
>>>> Mike Rapoport (3):
>>>>    m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
>>>>    m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM
>>>>    m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
>>>>
>>>>   arch/m68k/Kconfig.cpu               | 23 ++++++++++++++---
>>>>   arch/m68k/include/asm/page.h        |  2 ++
>>>>   arch/m68k/include/asm/page_mm.h     |  7 +++++-
>>>>   arch/m68k/include/asm/virtconvert.h |  2 +-
>>>>   arch/m68k/mm/init.c                 |  8 +++---
>>>>   arch/m68k/mm/motorola.c             | 39 ++++++++++++++++++++++++++---
>>>>   6 files changed, 69 insertions(+), 12 deletions(-)
>>>>
>>>> --
>>>> 2.26.2
>>>>
>
