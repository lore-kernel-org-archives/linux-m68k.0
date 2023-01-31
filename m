Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F587C38142
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Jan 2023 07:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjAaH0I (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 31 Jan 2023 02:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjAaH0I (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 31 Jan 2023 02:26:08 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0C23029A
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 23:26:05 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id bx13so6322774oib.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 23:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dp+hBPgfHAYYLd8ynrHyHlqiKDJtUwVwKsdSPXgeeBI=;
        b=bSNoIeFAN7khxpD8epwRw69o6RaD5oR68HHJK0R5NfaJvZdE/cN3MNn+0bB/jauQBQ
         wacV1jsNFps5wLFvFRWCa+67MtphfVWvyaYSV3pTX+4XipU3/hCRNOufWDlFANibsx1r
         A+fIHTpaG3Gm/TwZLNjPVCBYQQilfQ1snPr5f9apwdxH+VqSld7BTbRRTsM1V668OeTs
         VCVVGLDU47thIbUAq5vOnPv8UopUMD7wTWQPqXHRI4gs1vsg+/R9ieLrZmsHlq+hs1Eb
         DN9+3gb1RX9WGxdrCUgg2EMyLsDVXjUZxvcPnFhgmwKoBEL1XBDS029PEcXPu4PvqCRD
         a6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dp+hBPgfHAYYLd8ynrHyHlqiKDJtUwVwKsdSPXgeeBI=;
        b=Y1pwIUk//xXVwt/e+tGLYAV239QPRCCJCRefVhchSN32su5MCq0H32wQsUQBOXs2nm
         zllcSndhb6uMpYx/Awr5fWv8Vjx5TAJ9H+PEBMtrEGpxIcixiCh44AbJGG7Gumh/BVp1
         y2Ddo6e2KT04/jIRUQwAcNWyxne6V41bpP41SlIcHmeiZTpjT7ZSTpDQfYwZHT8hBj2Z
         CIw6/IRrHSPeosFuQV1iamzJaJ0K/zb2Vqa93bcXEFLjZSWedfCe99VswIRDVyvB1tWb
         9nLOfoZEEdgdX/JW8+tZwjVaOIdf53tSEgQmxHEKRF9TrO0HNfYOu0bTq6cBJGBXJ0hh
         ytjA==
X-Gm-Message-State: AO0yUKX4wZ0vpFQ8QzjXbGBA50c/llAaI3fbAKOjwiTXQYBxgKlZuwO3
        iKLnE0oGmxNe+hBc+fibU3IW2uxIsYd7+s83DMVLow==
X-Google-Smtp-Source: AK7set8mQJe8KFpeLB5R3dIJkq9BizgkW7A7gAfQZ8c2ra8PN5K11EWrWtT/QuNPdz5CBAX5oi7rCD4YtU6MdPmt2Rc=
X-Received: by 2002:a05:6808:179e:b0:378:4bd3:b102 with SMTP id
 bg30-20020a056808179e00b003784bd3b102mr391595oib.299.1675149964857; Mon, 30
 Jan 2023 23:26:04 -0800 (PST)
MIME-Version: 1.0
References: <Y9PWhU7DVQCLP9EX@bill-the-cat> <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat> <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <Y9fxfNDNXXyJQ0Dn@bill-the-cat> <6558aca3-63aa-c89c-93fc-a5afe48cbe78@helsinkinet.fi>
 <CAMuHMdV3xawhr_syeM_5vLrQsF1nMqZhOuyBbUW2mjyPy6Om8Q@mail.gmail.com>
 <Y9ga+bN+wHEI7w0m@bill-the-cat> <b3480cff-970b-bae3-4b8d-01cd587dcb94@kernel.org>
In-Reply-To: <b3480cff-970b-bae3-4b8d-01cd587dcb94@kernel.org>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Tue, 31 Jan 2023 08:25:34 +0100
Message-ID: <CALJHbkAcec5T=2YHSSPeTi8ifampNZ3=bZTTkeW_rqHmD=j1Yg@mail.gmail.com>
Subject: Re: U-Boot support for M68K removal
To:     Greg Ungerer <gerg@kernel.org>
Cc:     Tom Rini <trini@konsulko.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Eero Tamminen <oak@helsinkinet.fi>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, Jan 30, 2023 at 10:50 PM Greg Ungerer <gerg@kernel.org> wrote:
>
> Hi Tom,
>
> On 31/1/23 05:31, Tom Rini wrote:
> > On Mon, Jan 30, 2023 at 08:10:36PM +0100, Geert Uytterhoeven wrote:
> >> Hi Eero,
> >>
> >> On Mon, Jan 30, 2023 at 8:02 PM Eero Tamminen <oak@helsinkinet.fi> wrote:
> >>> On 30.1.2023 18.34, Tom Rini wrote:
> >>>> That's great to hear. While I started my life on m68k machines, I never
> >>>> did get Linux up on one. Do the coldfire platforms you have run U-Boot
> >>>> today? If so, are they already supported upstream? One of my biggest
> >>>> concerns about the architecture, in U-Boot, is that I've just not heard
> >>>> of anyone using it in quite some time, and we don't have any emulated
> >>>> platforms either (can it be done in QEMU? We have other plaforms in CI
> >>>> via QEMU) so I worry it's not working.
> >>>
> >>> Qemu supports both m68k and ColdFire nowadays:
> >>> https://www.qemu.org/docs/master/system/target-m68k.html
> >>>
> >>>
> >>>          - Eero
> >>>
> >>> PS. For m68k there are also a lot of other emulators that emulate
> >>> specific platforms.
> >>>
> >>> Aranym, 68040 Atari "clone", used a lot by Debian m68k port before Qemu
> >>> got m68k support.
> >>>
> >>> WinAUE, 68000-68040 Amiga emulation.  Unlike Aranym or Qemu, this
> >>> emulates also CPU cache.
> >>>
> >>> Hatari, 68000-68040 Atari emulation (based on WinUAE CPU core).
> >>>
> >>> Previous, 68030 NeXT emulator (based on Hatari).
> >>
> >> But none of the platforms listed above boot using U-Boot, which is
> >> what Tom is interested in...
> >>
> >> "qemu-system-m68k -machine help" lists a.o.:
> >>
> >>      an5206               Arnewsh 5206
> >>      mcf5208evb           MCF5208EVB (default)
> >>
> >> U-Boot still contains include/configs/M5208EVBE.h, but there are no
> >> actual users...
> >>
> >> Angelo: so support for amcore in qemu would be nice ;-)
> >
> > I did a little searching after sending and I see there's been some
> > patches for mcf5208evb and U-Boot, in QEMU but the last message (2019)
> > was that the CPU emulation wasn't quite complete enough.  But yes, one
> > way or another, it would be really great to get a virtualized platform
> > in CI to prevent future breakage.
>
> FWIW the QEMU emulation of the m5208evb is good enough to run Linux.
> I do a lot of kernel testing (and development!) using that.
>
Thanks for the info !


> Regards
> Greg
>

Regards,
angelo
>


-- 
Angelo Dureghello
Timesys
e. angelo.dureghello@timesys.com
