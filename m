Return-Path: <SRS0=0V5P=AH=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96429C433E0
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Jun 2020 20:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A16320720
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Jun 2020 20:17:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="uEcn9/ux"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgFZURe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Jun 2020 16:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgFZURe (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 26 Jun 2020 16:17:34 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AB1C03E979
        for <linux-m68k@vger.kernel.org>; Fri, 26 Jun 2020 13:08:32 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id m62so6147961vsd.4
        for <linux-m68k@vger.kernel.org>; Fri, 26 Jun 2020 13:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IZCSMeGMjlwnph8TM579sCg+NICrR3I72k2Q3QHJVqQ=;
        b=uEcn9/uxoFPe4+2cwfwiCj+Ig834tPa/1ec6RHqEVL6kUlyUCUZg35dKv1Vmcv52y5
         HQKqqZu4Tk6TfjGeZ0zeBb0zCtnoBGHkQ0s1TOE141SxzlVnDswgPhGZrFoB9raA5lNu
         s/IoPAKrCUVzn2SuzbMK14YimCq6rC6aHdTgMiJim4XxJCbHgB1rB/yJREB/pwiYa+9m
         JGcTDZW3nS0mSYDtqfbKAxK+dmy4TasZAWmIU/RbrvW0EXO984AVlnPtzLTh1MvhF/vV
         Zpw9RpHQZt+Ptn3UB1JX+WC89optLyVdejwrme4oemHn92mxckOElINItiBHdi0S3i54
         DszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZCSMeGMjlwnph8TM579sCg+NICrR3I72k2Q3QHJVqQ=;
        b=trb7YFyK/XObcGRJ6ZlTl9ofkXa5taUnZ67O+k/SvLbIAX7qSV5A1fuQFe+sPZSWPv
         iZWIIpYEN5wrV4QOAdS2ttWUKFTF+1rcI4VAsY1aO64/QZGEMaaDzLn/Ut0upCNazfM4
         wNDf9OhlqkYDWfW6XCLoXlbcolPygr9e0NBoWupTPQ6MrDKp1DjezDGvjZz8MWu2brEU
         S46y4RxLM4CFCyZPoZhOboZk3/VTjKu2ZbtIoRmGNuFo84415/Bo0mmpdmTwwVnTt6PM
         LCTloRA7vr5JVy60dItnGD13xMzk/Nyv0tJ3PeIlGw0EqnZpBPc33FMjJsySap9aVwkG
         snhg==
X-Gm-Message-State: AOAM533/QaTbnzTHXO7uKQ/DAAmooxbInqxY99xn11pdZ5Jv4uBZ613C
        ESD0iL3t9ndojOkYMkXW+ZY6E6XdXybTXGPSjh3d3ZTl2wOTEw==
X-Google-Smtp-Source: ABdhPJyrk6pMIdNYajcgiQ86hfFWOGPZXcJnfN4YydzGYg9wTGSxCiaqcI+mJ2ASWbzWfQ6hA/0VlnCp881Dl2YtlJ4=
X-Received: by 2002:a67:ca89:: with SMTP id a9mr1000375vsl.182.1593202111191;
 Fri, 26 Jun 2020 13:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200624233443.3346919-1-angelo.dureghello@timesys.com> <CAMuHMdVF848G0S788ufYxz8OO8rLTo-G9PRDO0Did3s0PGTNKg@mail.gmail.com>
In-Reply-To: <CAMuHMdVF848G0S788ufYxz8OO8rLTo-G9PRDO0Did3s0PGTNKg@mail.gmail.com>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Fri, 26 Jun 2020 22:14:29 +0200
Message-ID: <CALJHbkAn4hKQRT8cp2dQr3+ndKCjZ_E1e2L2nKBzzFKgvSHn6w@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: fix wrong m68k_fixup_info addresses
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert !

thanks a lot for the feedbacks.

On Thu, Jun 25, 2020 at 10:13 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Angelo,
>
> Thanks for your patch!
>
> On Thu, Jun 25, 2020 at 1:28 AM Angelo Dureghello
> <angelo.dureghello@timesys.com> wrote:
> > On mcf5441x, mmu enabled, using a small initramfs, the boot was
> > recently hanging silently in the initial phase, inside
> > arch/m68k/mm/init.c, m68k_setup_node()
> >
> > initrd at 0x47d2f000:0x47d82f64
> > overlap at 1073741889 for chunk 0
> > overlap at 1073746176 for chunk 0
> > overlap at 1073746736 for chunk 0
> > overlap at 1073746737 for chunk 0
> > overlap at 1073746738 for chunk 0
> > overlap at 1073746739 for chunk 0
> > overlap at 1073746740 for chunk 0
> >
> > From some debugging, at m68k_setup_node(), the 25-bits shift value
> > (virt_to_node_shift) seems unset, because applied to a wrong
> > address (address previously set from m68k_fixup).
> >
> > Tried some fixes, but the more low-risk and hopefully correct seems
> > to just add a volatile inside __virt_to_node_shift(). This seems to
> > produce correct addresses for the next fixup to work. Cannot test this
> > on other mmu ColdFire cpu's so every test is eventually welcome.
> >
> > Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
>
> > --- a/arch/m68k/include/asm/page_mm.h
> > +++ b/arch/m68k/include/asm/page_mm.h
> > @@ -135,7 +135,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
> >  {
> >         int shift;
> >
> > -       asm (
> > +       asm volatile (
> >                 "1:     moveq   #0,%0\n"
> >                 m68k_fixup(%c1, 1b)
> >                 : "=d" (shift)
>
> Perhaps we should add the volatile to the other asm statements, too?
> Andreas?

I see volatile is there in other similar m68k asm code chunks,
it should not hurt.

>
> Which compiler version are you using?

It's a toolchain i prepared up here years ago,
export CROSS_COMPILE=/opt/toolchains/m68k/gcc-5.2.0-nolibc/bin/m68k-linux-

If you have a link for a newer toolchain, happy to upgrade :)

> Have you compared the difference in generated code?
>
> With gcc version 8.4.0 (Ubuntu 8.4.0-1ubuntu1~18.04), the above makes
> no difference for m68k_setup_node(), and the compiler doesn't even
> optimize away the call to __virt_to_node_shift(), which is marked
> __attribute_const__.
>

Well, i only checked the assembly by objdump in object files, right now,
at least looking the m68k_fixup section in both cases, opcodes seems ok.

with volatile:

00000000 <.m68k_fixup>:
   0: 4e71           nop
...
6: R_68K_32 .init.text+0x1e
   a: 4e71           nop
   c: 4e71           nop
   e: 0000           .short 0x0000
  10: 0001           .short 0x0001
  12: 0000           .short 0x0000
12: R_68K_32 .init.text+0x22 correct, points to
                          22: 7200           moveq #0,%d1

  14: 0000           .short 0x0000
  16: 4e71           nop
  18: 4e71           nop
...
1e: R_68K_32 .init.text+0x46
  22: 4e71           nop


without

  00000000 <.m68k_fixup>:
   0: 4e71           nop
   2: 0000           .short 0x0000
   4: 0001           .short 0x0001
   6: 0000           .short 0x0000
6: R_68K_32 .init.text+0x10, corrrect, points to
              10: 7200           moveq #0,%d1

   8: 0000           .short 0x0000
   a: 4e71           nop
   c: 4e71           nop

Do you see anything strange ? Or, how can i objdump better ?

> Gr{oetje,eeting}s,
>
>                         Geert
>

Thanks, regards
angelo

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
