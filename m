From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-m68k.git is back
Date: Sun, 13 Nov 2011 11:44:56 +0100
Message-ID: <CAMuHMdWJPOvrU62GuN4-3+61V5kvaPZ40g5LkqzMp5dGnK+_+w@mail.gmail.com>
References: <CAMuHMdV4BEVPKBG7=-vvZ9fjEsaFjq+8Aw11XstqxpSfR8_1NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:36942 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751174Ab1KMKo5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Nov 2011 05:44:57 -0500
In-Reply-To: <CAMuHMdV4BEVPKBG7=-vvZ9fjEsaFjq+8Aw11XstqxpSfR8_1NA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org

On Thu, Oct 13, 2011 at 09:22, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> linux-m68k.git is back, in the usual place:
>
> http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git
>
> Interesting branches:
> =C2=A0- master: main development, containing accepted changesets,
> =C2=A0- m68k-queue: (almost) identical to master, but nice changesets=
 rebased on top of
> =C2=A0 =C2=A0the latest v* tag (incl. release candidates) from Linus =
(I don't follow stable),

I added the following cleanups to master:

      m68k: Remove unused platform.c skeleton files
      m68k: Remove unused GVP IO-Extender files and config symbols
      m68k: Remove unused mc68681.h header file for MultiFace III seria=
l
      fs/fat: Reorder options to match the m68k-queue branch
      m68k/atari: Remove Atari SCC serial driver
      Revert "CONFIG_SWAP=3Dn: include/linux/swap.h needs <linux/pagema=
p.h>"
      m68k/atari: Remove superfluous comment in debug code

and now it's identical to m68k-queue. I'll keep it that way.

> =C2=A0- for-*: What's destined for a specific merge window. The lates=
t overlap with
> =C2=A0 =C2=A0for-linus/for-next,

Sometimes they may be a few commits ahead of for-linus/for-next, e.g. i=
f
those commits have to go in through another maintainer's tree.

> master and m68k-v* are never rebased. m68k-queue and for-* are rebase=
d when a
> new v* comes out.

and they may be reshuffled when commits are added.

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
