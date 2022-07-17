Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E49FC433EF
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Jul 2022 09:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiGQJsI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 17 Jul 2022 05:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGQJsI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 17 Jul 2022 05:48:08 -0400
X-Greylist: delayed 348 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 17 Jul 2022 02:48:05 PDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BE2165BD
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Jul 2022 02:48:05 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Lm0Vp40nfz1s89Z;
        Sun, 17 Jul 2022 11:42:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Lm0Vp21NVz1qqkr;
        Sun, 17 Jul 2022 11:42:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id VeQDa_g4SAsD; Sun, 17 Jul 2022 11:42:08 +0200 (CEST)
X-Auth-Info: 3A1dy/wG3DUtKhgga/DiQs7lg/N8fv59NJ8DHAZBVXqRPOCH94SHoYoWjape9fgO
Received: from igel.home (ppp-46-244-169-137.dynamic.mnet-online.de [46.244.169.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sun, 17 Jul 2022 11:42:08 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id B2DC62C35D8; Sun, 17 Jul 2022 11:42:06 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     dengshaomin@cdjrlc.com, Sam Creasey <sammy@sammy.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH] mm:%Lx is non-standard C
References: <20220716161022.16902-1-dengshaomin@cdjrlc.com>
        <CAMuHMdUhGHXnd=tzLNKT-_enBfs_YZgAHNv6jeNTQ=c_e63urw@mail.gmail.com>
X-Yow:  ..  I see TOILET SEATS...
Date:   Sun, 17 Jul 2022 11:42:06 +0200
In-Reply-To: <CAMuHMdUhGHXnd=tzLNKT-_enBfs_YZgAHNv6jeNTQ=c_e63urw@mail.gmail.com>
        (Geert Uytterhoeven's message of "Sun, 17 Jul 2022 11:26:45 +0200")
Message-ID: <87edykrs7l.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1.90 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 17 2022, Geert Uytterhoeven wrote:

> CC linux-m68k.
>
> On Sat, Jul 16, 2022 at 6:10 PM shaom Deng <dengshaomin@cdjrlc.com> wrote:
>> replace %Lx with %lx, because %Lx is not standard
>>
>> Signed-off-by: shaom Deng <dengshaomin@cdjrlc.com>
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> i.e. will queue in the m68k for-v5.20 branch.
>
>> --- a/arch/m68k/sun3/sun3dvma.c
>> +++ b/arch/m68k/sun3/sun3dvma.c
>> @@ -77,7 +77,7 @@ static void print_use(void)
>>         pr_info("%d entries in use total\n", j);
>>
>>         pr_info("allocation/free calls: %lu/%lu\n", dvma_allocs, dvma_frees);
>> -       pr_info("allocation/free bytes: %Lx/%Lx\n", dvma_alloc_bytes,
>> +       pr_info("allocation/free bytes: %lx/%lx\n", dvma_alloc_bytes,
>>                 dvma_free_bytes);

Does that actually work?  The L modifier is equivalent to `ll', not `l',
and dvma_alloc_bytes and dvma_free_bytes are in fact of type unsigned
long long.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
