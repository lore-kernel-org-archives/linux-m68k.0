Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A3EC07E96
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 07:36:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 343CB61C59
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 07:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhGHHi5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 03:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbhGHHi4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 03:38:56 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76ED8C061574
        for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jul 2021 00:36:15 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4GL7Q260x9z1s3pb;
        Thu,  8 Jul 2021 09:36:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4GL7Q259LLz1qwZ5;
        Thu,  8 Jul 2021 09:36:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id hIXHirRx30ta; Thu,  8 Jul 2021 09:36:09 +0200 (CEST)
X-Auth-Info: Gz0qFwBa3eZ3ybiZsG4wyfVG4uZ236XRv0V2LORDDqNxGtiERiYnPZBnozzpr61y
Received: from igel.home (ppp-46-244-183-101.dynamic.mnet-online.de [46.244.183.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  8 Jul 2021 09:36:09 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 564AA2C042C; Thu,  8 Jul 2021 09:36:09 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
        <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
        <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
X-Yow:  I LOVE juxtaposing th' splendor of an unpopulated ARROYO with
 th' SLEEK lines of ``NARCISSUS-X'', my new SPORTS UTILITY VEHICLE!
Date:   Thu, 08 Jul 2021 09:36:09 +0200
In-Reply-To: <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
        (Linus Torvalds's message of "Wed, 7 Jul 2021 20:01:33 -0700")
Message-ID: <87lf6hmf4m.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 07 2021, Linus Torvalds wrote:

> Christoph does:
>
>    #define __put_user_asm(inst, res, x, ptr, bwl, reg)    \
>    asm volatile ("\n"                                     \
>           "1:     #inst."#bwl"    %2,%1\n"
>    ...
>
> and then uses it with code like
>
>                 __put_user_asm(MOVES, __pu_err, __pu_val, ptr, b, d);
>
> and
>
>                 __get_user_asm("move", __gk_err, __gk_dst, __gk_src, u8, b, d);
>
> and the issue is that there's a '#' too many.
>
> The '#' turns the argument into a string,

No, it's inside a string, and the assembler just sees a comment starting
with `#inst.'.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
