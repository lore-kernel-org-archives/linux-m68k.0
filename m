From: Denis Efremov <yefremov.denis@gmail.com>
Subject: [PATCH 18/21] m68k/sun3/: remove inline marking of EXPORT_SYMBOL functions
Date: Thu,  9 May 2013 14:36:56 +0400
Message-ID: <1368095819-11011-7-git-send-email-yefremov.denis__13996.4033653543$1368096076$gmane$org@gmail.com>
References: <1368086241-9357-1-git-send-email-yefremov.denis@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1368086241-9357-1-git-send-email-yefremov.denis@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Creasey <sammy@sammy.net>
Cc: Denis Efremov <yefremov.denis@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, trivial@kernel.org, ldv-project@linuxtesting.org

EXPORT_SYMBOL and inline directives are contradictory to each other.
The patch fixes this inconsistency.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Denis Efremov <yefremov.denis@gmail.com>
---
 arch/m68k/sun3/sun3dvma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/sun3/sun3dvma.c b/arch/m68k/sun3/sun3dvma.c
index ca0966c..cab5448 100644
--- a/arch/m68k/sun3/sun3dvma.c
+++ b/arch/m68k/sun3/sun3dvma.c
@@ -275,7 +275,7 @@ void dvma_init(void)
 
 }
 
-inline unsigned long dvma_map_align(unsigned long kaddr, int len, int align)
+unsigned long dvma_map_align(unsigned long kaddr, int len, int align)
 {
 
 	unsigned long baddr;
-- 
1.8.1.4
