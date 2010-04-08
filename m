From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: ARAnyM - nfblock needs <linux/slab.h>
Date: Thu, 8 Apr 2010 23:31:38 +0200
Message-ID: <k2t10f740e81004081431gda8d085ncb405b49840a9553@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:38198 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933038Ab0DHVbj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 8 Apr 2010 17:31:39 -0400
Received: by wwi17 with SMTP id 17so519217wwi.19
        for <linux-m68k@vger.kernel.org>; Thu, 08 Apr 2010 14:31:38 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Needed on current 2.6.34-rc3

 arch/m68k/emu/nfblock.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
index 3d584f1..fed2883 100644
--- a/arch/m68k/emu/nfblock.c
+++ b/arch/m68k/emu/nfblock.c
@@ -16,6 +16,7 @@
 #include <linux/genhd.h>
 #include <linux/blkdev.h>
 #include <linux/hdreg.h>
+#include <linux/slab.h>

 #include <asm/natfeat.h>

-- 
1.6.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
