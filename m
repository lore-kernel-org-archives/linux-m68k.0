From: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] kexec: distribute kexec/arch/m68k/bootinfo.h
Date: Mon, 22 Sep 2014 22:04:59 +0200
Message-ID: <87r3z3bevo.fsf_-_@igel.home>
References: <1381859460-13645-1-git-send-email-geert@linux-m68k.org>
	<1381859460-13645-4-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381859460-13645-4-git-send-email-geert@linux-m68k.org> (Geert
	Uytterhoeven's message of "Tue, 15 Oct 2013 19:51:00 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 kexec/arch/m68k/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kexec/arch/m68k/Makefile b/kexec/arch/m68k/Makefile
index 7b13564..eeaacbd 100644
--- a/kexec/arch/m68k/Makefile
+++ b/kexec/arch/m68k/Makefile
@@ -10,5 +10,6 @@ m68k_ADD_SEGMENT =
 m68k_VIRT_TO_PHYS =
 
 dist += kexec/arch/m68k/Makefile $(m68k_KEXEC_SRCS)			\
+	kexec/arch/m68k/bootinfo.h					\
 	kexec/arch/m68k/kexec-m68k.h					\
 	kexec/arch/m68k/include/arch/options.h
-- 
2.1.1

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
