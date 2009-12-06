From: Philippe De Muyter <phdm@macqel.be>
Subject: [PATCH m68k resent] allow ioremapping top of memory
Date: Sun, 6 Dec 2009 20:28:41 +0100
Message-ID: <20091206192841.GA23088@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay007.isp.belgacom.be ([195.238.6.173]:39065 "EHLO
	mailrelay007.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757473AbZLFT3C (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Dec 2009 14:29:02 -0500
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

Hi Geert and all,

The test in __ioremap to reject memory ranges crossing the 0 boundary
rejects also memory ranges ending at the end of the memory.  Fix that.

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
