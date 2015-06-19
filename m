From: gerg@uclinux.org
Subject: [PATCH] m68k: improve m68knommu MAINTAINERS entry
Date: Fri, 19 Jun 2015 11:13:12 +1000
Message-ID: <1434676392-12766-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntqsrv01p.mx.bigpond.com ([61.9.168.231]:53803 "EHLO
	nskntqsrv01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751818AbbFSBZ6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 18 Jun 2015 21:25:58 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Improve the information in the m68knommu maintainers entry. This
should aid in making it clearer what parts of the m68k architecture
code can go via the m68knommu git tree.

Specifically the entry now lists the relevant git tree where m68knommu
patches are promoted through. It also spells out that the coldfire
sub-architecture, and with it the directory of arch/m68k/coldfire, as
being supported via this tree.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8afd29..bd0090d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10155,11 +10155,14 @@ S:	Maintained
 F:	Documentation/filesystems/ubifs.txt
 F:	fs/ubifs/
 
-UCLINUX (AND M68KNOMMU)
+UCLINUX (M68KNOMMU AND COLDFIRE)
 M:	Greg Ungerer <gerg@uclinux.org>
 W:	http://www.uclinux.org/
+L:	linux-m68k@lists.linux-m68k.org
 L:	uclinux-dev@uclinux.org  (subscribers-only)
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
 S:	Maintained
+F:	arch/m68k/coldfire/
 F:	arch/m68k/*/*_no.*
 F:	arch/m68k/include/asm/*_no.*
 
-- 
1.9.1
