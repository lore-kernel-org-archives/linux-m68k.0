From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/6] m68k: merge and clean up files in m68k/lib
Date: Wed, 6 Apr 2011 21:36:13 +0200
Message-ID: <BANLkTin1z7CMVdApJWtCQLyhVv-ZKAtT8A@mail.gmail.com>
References: <1301471907-10204-1-git-send-email-gerg@uclinux.org>
	<AANLkTi=KoiaabjifdcB+YC1hiE9mb+CJz07Xfn588j7e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64310 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753888Ab1DFTgP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Apr 2011 15:36:15 -0400
Received: by bwz15 with SMTP id 15so1437551bwz.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Apr 2011 12:36:14 -0700 (PDT)
In-Reply-To: <AANLkTi=KoiaabjifdcB+YC1hiE9mb+CJz07Xfn588j7e@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@vger.kernel.org

On Wed, Mar 30, 2011 at 20:41, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> Hi Greg,
>
> On Wed, Mar 30, 2011 at 09:58, Greg Ungerer <gerg@uclinux.org> wrote:
>> The following set of patches cleans up and merges individual files i=
n
>> the arch/m68k/lib directory. Mostly strait forward stuff,
>>
>> I have build and run tested on ARAnyM/Atari and ColdFire (non-mmu)
>> targets.

> Anyway, I did a thorough review, so consider it
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Upon actually trying it, I get:

arch/m68k/kernel/setup_mm.c:488: undefined reference to `strcpy'
arch/m68k/q40/config.c:149: undefined reference to `strcpy'
arch/m68k/atari/config.c:582: undefined reference to `strcpy'
arch/m68k/atari/config.c:588: undefined reference to `strcpy'
arch/m68k/atari/config.c:604: undefined reference to `strcpy'
arch/m68k/mac/built-in.o:arch/m68k/mac/config.c:916: more undefined
references to `strcpy' follow

Some of these are sprintf() or strcat() calls, "optimized" into strcpy(=
) by gcc
(4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)). Should have thought ab=
out
that, cfr. commit f9b07897c6288d7e5fc1fd004fccb0c5f1a0e570
("m68k: Uninline strchr()").
But not all of them: some are real strcpy() calls. Why are they the
inline version?

Reverting 7a2dc626ba38595bf04c663d834c394e7c0aa1f7 ("m68k: remove no
longer used arch/m68k/lib/string.c") fixes this.

So we need to keep at least the out-of-line strcpy().

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
