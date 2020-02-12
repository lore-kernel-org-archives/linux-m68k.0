Return-Path: <SRS0=R5AG=4A=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2017C2BA83
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Feb 2020 09:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F37F2082F
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Feb 2020 09:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgBLJ0J (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Feb 2020 04:26:09 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41633 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728696AbgBLJ0J (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Feb 2020 04:26:09 -0500
Received: by mail-oi1-f194.google.com with SMTP id i1so1373794oie.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Feb 2020 01:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ltz/wRnaNIZntV3wpgOwX/2s18RWheTUMisug+H5mlc=;
        b=GPDdG4a+a3/UcZhFlGUnOYG0Rzf3e7UwPHlaJZpbLXeB163jNXikbGpenmA1R+ufo2
         DWkDDOsnxNrPorH1Ag+OlierfwCDCHHJQSMBWptxcp80OSLesO/eJ9fvI90JxGmTV9D+
         u85txBeYPNSA437DXTLveQzhYQrSUFtNXrv6UNvHhNaOHrHsOOawtNo1WWLMkdGdRaOc
         uIKE7Mkj6/98YLiOYgPDwo23QtmcT3NJj60hTPV6u+BumJx0zCdt0SijGRXsNvASj8zY
         tginmx8vJTO1OqxKueHpRZ1IPfM1VT9QO6uyw0Xs2o02AfTLjuVortvycxtX4Qofb+NB
         6mEQ==
X-Gm-Message-State: APjAAAUi1jg4CkuFgd7juv8bBGfyqpqfILvYjIwMFR6gEvIUJpUnC1jD
        un/89aNnht1jPmQytC1YDj3+lG/TGVwMGD0c0AA=
X-Google-Smtp-Source: APXvYqxxPeZbuqaTTpT3vwX5Zpc4udI+nYPgYoBUMe8BqKyyuWPHGsnn9PAqOcBN7GrTfgHO+7CGFYqT6IDyRKLoyvo=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr5352368oia.148.1581499568301;
 Wed, 12 Feb 2020 01:26:08 -0800 (PST)
MIME-Version: 1.0
References: <dcdd615f77dacf8a98e18950b66fb5a675277f38.1581498987.git.michal.simek@xilinx.com>
 <CAMo8BfLYM-_SbqmMUCVjwqL7MpA2W7toTg_F6HTY4Sg5QxGzfw@mail.gmail.com>
In-Reply-To: <CAMo8BfLYM-_SbqmMUCVjwqL7MpA2W7toTg_F6HTY4Sg5QxGzfw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Feb 2020 10:25:57 +0100
Message-ID: <CAMuHMdUZ_e9JsF0fuLxBwdoy7YVLarH6E98z5nKUZ2CccSkV-Q@mail.gmail.com>
Subject: Re: [PATCH v2] asm-generic: Fix unistd_32.h generation format
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>, git@xilinx.com,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stefan Asserhall <stefan.asserhall@xilinx.com>,
        Chris Zankel <chris@zankel.net>,
        "David S. Miller" <davem@davemloft.net>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Helge Deller <deller@gmx.de>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Matt Turner <mattst88@gmail.com>,
        Rich Felker <dalias@libc.org>,
        Richard Henderson <rth@twiddle.net>,
        Tony Luck <tony.luck@intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
        "open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Max,

On Wed, Feb 12, 2020 at 10:23 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Wed, Feb 12, 2020 at 1:16 AM Michal Simek <michal.simek@xilinx.com> wrote:
> >
> > Generated files are also checked by sparse that's why add newline
> > to remove sparse (C=1) warning.
> >
> > The issue was found on Microblaze and reported like this:
> > ./arch/microblaze/include/generated/uapi/asm/unistd_32.h:438:45:
> > warning: no newline at end of file
> >
> > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > Reviewed-by: Stefan Asserhall <stefan.asserhall@xilinx.com>

> > --- a/arch/m68k/kernel/syscalls/syscallhdr.sh
> > +++ b/arch/m68k/kernel/syscalls/syscallhdr.sh
> > @@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
> >         printf "#endif\n"
> >         printf "\n"
> >         printf "#endif /* %s */\n" "${fileguard}"
>
> Here there's already \n at the end, so no need for another one?

Thanks! I completely missed that.
So I did fix the original while applying ;-)

> > +       printf "\n"
> >  ) > "$out"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
