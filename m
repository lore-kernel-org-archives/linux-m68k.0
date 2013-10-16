From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 07/16] m68k/vme: Remove unused mvme_bdid_ptr
Date: Wed, 16 Oct 2013 14:31:24 +0200
Message-ID: <1381926693-6392-8-git-send-email-geert__29829.6202476651$1381926918$gmane$org@linux-m68k.org>
References: <1381926693-6392-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381926693-6392-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/mvme16xhw.h |    2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/m68k/include/asm/mvme16xhw.h b/arch/m68k/include/asm/mvme16xhw.h
index 6117f56653d2..87fa84ad252e 100644
--- a/arch/m68k/include/asm/mvme16xhw.h
+++ b/arch/m68k/include/asm/mvme16xhw.h
@@ -7,8 +7,6 @@
 
 /* Note, bytes 12 and 13 are board no in BCD (0162,0166,0167,0177,etc) */
 
-extern long mvme_bdid_ptr;
-
 typedef struct {
 	char	bdid[4];
 	u_char	rev, mth, day, yr;
-- 
1.7.9.5
