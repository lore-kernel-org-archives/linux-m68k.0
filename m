From: Philippe De Muyter <phdm@macqel.be>
Subject: [PATCH] m68k allow ioremapping top of memory
Date: Thu, 22 Oct 2009 15:54:54 +0200
Message-ID: <20091022135454.GA27903@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756062AbZJVNy6@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Hi all,

The test in __ioremap to reject memory ranges crossing the 0 boundary
rejects also memory ranges at the end of the memory.  Fix that.

Signed-off-by: Philippe De Muyter <phdm@macqel.be>

diff --git a/arch/m68k/mm/kmap.c b/arch/m68k/mm/kmap.c
--- a/arch/m68k/mm/kmap.c
+++ b/arch/m68k/mm/kmap.c
@@ -116,7 +115,7 @@ void __iomem *__ioremap(unsigned long ph
 	/*
 	 * Don't allow mappings that wrap..
 	 */
-	if (!size || size > physaddr + size)
+	if (!size || physaddr > (unsigned long)(-size))
 		return NULL;
 
 #ifdef CONFIG_AMIGA
