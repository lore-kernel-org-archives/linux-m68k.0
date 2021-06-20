Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF4DC48BDF
	for <linux-m68k@archiver.kernel.org>; Sun, 20 Jun 2021 23:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2D916117A
	for <linux-m68k@archiver.kernel.org>; Sun, 20 Jun 2021 23:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhFTXt6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 20 Jun 2021 19:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhFTXt5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Jun 2021 19:49:57 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AC6C061574
        for <linux-m68k@vger.kernel.org>; Sun, 20 Jun 2021 16:47:43 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id t8so2009907pfe.3
        for <linux-m68k@vger.kernel.org>; Sun, 20 Jun 2021 16:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=39g5V9yhB3gxa86LO0mzrQEVqqhyM/UMgiqaO7Fpwew=;
        b=IWMzIUYKn5Ml92JJ1uFfYcWZtWFe/dNBeMYB/3VbjcyXbRXydnd2q+dGxbfjJyVAY4
         cNenzS4mtsIJnn2DErt0OlRZB3/phL3RmBUtrnW7LKOViLtOr0F4b/QPs4jRYw3MJMkp
         uF33OSPYtHDYlBqePwngxm2H/iRxVC7VHirnmTINdWQcf38F4yutPzCJkIWATEoYLWjH
         rjzZtMSLRgZqEwkrcFaZhOsQAqesMBmErEV+sNIBg0EV2yjNOmW5acSSLNpOotIagZn1
         S09jvy3ByzJT8HxmI9NeAXh6DWN4zBjuUzE4Ao7rSR5uHhRd5rLjPLRd6xWn46qHHKkc
         oldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=39g5V9yhB3gxa86LO0mzrQEVqqhyM/UMgiqaO7Fpwew=;
        b=tj5vhZVa0MIgMU6byGGe4nUsZsH2Gxwl5SIvApPIMAyMe/PgawfiqbNAVQXbNhHCiU
         s/Pwd2xYFst6QqUkIHUZPFD3I0VYWq2epHh/hZMbHTScyYA/TYgFJC/abu2WFW/T+OWj
         Tkj4ebNxScCeZEzwdUsGZUEEFe9YqL4sLh8vPGHX5mM9O7PWIkwji/bCWxTqJKqJdv3Y
         fhe+QkFnW/hQsC8VQIH5XBFG+nVz2okn+ydFPUZxHG3O6AchWjGxkdiWNz/mvh6uuQAM
         48mYLkcSJT2BTbW9k0/R/1kCppQ89oQm3zxbklb/frwywHbAqsQFn3JAuaZBnIxW0chK
         5lXw==
X-Gm-Message-State: AOAM530hGRBxnXhz70yBVrfxiJ4WfPw0yGMaeEeSZj2BaiYSft+LbDIl
        Hi4p7Oq5nctKPUIWZUGPIpoWfF9g3PY=
X-Google-Smtp-Source: ABdhPJxqDwO0xRQi/F99rxBpP9VVrYw2hA90hVNYpS1wP/2QDie73/U75llP2dQZf1c6j0SG1uNkKw==
X-Received: by 2002:a65:4109:: with SMTP id w9mr20714951pgp.24.1624232863527;
        Sun, 20 Jun 2021 16:47:43 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:e4cb:9037:8dab:1327? ([2001:df0:0:200c:e4cb:9037:8dab:1327])
        by smtp.gmail.com with ESMTPSA id g18sm13250837pfi.199.2021.06.20.16.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jun 2021 16:47:43 -0700 (PDT)
Subject: Re: [PATCH v6 0/3] Add APNE PCMCIA 100 Mbit support
To:     ALeX Kazik <alex@kazik.de>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <1624145073-12674-1-git-send-email-schmitzmic@gmail.com>
 <CAFFuhJry5tuJmzu1H_3-9NfGsiOYGHQpdY7aPBOockXeA7NAhw@mail.gmail.com>
 <77d654d2-000e-4bc5-c5c8-f0967c26ccc3@gmail.com>
 <CAFFuhJo=Qn=emtrxrs044ByuixKj3oSkQ+ZagU7TB63NMBC25Q@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <8ba06c44-6a83-2735-2437-b96a4a71afa4@gmail.com>
Date:   Mon, 21 Jun 2021 11:47:38 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFFuhJo=Qn=emtrxrs044ByuixKj3oSkQ+ZagU7TB63NMBC25Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Alex,

thanks for clarifying.

There's a number of reasons why this might fail:

- card really needs the reset before even accepting the probe I/O,

- PCMCIA interface needs to be enabled before the probe (pcmcia_init() 
normally does that, but the card reset happens right at the start there),

- a probe read on a 16 bit card in 8 bit mode does appear to give the 
correct result.

I'll have to come up with something better - the CISTPL_CFTABLE_ENTRY 
config tuple ought to contain information about the IO path width 
somewhere. Just a matter of parsing it out without duplicating all of 
drivers/pcmcia/cistpl.c ... Any takers?

Cheers,

     Michael


On 21/06/21 9:55 am, ALeX Kazik wrote:

> Hi Michael,
>
>> thanks for testing again
> I'm happy to help.
>
>> so autoprobe (no boot option) did_not_ work?
> Yes, it did not work - sorry.
>
> If anyone is curious: I'm testing with linux 5.12.9 (was the latest
> stable when the v1 appeared) and an about 5 year old installation on
> my A1200 with 68030+FPU@50Mhz and 64MB ram.
>
> Alex.
