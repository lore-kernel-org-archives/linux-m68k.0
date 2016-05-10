From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68k: change m68knommu maintainer email address
Date: Tue, 10 May 2016 21:29:22 +1000
Message-ID: <1462879762-23009-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:37686
	"EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750922AbcEJLjE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 10 May 2016 07:39:04 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Change my email address in the "UCLINUX (M68KNOMMU and COLDFIRE)" entry
from gerg@uclinux.org to gerg@linux-m68k.org. I intend using that for
m68k (and uclinux) specific work from now on.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a727d99..b068bb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11389,7 +11389,8 @@ F:	Documentation/filesystems/ubifs.txt
 F:	fs/ubifs/
 
 UCLINUX (M68KNOMMU AND COLDFIRE)
-M:	Greg Ungerer <gerg@uclinux.org>
+M:	Greg Ungerer <gerg@linux-m68k.org>
+W:	http://www.linux-m68k.org/
 W:	http://www.uclinux.org/
 L:	linux-m68k@lists.linux-m68k.org
 L:	uclinux-dev@uclinux.org  (subscribers-only)
-- 
1.9.1
