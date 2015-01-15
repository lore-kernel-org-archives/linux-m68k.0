From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.19 (take 2)
Date: Thu, 15 Jan 2015 12:31:00 +0100
Message-ID: <1421321460-4791-1-git-send-email-geert__33659.0152387091$1421321491$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit b1940cd21c0f4abdce101253e860feff547291b0:

  Linux 3.19-rc3 (2015-01-05 17:05:20 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to f27bd5bfeda5881ce283aa06408c8fa99fb950fa:

  m68k: Wire up execveat (2015-01-11 11:14:14 +0100)

Summary:
      m68k: Wire up execveat

----------------------------------------------------------------
Geert Uytterhoeven (1):
      m68k: Wire up execveat

 arch/m68k/include/asm/unistd.h      | 2 +-
 arch/m68k/include/uapi/asm/unistd.h | 1 +
 arch/m68k/kernel/syscalltable.S     | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
