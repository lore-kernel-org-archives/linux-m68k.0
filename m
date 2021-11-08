Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EE4C433EF
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 21:48:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55DED61361
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 21:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240590AbhKHVuq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 Nov 2021 16:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240591AbhKHVup (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 8 Nov 2021 16:50:45 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C99C061570
        for <linux-m68k@vger.kernel.org>; Mon,  8 Nov 2021 13:48:01 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id b11so3814209pld.12
        for <linux-m68k@vger.kernel.org>; Mon, 08 Nov 2021 13:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=R/8fc5BVCUkti+5ltf7/7V4/QJkXWYTW/7UycP2MzbA=;
        b=Ie7RbOc9mu49Bi2jnrRjeiFFhSd6XruwhKrt7XSbHleEOwcSNlVr5eExuL0QqTq8y1
         dpSAW4KXl6vHFruc627mptkVv6MeEQXhCrjH/ATMA+sPitMP/cHd8z8Eexo9Lp0FbSXI
         LXjgwIC9O86wvbKJQ7fLAvOJOolEvz49f6lQn3nt4nUgFWmAQJM2mwvkcoL7HQQNko4W
         OH50npVfpDK6hzmhU+GNaA5ql8X9yKSoIBJXv/xv113Av3LRJz9SRZ6oFITr/Q0n/0+o
         vI/QJljFQ29phUAbEfkjEKJqRO6ffj1LotN5VBX00GK1mg9/sYMokoVk5segfwtfrIx3
         5QYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=R/8fc5BVCUkti+5ltf7/7V4/QJkXWYTW/7UycP2MzbA=;
        b=rfJYfwJRqwlA3hrzyc287RAJam3y+4bqN/HQOo2BJG+IQ9jAeJiRZ0alwckMJN1ydL
         QICQA71vYViDlOK6phHHLmOXcLsdxpDRLNlqGx5GSpzgz9CZ/ycC30Hob/fxIFqb5M+a
         6kVha7Bu6V+IHnKcs3T66rPNifl4o9Vh5yLrS2VLjAFAqIcETI7Q/TpXO9quEogidT+W
         bvoIpZiJIdm9oOY5LIN8OlCT4dPWU/ScVzDkk5++VrPscDkxFZU3LrFH+yPF1DcXCzuA
         j2Yw5zwMPEQ8v34xxLQNl/q9l1fV+B4q8NQMqGcD5+xGzsk0huXDbUljhKnUMByNflnZ
         j5GQ==
X-Gm-Message-State: AOAM531HMYQ0kZQaCe54eTqKorPUKrNPRZkb3KZjEUYcvuA8Mmd6dM0D
        uG5R3rZMFRlFhXzTEwvrjLY=
X-Google-Smtp-Source: ABdhPJyZbt8BWl+iUJELBUd+pHlXGsEGOUMjX+ASsSN0HSJUqOLk++fyD1hULpoKOOvw/jHT0uTDOg==
X-Received: by 2002:a17:902:c412:b0:141:f710:2a94 with SMTP id k18-20020a170902c41200b00141f7102a94mr2042967plk.1.1636408080567;
        Mon, 08 Nov 2021 13:48:00 -0800 (PST)
Received: from [10.1.1.26] (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id b21sm12934567pff.179.2021.11.08.13.47.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:48:00 -0800 (PST)
Subject: Re: [PATCH v8 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211104061102.30899-1-schmitzmic@gmail.com>
 <20211104061102.30899-2-schmitzmic@gmail.com>
 <CAMuHMdVDAZpG=H210R_qeWmMPFm_62jGgsXv_ymYjDBC5-CcZQ@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>, ALeX Kazik <alex@kazik.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <c14ea1ed-c3f1-c5f4-c7d6-1b73387bc278@gmail.com>
Date:   Tue, 9 Nov 2021 10:47:55 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVDAZpG=H210R_qeWmMPFm_62jGgsXv_ymYjDBC5-CcZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,


On 08/11/21 21:35, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Thu, Nov 4, 2021 at 7:11 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Add the interface definitions for 16 bit card autoprobing (using
>> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
>> by apne.c.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>
> Thanks for your patch!
>
>> --- a/arch/m68k/include/asm/amipcmcia.h
>> +++ b/arch/m68k/include/asm/amipcmcia.h
>> @@ -64,6 +64,7 @@ static inline void pcmcia_disable_irq(void)
>>  #define PCMCIA_SPEED_250NS     250
>>  #define PCMCIA_SPEED_720NS     720
>>
>> +#ifndef _LINUX_CISTPL_H
>
> This #ifndef is here to prevent conflicts with <pcmcia/cistpl.h>?
> Why can't the definitions below be removed, and <pcmcia/cistpl.h>
> always included instead?

We'd have to include it everywhere amipcmcia.h is included (because of 
the pcmcia_parse_tuple() external declaration below). Didn't want to do 
that unless absolutely necessary, but if you don't mind that, I'll 
change this part.

>
>>  /* PCMCIA Tuple codes */
>>
>>  #define CISTPL_NULL            0x00
>> @@ -106,5 +107,8 @@ static inline void pcmcia_disable_irq(void)
>>  #define CISTPL_FUNCID_NETWORK  0x06
>>  #define CISTPL_FUNCID_AIMS     0x07
>>  #define CISTPL_FUNCID_SCSI     0x08
>> +#else  /* defined _LINUX_CISTPL_H */
>> +extern int pcmcia_parse_tuple(tuple_t *cftuple, cisparse_t *cfparse);
>
> This can be unconditional?

Brain fade on my part - this of course needs to be conditional on 
CONFIG_PCMCIA. not on _LINUX_CISTPL_H.

Cheers,

	Michael


>
>> +#endif
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
