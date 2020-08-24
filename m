Return-Path: <SRS0=5Aq8=CC=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02F3C433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Aug 2020 20:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97D852067C
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Aug 2020 20:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ceo5XEc1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHXUru (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Aug 2020 16:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgHXUrt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Aug 2020 16:47:49 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5111C061574
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Aug 2020 13:47:49 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id m71so5564132pfd.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Aug 2020 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tWgd3e/VCRjToKsy/2L93HJH/u9/zg4c46ZeIY+eM38=;
        b=Ceo5XEc1p+w/YUUJfkgkdllCPvYj6caO8whVLYQ/EYjlPct0n1fHY68/m+lEItmSat
         CkGqfk4ArmvmBqcm1WGRQSCUN8KwxtO5tO35p2i+OrQY5R4VQyQyshw1C+WVdC0MZ3Or
         A9+HuFxTol3pBNO/nacCH033uWZBm9uiQCBgRqpeYjl7sMJfgKGJg/TmdVAqUviWXMGG
         FzTWBVkwbTPJx7HaHO/hI5rA9sy7Juu4Ka/da+0nlkrz/mgYOblndZLxc/CiSmzQyW7V
         4oR3Vy4bHcIxAj3hCi140CS5YDL8INAE05FYlvlN9KZj2OfQXzdc8wcWTvBQnSJMrbjh
         J4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tWgd3e/VCRjToKsy/2L93HJH/u9/zg4c46ZeIY+eM38=;
        b=Ysqcz9sxnIaQsnxk6m7pQng8bh7j3Y/85lesdf9BHkGe+ODWYwpoJVOR3tkQjZTEkR
         bEyPQEfZA4VAUWmGLZC+7Gh0tmZ9U8HgBuupJuLF+GkHYc6bmZaEPay6wYeg/fkit8Bm
         L2XRdiBft2RK07L4CVuKG9WCYjSwL5HI331ju5ANt1KzT+InGk49kAqtsc953fp2M+da
         kNfpkPUANesaHzeFRsB5OSv2l3LaJkYIIf9FAEu7rOXNQANNFSfjrn3aBXxvuYbNHL3p
         ZRpTC9Wtb3kZBrE2j0krgIKWY6dI3JRVqBHmxxJDLSpZMUA8EzLZVBWe4Zf5vQzwHtgr
         fbAg==
X-Gm-Message-State: AOAM533/3GCvcTTq2H/3pB7xfCzeSq/aZrcVn80qERF4NUUS7lBsoj9R
        aY3iOWA9jX3chFIfcowm6NM=
X-Google-Smtp-Source: ABdhPJyogd8YvgZPsh4QogyBtTFlSpHTTm64elCvTiOT0O8wjE3LPQ/BKFoX/PtjcrbSSRPcjFmOrQ==
X-Received: by 2002:a65:4808:: with SMTP id h8mr4589884pgs.113.1598302069010;
        Mon, 24 Aug 2020 13:47:49 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:89f4:3cef:6eb7:f696? ([2001:df0:0:200c:89f4:3cef:6eb7:f696])
        by smtp.gmail.com with ESMTPSA id t20sm11566756pgj.27.2020.08.24.13.47.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2020 13:47:48 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Mike Rapoport <rppt@linux.ibm.com>
References: <20200718162651.26538-1-rppt@kernel.org>
 <20200820160334.GA752365@kernel.org>
 <5d16d058-a544-5f69-07e9-59da5ffafaf2@gmail.com>
 <20200821075636.GF752365@kernel.org>
 <9ea389e1-bd86-953b-8ae2-40278506e30a@gmail.com>
 <20200822095131.GG752365@kernel.org>
 <28567532-3406-5086-0f77-568af4bbabcf@gmail.com>
 <20200823080649.GH752365@kernel.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <33f4e879-95ea-8302-f0ed-595beb8b98eb@gmail.com>
Date:   Tue, 25 Aug 2020 08:47:41 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200823080649.GH752365@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

On 23/08/20 8:06 PM, Mike Rapoport wrote:
>>>> 20 kB more total memory with sparsemem. Less memory used when booting
>>>> to FastRAM, more used when booting to ST-RAM (checked right after boot
>>>> on an idle system). The latter probably isn't significant.
>>> When booting to FastRAM we still discard ST-RAM and only use it as
>>> device memory for the framebuffer. So the total memory map size will be
>>> smaller.
>> Makes sense, but I was still surprised that replacing discontigmem by
>> sparsemem saves 20 kB regardless of whether or not ST-RAM is used.
> The problem with sparse, however, is the memory wasted for empty memmap.
> For example, if the section size is 16M and there is, say, 17M of
> FastRAM, the memory map will be created for 32M. This means that there
> will be 3840 unused 'struct page' objects. :(

No such thing as a free lunch - that would be a case for the 1G VM limit 
(which I admit, I did not test!)?

In my case, ST-RAM is 14 MB, so only half of the last 4 MB wasted. Note 
that the top of the 16 MB physical area is mapped by early kernel 
startup as noncacheable (hardware registers). I hope this mapping is 
left alone by sparsemem.

Now what would be required to allow use of the ST-RAM chunk (or any 
other memory area mapped out of order) by the kernel memory allocators?

Cheers,

     Michael


>
>>> How many FastRAM do you have in your configuration?
>> Only 256 MB. Can't use much more on my old Powerbook.
>>
>> Cheers,
>>
>> 	Michael
>>
