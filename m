Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7402DC4338F
	for <linux-m68k@archiver.kernel.org>; Thu, 12 Aug 2021 03:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55B3A60EE2
	for <linux-m68k@archiver.kernel.org>; Thu, 12 Aug 2021 03:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhHLDif (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 11 Aug 2021 23:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbhHLDie (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 11 Aug 2021 23:38:34 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F236C061765
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Aug 2021 20:38:07 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so13060012pjr.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Aug 2021 20:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=SJSX6qlyRtNd0LzBcUXlmF1D06z5qNWVDKcH5XxoyRA=;
        b=NkeXL1qsT5Iqq0E7t6BbuO1g9llPMzztorp2BDAYjhQnshuxZuk4B5ol3G8/S4XtN2
         1VTKbtWxlUevUEEZDeVdZP4su9C2AlgTO8ZusdwMAnTqX5GXuLEWyin5MbdXLgbjH1QG
         nF7fxu+D3pGI0xLBRH6uNJImgdnt0XIYrgDE0A0HN33qxfBkpp18Rgl6zR+dJoaO206I
         UfeHBZ3j9D0+J9xTVfSfell3FRJ0oAXvfNdaMmIJeYHHR0KIGmvdQkE76XrH9dkdFvWy
         NuatGMYzkeHyEsEHsNmF4B3kF1hAVaj5HH3HcAeucCJQXBZDdhHjGA85q4FqqFCLa1BO
         x83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=SJSX6qlyRtNd0LzBcUXlmF1D06z5qNWVDKcH5XxoyRA=;
        b=AeHbLl2PC45U2xpNMvMxz7IMEIXkAepWWpCmuSG/eBih53NAc3qNwTk99ZradWlq9i
         mAzfIHA8FbPPWRUgHG8m2W/3IUNVOcf1ICOutY/t6rJxWHTdwCZHtjP+kUNlaRKkb4fv
         0x8uIr0oK6LUiWSyGe0C6M+gTydGR3psrfO5vK1FZbjw31N23HIyEpjPETPRuRbegXUf
         xeocNSVic0IexwhB7g3NPnDjiojo2WN+479GBKK9Ppx7nHiq1/KxtRgZ468iwL+X9e94
         x6Tt7pjsyakcH/WNrmSaZyDZK53+T2uUDiFjQuuX99Q3TS1wncD7EjW0ZFnjxBn15fOh
         whuQ==
X-Gm-Message-State: AOAM5339UVNtf5cag7y2EgGc/Y9nUSE5QGZzWAGU4GFRdqs0jUD9Zuvf
        BBTOzBOjbBoomeQ5Me1PDe8=
X-Google-Smtp-Source: ABdhPJwdnUKRYrNRu/WRa4PXSdj9p/+2ovXN8lZwdSnGUfo+G2Jl5MbRcS5fQ2dLBZzyzDsx1jEfsA==
X-Received: by 2002:a65:448a:: with SMTP id l10mr1881534pgq.313.1628739486188;
        Wed, 11 Aug 2021 20:38:06 -0700 (PDT)
Received: from [10.1.1.25] (222-152-187-49-fibre.sparkbb.co.nz. [222.152.187.49])
        by smtp.gmail.com with ESMTPSA id j16sm1163200pfi.165.2021.08.11.20.38.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Aug 2021 20:38:05 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
References: <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
 <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com>
 <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
 <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com>
 <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com>
 <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
 <20210811091259.GA15014@lst.de>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <96e587de-9600-16aa-d1fb-686ab1f3ed06@gmail.com>
Date:   Thu, 12 Aug 2021 15:37:59 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210811091259.GA15014@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

I run my tests on a 030, so that patch is unlikely to have any effect 
there. I'll give it a spin though (once my current tests with restoring 
USER_DATA everywhere but logging if get_fc() reads something else) are 
done.

I wonder whether copy_thread() ought to set SUPER_DATA when creating 
kernel threads though (see the comment there). With init_thread starting 
out with USER_DATA now, we'd have to explicitly set SUPER_DATA instead 
of just copying the current value there...

Leaves flush_icache_range() and flush_tlb_page() to worry about.

Cheers,

	Michael

Am 11.08.2021 um 21:12 schrieb Christoph Hellwig:
> Hi Michael,
>
> from looking at your patches I suspect the 040 traps might be able
> to be called witha different fc.  Can you check if the below patch,
> which is a cut down version of your changes makes all the issues
> go away?
>
> diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
> index debb4537eab5..a554e529fd26 100644
> --- a/arch/m68k/include/asm/processor.h
> +++ b/arch/m68k/include/asm/processor.h
> @@ -94,6 +94,13 @@ static inline void set_fc(unsigned long val)
>  			      "movec %0,%/dfc\n\t"
>  			      : /* no outputs */ : "r" (val) : "memory");
>  }
> +static inline unsigned long get_fc(void)
> +{
> +	unsigned long val;
> +	__asm__ ("movec %/dfc,%0":"=r" (val):);
> +	WARN_ON_ONCE(val != USER_DATA);
> +	return val;
> +}
>  #else
>  static inline void set_fc(unsigned long val)
>  {
> diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
> index c5e0a4f93bd5..1b073299fa55 100644
> --- a/arch/m68k/kernel/traps.c
> +++ b/arch/m68k/kernel/traps.c
> @@ -181,6 +181,7 @@ static inline void access_error060 (struct frame *fp)
>  static inline unsigned long probe040(int iswrite, unsigned long addr, int wbs)
>  {
>  	unsigned long mmusr;
> +	unsigned long old_fc = get_fc();
>
>  	set_fc(wbs);
>
> @@ -191,7 +192,7 @@ static inline unsigned long probe040(int iswrite, unsigned long addr, int wbs)
>
>  	asm volatile (".chip 68040; movec %%mmusr,%0; .chip 68k" : "=r" (mmusr));
>
> -	set_fc(USER_DATA);
> +	set_fc(old_fc);
>
>  	return mmusr;
>  }
> @@ -200,6 +201,7 @@ static inline int do_040writeback1(unsigned short wbs, unsigned long wba,
>  				   unsigned long wbd)
>  {
>  	int res = 0;
> +	unsigned long old_fc = get_fc();
>
>  	set_fc(wbs);
>
> @@ -215,7 +217,7 @@ static inline int do_040writeback1(unsigned short wbs, unsigned long wba,
>  		break;
>  	}
>
> -	set_fc(USER_DATA);
> +	set_fc(old_fc);
>
>  	pr_debug("do_040writeback1, res=%d\n", res);
>
>
