Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ED7C7EE30
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 02:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjB0CB7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Feb 2023 21:01:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjB0CBt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Feb 2023 21:01:49 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E6C14EBD
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 18:01:36 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id k21-20020a17090aaa1500b002376652e160so4770213pjq.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 18:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/o9cv6FW9yb1vp78/4DThJE4MX4bk8wIAP5jhSuCII=;
        b=SwjD3CVydZEjIcm7bTjxFEGVCzVjmtt8VKPqcUbNjrithwfD+Qhsiz9B5y1nF6nA5A
         jY6qn3FH2sRibqYkBzZi/RInEHTw4xAz5Ld/He9ab3nHPCG51lsmmB9vMby75r1JPVb3
         50IzEXAVpcZhIVA/qURFb7+csiWaQzXjGmdsD0+yakCY36lyWEehsNx5Q32tnc0dwjEU
         Vg25RQW+p7fS2sL3OqLEOTekLBgSWqh8v0BHCZ/UZAqyjP/swD6Dff7tGmijpGcdDfZb
         JF3j7CB/t71WM1WOSAjMshhe9WFdOhlwpwHLjr+ajUojgOFiaGtzITqAd+uYaG73BWlD
         ybcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/o9cv6FW9yb1vp78/4DThJE4MX4bk8wIAP5jhSuCII=;
        b=ehpXMg+vXCB63IIHl7woIhnE/KgWSgbfgRM8i5cgUZhmy0r1O6aYWVldfQkAsBBOtw
         g2ZltTQhc3eNNfXdMporQbqudOkqv/XFzK4XdPc0pZSJhQMvcyEko037Xv5jfMmkf1IQ
         MNUpcnRHaEcjD+l2MFPrBH9W3JV9dK65GqpqewVKakRila+W8P8JaaVPIot46QrPF6Bx
         Vbe2jAkiBYweTNupt9wyuWdR25Fyb6X3pI7qamahVDN6c+2dYQsGWFDB9/RFgnfQQXJu
         NqItgfgONmDtOu7AVAEEYSi0BVepjUSGS9lKtntSrH/4IKjXIhjkXxd/R8Rixrf0dSwJ
         W/ug==
X-Gm-Message-State: AO0yUKXWYZedKNZv8TJbmxrhdULUSpQqFGRPzoyg6+cSqarsi7280jWd
        FIV589297irDM/oEVjxbBvQ=
X-Google-Smtp-Source: AK7set/T5AKbR7PowEmdJzwnHd9Rp7MGMA6OBbLB2+Dnl8BG/dpd593nxBDl4SFLzjtm4hHDHhFzJA==
X-Received: by 2002:a17:903:18e:b0:19c:ec4f:1f0 with SMTP id z14-20020a170903018e00b0019cec4f01f0mr9220865plg.60.1677463295625;
        Sun, 26 Feb 2023 18:01:35 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id jh11-20020a170903328b00b001962858f990sm3275367plb.164.2023.02.26.18.01.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Feb 2023 18:01:35 -0800 (PST)
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
 <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org,
        Finn Thain <fthain@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <96e0d5c1-6582-10ed-b6e2-d1bbbdf5a2bd@gmail.com>
Date:   Mon, 27 Feb 2023 15:01:29 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert, Stephen,

Am 27.02.2023 um 01:52 schrieb Geert Uytterhoeven:
> On Sun, Feb 26, 2023 at 12:02 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Tue, Feb 21, 2023 at 4:53 PM John Paul Adrian Glaubitz
>> <glaubitz@physik.fu-berlin.de> wrote:
>>> On Tue, 2023-02-21 at 15:55 +0100, Geert Uytterhoeven wrote:
>>>> Looks surprisingly similar to the issue reported by Stan.
>>>> Do the mitigations given in
>>>> https://lore.kernel.org/all/CAMuHMdUtkr2zvZiJfLXvs9d_inJbktSNqQQfO1oxnJHZeoYcHg@mail.gmail.com
>>>> help?
>>>
>>> The kernel actually crashes with a backtrace:
>>>
>>> ABCDGHIJK
>>> [    0.000000] Linux version 6.0.0-6-m68k (debian-kernel@lists.debian.org) (gcc-12 (Debian 12.2.0-9) 12.2.0, GNU ld (GNU Binutils for
>>> Debian) 2.39) #1 Debian 6.0.12-1 (2022-12-09)
>>> [    0.000000] Enabling workaround for errata I14
>>> [    0.000000] printk: bootconsole [debug0] enabled
>>> [    0.000000] Amiga hardware found: [A4000] VIDEO BLITTER AUDIO FLOPPY A4000_IDE KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA
>>> LISA ALICE_PAL ZORRO3
>>> [    0.000000] initrd: 0ef0602c - 0f800000
>>> [    0.000000] Zone ranges:
>>> [    0.000000]   DMA      [mem 0x0000000008000000-0x000000f7ffffffff]
>>> [    0.000000]   Normal   empty
>>> [    0.000000] Movable zone start for each node
>>> [    0.000000] Early memory node ranges
>>> [    0.000000]   node   0: [mem 0x0000000008000000-0x000000000f7fffff]
>>> [    0.000000] Initmem setup node 0 [mem 0x0000000008000000-0x000000000f7fffff]
>>> [    0.000000] Unable to handle kernel access at virtual address (ptrval)
>>
>> I see the same issue on my A4000, bisecting...
>
> Bisected to commit 376e3fdecb0dcae2 ("m68k: Enable memtest
> functionality") in v5.17-rc1.  Reverting that on top of latest fixes the
> issue.

Yes, I'm sorry to say that was the only likely candidate. Can't see why 
though - are Macs all configured to have RAM start at address zero, and 
possibly contiguous, Finn?

Cheers,

	Michael


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
