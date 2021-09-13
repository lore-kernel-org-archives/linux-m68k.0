Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC844C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 06:54:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9099460F26
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 06:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237453AbhIMG4M (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 02:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237429AbhIMG4M (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Sep 2021 02:56:12 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653B8C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 23:54:57 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id t1so8557533pgv.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 23:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=DpXYH80Z7pPdLLKjZiOU8V+DZoFDcjGv5Xb072+0Kvo=;
        b=MskEUdi2JIXiQ4u1jS5m4f4VNYtfdOzNDSftIu0EgOJCeoU9gOtVdXdnRcsOL5QLBf
         FB0rcWUGMUW4bjh23Va7aj48b+9n46AnwWwf3J6rujx1mwniXNLqn1UFsQ3q9WIumMAj
         fwmgZi2JwmQs2iHOqdeLoVrF2KU5/WqOm0MPU+4wP8nMTsSSVk3+mCBpgQz1+7c+n/gv
         rVYhAypcD7178JGYxasJIzaErD6q2HSaxh2bQ+AwJYWiWgIQr0UtCmrF++aFzAqYFFGE
         CZ2DbxIeUGG0y3FBZsYN+yaQ+iuIeQBKO3N1FI+VwdNVq6+yAVdalc5SEIyUqFqBGEh2
         lVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=DpXYH80Z7pPdLLKjZiOU8V+DZoFDcjGv5Xb072+0Kvo=;
        b=VrCKPBvF4QPFzEqak9+t+MWFx/gSZpe24Lj/sJoBBAqhcokhUOcZpAgiKQkjl84Rjr
         KqMyDgLsW7qij5BLc5+L+kDshDrSy1Pc+yuin+Y1EqqFJnJKToOvlvLWhPisX62XQlqQ
         +GVzOJJ4w0pwnomMQg54//t5T1f0kaSsDQlejVV7FcNkx7xjOQP2h67+bgm2o/2F1MQy
         /Mt8qcbG1/CQxVHVwjpQeKQaI8OfM41aTlo+y7evUI5unVnv/PsTpl+CGQtwpBF1RTRS
         KuUKh6NEHQdJx9uqdzqAx6baqKddfw8W+/8gd8kzEarfcHeWf9KW0EWcwn6hG+LVWttQ
         se9g==
X-Gm-Message-State: AOAM5309qP/unSvbgi+FhbZ/7uTttUfEJcPlpbhDsihZvzvz1PhIPfI0
        qDEufHdJ1QAPRAXsfGektpqgM/JeGxs=
X-Google-Smtp-Source: ABdhPJxFhFNH4GlUUvQst6r/BPSZRzBApoKbjlWwaY2xhYvTQUoPTX+Gcs8AMhim/gJW5vunB9dIVg==
X-Received: by 2002:a63:30d:: with SMTP id 13mr9988193pgd.289.1631516096608;
        Sun, 12 Sep 2021 23:54:56 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id bx2sm5542497pjb.35.2021.09.12.23.54.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Sep 2021 23:54:56 -0700 (PDT)
Subject: Re: [RFC] m68k: Enable memtest kernel parameter
To:     Mike Rapoport <rppt@kernel.org>, Finn Thain <fthain@linux-m68k.org>
References: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org>
 <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
 <a4cd5e13-bdd0-35c-77ff-c0f0cef1486@linux-m68k.org>
 <YT7oDJhKHNVyHZU9@kernel.org>
Cc:     linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <71f1f942-aa38-dd1a-033e-c10b4417554a@gmail.com>
Date:   Mon, 13 Sep 2021 18:53:20 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <YT7oDJhKHNVyHZU9@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

tested and found to work as intended.

Cheers,

	Michael

On 13/09/21 17:56, Mike Rapoport wrote:
> Hi Finn,
>
> On Mon, Sep 13, 2021 at 03:17:33PM +1000, Finn Thain wrote:
>> On Mon, 13 Sep 2021, Michael Schmitz wrote:
>>
>>>
>>> I'm amazed this works - I'd expect the kernel text segment to get
>>> trashed by the memory test routines.
>>
>> I think the initramfs may get clobbered when the 'memtest' parameter is
>> set. But that may be expected behaviour...
>
> It's not the expected behaviour. The initramfs is clobbered because memtest
> runs before initramfs memory is reserved. The patch below (not even compile
> tested) should help. Now, for some reason the reservation of initrd does
> not happen on SUN3, which is probably wrong, so maybe we can drop that
> #ifndef CONFIG_SUN3 before #ifdef CONFIG_BLK_DEV_INITRD.
>
> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> index 4b51bfd38e5f..4ca8f1120abc 100644
> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -338,12 +338,6 @@ void __init setup_arch(char **cmdline_p)
>  		panic("No configuration setup");
>  	}
>
> -	paging_init();
> -
> -#ifdef CONFIG_NATFEAT
> -	nf_init();
> -#endif
> -
>  #ifndef CONFIG_SUN3
>  #ifdef CONFIG_BLK_DEV_INITRD
>  	if (m68k_ramdisk.size) {
> @@ -352,8 +346,16 @@ void __init setup_arch(char **cmdline_p)
>  		initrd_end = initrd_start + m68k_ramdisk.size;
>  		pr_info("initrd: %08lx - %08lx\n", initrd_start, initrd_end);
>  	}
> +#endif
>  #endif
>
> +	paging_init();
> +
> +#ifdef CONFIG_NATFEAT
> +	nf_init();
> +#endif
> +
> +#ifndef CONFIG_SUN3
>  #ifdef CONFIG_ATARI
>  	if (MACH_IS_ATARI)
>  		atari_stram_reserve_pages((void *)availmem);
>
>
