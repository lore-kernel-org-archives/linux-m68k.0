From: Kars de Jong <jongk@linux-m68k.org>
Subject: [PATCH] .gitignore update for m68k arch
Date: Thu, 20 Nov 2008 14:35:25 +0100
Message-ID: <1227188125.25134.2.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtpq3.tb.mail.iss.as9143.net ([212.54.42.166]:35951 "EHLO
	smtpq3.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751317AbYKTNfi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 20 Nov 2008 08:35:38 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k kernel mailing list <linux-m68k@vger.kernel.org>

From: Kars de Jong <jongk@linux-m68k.org>
Date: Thu, 20 Nov 2008 14:28:30 +0100
Subject: [PATCH] .gitignore update for m68k arch

arch/m68k/kernel/.gitignore: Added vmlinux.lds to .gitignore file because it shouldn't be tracked.

Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
---
 arch/m68k/kernel/.gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 arch/m68k/kernel/.gitignore

diff --git a/arch/m68k/kernel/.gitignore b/arch/m68k/kernel/.gitignore
new file mode 100644
index 0000000..c5f676c
--- /dev/null
+++ b/arch/m68k/kernel/.gitignore
@@ -0,0 +1 @@
+vmlinux.lds
-- 
1.5.6.5



