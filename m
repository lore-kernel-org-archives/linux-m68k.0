From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux 3.10.1 with initrd (was Re: linux 3.8.12-1 (atari flavour)
 does not boot)
Date: Fri, 2 Aug 2013 21:58:18 +0200
Message-ID: <CAMuHMdX+BCD8zt9MFw32stzM7dZzu05pOSCW=5jQURB5mpXUpg@mail.gmail.com>
References: <alpine.DEB.2.02.1305132122190.14304@tglase.lan.tarent.de>
	<CAMuHMdX+t0=J+8a1JoF6Jf=gO_ROuL_kgAVjF0DJA-cgPGp_Ng@mail.gmail.com>
	<Pine.BSM.4.64L.1305132126170.11828@herc.mirbsd.org>
	<5192331E.9010009@debian.org>
	<Pine.BSM.4.64L.1305141338580.14676@herc.mirbsd.org>
	<20130514144112.GH11842@chumley.earth.sol>
	<Pine.BSM.4.64L.1305141642360.9568@herc.mirbsd.org>
	<Pine.BSM.4.64L.1307201716460.31890@herc.mirbsd.org>
	<CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=e_EJN4b1cqdbcRqgC7ABg@mail.gmail.com>
	<0f1d3739660c2bece613948285afd937@biophys.uni-duesseldorf.de>
	<CAMuHMdXq1Cz9K9qcVqx=C6sbrDJ4JpWT7c6G+JhY+Z4SdYdnKg@mail.gmail.com>
	<51FBEBE1.1020507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:43989 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752709Ab3HBT6T (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Aug 2013 15:58:19 -0400
Received: by mail-pa0-f45.google.com with SMTP id bg4so1039879pad.4
        for <linux-m68k@vger.kernel.org>; Fri, 02 Aug 2013 12:58:18 -0700 (PDT)
In-Reply-To: <51FBEBE1.1020507@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Mikael Pettersson <mikpe@it.uu.se>, Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Fri, Aug 2, 2013 at 7:26 PM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>>> What is the cause of the problem exactly - the hsync handler changing the
>>> IPL to block out further interrupts, whenever it is called for the first
>>> time after interrupts are enabled? We could stop doing that on
>>> multi-platform kernels (taking all hsync interrupts will be a performance
>>> hit but not stop the system from working).
>>
>> AFAICS, it's indeed the hsync handler blocking further interrupts on
>> multi-platform kernels.
>
> So we could stop blocking further interrupts in multi platform kernels. How
> much of a performance hit will this be on say a stock Falcon or TT?

That's 15000 - 30000 more interrupts per second.

>> We could ignore IPL2 when running on Atari (untested whitespace-damaged
>> patch):

[...]

>> or just ignore all priorities on all platforms, and consider interrupts
>> disabled
>> iff all priorities are disabled:

>> The former is safer but slower, the second is faster but will miss cases
>> where some interrupt priorities are disabled.
>
> The safer but slower option (we can still use the fast version of it on
> single platform kernels). We should test the faster at any rate to see
> whether there are really cases where we miss disabled interrupts.

On single-platform kernels, ALLOWINT = ~0x500, and we can use the
current (fast) version.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
