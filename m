From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/11] m68k: Atari EtherNAT Updates
Date: Tue, 8 Jun 2010 13:35:19 +0200
Message-ID: <AANLkTikbJdI1yIzVXJi6WNLiL2n7crMkXT7uWzDtINya@mail.gmail.com>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
	<alpine.DEB.2.00.1006060547550.1329@zirkon.biophys.uni-duesseldorf.de>
	<AANLkTinusfjUBq9fjzLuqv5ZXjdTO1ZC3Qu-eZ8Hsg1z@mail.gmail.com>
	<alpine.DEB.2.00.1006070703040.17584@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:48499 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751406Ab0FHLfV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Jun 2010 07:35:21 -0400
Received: by wyi11 with SMTP id 11so3109947wyi.19
        for <linux-m68k@vger.kernel.org>; Tue, 08 Jun 2010 04:35:19 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1006070703040.17584@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Mon, Jun 7, 2010 at 07:10, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> > Was my backwards compatibility patch to the kernel ld script ever applied?
>>
>> No, at that time I didn't have time to look into it, and later you
>> said the (one) computer with that
>> toolchain had died (so you were going to use a newer one?).
>
> I tried to build a newer one but got stuck (crosstool seems no longer
> maintained, that's what I used last time). Then the disk with all the m68k stuff
> on it died. I've found some info on Ubuntus bug pages on getting 4.4 to build as
> cross compiler, I'll try again using that for starters.

This is what I used (for the 4.1.2 compiler):

http://people.debian.org/~smarenka/m68k/cross-compilers/aaareadme.txt
http://www.xs4all.nl/~zippel/crosscc/crosscc.README

When building on Ubuntu, you have to delete the following lines from
gcc-4.1-4.1.1ds2/debian/rules.defs first:

     ifeq ($(distribution),Ubuntu)
       GFDL_INVARIANT_FREE=no
     endif

With some versions of debhelper, the linker cannot find some library.
You can work around this bug by prefixing the make command with

     LD_LIBRARY_PATH=/usr/m68k-linux-gnu/lib

Alternatively, Emdebian seems to have some older toolchain binaries,
but I never tried them.

>> Eventually, the EtherNAT support should be merged with the standard
>> driver anyway,,,
>
> But for the polled interrupt kludge I agree. Last time I checked the interrupt
> to use for the EtherNAT is beyond what we currently reserve in the Atari
> interrupt map, so I'd have to change the max number of interrupts - what are the
> repercussions for doing this?

VME, Sun 3, and Coldfire already support more interrupts than Atari, so the core
code should handle this fine.

Which reminds me we still have to move to the generic hardirq framework...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
