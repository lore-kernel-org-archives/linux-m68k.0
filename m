Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01500ECAAA1
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Sep 2022 07:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiIOHmg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 15 Sep 2022 03:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiIOHmb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 15 Sep 2022 03:42:31 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0EA92F5B
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Sep 2022 00:42:22 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id c2so17543736plo.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Sep 2022 00:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date;
        bh=quLbesHK1sclIUgYAXvNPWiEr9BuvEDuzROq3QVsdiA=;
        b=TLWJoMPWO4QOdq+abuIlVjwq045uGgoff/nYx8t1moo3ZErq+y6Ytw3niCJ7tp4WfG
         ImwzE+k2zQ+B2KPJ+ygHyWd6J7qSgGwRIa/1l1PxFeZ1GN94TBinF0nyTQ1/lMLxlxYL
         LyTDBUZs2behva7+Zpbv7HvaH6a2GcnsMYXKI2xO5Hrfle3klChj2qoqbam7K/33KH04
         MG8HbzwOtgkQXizjQFKu03px0q84gzm1X0StkRA8SJxostEKCR8f7DHozz+yiIrnofFI
         dqZKHFQds4H+aJFoqaZ71SUkT0qoUjuJMxkn2hGKb5DwyiGa9ZWcLgOxDCkfecK9ZeoU
         olvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date;
        bh=quLbesHK1sclIUgYAXvNPWiEr9BuvEDuzROq3QVsdiA=;
        b=QZjwvtV4O7SUqwG5qStwlBwm4ZCqfmDnWs+l6MCmlJcBFvElc7hUeVpvhheGWf9M/l
         X2lR0n9e97jKSLrExz9FoRbITQBkR8Ajphivk5JNDdKS22FtyKcWnhczazT/gGu2+pto
         2NY2tQ4PUQzuni90a8WgR34lCqBorWiqYiKPolcMuL53I3OLGl+jFyP0DjMbjlYbgSC/
         QkpcAjJo2+ldv+kWm8MjyMFPP65nkBCp9hvH4IMmXy5TNbgpdM50XqCYzTth2o0PtGMw
         tk7MdiRdnbN/oVEjmihibr6xj9iFXBMS9yKQEzLhHYAacspweEFfM4uW18opGCJf4u+m
         CDqQ==
X-Gm-Message-State: ACrzQf07qOLK5Asu4nhRqulyg0l4L68qRf7UCXNeOXZiUTLfB2MNgojV
        H46o6zBotuV5yrkS7uqqqUA=
X-Google-Smtp-Source: AMsMyM6UwY22j+sGWugER6jLNc5tapANAV8AQ4gMs7BwXgPT1my8OySqrIcWSAB7281PRCbLYwkV+w==
X-Received: by 2002:a17:903:32c1:b0:176:d67b:cf70 with SMTP id i1-20020a17090332c100b00176d67bcf70mr3119169plr.117.1663227742259;
        Thu, 15 Sep 2022 00:42:22 -0700 (PDT)
Received: from [10.1.1.24] (122-58-18-24-fibre.sparkbb.co.nz. [122.58.18.24])
        by smtp.gmail.com with ESMTPSA id g17-20020aa796b1000000b0054097cb2da6sm11597154pfk.38.2022.09.15.00.42.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Sep 2022 00:42:21 -0700 (PDT)
Subject: Re: [PATCH] m68k: fix the comments of via_rtc_send
To:     Deming Wang <wangdeming@inspur.com>, funaho@jurai.org,
        geert@linux-m68k.org
References: <20220915014737.1620-1-wangdeming@inspur.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1e8ed681-9a73-d45a-97bd-9d75d2323f82@gmail.com>
Date:   Thu, 15 Sep 2022 19:42:17 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20220915014737.1620-1-wangdeming@inspur.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Here we go again ...

In the interest of avoiding further patches of this nature, can we 
please change the comment to read:

'The bits of the byte go into the RTC in MSB order'

That ought to make it abundantly clear the duplicate 'in' isn't. (As 
would have looking at comment in the the function just before 
via_rtc_send() ...)

Cheers,

	Michael

Am 15.09.2022 um 13:47 schrieb Deming Wang:
> remove the double word of 'in'.
>
> Signed-off-by: Deming Wang <wangdeming@inspur.com>
> ---
>  arch/m68k/mac/misc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
> index 4fab34791758..29a4cb46af01 100644
> --- a/arch/m68k/mac/misc.c
> +++ b/arch/m68k/mac/misc.c
> @@ -126,7 +126,7 @@ static void via_rtc_send(__u8 data)
>
>  	reg = via1[vBufB] & ~(VIA1B_vRTCClk | VIA1B_vRTCData);
>
> -	/* The bits of the byte go in in MSB order */
> +	/* The bits of the byte go in MSB order */
>
>  	for (i = 0 ; i < 8 ; i++) {
>  		bit = data & 0x80? 1 : 0;
>
