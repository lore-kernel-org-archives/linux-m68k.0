From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: M68k tree updates
Date: Wed, 25 Nov 2009 22:20:27 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0911252213340.31650@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>

It took me a while, but finally I managed to update
http://git.kernel.org/?p=linux/kernel/git/geert/linux-m68k.git again.

I added the following to master (the main development branch):

Andreas Schwab (2):
      m68k: use generic code for ptrace requests
      m68k: ptrace fixes

Geert Uytterhoeven (5):
      rtc: Add an RTC driver for the Oki MSM6242
      rtc: Add an RTC driver for the Ricoh RP5C01
      kgdb: Replace strstr() by strchr() for single-character needles
      net: ETHOC should depend on HAS_DMA
      dvb: SMS_SIANO_MDTV should depend on HAS_DMA

John Kacur (1):
      m68k: Remove the BKL from sys_execve

Krzysztof Helt (1):
      fbdev: atafb - add palette register check

Roel Kluin (1):
      m68k: parport_mfc3 - Not makes it a bool before the comparison.

Stephen Rothwell (1):
      m68k: don't export static inline functions

Tim Abbott (2):
      m68k: Make thread_info.h usable from assembly.
      m68k: Cleanup linker scripts using new linker script macros.


I added the following to for-next (aka for-2.6.33, to submit when the merge
window for 2.6.33 opens):

Andreas Schwab (2):
      m68k: use generic code for ptrace requests
      m68k: ptrace fixes

Geert Uytterhoeven (2):
      rtc: Add an RTC driver for the Oki MSM6242
      rtc: Add an RTC driver for the Ricoh RP5C01

John Kacur (1):
      m68k: Remove the BKL from sys_execve

Krzysztof Helt (1):
      fbdev: atafb - add palette register check

Roel Kluin (1):
      m68k: parport_mfc3 - Not makes it a bool before the comparison.

Stephen Rothwell (1):
      m68k: don't export static inline functions

Tim Abbott (2):
      m68k: Make thread_info.h usable from assembly.
      m68k: Cleanup linker scripts using new linker script macros.


I haven't updated m68k-queue (the branch with clean m68k changes w.r.t.
Linus' tree) yet.

If anything is missing, please tell me. Thx!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
