Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7C6C0015E
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 22:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjGUWHU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 18:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjGUWHU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 18:07:20 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F33268F
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 15:07:19 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b8ad907ba4so14692025ad.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689977238; x=1690582038;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE9OW9EJ1w8yR7UmgL6WgzRJiITnyjCEHTX3wqWdzrs=;
        b=gnuTvFgrEKCVtwM10YyX41YIffVuz/Q5Lm5/Tp6wswQmU9/U4e7kq62S3x+K+RdGFS
         p0tT0C/HcZ67QdRVQSbeWA/UozKnIpaYAmydyj5Kvijadzfhs3fCIgzuIwcycDtgCA8+
         hZ6U64YypLGtiuSJFuqFpRVsdMOANWD8ayyxx5Kc7VT84CuijH4lheLAmnYj10FizxD4
         hn2DqO/8g8/x1WycbDKwuogOilubZpUlFxIutmyY1YldH7jGTKW4Rr+6/kqV2f4b/16L
         VxvGWjjZIPizyA0j0ZPj4wMhrRCk9jzHzZBBtRJ+cBuG/Rnobll2lkl33r6xxN1cn0Q7
         tQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689977238; x=1690582038;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wE9OW9EJ1w8yR7UmgL6WgzRJiITnyjCEHTX3wqWdzrs=;
        b=SQpFFFN9W6lzOwdkZvXemmhqztk58exK8yHlaJtN/kI84oV/BRYHZGnVmcu0tu3Tks
         vn6Srkoto0s/bvN2oi6gCaf4eDbsZK6f6W+t4H2brIp31DioNeLWYuuxNmgM7vK+x0hp
         OKE2HwKcx6hza3Akve6limzWi+bBBSv1O49zgS0xtmfJLwSOp0JCQLPvTAs+1VtVKxdD
         Pg9QSePda8BXEenPfYg5jrmma+kHYDKfaHla1wMfiSYSnvHt+5UfPmzRbdR/zUVozin6
         Yr32j84wirvQ3gARKQ78v42STJvxsCAvSwtzzzk2lJe4o7EE3Sr943bmn2E5cn4hHiyp
         5OAQ==
X-Gm-Message-State: ABy/qLZxwllvPx6HExDq7kPyyb2SdR0WpPPx2ANlm2RuT8lPW/5DVTbV
        uLnUavAHwHNKyuGTWJsrcg4AeeP5eBs=
X-Google-Smtp-Source: APBJJlGiyCH/3FHDOjnWHrLNtlXiX0ju4GJyTOI76qqV1ka0jqcNEEv2aWeBI2CTEAA9BExXYN9+IQ==
X-Received: by 2002:a17:903:110c:b0:1b8:525a:f685 with SMTP id n12-20020a170903110c00b001b8525af685mr2934827plh.37.1689977238138;
        Fri, 21 Jul 2023 15:07:18 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e80d00b001b87d3e845bsm3995976plg.149.2023.07.21.15.07.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2023 15:07:17 -0700 (PDT)
Subject: Re: clear_bit_unlock_is_negative_byte
To:     Matthew Wilcox <willy@infradead.org>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
 <5e3a36d1-13f0-9cc3-de44-cc045025b290@gmail.com>
 <ZLngEXDdrAKSw+90@casper.infradead.org>
 <2e4c5eda-671e-9fc8-17fc-7f4b894ef653@gmail.com>
 <ZLq6W1PB0Jh74gjD@casper.infradead.org>
Cc:     linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6041ed90-f54b-f497-52ef-e2abb11f73f0@gmail.com>
Date:   Sat, 22 Jul 2023 10:07:12 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <ZLq6W1PB0Jh74gjD@casper.infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Matthew,

Am 22.07.2023 um 05:03 schrieb Matthew Wilcox:
> I thought it a little odd to use an unsigned char when we're testing
> to see if it's negative, so I went with this:
>
> static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
>                 volatile unsigned long *p)
> {
>         char result;
>         char mask = 1 << nr;            /* nr guaranteed to be < 7 */
>         char *cp = (char *)p + 3;       /* m68k is big-endian */
>
>         __asm__ __volatile__ ("eori.b %1, %2; smi %0"
>                 : "=d" (result)
>                 : "i" (mask), "o" (*cp)
>                 : "memory");
>         return result;
> }

I don't think signedness make a difference here, as we don't leave 
anything about the test to the compiler.

>> I'm sure you can do all the casting to char and increment by 3 in the asm
>> argument...
>
> I'd rather not.  I looked at doing the offset by three inside the asm,
> but it seems like gcc is smart enough to do that without help:
>
> 000006e0 <folio_unlock>:
>      6e0:       206f 0004       moveal %sp@(4),%a0
>      6e4:       0a28 0001 0003  eorib #1,%a0@(3)
>      6ea:       5bc0            smi %d0
>      6ec:       4a00            tstb %d0
>      6ee:       670a            beqs 6fa <folio_unlock+0x1a>
>      6f0:       42a7            clrl %sp@-
>      6f2:       2f08            movel %a0,%sp@-
>      6f4:       4eba fcec       jsr %pc@(3e2 <folio_wake_bit>)
>      6f8:       508f            addql #8,%sp
>      6fa:       4e75            rts
>
> You'll note the smi/tstb pair are unnecessary.  It could simply BPL to
> the RTS instruction, but we can't tell GCC that because we don't have
> the __GCC_ASM_FLAG_OUTPUTS__ feature.

I see. __GCC_ASM_FLAG_OUTPUTS__ appears to be rare enough to assume m68k 
won't get to use it this decade.

>
> By the way, before this optimisation, it was this:
>
> 000006fc <folio_unlock>:
>      6fc:       206f 0004       moveal %sp@(4),%a0
>      700:       08a8 0000 0003  bclr #0,%a0@(3)
>      706:       2010            movel %a0@,%d0
>      708:       4a00            tstb %d0
>      70a:       6c0a            bges 716 <folio_unlock+0x1a>
>      70c:       42a7            clrl %sp@-
>      70e:       2f08            movel %a0,%sp@-
>      710:       4eba fcd0       jsr %pc@(3e2 <folio_wake_bit>)
>      714:       508f            addql #8,%sp
>      716:       4e75            rts
>
> which is the same number of instructions, but one more memory reference.

Seeing as a0 was just loaded from memory above, and should be in the 
cache, I doubt there's much performance difference from the additional 
memory access here. Haven't looked at how many clock cycles each of 
these instructions take.

> It's a read-after-write hazard, but I don't know if that affects any
> m68k implementation; my impression is that even on an '060 there aren't

Unless something modifies the memory location pointed to by a0 (during 
preemption of any kind), I can't see a race here (a0 is saved/restored 
during interrupts, syscalls and such).
We haven't seen any races here in the past with this code AFAICS.

> any real performance implications.  Kudos to gcc for figuring out that
> testing bit 7 can be done with the tstb instruction.
>
>> If there's a simple way to exercise this code path using standard Unix tools
>> (or stress-ng which I ought to have somewhere), drop me a hint.
>
> Oh, it's so common to have a waiter on a folio unlock that just making
> it to the login prompt is enough to declare comfidently that this works.
> CPU implementations with memory barriers and such fanciness are a little
> harder to be confident in, but this looks good to me.  I generally run
> xfstests, but that's just because I have it all set up and ready to go.

Should be all good then.

> I'll drop your Tested-by on this if that's OK?  If you want a
> Co-developed-by credit, that's fine with me too!

Tested-by is fine, thanks. I wouldn't want anyone to assume I'm familiar 
with folios and the like...

Cheers,

	Michael


