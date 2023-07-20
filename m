Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D0AEB64DA
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Jul 2023 22:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjGTWhY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Jul 2023 18:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjGTWhW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Jul 2023 18:37:22 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29CE1722
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 15:37:20 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b8b4749013so9833105ad.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689892640; x=1690497440;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W1w+SY6j6kG1tNs2NxJ9QC7V4tqkxWT/kRb5zTe4W4=;
        b=YV1e4oKAXfzbTRKikzI5KNFWM5JXF76KTnSUdDfwqmu6/RyTKRB6SoyAwGrX4UzzV3
         pFesznNl1fXFESxhSqptxALrnUHU/6DTIm38n8qkwdeMM8YJSZh+hGgjl+fM0vgY3+b0
         4b0CykC66BtX+lTF+FECf02s6uikmfdy8aqscm1MAIj/lMBpv3yD3zEMxF0zaWhhZGV5
         gU7dQcqNmQ/noxlnyyGT2KsbEWa3VYXg3Bq26u+60kPfRSF7L1gQ0gW55Fkr8Cvd8Ud1
         MWlMl5Tsd21HlUvRoAfXzifhaYmWm6TgE8IvTO8+eyZV9Trlwq+yQlXoA2U5KFsqyVlS
         EWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689892640; x=1690497440;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/W1w+SY6j6kG1tNs2NxJ9QC7V4tqkxWT/kRb5zTe4W4=;
        b=Mlz0BxMHiU/wXh43hqAFrNNfyvwgsgm8xG6REnHghRqdSXPUK+gDJIfkKPJgM62YWw
         vUnKlDrSrEY0Qn4qKT1OnNg4ebNqEkR12ulcRdbpS5JtKZ/ZK2HPRZ6EI1OJOsk1wbXo
         3Abxjbuja7jvC5gExh2kzIoQqDVjClwOWxKVQTHNVWr55ZVmAUceSQI+860SlcC3Zpiq
         zsGwQ0FTXoHfKoxLq9HOWpVBCTTINeayafWY8d3d8/HpevHL7HkV8o1Plapu7Zbx3iUp
         w2FlsaVCCxEo2ukJdaN52fpwU1pwzqReR3D1aLlUKrNDZB2QIdZD6+R/GkkH9OGfYQqo
         vOdQ==
X-Gm-Message-State: ABy/qLZ7WRMjxMs9pINk7BbQBLNuk527VAKUs/sBP/h0wvMn7czsZA3v
        XfwRzf5H89fV4sYQfpxIhdk6bTv0SOg=
X-Google-Smtp-Source: APBJJlFncE86q8OqVpFrkZg/LlxqNtmF9dQXVg2LAFHEf7l4rWNjQQu4mf/jWv6Fi3Z3haTylZH+jA==
X-Received: by 2002:a17:903:264d:b0:1b8:a39a:2833 with SMTP id je13-20020a170903264d00b001b8a39a2833mr315989plb.15.1689892639621;
        Thu, 20 Jul 2023 15:37:19 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id iw2-20020a170903044200b001b6a27dff99sm1914357plb.159.2023.07.20.15.37.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2023 15:37:19 -0700 (PDT)
Subject: Re: clear_bit_unlock_is_negative_byte
To:     Matthew Wilcox <willy@infradead.org>,
        linux-m68k@lists.linux-m68k.org
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
Date:   Fri, 21 Jul 2023 10:37:14 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Matthew,

Am 21.07.2023 um 07:27 schrieb Matthew Wilcox:
> I'm looking to implement clear_bit_unlock_is_negative_byte() on every
> architecture so we can delete the ifdeffery around maybe-we-have-it
> and remove the simple implementation from filemap.c.  Here's what I've
> come up with for m68k:
>
> +static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
> +               volatile unsigned long *p)
> +{
> +       char result;
> +       char mask = 1 << nr;    /* nr guaranteed to be < 7 */
> +
> +       __asm__ __volatile__ ("eori %1, %2; smi %0"
> +               : "=d" (result)
> +               : "i" (mask), "o" (*p)
> +               : "memory");
> +       return result;
> +}
>
> It compiles, so I feel Very Pleased With Myself, since I haven't written
> m68k assmbly in 25 years.  But I have questions.

Unfortunately, after plugging this in, the boot hangs at the first block 
device encountered:

calling  proc_hardware_init+0x0/0x20 @ 1
initcall proc_hardware_init+0x0/0x20 returned 0 after 40 usecs
calling  rtc_init+0x0/0x5e @ 1
initcall rtc_init+0x0/0x5e returned 0 after 40 usecs
calling  atari_nvram_init+0x0/0x42 @ 1
initcall atari_nvram_init+0x0/0x42 returned 0 after 40 usecs
calling  nfhd_init+0x0/0x206 @ 1
nfhd8: found device with 20971440 blocks (512 bytes)

Doesn't eat up memory, doesn't sit in a tight spin, just never proceeds 
past that point.

Running old and new code side by side (well, actually sequentially) in 
clear_bit_unlock_is_negative_byte()  and comparing results, the return 
values generated by both options match but the actual contents of the 
pointer passed to the function (after the mods) does differ:

nfhd8: found device with 20971440 blocks (512 bytes)
cbu_inb memval mismatch: 2004 12005
cbu_inb memval mismatch: 2004 12005
  nfhd8: AHDI p1 p2
cbu_inb memval mismatch: 26 10027
cbu_inb memval mismatch: 26 10027

(first value is from the old code, second value from the new code).

It looks to me that the eori operates on a 16 bit word here?

(Disclaimer: I have written m68k assembly occasionally in the past 
years, but I struggle with inline asm...)

Cheers,

	Michael

>
> First, m68k is big-endian, so I suspect I'm accessing the wrong byte.
> Should something in there be adding 3 to 'p'?  Better to do it in the
> asm, or in the constraints so the compiler can see it?
>
> Second, have I properly communicated to the assembler that this is
> a byte-size operation, and it needs to check bit 7 and not bits 15 or 31
> to set the negative flag?
>
> Third, can this be done better?  x86 has __GCC_ASM_FLAG_OUTPUTS__
> so it doesn't need the equivalent of the SMI instruction to move the
> condition to an output variable; it can just tell the compiler that
> the N flag communicates the result that it's looking for.  Does m68k
> have __GCC_ASM_FLAG_OUTPUTS__ or did nobody do that work yet?
>
> Fourth, we could do this is with ANDI instead of EORI.  It's mildly
> safer, but we really shouldn't have two threads clearing the lock bit
> that race with each other.  We can't do it with BCLR because that
> doesn't set the N flag.  If we do that, we'd need to invert the mask.
>
> Appreciate your time looking at this.
>
