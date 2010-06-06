From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/11] m68k: Atari EtherNAT Updates
Date: Sun, 6 Jun 2010 10:25:08 +0200
Message-ID: <AANLkTinusfjUBq9fjzLuqv5ZXjdTO1ZC3Qu-eZ8Hsg1z@mail.gmail.com>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
	<alpine.DEB.2.00.1006060547550.1329@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:57196 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754084Ab0FFIZL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Jun 2010 04:25:11 -0400
Received: by wyi11 with SMTP id 11so1722566wyi.19
        for <linux-m68k@vger.kernel.org>; Sun, 06 Jun 2010 01:25:09 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1006060547550.1329@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Sun, Jun 6, 2010 at 05:59, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
> Was my backwards compatibility patch to the kernel ld script ever app=
lied?

No, at that time I didn't have time to look into it, and later you
said the (one) computer with that
toolchain had died (so you were going to use a newer one?).

>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - request_irq - Remove unn=
ecessary leading & from sec
>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - convert to dev_pm_ops
>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - Fix irq flags
>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - fix unused flags warning=
s on UP systems
>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - Fix up type mismatch in =
smc_drv_resume().
>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - use netdev_mc_count and =
netdev_mc_empty when approp
>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - convert multiple drivers=
 to use netdev_for_each_mc_
>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - remove trailing space in=
 messages
>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - include cleanup: slab.h
>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - convert multicast list t=
o list_head
>> =C2=A0 =C2=A0 =C2=A0 m68k: Atari EtherNAT - trans_start cleanups
>
> Lots of patches - much appreciated!

Eventually, the EtherNAT support should be merged with the standard
driver anyway,,,

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
