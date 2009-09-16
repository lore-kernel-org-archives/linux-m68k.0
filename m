From: Tim Abbott <tabbott@ksplice.com>
Subject: [PATCH v2 0/2] Linker script cleanup patches for m68k
Date: Wed, 16 Sep 2009 12:44:24 -0400
Message-ID: <1253119466-19488-1-git-send-email-tabbott@ksplice.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759925AbZIPQpD@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Tim Abbott <tabbott@ksplice.com>
List-Id: linux-m68k@vger.kernel.org

This is an updated version of the patch series I sent on September 6
cleaning up the m68k architecture's linker scripts.  The only change is
that it is rebased on top of Linus's current master.

This cross-architecture linker script cleanup project is in
preparation for adding support for building the kernel with
-ffunction-sections -fdata-sections, which is a prerequisite for
Ksplice.

Tim Abbott (2):
  m68k: Make thread_info.h usable from assembly.
  m68k: Cleanup linker scripts using new linker script macros.

 arch/m68k/include/asm/thread_info_mm.h |    2 +
 arch/m68k/kernel/vmlinux-std.lds       |   53 ++++++-------------------------
 arch/m68k/kernel/vmlinux-sun3.lds      |   53 ++++++--------------------------
 3 files changed, 23 insertions(+), 85 deletions(-)
