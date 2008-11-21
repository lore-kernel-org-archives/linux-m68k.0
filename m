From: Kars de Jong <jongk@linux-m68k.org>
Subject: Re: [PATCH] .gitignore update for m68k arch
Date: Fri, 21 Nov 2008 13:30:37 +0100
Message-ID: <1227270637.13195.5.camel@kars.perseus.home>
References: <1227188125.25134.2.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtpq2.tb.mail.iss.as9143.net ([212.54.42.165]:40723 "EHLO
	smtpq2.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753360AbYKUMav (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 21 Nov 2008 07:30:51 -0500
In-Reply-To: <1227188125.25134.2.camel@kars.perseus.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k kernel mailing list <linux-m68k@vger.kernel.org>

On do, 2008-11-20 at 14:35 +0100, Kars de Jong wrote:
> Subject: [PATCH] .gitignore update for m68k arch

Here is a new version, which also includes some generated files in
drivers/zorro.

From: Kars de Jong <jongk@linux-m68k.org>
Date: Fri, 21 Nov 2008 13:18:12 +0100
Subject: [PATCH] .gitignore update for m68k arch

arch/m68k/kernel/.gitignore: Added vmlinux.lds to .gitignore file because it shouldn't be tracked.
drivers/zorro/.gitignore: Added devlist.h and gen-devlist to .gitignore file because they shouldn't be tracked.

Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
---
 arch/m68k/kernel/.gitignore |    1 +
 drivers/zorro/.gitignore    |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 arch/m68k/kernel/.gitignore
 create mode 100644 drivers/zorro/.gitignore

diff --git a/arch/m68k/kernel/.gitignore b/arch/m68k/kernel/.gitignore
new file mode 100644
index 0000000..c5f676c
--- /dev/null
+++ b/arch/m68k/kernel/.gitignore
@@ -0,0 +1 @@
+vmlinux.lds
diff --git a/drivers/zorro/.gitignore b/drivers/zorro/.gitignore
new file mode 100644
index 0000000..34f980b
--- /dev/null
+++ b/drivers/zorro/.gitignore
@@ -0,0 +1,2 @@
+devlist.h
+gen-devlist
-- 
1.5.6.5



