From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: TLS, was Re: Getting the ol' Macintosh LC475 modernized
Date: Thu, 22 Aug 2013 16:44:25 +0200
Message-ID: <CAMuHMdXfPL-KMKwoYgToTzU+thcytsGma1huaSgyyYvxhz6Xzg@mail.gmail.com>
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
	<CAMuHMdW+zp1=3Jpg2FVDEFD+B58iAO=8ibL=45rgsgy32S43ZQ@mail.gmail.com>
	<Pine.LNX.4.64.1308221334330.2618@digraph.polyomino.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:54562 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752852Ab3HVOo0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Aug 2013 10:44:26 -0400
Received: by mail-pb0-f48.google.com with SMTP id ma3so1857045pbc.7
        for <linux-m68k@vger.kernel.org>; Thu, 22 Aug 2013 07:44:25 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.64.1308221334330.2618@digraph.polyomino.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Joseph S. Myers" <joseph@codesourcery.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Aug 22, 2013 at 3:37 PM, Joseph S. Myers
<joseph@codesourcery.com> wrote:
> On Thu, 22 Aug 2013, Geert Uytterhoeven wrote:
>
>> > The vDSO support has been there in glibc ever since the NPTL port was
>> > first added.  I've no idea why the kernel changes still haven't gone in.
>>
>> I didn't know that. Seems to be recent work, cfr.
>> https://github.com/Xilinx/glibc/blob/master/ports/ChangeLog.m68k ?
>
> It dates back to the original 2010-03-09 addition of NPTL support.

Ah yes, further in the log...

>> Where can I find the kernel changes?
>
> I don't know where such changes may have originally been posted but e.g.
> one version appears to be at
> <https://dev.openwrt.org/browser/trunk/target/linux/coldfire/patches/012-Add-vDSO-support-for-Coldfire-platform.patch?rev=31546>.

Thanks!

I (Google) can't find any evidence of them ever being posted to a public list.
They seem to have entered OpenWRT without any discussion on
openwrt-devel@lists.openwrt.org (yes, I'm subscribed)...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
