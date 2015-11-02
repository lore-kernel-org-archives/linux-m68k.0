From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.4
Date: Mon,  2 Nov 2015 09:53:22 +0100
Message-ID: <1446454402-12042-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next

for you to fetch changes up to bab84fa9cc09dfa9702029f83ea6bf8bf5ae96af:

  m68k/sun3: Use %pM format specifier to print ethernet address (2015-09-13 14:37:26 +0200)

----------------------------------------------------------------
Alexander Kuleshov (1):
      m68k/sun3: Use %pM format specifier to print ethernet address

 arch/m68k/sun3/idprom.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
