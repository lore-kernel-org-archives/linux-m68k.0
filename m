Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCDEC433F5
	for <linux-m68k@archiver.kernel.org>; Sat, 13 Nov 2021 03:01:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30743610A0
	for <linux-m68k@archiver.kernel.org>; Sat, 13 Nov 2021 03:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbhKMDDz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 12 Nov 2021 22:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbhKMDDy (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 12 Nov 2021 22:03:54 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331A0C061766
        for <linux-m68k@vger.kernel.org>; Fri, 12 Nov 2021 19:01:03 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gt5so8236704pjb.1
        for <linux-m68k@vger.kernel.org>; Fri, 12 Nov 2021 19:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=PBfB+gsRJu/FKp2Pu6Qy9uey1U/ychuKcQOYnTYsVSM=;
        b=oE+4tc7+kqmExdZpLbUPSNCoT6kK7yjWb0ktHpvh7cu3luf/EyMn8pSwOYFwK3JW5N
         ZLWaXTKd6qL/pAkyy8ssLa86+bwhEK3UyPpAOkrgF1fGl4vbKhGdtzPTpY210St7JuDl
         ioXj6fH5WrX7qAlLloLBLqJ7jkZGRHRpwacYBcmWnEz8Uz7W3+3v3dyodBvO/Arrwp1B
         e/xfM7eelCXtE2B8Qvqev06HnVQnE/wtsmCm5fRjcNvR+PzDQkYwxgyDiz+RaQuCH6En
         YBcMoECsnQwON+wgwXxXleAk1I3Knbdt43YTdvTC6IlejNs/XW3Cf92f1ZVHAehvTGjm
         X3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=PBfB+gsRJu/FKp2Pu6Qy9uey1U/ychuKcQOYnTYsVSM=;
        b=N+/LC4PONv7UNu/t2gEtiE4ed4liJmAwelLRTd2tdpZmx84TGvHaIPxZaFljFMs6j+
         SSpqOlJiauR/f10x1XlokprwuluXMISYrA5JFxOruTnTD+yzyzcPX0Q84CFvLZtFqOKJ
         Gz7py5ju+ZqjDGB81TTzj+9CS6PttH3NKTy+7UY1cm+OaxuwdptmiTwo99qNv5LK1fr5
         MuJ4GaEbH0qPkvOvMvKnHRHQ1aYh07k5SvZ0sb5peo6UK8QXX61fWBfbdzdvz4J7+C3R
         RtEE84jaN/whvVf1glNJSVT1Lc5m6ldTpaxw0SMTGsI5yqRaa8o/pIreO+JBc5XTl42G
         DZSg==
X-Gm-Message-State: AOAM531O7KiOj6v16jK+I8yORSIQ4DkxSYxS23l7Nfu//cBC9Jx6juxe
        zvq40hS/tV/qfbbG36v/50SJb4P3vMA=
X-Google-Smtp-Source: ABdhPJx5Ep22uICahm99yrFzScwxK2SG+CP8Prllmg5bB+cpzXY4Z2hKyuR6qFO0EzMA0iDETSSnkg==
X-Received: by 2002:a17:90b:1947:: with SMTP id nk7mr24042143pjb.227.1636772462688;
        Fri, 12 Nov 2021 19:01:02 -0800 (PST)
Received: from [10.1.1.26] (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id f21sm1416060pfc.191.2021.11.12.19.00.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Nov 2021 19:01:02 -0800 (PST)
Subject: Re: [PATCH v10 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211111025554.26768-1-schmitzmic@gmail.com>
 <20211111025554.26768-2-schmitzmic@gmail.com>
 <CAMuHMdWqUO5xBp+sbOJrAGRPA+4YqZNuXjypdHi8R3fkQ9Ufxw@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>, ALeX Kazik <alex@kazik.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1b1ccd18-0c75-c8f5-4a60-5cefb0f0cae7@gmail.com>
Date:   Sat, 13 Nov 2021 16:00:57 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWqUO5xBp+sbOJrAGRPA+4YqZNuXjypdHi8R3fkQ9Ufxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 12/11/21 23:33, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Thu, Nov 11, 2021 at 3:56 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Add the interface definition for 16 bit card autoprobing (using
>> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
>> by apne.c. Include necessary cftable definitions from cistpl.h,
>> remove locally duplicate definitions from amipcmcia.h.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>
> Thanks for your patch!
>
>> --- a/arch/m68k/include/asm/amipcmcia.h
>> +++ b/arch/m68k/include/asm/amipcmcia.h
>> @@ -13,6 +13,7 @@
>>  #ifndef __AMIGA_PCMCIA_H__
>>  #define __AMIGA_PCMCIA_H__
>>
>> +#include <pcmcia/cistpl.h>
>>  #include <asm/amigayle.h>
>>
>>  /* prototypes */
>> @@ -64,47 +65,8 @@ static inline void pcmcia_disable_irq(void)
>>  #define PCMCIA_SPEED_250NS     250
>>  #define PCMCIA_SPEED_720NS     720
>>
>> -/* PCMCIA Tuple codes */
>> -
>> -#define CISTPL_NULL            0x00
>> -#define CISTPL_DEVICE          0x01
>> -#define CISTPL_LONGLINK_CB     0x02
>> -#define CISTPL_CONFIG_CB       0x04
>> -#define CISTPL_CFTABLE_ENTRY_CB        0x05
>> -#define CISTPL_LONGLINK_MFC    0x06
>> -#define CISTPL_BAR             0x07
>> -#define CISTPL_CHECKSUM                0x10
>> -#define CISTPL_LONGLINK_A      0x11
>> -#define CISTPL_LONGLINK_C      0x12
>> -#define CISTPL_LINKTARGET      0x13
>> -#define CISTPL_NO_LINK         0x14
>> -#define CISTPL_VERS_1          0x15
>> -#define CISTPL_ALTSTR          0x16
>> -#define CISTPL_DEVICE_A                0x17
>> -#define CISTPL_JEDEC_C         0x18
>> -#define CISTPL_JEDEC_A         0x19
>> -#define CISTPL_CONFIG          0x1a
>> -#define CISTPL_CFTABLE_ENTRY   0x1b
>> -#define CISTPL_DEVICE_OC       0x1c
>> -#define CISTPL_DEVICE_OA       0x1d
>> -#define CISTPL_DEVICE_GEO      0x1e
>> -#define CISTPL_DEVICE_GEO_A    0x1f
>> -#define CISTPL_MANFID          0x20
>> -#define CISTPL_FUNCID          0x21
>> -#define CISTPL_FUNCE           0x22
>> -#define CISTPL_SWIL            0x23
>> -#define CISTPL_END             0xff
>> -
>> -/* FUNCID */
>> -
>> -#define CISTPL_FUNCID_MULTI    0x00
>> -#define CISTPL_FUNCID_MEMORY   0x01
>> -#define CISTPL_FUNCID_SERIAL   0x02
>> -#define CISTPL_FUNCID_PARALLEL 0x03
>> -#define CISTPL_FUNCID_FIXED    0x04
>> -#define CISTPL_FUNCID_VIDEO    0x05
>> -#define CISTPL_FUNCID_NETWORK  0x06
>> -#define CISTPL_FUNCID_AIMS     0x07
>> -#define CISTPL_FUNCID_SCSI     0x08
>> +/* CIS tuple parser for 16 bit IO detection */
>> +
>> +extern int pcmcia_parse_tuple(tuple_t *cftuple, cisparse_t *cfparse);
>
> Seems like you can just #include <pcmcia/ds.h> instead, no ill
> effects on .i and .s output?

Too true - will do that instead.

Cheers,

	Michael

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
