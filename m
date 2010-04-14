From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [git pull] m68k updates for 2.6.34
Date: Wed, 14 Apr 2010 19:56:24 +0200
Message-ID: <k2m10f740e81004141056xa6b6328dxb52c4cbc7d6f0a07@mail.gmail.com>
References: <alpine.DEB.2.00.1003292048530.3832@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:41546 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754246Ab0DNR4Y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 14 Apr 2010 13:56:24 -0400
In-Reply-To: <alpine.DEB.2.00.1003292048530.3832@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Mon, Mar 29, 2010 at 20:52, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> Please pull to receive 2 more m68k updates for 2.6.34:
> =C2=A0- The first one fixes a build problem we started seeing lately,
> =C2=A0- The second one corrects struct sigcontext for ColdFire, as I'=
ve
> =C2=A0 =C2=A0accidentally merged the wrong version of a patch for the=
 previous
> =C2=A0 =C2=A0pull request.
>
> Thanks!

This one is still valid, I've just rebased to the latest version.
Thaks for pulling!

The following changes since commit 2ba3abd8186f24c7fb418927025b4e2120e3=
a362:
  Linus Torvalds (1):
        Merge branch 'pm-fixes' of git://git.kernel.org/.../rafael/susp=
end-2.6

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-=
linus

Geert Uytterhoeven (1):
      m68k: Fix asm constraints for atomic_sub_and_test() and
atomic_add_negative()

Maxim Kuvyrkov (1):
      m68k: Fix `struct sigcontext' for ColdFire

 arch/m68k/include/asm/atomic_mm.h  |    8 ++++++--
 arch/m68k/include/asm/sigcontext.h |    4 +---
 2 files changed, 7 insertions(+), 5 deletions(-)

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
