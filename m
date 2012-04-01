From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/5] m68k/atari: EtherNAT - change number of Atari
 interrupts to make room for EtherNAT interrupts
Date: Sun, 1 Apr 2012 22:39:48 +0200
Message-ID: <CAMuHMdUm8Mot6ioYemQVacCZxgYKBGBDGUz2X4Xh_zJf_ZPgKQ@mail.gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>
	<4F4B2BB6.900@gmail.com>
	<4F77C245.5090002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:52330 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753124Ab2DAUjs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Apr 2012 16:39:48 -0400
Received: by iagz16 with SMTP id z16so3261402iag.19
        for <linux-m68k@vger.kernel.org>; Sun, 01 Apr 2012 13:39:48 -0700 (PDT)
In-Reply-To: <4F77C245.5090002@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hi Michael,

On Sun, Apr 1, 2012 at 04:49, Michael Schmitz <schmitzmic@googlemail.co=
m> wrote:
> Part 1 (this): make room for the EtherNAT interrupts - they appear at
> vectors 0xc3 (USB ISP1160) and 0xc4 (SMC91C111)

Is there any specific reason you cannot use atari_register_vme_int(), l=
ike
drivers/net/ethernet/amd/atarilance.c, to avoid increasing NR_IRQS?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
