From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.7
Date: Mon, 16 May 2016 13:23:20 +0200
Message-ID: <1463397800-1169-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.7-tag1

for you to fetch changes up to 9a6462763b170bd22be707d5d9e2b8ba8cc4028e:

  m68k/mvme16x: Include generic <linux/rtc.h> (2016-05-03 16:02:59 +0200)

----------------------------------------------------------------
m68k updates for 4.7

  - Preparatory work for Arnd's genrtc removal series.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      m68k/bvme6000: Include generic <linux/rtc.h>
      m68k/mvme16x: Include generic <linux/rtc.h>

 arch/m68k/bvme6000/rtc.c | 2 +-
 arch/m68k/mvme16x/rtc.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
