From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] M68K-Amiga: Use seq_puts() in amiga_get_hardware_list()
Date: Sun, 23 Oct 2016 23:11:20 +0200
Message-ID: <6d2b718d-392a-8a41-87cd-6cc1ef1dfb1c@users.sourceforge.net>
References: <cc9b366d-4d5e-3ed6-4665-cbc577c69f74@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <cc9b366d-4d5e-3ed6-4665-cbc577c69f74@users.sourceforge.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Oct 2016 22:55:03 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/m68k/amiga/config.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index ddb8192..65f63a4 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -786,8 +786,7 @@ static void amiga_get_hardware_list(struct seq_file *m)
 	if (AMIGAHW_PRESENT(name))			\
 		seq_printf (m, "\t%s\n", str)
 
-	seq_printf (m, "Detected hardware:\n");
-
+	seq_puts(m, "Detected hardware:\n");
 	AMIGAHW_ANNOUNCE(AMI_VIDEO, "Amiga Video");
 	AMIGAHW_ANNOUNCE(AMI_BLITTER, "Blitter");
 	AMIGAHW_ANNOUNCE(AMBER_FF, "Amber Flicker Fixer");
-- 
2.10.1
