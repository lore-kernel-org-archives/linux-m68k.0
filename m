Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32308C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Feb 2022 14:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344651AbiBNO0s (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Feb 2022 09:26:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355124AbiBNO0q (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Feb 2022 09:26:46 -0500
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C94D2DC
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 06:26:38 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id v6so18960784vsp.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 06:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+D9TDb8zgo7SYyd9U66f/5PMXdHiP4mRfXaTW0S+zdU=;
        b=0OeY0hO5gGFnWVyE1t9xsahWeQmo002YeAMok6tGgP8HFi8cUVS1npmV86G45pylVn
         KUhWeQBjKRVIKexQV4AcIR0bPcBLgIXTfb4UKv7ExeqwsXKbgtWTsJLrISnYW97TsEtC
         K+O/arTENfbNVS0SHiqxbJ8qAOgKnLYsxvvMdBYMinsfFvILZF/JPXo4nJRtKhQzeeDy
         NIQsEFlaq7WMDUv4JUzgo/bpBsbrfKaK4OcqEx66VKYj93tq802E0co6/id/MTUdumeY
         iSc7wTp72RK70HFMpz92BY2gEg++FrPiOSRdPXKNxmW/yS58T2ZR5ebOIr4Oo/YYzm0Z
         QPtQ==
X-Gm-Message-State: AOAM531LiOiGE8ER5xqE2zp8ah+9gX8oYqQAmu00sydfBLdF2n5K/714
        hcYIotxbxAvKzbVk+BY8q1g8SC+R+wNm2bn3
X-Google-Smtp-Source: ABdhPJyo3ZFC6/KAvLgjxe8oZLOn7AA7mE3fFJ/tyOerQIRoKEcZiqAbRjE6x2QR0yj9/XDIRLfduQ==
X-Received: by 2002:a05:6102:3751:: with SMTP id u17mr1693960vst.81.1644848796976;
        Mon, 14 Feb 2022 06:26:36 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id v13sm1822749vsr.10.2022.02.14.06.26.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 06:26:36 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id 103so8210992uag.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 06:26:35 -0800 (PST)
X-Received: by 2002:ab0:384c:: with SMTP id h12mr3670905uaw.122.1644848795466;
 Mon, 14 Feb 2022 06:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20220211210757.612595-1-Jason@zx2c4.com> <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
 <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
In-Reply-To: <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Feb 2022 15:26:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDj+BVCs4Syg39vjnHGKcwJnCgDxrGoOiEFM_T4ojwPg@mail.gmail.com>
Message-ID: <CAMuHMdXDj+BVCs4Syg39vjnHGKcwJnCgDxrGoOiEFM_T4ojwPg@mail.gmail.com>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Joshua Kinard <kumba@gentoo.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Eric Biggers <ebiggers@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Lennart Poettering <mzxreary@0pointer.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Mon, Feb 14, 2022 at 3:05 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Sun, Feb 13, 2022 at 12:06 AM Joshua Kinard <kumba@gentoo.org> wrote:
> > The R6000/R6000A CPU only ever existed in systems in the late 1980's that
> > were fairly large, and I don't think there is a complete, working unit out
> > there that can actually boot up, let alone boot a Linux kernel.
>
> So from what you've written, it sounds like MIPS is actually not a problem here.
>
> So the only systems we're actually talking about without a good cycle
> counter are non-Amiga m68k? If so, that'd be a pretty terrific
> finding. It'd mean that this idea can move forward, and we only need
> to worry about some m68k museum pieces with misconfigured
> userspaces...

I'm afraid you missed one important detail.  You wrote:

> On every platform, random_get_entropy() is connected to get_cycles(),
> except for three: m68k, MIPS, and RISC-V.

The default implementation in include/asm-generic/timex.h is:

    static inline cycles_t get_cycles(void)
    {
            return 0;
    }

Several architectures do not implement get_cycles(), or implement it
with a variant that's very similar or identical to the generic version.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
