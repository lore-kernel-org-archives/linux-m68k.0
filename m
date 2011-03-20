From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/atari: SCC - Move Atari serial driver to staging
Date: Sun, 20 Mar 2011 10:11:09 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1103201010001.13805@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Cfr. commit 4c37705877e74c02c968735c2eee0f84914cf557 ("tty: move obsolete and
broken generic_serial drivers to drivers/staging/generic_serial/")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/char/Makefile                              |    1 -
 drivers/staging/generic_serial/Makefile            |    1 +
 .../{char => staging/generic_serial}/atari_scc.c   |    0
 drivers/{char => staging/generic_serial}/scc.h     |    0
 4 files changed, 1 insertions(+), 1 deletions(-)
 rename drivers/{char => staging/generic_serial}/atari_scc.c (100%)
 rename drivers/{char => staging/generic_serial}/scc.h (100%)

diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index e2b5ac5..057f654 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -5,7 +5,6 @@
 obj-y				+= mem.o random.o
 obj-$(CONFIG_TTY_PRINTK)	+= ttyprintk.o
 obj-y				+= misc.o
-obj-$(CONFIG_ATARI_SCC)		+= atari_scc.o generic_serial.o
 obj-$(CONFIG_ATARI_DSP56K)	+= dsp56k.o
 obj-$(CONFIG_VIRTIO_CONSOLE)	+= virtio_console.o
 obj-$(CONFIG_RAW_DRIVER)	+= raw.o
diff --git a/drivers/staging/generic_serial/Makefile b/drivers/staging/generic_serial/Makefile
index ffc90c8..c327828 100644
--- a/drivers/staging/generic_serial/Makefile
+++ b/drivers/staging/generic_serial/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_BVME6000_SCC)	+= generic_serial.o vme_scc.o
 obj-$(CONFIG_A2232)		+= ser_a2232.o generic_serial.o
 obj-$(CONFIG_SX)		+= sx.o generic_serial.o
 obj-$(CONFIG_RIO)		+= rio/ generic_serial.o
+obj-$(CONFIG_ATARI_SCC)		+= atari_scc.o generic_serial.o
diff --git a/drivers/char/atari_scc.c b/drivers/staging/generic_serial/atari_scc.c
similarity index 100%
rename from drivers/char/atari_scc.c
rename to drivers/staging/generic_serial/atari_scc.c
diff --git a/drivers/char/scc.h b/drivers/staging/generic_serial/scc.h
similarity index 100%
rename from drivers/char/scc.h
rename to drivers/staging/generic_serial/scc.h
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
