Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D7DC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Jul 2022 11:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiGKLnY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Jul 2022 07:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbiGKLmz (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Jul 2022 07:42:55 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B9FCC
        for <linux-m68k@vger.kernel.org>; Mon, 11 Jul 2022 04:38:10 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id cw12so150905qvb.12
        for <linux-m68k@vger.kernel.org>; Mon, 11 Jul 2022 04:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=fLh0Zcth9yobdbqPcPHWmXTtQH4g0b9Q2v2bOxrOEDg=;
        b=KYXfkU2KCKSLZ2EtKT3g/PE+J0LPPxSS0iNaWUnhy1o5Xty0bTBlfgxpFDPKWClGDa
         SYBF3tcNZPfvHpNJnbyBjKjyoO13F1kbe9FNzmdNcp6uk/M2GnEuXgi6vPDTuWM+wEQN
         cQ35ej6oSMklHRlrUi1H6gluKuy0kJQ9GFOTWdfwl9HdxxB886ZJzo9nn77ULWCgpnkZ
         6O6PmgbPUS7MTreuT8t9VGq4Z9coJm6egz2prXbXkHgvrE1fMte8e/pl9/vvKLlsm4/2
         i1XVLfo1BtnbFklQ8D6MhbFJt5wgHUUIsqfTLIu3iSDantRd2lEjrWNAXoo50jwffEn2
         neLQ==
X-Gm-Message-State: AJIora+MFxoWLoiUcloUxUtBmUYUMZ/mFPHrtjzaRBE3aPkYGdKvnXMf
        Q8ocKB5seMSK+KOxnXRc2lSbcsS6ofadqA==
X-Google-Smtp-Source: AGRyM1tEans4VEBhaEato7RFaGneoRmzCoo33XGRh91K3lzZKz3XlspKCkdTFcq50L3PoukKlZ1HqA==
X-Received: by 2002:ad4:5ba7:0:b0:473:6654:f727 with SMTP id 7-20020ad45ba7000000b004736654f727mr4513762qvq.95.1657539489184;
        Mon, 11 Jul 2022 04:38:09 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id i11-20020a05622a08cb00b00319dc953432sm5186261qte.77.2022.07.11.04.38.09
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:38:09 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31c8bb90d09so45604557b3.8
        for <linux-m68k@vger.kernel.org>; Mon, 11 Jul 2022 04:38:09 -0700 (PDT)
X-Received: by 2002:a81:1090:0:b0:31c:9be5:6c95 with SMTP id
 138-20020a811090000000b0031c9be56c95mr19175430ywq.384.1657539488673; Mon, 11
 Jul 2022 04:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <AANLkTimZ4q3mGhy27qVo5gQHMCM2U8jrc_fNPH4YUXev@mail.gmail.com>
In-Reply-To: <AANLkTimZ4q3mGhy27qVo5gQHMCM2U8jrc_fNPH4YUXev@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Jul 2022 13:37:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=ovE6e9TSvsYS7givuEGCcBNAhk3byWUEPdMJ11xEzg@mail.gmail.com>
Message-ID: <CAMuHMdV=ovE6e9TSvsYS7givuEGCcBNAhk3byWUEPdMJ11xEzg@mail.gmail.com>
Subject: Re: Atari console corruption
To:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 13, 2010 at 9:10 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> If your shell command line looks like:
>
> sh-3.1# abcd
>
> Then insert another 'b' in front of the existing 'b'. The 'c' will
> become corrupted.
> The actual characters don't matter, except that the inserted character must be
> the same as the existing one.
> It happens in all even columns, so if your prompt is different, just try it at
> a different even position.
>
> It happens in frame buffer depths 2, 4, and 8. In monochrome mode the corruption
> is different. In 16 bpp, when it uses the cfb code, there's no
> corruption, so the bug
> must be in the Atari-specific code.
>
> I could not reproduce it in vi, only in bash.
>
> Tested on ARAnyM only.

FTR, this was "fixed" in commit 81732c3b2fede049 ("tty vt: Fix line
garbage in virtual console on command line edition") in v3.7, followed
by a few fixes for the regressions introduced by this fix.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
