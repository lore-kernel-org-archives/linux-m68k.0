From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] M68K-Atari: Use seq_puts() in atari_get_hardware_list()
Date: Sun, 23 Oct 2016 23:12:20 +0200
Message-ID: <bdb745b6-c78d-9fb5-906e-b41a9b2ef7a2@users.sourceforge.net>
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
Date: Sun, 23 Oct 2016 23:00:22 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/m68k/atari/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 97a3c38..e328eaf 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -629,7 +629,7 @@ static void atari_get_hardware_list(struct seq_file *m)
 	if (ATARIHW_PRESENT(name))			\
 		seq_printf(m, "\t%s\n", str)
 
-	seq_printf(m, "Detected hardware:\n");
+	seq_puts(m, "Detected hardware:\n");
 	ATARIHW_ANNOUNCE(STND_SHIFTER, "ST Shifter");
 	ATARIHW_ANNOUNCE(EXTD_SHIFTER, "STe Shifter");
 	ATARIHW_ANNOUNCE(TT_SHIFTER, "TT Shifter");
-- 
2.10.1
