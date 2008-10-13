From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [patch 04/18] m68k: Add NOTES to init data so its discarded at boot
Date: Mon, 13 Oct 2008 21:58:50 +0200
Message-ID: <20081013195914.420949871@mail.of.borg>
References: <20081013195846.674654386@mail.of.borg>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from winston.telenet-ops.be ([195.130.137.75]:53390 "EHLO
	winston.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752774AbYJMUFk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Oct 2008 16:05:40 -0400
Content-Disposition: inline; filename=m68k-add-notes-to-init-data.diff
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

From: Roman Zippel <zippel@linux-m68k.org>

Add .note.gnu.build-id to init data so it's discarded at boot.

[Andreas Schwab] Use NOTES macro

Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/vmlinux-std.lds |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -74,6 +74,7 @@ SECTIONS
   .init.ramfs : { *(.init.ramfs) }
   __initramfs_end = .;
 #endif
+  NOTES
   . = ALIGN(8192);
   __init_end = .;
 

-- 
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

