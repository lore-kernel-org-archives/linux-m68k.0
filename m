Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40898C64E7B
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Dec 2020 15:04:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC1FD20691
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Dec 2020 15:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="MuJqInQZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390053AbgLAPDr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 1 Dec 2020 10:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389268AbgLAPDq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 1 Dec 2020 10:03:46 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9BCC0617A7
        for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Dec 2020 07:03:06 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id d8so1852300ioc.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 01 Dec 2020 07:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Og6g/lyCjIcL1kVP5tZ0QAgJA4aZEi6Vqr/nNvj+z/c=;
        b=MuJqInQZV0OrkCoMCfzib+ByRspfryye7ScpvL1lLH2mX7NIsytrmRxolmgtJ9fehy
         EbBP/aISbDHRpdOD5loNtEUerij2pZmUpMmUXabE4MTbgLqQTGiN1E8/2+XHluf6FGt7
         RX2J4Jg/H1cUlGQdmuUFT6gfHB2UBbkhTCfAwzG5pdvDGhtrcqZz6tB4oxo19nKrQsOu
         jKoANA3VnBqbkAYWC8rpsG34RztYl9VAjQzCZc2EVqsalbS9SdeVQE9rsjul3fuGnFXA
         LEQIXyj9US4vZsCrqyALxiMfO2iSyFmFdxk7I7HJVNQcsSl4LlCsElbVCoxYnRqt17Jm
         y6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Og6g/lyCjIcL1kVP5tZ0QAgJA4aZEi6Vqr/nNvj+z/c=;
        b=Dr3kwTMP1g7ZT8s0rpG2QZyfAsRCNrJUmA78cxfNPxM6Qh7YlO4accHTZp90BIMcSq
         aXPSmaAcsj6J9eP0Ld82EqOsGv4rwpMiHZ7f5VLu/g+OflcKNnGJabKkgedoRJ+N1zT8
         iHXDxdUr0JFxhAtgTTDzSqrBsBKNmQtvFrTj2vrlI9re338r/nU+r2ztTvVbWKjRTrA4
         AfjKmbLNFyBlLdlv9VMyUjyBN9ibzfLhStrL1fH7O6JJAcBt+ogZenXgaJ1ZDFwms4rv
         ko611Go6LNCWWJzTB+XTyuieSzjkX3OCYlRBIV4LuepYw4BYjQPgTJZBhGuE0kdNFErl
         JIkA==
X-Gm-Message-State: AOAM532BPzLYirvj+maFCqJ1cVfJ4gALIOOZe2W3jjSE2dXKVxtEEj1k
        1MCTYRRhpciTDWcWQjCvDTiikQ==
X-Google-Smtp-Source: ABdhPJwnZnnT3CSvidMrOWY7WttjZ3ON/dA9qpMhE8X0d7c2GzTEq5bmfutQ1PBUEhW9MbRonHjKIw==
X-Received: by 2002:a02:90c6:: with SMTP id c6mr2924306jag.3.1606834985798;
        Tue, 01 Dec 2020 07:03:05 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id h70sm35580iof.31.2020.12.01.07.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 07:03:04 -0800 (PST)
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
To:     Mike Rapoport <rppt@kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mm@kvack.org, linux-snps-arc@lists.infradead.org
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
 <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
 <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
 <20201201121033.GG557259@kernel.org>
 <49a2022c-f106-55ec-9390-41307a056517@physik.fu-berlin.de>
 <20201201135623.GA751215@kernel.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <59351dbb-96cc-93b2-f2ec-b8968e935845@kernel.dk>
Date:   Tue, 1 Dec 2020 08:03:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201135623.GA751215@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 12/1/20 6:56 AM, Mike Rapoport wrote:
> (added Jens)
> 
> On Tue, Dec 01, 2020 at 01:16:05PM +0100, John Paul Adrian Glaubitz wrote:
>> Hi Mike!
>>
>> On 12/1/20 1:10 PM, Mike Rapoport wrote:
>>> On Tue, Dec 01, 2020 at 12:35:09PM +0100, John Paul Adrian Glaubitz wrote:
>>>> Hi Mike!
>>>>
>>>> On 12/1/20 11:29 AM, Mike Rapoport wrote: 
>>>>> These changes are in linux-mm tree (https://www.ozlabs.org/~akpm/mmotm/
>>>>> with a mirror at https://github.com/hnaz/linux-mm)
>>>>>
>>>>> I beleive they will be coming in 5.11.
>>>>
>>>> Just pulled from that tree and gave it a try, it actually fails to build:
>>>>
>>>>   LDS     arch/ia64/kernel/vmlinux.lds
>>>>   AS      arch/ia64/kernel/entry.o
>>>> arch/ia64/kernel/entry.S: Assembler messages:
>>>> arch/ia64/kernel/entry.S:710: Error: Operand 2 of `and' should be a general register
>>>> arch/ia64/kernel/entry.S:710: Error: qualifying predicate not followed by instruction
>>>> arch/ia64/kernel/entry.S:848: Error: Operand 2 of `and' should be a general register
>>>> arch/ia64/kernel/entry.S:848: Error: qualifying predicate not followed by instruction
>>>>   GEN     usr/initramfs_data.cpio
>>>> make[1]: *** [scripts/Makefile.build:364: arch/ia64/kernel/entry.o] Error 1
>>>> make: *** [Makefile:1797: arch/ia64/kernel] Error 2
>>>> make: *** Waiting for unfinished jobs....
>>>>   CC      init/do_mounts_initrd.o
>>>>   SHIPPED usr/initramfs_inc_data
>>>>   AS      usr/initramfs_data.o
>>>
>>> Hmm, it was buidling fine with v5.10-rc2-mmotm-2020-11-07-21-40.
>>> I'll try to see what could cause this.
>>>
>>> Do you build with defconfig or do you use a custom config?
>>
>> That's with "localmodconfig", see attached configuration file.
> 
> Thanks.
> It seems that the recent addition of TIF_NOTIFY_SIGNAL to ia64 in
> linux-next caused the issue. Can you please try the below patch?

That's a lot of typos in that patch... I wonder why the buildbot hasn't
complained about this. Thanks for fixing this up! I'm going to fold this
into the original to avoid the breakage.

-- 
Jens Axboe

