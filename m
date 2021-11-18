Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51C6C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Nov 2021 04:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B999961A3A
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Nov 2021 04:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhKRFBk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Nov 2021 00:01:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhKRFBi (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 18 Nov 2021 00:01:38 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7244C061570
        for <linux-m68k@vger.kernel.org>; Wed, 17 Nov 2021 20:58:38 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so5839168pjb.1
        for <linux-m68k@vger.kernel.org>; Wed, 17 Nov 2021 20:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=pS5qZ6sfnwE1j85MLy/Dy93IWRAvn3K3JEbIwWHjfWQ=;
        b=qZaCcsM2ZBl5e/ufqanQWrGRnmUB4oUgExebT+MjgvNvmVjrqO69vW1WCOufhozIBd
         kmgg2GPxwJw0JxpQJc2OoghIM85+sVujWV2rLxOLmLMcXcf07Vm13rH/j9r1std8bdvL
         TzP9NH4M0LsB2beHGyH5PeYzkdsdIxilZyVmciv5WjdGiJ8NyKCph8dzd4M53iQf5HkD
         0DmTQNXWU7FS5Lqx1UMwSISTRXJBtLbVLVQ9fBs8jHez8B3KCZ3aZ7qy6H91T+GtpTVU
         xb+9/8d+SaGBbiYqMvO2RghnfxDaUGf6oNvIPCJlFGhQXl6zmSowf2JwdB+BIFUPfPB/
         BwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=pS5qZ6sfnwE1j85MLy/Dy93IWRAvn3K3JEbIwWHjfWQ=;
        b=aIKBRg3XQ48gSJmfgc6qiTZZvmr5tuLUdz9lw4nM0wJgcdqpKJpHfbf3xKNKKjZb2V
         WUYzqOLhEnmZrRQx8fmKn3OEvLDG5wRuEZ4PMAtmXZ9I5EtezGYbGuu/TtJbTsCf7Mgt
         avQcBAfZGxcXpmVp04ejvr/21lgCL3BjzF8FtYqjNCZ+roHoR5D7WY1tYyuJGHXHPbln
         jIOOfJu7q8JXMfJzn0eLHF2CTYDQ1VHfksYlESFZuM+YjQ56re+XKFamVANBTo251RDn
         QxpvJyv2g5qN8GTqfuGKCrFnOtJqn9ZezVy/j71PFJfpIUoq8faQllUCG+Auo4qmxowy
         SzAg==
X-Gm-Message-State: AOAM532+d9pRdFKG3J8UPRxo1z+DBCPTEdqkyZg8wnp0JRzN+h5852tA
        lx1tsWYjoMHypK0/Avx7pcI=
X-Google-Smtp-Source: ABdhPJw5Pkh0BTeC8OxhpBkbgkOp0xhFVjdqNDSMSsEBPAE28YMeavfgkhCP2oGAnTJCSkmMFIbXYw==
X-Received: by 2002:a17:902:c643:b0:141:cf6b:6999 with SMTP id s3-20020a170902c64300b00141cf6b6999mr63972584pls.80.1637211518537;
        Wed, 17 Nov 2021 20:58:38 -0800 (PST)
Received: from [10.1.1.26] (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id z3sm1327324pfh.79.2021.11.17.20.58.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Nov 2021 20:58:38 -0800 (PST)
Subject: Re: [PATCH v11 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211114234005.335-1-schmitzmic@gmail.com>
 <20211114234005.335-2-schmitzmic@gmail.com>
 <CAMuHMdWP-15RzVZiE1zR3sdSf06bqj9LZwh3BkgpoUHmvqxLsg@mail.gmail.com>
 <cbc4b37e-0ab7-b719-c7c5-a4315da220e6@gmail.com>
 <CAMuHMdVZHHAKb8y0YKbKJ5Qw-_pJvwczaNqkrsJhFEWQd6h4uw@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>, Denis Kirjanov <dkirjanov@suse.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <a5a71ab2-2e71-ca0f-59b1-d85c4e86bfe8@gmail.com>
Date:   Thu, 18 Nov 2021 17:58:33 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVZHHAKb8y0YKbKJ5Qw-_pJvwczaNqkrsJhFEWQd6h4uw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 18/11/21 03:35, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Wed, Nov 17, 2021 at 8:15 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 15/11/21 22:59, Geert Uytterhoeven wrote:
>>> On Mon, Nov 15, 2021 at 12:40 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>>> Add the interface definition for 16 bit card autoprobing (using
>>>> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
>>>> by apne.c. Include necessary cftable definitions from cistpl.h,
>>>> remove locally duplicate definitions from amipcmcia.h.
>>>>
>>>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>>>
>>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>> I may have to give this another spin, in order to address a review
>> comment by Denis about making the apne.c 16 bit IO autoprobe module
>> parameter ('100mbit') a sysfs parameter.
>>
>> I suggest to move that parameter to arch/m68k/amiga/pcmcia.c to ensure
>> it's always visible, and rename it to better reflect its actual function
>> (pcmcia_16bit comes to mind). apne.c would then use that parameter to
>> autoprobe 16 bit IO support, or set isa_type according to the parameter.
>>
>> Would that satisfy your concerns, Denis?
>
> What's the point of the sysfs parameter, given the driver cannot be
> unbound and rebound, as it does not use the driver model yet?

Pre-setting the desired IO type before loading the module - though 
actual setting of isa_type still has to wait until module load (or 
driver probe). I'd have to write a callback that validates user input if 
we want to set isa_type directly in pcmcia.c ...

> The only thing you can (try to) do is unload and reload the module,
> at which point you can pass the module parameter again?

I take that as 'don't do that', then ... ?

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
