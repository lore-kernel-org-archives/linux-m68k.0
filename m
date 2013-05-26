From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] m68k: Update defconfigs for v3.9
Date: Sun, 26 May 2013 09:53:09 +0200
Message-ID: <CAMuHMdXb7CTx-+s7-y4PJ7bx=Ppz5D6ScUiV=iFFHUhUOLryXA@mail.gmail.com>
References: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com>
	<20130525193301.GB10275@cynthia.pants.nu>
	<4BE4134A-EB58-454A-97B3-94960777DF3F@2013.bluespice.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:63631 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758863Ab3EZHxK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 26 May 2013 03:53:10 -0400
Received: by mail-pd0-f173.google.com with SMTP id v14so4352512pde.18
        for <linux-m68k@vger.kernel.org>; Sun, 26 May 2013 00:53:09 -0700 (PDT)
In-Reply-To: <4BE4134A-EB58-454A-97B3-94960777DF3F@2013.bluespice.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2013.bluespice.org>
Cc: Brad Boyer <flar@allandria.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitzmic@gmail.com>

On Sat, May 25, 2013 at 9:47 PM, Ingo J=C3=BCrgensmann <ij@2013.bluespi=
ce.org> wrote:
>>> arch/m68k/configs/mac_defconfig ------------------+
>>> CONFIG_MAC_PARTITION                  : y y y y y . y y y y y .
>> Shouldn't MAC_PARTITION be enabled for the mac configuration?
>
> Yeah, I wondered about that for Amiga as well, but then I noticed tha=
t the corresponding partition is not selected for none of the specific =
subarch.
> I assumed therefor that this isn't necessary and the partition is sel=
ected/included automatically when the subarch is chosen.
> But I guess Geert can explain it in more depth. :-)

Welcome to the magic of reduced defconfigs and "savedefconfig"!

If you do "make ARCH=3Dm68k mac_defconfig" resp.
"make ARCH=3Dm68k amiga_defconfig", it will expand the reduced defconfi=
g.
The MAC_PARTITION resp. AMIGA_PARTITION options will be enabled,
as they default to y in Kconfig for the Mac resp. Amiga platform.

We could also disable PARTITION_ADVANCED, but this would drop support
for non-native partition types[*]. As m68k developers/users tend to mov=
e
disks between systems, it may if more partition support is included in =
the
defconfigs.

[*] Default partition support with PARTITION_ADVANCED=3Dn would be:
  - Everybody has MSDOS and EFI support,
  - Amiga has Amiga support,
  - Atari has Atari suport,
  - Mac has Mac support.
  - Sun3/3x has Sun partition support,
  - VME has SYSV68 partition support.
The multi_defconfig would have all of them, but that kernel image may b=
e too
big to boot on all systems.

So please look at at least one of the full expanded .config files, to
see if there's
more rubbish to disable (or to enable ;-) in the non-platform-specific =
options.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
