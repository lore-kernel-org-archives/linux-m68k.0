From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Fwd: 3.12 won't startup at amiga 1200 [Antworten] [AntwortenAnAlle]
Date: Tue, 12 Nov 2013 10:19:41 +0100
Message-ID: <CAMuHMdWY70TAAvJaniyUODirneQ58acmsGWD5fKLHASVFeHo5w@mail.gmail.com>
References: <526816EB-000000BB@tuxist.de>
	<CAMuHMdW4QP88Lbsg6iDVRi6UG4Lr4AdiX-4nnyS+dSu625SFfA@mail.gmail.com>
	<52681FE2-000000C0@tuxist.de>
	<CAMuHMdVjHsKUBwne9zDjdpfnUr0-okYUL4sH-yxUJsXN3t+yHQ@mail.gmail.com>
	<526833A2.3040906@physik.fu-berlin.de>
	<CAMuHMdW9QDZGq0_yzOwUbk634q583LFYz=cYFsv0eE9LYVdP1w@mail.gmail.com>
	<526BFDDF.4030407@tuxist.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:59576 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753286Ab3KLJTl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 Nov 2013 04:19:41 -0500
Received: by mail-pb0-f48.google.com with SMTP id mc17so4332756pbc.21
        for <linux-m68k@vger.kernel.org>; Tue, 12 Nov 2013 01:19:41 -0800 (PST)
In-Reply-To: <526BFDDF.4030407@tuxist.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Tuxist <tuxist@tuxist.de>

---------- Forwarded message ----------
From: Tuxist <tuxist@tuxist.de>
Date: Sat, Oct 26, 2013 at 7:37 PM
Subject: Re: 3.12 won't startup at amiga 1200 [Antworten] [AntwortenAnAlle]
To: Geert Uytterhoeven <geert@linux-m68k.org>



Am 24.10.2013 10:41, schrieb Geert Uytterhoeven:
> On Wed, Oct 23, 2013 at 10:37 PM, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>> On 10/23/2013 10:10 PM, Geert Uytterhoeven wrote:
>>> On Wed, Oct 23, 2013 at 9:13 PM, Tuxist <tuxist@tuxist.de> wrote:
>>>> my last config http://tuxist.de/config-3.12-rc6
>>> That one crashes badly on ARAnyM, as the SMC Ultra Ethernet driver
>>> does some bad pokes:
>>>
>>> Unable to handle kernel access at virtual address 80a30206
>>> Oops: 00000000
>>> PC: [<0032ca1e>] ultra_probe1+0x26/0x38a
>>>
>>> Disabling CONFIG_AMIGA_PCMCIA to get rid of all the obsolete ISA
>>> drivers that probably won't work on m68k hardware...
>> Uh, isn't the Amiga PCMCIA stack completely different from the regular
>> PCMCIA/PCCard stack of the kernel used for PC hardware?
> Yes.
>
>> I'm using CONFIG_AMIGA_PCMCIA with 3.2.0-4-amiga on my A1200 with
>> a 8390-compatible PCMCIA NIC which uses apne.c without any of
>> such problems.
> But disabling CONFIG_AMIGA_PCMCIA also disables CONFIG_ISA, hence
> it disables all legacy ISA drivers that poke around in ISA I/O space, and that
> Tuxist had enabled in his .config.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

hi,

i have now successfully boot my amiga with rtc and linux-next now seem's
the fpu emulation brocken

Failure Message:

PC: [<00020840>] fp_normalize_ext+0x0/0xe

SR: 2010  SP: 079d1f3c  a2: 079e3820

d0: 079e3a7a    d1: 7fffffff    d2: f23c5438    d3: 00000002

d4: 00000005    d5: 800261b8    a0: 0000001c    a1: 079e3a0a

Process syslogd-listfil (pid: 1397, task=079e3820)

Frame format=B ssw=074d isc=0c40 isb=7fff daddr=00000018 dobuf=079d1fbc

baddr=00020844 dibuf=00000000 ver=f

Stack from 079d1fc4:

        000210c6 0001fd50 00000000 00000001 00000002 00000005 800261b8
80007710

        00000000 800055ac 800085e1 ffffffff 00000000 0008c014 90c4002c

Call Trace: [<000210c6>] fp_finalrounding+0x6/0x1a

 [<0001fd50>] fpu_emu+0x2c/0x4c

 [<0008c014>] bio_uncopy_user+0x28/0x92

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
