From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.12
Date: Tue,  2 May 2017 09:23:13 +0200
Message-ID: <1493709793-4976-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.12-tag1

for you to fetch changes up to f6ab4d59a5fe205f12287e515a43fc5e6de779b1:

  nubus: Add MVC and VSC video card definitions (2017-04-20 09:54:24 +0200)

----------------------------------------------------------------
m68k updates for 4.12

  - More kernel message modernizations and cleanups,
  - Mac and Nubus improvements and cleanups.

Thanks for pulling!

----------------------------------------------------------------
David Huggins-Daines (2):
      nubus: Fix nubus_rewinddir
      nubus: Clean up printk calls

Finn Thain (4):
      m68k/mac: Adopt platform_device_register_simple()
      m68k/mac: Clarify IOP message alloc/free confusion
      nubus: Clean up whitespace
      nubus: Add MVC and VSC video card definitions

Geert Uytterhoeven (2):
      m68k/mac: IOP - Modernize printing of kernel messages
      m68k/mac: Modernize printing of kernel messages

 arch/m68k/mac/config.c     |  61 ++----
 arch/m68k/mac/iop.c        |  93 ++++-----
 arch/m68k/mac/misc.c       |  23 +--
 drivers/nubus/nubus.c      | 459 +++++++++++++++++++++------------------------
 include/uapi/linux/nubus.h |   4 +-
 5 files changed, 278 insertions(+), 362 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
