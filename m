From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: TLS, was Re: Getting the ol' Macintosh LC475 modernized
Date: Thu, 22 Aug 2013 15:07:34 +0200
Message-ID: <CAMuHMdW+zp1=3Jpg2FVDEFD+B58iAO=8ibL=45rgsgy32S43ZQ@mail.gmail.com>
References: <52116B54.8080507@iamscott.net>
	<Pine.BSM.4.64L.1308190104230.780@herc.mirbsd.org>
	<5212C061.9040306@iamscott.net>
	<Pine.BSM.4.64L.1308200654590.2366@herc.mirbsd.org>
	<52143FE6.9050805@iamscott.net>
	<alpine.LNX.2.00.1308211423540.885@nippy.intranet>
	<Pine.BSM.4.64L.1308210819340.10692@herc.mirbsd.org>
	<CAMuHMdV4dns1-B6C9gx2oqX-umrVzJLQmvgJu+h163KOjJxRCA@mail.gmail.com>
	<Pine.BSM.4.64L.1308212250320.16289@herc.mirbsd.org>
	<alpine.LNX.2.00.1308221034260.3643@nippy.intranet>
	<Pine.LNX.4.64.1308221142180.31459@digraph.polyomino.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:43094 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752595Ab3HVNHe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Aug 2013 09:07:34 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so1864596pdi.19
        for <linux-m68k@vger.kernel.org>; Thu, 22 Aug 2013 06:07:34 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.64.1308221142180.31459@digraph.polyomino.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Joseph S. Myers" <joseph@codesourcery.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Aug 22, 2013 at 1:44 PM, Joseph S. Myers
<joseph@codesourcery.com> wrote:
> On Thu, 22 Aug 2013, Finn Thain wrote:
>> Losing a register also hurts performance. Someone suggested moving
>> get/set_thread_area to a VDSO (as well as the atomic ops). As I understand
>> it, this need not break the ABI and should be faster than the TLS system
>> calls.
>
> The vDSO support has been there in glibc ever since the NPTL port was
> first added.  I've no idea why the kernel changes still haven't gone in.

I didn't know that. Seems to be recent work, cfr.
https://github.com/Xilinx/glibc/blob/master/ports/ChangeLog.m68k ?

Where can I find the kernel changes?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
