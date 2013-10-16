From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/8] Amiga Zorro updates
Date: Wed, 16 Oct 2013 13:03:17 +0200
Message-ID: <1381921405-11206-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org

Here is a set of miscellaneous updates for the Amiga Zorro bus code:
  - [1/8] Documentation/zorro.txt: Update path to arch-specific
  - [2/8] zorro: Do not allocate zorro_autocon[] statically
          This reduces memory usage, especially for multi-platform kernels
  - [3/8] zorro: Don't fill in dummy names in zorro_name_device()
  - [4/8] zorro: Refactor conditional handling of Zorro device
  - [5/8] zorro: Let the driver core handle device enumeration
  - [6/8] zorro: ZTWO_VADDR() should return "void __iomem *"
  - [7/8] zorro/UAPI: Disintegrate include/linux/zorro*.h
          This exports the Zorro definitions (again) to bootstraps.
  - [8/8] zorro/UAPI: Use proper types (endianness/size) in

All comments are welcome!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
