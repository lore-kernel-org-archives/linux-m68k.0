Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FCBC433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Nov 2021 19:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 405E2619BB
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Nov 2021 19:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhKRTqE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Nov 2021 14:46:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhKRTqD (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 18 Nov 2021 14:46:03 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C357C061574
        for <linux-m68k@vger.kernel.org>; Thu, 18 Nov 2021 11:43:03 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id h63so6323541pgc.12
        for <linux-m68k@vger.kernel.org>; Thu, 18 Nov 2021 11:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=0X2NZHFl/NpiBC6W+rWSDW/S8iLawqw+UEl3EgMTojY=;
        b=HX4oaB6sx3kUz19EmK7Jjsz6snS7zh/iO0cCp45NXz59HhYOFTvd+x/f/hdY7H4whi
         LqUuoo3xrm+2XWhHaAznbdUind/BeB+6TF8QerRQ/M0e0LJRrvlzB3er7sQZBHrypxJw
         7+NeVKBBnDh7xvlfjaCpPtWoy+b2V7UaiQQ+wCDEflLqAUVZS0ew7ACZrXkg3IAi4TAc
         vrtKI0DAcqepFIzDEf20YaVjrfAQ+jhp/ibg7hQRms2YpxvtuPpGaPfcU11VxEH8n65m
         wkUO8zoT/RSVrqZFYb2uviSy0sSmwENgpRR6PpREk6jiFxiNVhnH3OsCPntbzYWce3+t
         5r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=0X2NZHFl/NpiBC6W+rWSDW/S8iLawqw+UEl3EgMTojY=;
        b=GodJo+M1lDt/8sH+68PVlqPeGQzLki2iPDmJ2HbuhpnnXdBQ5ougrcUgrjmwaMsuFW
         8AUUYqb3eqxvFU5tZT8SeJZ+IXguojG2JJfsSw7ov400p5/mw7560DHBRODVaXmfBxpL
         xUAPSgCmSKSH5qoBJWv00JFa9+mJoOrN0Lxw3dBBcl1IcPa273/qB+SRlGX4CfOrQpfA
         2iUSjBRGfFI3WYLqODpTOy7yDKDLLz8xoQxc2JHT9Pe7Nt5wAb+w9KlgMknO0M+SF7AX
         KyWVPL9AAREJidl9tpSsTauWt6Xihee2uDmGNltpM2pekaZlWgm+/69rgup1qxN+n/48
         P8eQ==
X-Gm-Message-State: AOAM531fS3A5/TXeAKk9xLFqvt8gHFx+4mlJm6ZJEUsd6L8HW9CqP55W
        TIp0hXm8WcpsXjdWTNw6lPk=
X-Google-Smtp-Source: ABdhPJz/zTMMcurWOHGAvCAcbTeKO+a6tYMzDNHtoqVO998kgc0I6cwJWFpkbkceE3BH4bvGWMBtEA==
X-Received: by 2002:a65:4107:: with SMTP id w7mr2006261pgp.29.1637264582934;
        Thu, 18 Nov 2021 11:43:02 -0800 (PST)
Received: from [10.1.1.26] (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id w189sm379979pfd.164.2021.11.18.11.42.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Nov 2021 11:43:02 -0800 (PST)
Subject: Re: [PATCH v11 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211114234005.335-1-schmitzmic@gmail.com>
 <20211114234005.335-2-schmitzmic@gmail.com>
 <CAMuHMdWP-15RzVZiE1zR3sdSf06bqj9LZwh3BkgpoUHmvqxLsg@mail.gmail.com>
 <cbc4b37e-0ab7-b719-c7c5-a4315da220e6@gmail.com>
 <CAMuHMdVZHHAKb8y0YKbKJ5Qw-_pJvwczaNqkrsJhFEWQd6h4uw@mail.gmail.com>
 <a5a71ab2-2e71-ca0f-59b1-d85c4e86bfe8@gmail.com>
 <CAMuHMdXpqDWLdFeEaEpS06fK_jKLOU8LMv5v7d=ey1oR=7jo9A@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>, Denis Kirjanov <dkirjanov@suse.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fd0f59e5-753f-5a38-66b9-5edda6a03247@gmail.com>
Date:   Fri, 19 Nov 2021 08:42:57 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXpqDWLdFeEaEpS06fK_jKLOU8LMv5v7d=ey1oR=7jo9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 18/11/21 21:09, Geert Uytterhoeven wrote:
>>>> I suggest to move that parameter to arch/m68k/amiga/pcmcia.c to ensure
>>>> it's always visible, and rename it to better reflect its actual function
>>>> (pcmcia_16bit comes to mind). apne.c would then use that parameter to
>>>> autoprobe 16 bit IO support, or set isa_type according to the parameter.
>>>>
>>>> Would that satisfy your concerns, Denis?
>>>
>>> What's the point of the sysfs parameter, given the driver cannot be
>>> unbound and rebound, as it does not use the driver model yet?
>>
>> Pre-setting the desired IO type before loading the module - though
>> actual setting of isa_type still has to wait until module load (or
>> driver probe). I'd have to write a callback that validates user input if
>> we want to set isa_type directly in pcmcia.c ...
>
> IMHO the sysfs parameter would only make sense if all of the 8/16-bit
> handling (and the special reset) is done in arch/m68k/amiga/pcmcia.c,
> so it can be shared for multiple cards.

Do we even have any other cards/drivers that work with the Amiga PCMCIA 
port?

>>> The only thing you can (try to) do is unload and reload the module,
>>> at which point you can pass the module parameter again?
>>
>> I take that as 'don't do that', then ... ?
>
> I meant you can do the above without the sysfs parameter.

I wasn't overly clear there - what I meant is, I take your comment to 
mean 'don't bother adding a sysfs parameter that does not add any extra 
functionality'.

The module parameter will appear in sysfs and can be used to read out 
the 16 bit IO state anyway.

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
