Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352DAC433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 07:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 124E261A53
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 07:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbhKQHS2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Nov 2021 02:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhKQHS2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 17 Nov 2021 02:18:28 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E2DC061570
        for <linux-m68k@vger.kernel.org>; Tue, 16 Nov 2021 23:15:30 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id v19so1345803plo.7
        for <linux-m68k@vger.kernel.org>; Tue, 16 Nov 2021 23:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=GVWlngdJe0FGM6hgAdYdbo361NVDqZTqvtcI5rJ1rCA=;
        b=n640dWlXrGQwMjYmp1UrbAgGSEqZlyS6qeADb7CVciPRI5uv0ItXg6n18GLNkM8agw
         SsoxSB5Cd+lAz0x2TcywE4Kw0cXyGX7oB+8UEgP9rUV7xtdbDeB+BCb6uUHE9z/QCkYz
         SAEOM+46c9SJwzxmdCSu0GBLJn2au4JLSFyy0r3uQMlhkAnCAFlGPhAY7hds/GIaK68v
         z8+hRmeQbymGR6o5fjFdpZGSqPwRrljT7k4QmPnCkGgTldQ+6rafXbkJzr6oJrLUqcST
         DIrG6U2ISdb4YaMQ31Uvhb8pwXTOzX3rNMDX7IVCGXQNlFyKjZzC8YZ25K/4O6NPp0b6
         rR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=GVWlngdJe0FGM6hgAdYdbo361NVDqZTqvtcI5rJ1rCA=;
        b=NABihNoxI9fjb2OPRtn0qsun7e7F/u1jtNgXNEU+ptyQb5Jbh5FEC4DYmU42bXWhg9
         3GkptBEMJu/3NxMLoS64GhofkR85LVNy87ikY4M+rGvcBk5vyYYno3OVW9ZsF/bSh4zB
         AoWvcMmRjYUcm4T5CZL7J21/OsXAM57AfgPxhftib4tCxP5KmsKaEgMvtRk9+TTKi2J8
         xbGV8n5to/gY17d7U4yNlGtCEjSsWfP25JV/jUm52GXkvurusVQ+TFApI2PhrY7DgCPP
         iKz1vG0nxl/YmHEwtG8p7Lv9Tc/rPGXgsZ09QbUeT3WusDSUyrDHxtBTDWmUnYVi+M3w
         /iIw==
X-Gm-Message-State: AOAM531dqMLpcAoPAJw+zZaaQk/GixpH0Wvv0dEzJfAGEBr0Zk9JTvVA
        Rbfzg428BakWMiTDXuRUw5gkyPGME00=
X-Google-Smtp-Source: ABdhPJy7hvXxTH8Ghbsl64+wcoD+EcOZl03sPH+gyLI2y8/k7Riqjvpr8mouH7wLQ4LUYDKkDIuf8A==
X-Received: by 2002:a17:902:bc8b:b0:143:caf5:4a0e with SMTP id bb11-20020a170902bc8b00b00143caf54a0emr18673199plb.38.1637133329764;
        Tue, 16 Nov 2021 23:15:29 -0800 (PST)
Received: from [10.1.1.26] (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id m9sm20188268pff.43.2021.11.16.23.15.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Nov 2021 23:15:29 -0800 (PST)
Subject: Re: [PATCH v11 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211114234005.335-1-schmitzmic@gmail.com>
 <20211114234005.335-2-schmitzmic@gmail.com>
 <CAMuHMdWP-15RzVZiE1zR3sdSf06bqj9LZwh3BkgpoUHmvqxLsg@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>, Denis Kirjanov <dkirjanov@suse.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <cbc4b37e-0ab7-b719-c7c5-a4315da220e6@gmail.com>
Date:   Wed, 17 Nov 2021 20:15:15 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWP-15RzVZiE1zR3sdSf06bqj9LZwh3BkgpoUHmvqxLsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Thanks Geert,

On 15/11/21 22:59, Geert Uytterhoeven wrote:
> On Mon, Nov 15, 2021 at 12:40 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Add the interface definition for 16 bit card autoprobing (using
>> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
>> by apne.c. Include necessary cftable definitions from cistpl.h,
>> remove locally duplicate definitions from amipcmcia.h.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

I may have to give this another spin, in order to address a review 
comment by Denis about making the apne.c 16 bit IO autoprobe module 
parameter ('100mbit') a sysfs parameter.

I suggest to move that parameter to arch/m68k/amiga/pcmcia.c to ensure 
it's always visible, and rename it to better reflect its actual function 
(pcmcia_16bit comes to mind). apne.c would then use that parameter to 
autoprobe 16 bit IO support, or set isa_type according to the parameter.

Would that satisfy your concerns, Denis?

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
