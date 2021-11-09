Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCC9C433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 19:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC5EB61184
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 19:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242897AbhKITDA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 9 Nov 2021 14:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241264AbhKITDA (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Nov 2021 14:03:00 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DF8C061764
        for <linux-m68k@vger.kernel.org>; Tue,  9 Nov 2021 11:00:14 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id p8so18010799pgh.11
        for <linux-m68k@vger.kernel.org>; Tue, 09 Nov 2021 11:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=gPOZcXeY5dfrLJecxxNQOBXWn4oGse2whbXlueQGIA4=;
        b=Ki1g5YMgWUargtyCVakD4F4rLZssicw9ya6oME0lpgVygVVJnjWtcnHljIAUktTSWz
         qzvNCTX+UJq2AUmc5nfMtRKjc8m2EJCYiiVqX/vIqabIgliZT691mK66tM4P6jDZlxEe
         M8t6VfRGelzHtcFvEx13RWqngr0RRiJyxbVfi7sB84nyTh2U/hxg8OfYD+zMshWkW3DH
         AJb0RWb/6sxV8TaqrYd+tJbQV7gfhi33UxnkhIJMH4DC1kV7Ujg0Qi5hjPlDcWespPxo
         UItRtSYFGMLnR8/X3anxjZa05J8+opInwhFgJSVPYUpT8snOOai2IEjSPCyk4C3Ny2C1
         vfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:references:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=gPOZcXeY5dfrLJecxxNQOBXWn4oGse2whbXlueQGIA4=;
        b=Bk7n1N/mcL4eJaOQ88WvqRDNvbFe0SB0LjtSvWmhgr6s3ab0GThtCnB01pgES19gSn
         RUJcN/kO6sp5730s5MAqFN2ebPOdEsbwOu3m64SkYhd07G2JtFNnEHBwFH2SW8XfR1cI
         f6QYuEx8RoA+l0PuP8D0OKX9HIGDsZBUbsjiV8utN02veUnPgG7EqIjID1t1gDAI6erc
         rUtf9ueWq4tfNapaziKQ92/PXTEm5QwSiXbwJTgLBoXTyT/k1lOEbr8lraS0jz9TE6iG
         x2E97FUzJm/peYtpKaRJdp8FiPsT/2ApU7ww1Al3upFzbGUj1IYiqg0HgUVMM/hGFMJq
         xRHw==
X-Gm-Message-State: AOAM530kj66NcIqI7DaN+NlbIdPn+tPPfmegeq4nc4H4vNIseFNyn0aO
        Yn0DKYFtK1DvSr7Q5C4S78Y=
X-Google-Smtp-Source: ABdhPJxEBgrO0fSA9XI+yPTupJ3KF15ycuXUZzxhWkID9I7yb+BkMVmLhwhc8bPgfLkJgOHLjKqaSg==
X-Received: by 2002:a65:558f:: with SMTP id j15mr1378711pgs.311.1636484413745;
        Tue, 09 Nov 2021 11:00:13 -0800 (PST)
Received: from [10.1.1.26] (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id on6sm4240537pjb.47.2021.11.09.11.00.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Nov 2021 11:00:13 -0800 (PST)
From:   Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v8 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211104061102.30899-1-schmitzmic@gmail.com>
 <20211104061102.30899-2-schmitzmic@gmail.com>
 <CAMuHMdVDAZpG=H210R_qeWmMPFm_62jGgsXv_ymYjDBC5-CcZQ@mail.gmail.com>
 <c14ea1ed-c3f1-c5f4-c7d6-1b73387bc278@gmail.com>
 <CAMuHMdVU4DJ+ahHVW47swRfyFC97-uGUz4nZBo4OZipBTvut-Q@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>, ALeX Kazik <alex@kazik.de>
Message-ID: <efd4797d-4265-c886-8fd9-173bbf2dc62b@gmail.com>
Date:   Wed, 10 Nov 2021 08:00:03 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVU4DJ+ahHVW47swRfyFC97-uGUz4nZBo4OZipBTvut-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 09/11/21 20:55, Geert Uytterhoeven wrote:
>>>> --- a/arch/m68k/include/asm/amipcmcia.h
>>>> +++ b/arch/m68k/include/asm/amipcmcia.h
>>>> @@ -64,6 +64,7 @@ static inline void pcmcia_disable_irq(void)
>>>>  #define PCMCIA_SPEED_250NS     250
>>>>  #define PCMCIA_SPEED_720NS     720
>>>>
>>>> +#ifndef _LINUX_CISTPL_H
>>>
>>> This #ifndef is here to prevent conflicts with <pcmcia/cistpl.h>?
>>> Why can't the definitions below be removed, and <pcmcia/cistpl.h>
>>> always included instead?
>>
>> We'd have to include it everywhere amipcmcia.h is included (because of
>> the pcmcia_parse_tuple() external declaration below). Didn't want to do
>> that unless absolutely necessary, but if you don't mind that, I'll
>> change this part.
>
> That include can be avoided by providing forward declarations for
> struct tuple_t and struct cisparse_t, and using the struct types
> instead of the typedefs for the pcmcia_parse_tuple() parameters, right?

Probably, but we'd still have the conflicts from including both 
pcmcia/cistpl.h and asm/amipcmcia.h in apne.c.

>
>>
>>>
>>>>  /* PCMCIA Tuple codes */
>>>>
>>>>  #define CISTPL_NULL            0x00
>>>> @@ -106,5 +107,8 @@ static inline void pcmcia_disable_irq(void)
>>>>  #define CISTPL_FUNCID_NETWORK  0x06
>>>>  #define CISTPL_FUNCID_AIMS     0x07
>>>>  #define CISTPL_FUNCID_SCSI     0x08
>>>> +#else  /* defined _LINUX_CISTPL_H */
>>>> +extern int pcmcia_parse_tuple(tuple_t *cftuple, cisparse_t *cfparse);
>>>
>>> This can be unconditional?
>>
>> Brain fade on my part - this of course needs to be conditional on
>> CONFIG_PCMCIA. not on _LINUX_CISTPL_H.
>

Got your meaning now - this can be unconditional now.

Cheers,

	Michael


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
