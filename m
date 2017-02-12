From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 6/6] m68k: paging_init - remove dead code
Date: Sun, 12 Feb 2017 22:12:12 +0100
Message-ID: <1486933932-585-7-git-send-email-minipli__47105.2452260212$1486933987$gmane$org@googlemail.com>
References: <1486933932-585-1-git-send-email-minipli@googlemail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1486933932-585-1-git-send-email-minipli@googlemail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, "David S. Miller" <davem@davemloft.net>, Jesper Nilsson <jesper.nilsson@axis.com>, Mikael Starvik <starvik@axis.com>, Geert Uytterhoeven <geert@linux-m68k.org>, x86@kernel.org, linux-kernel@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, linux-m68k@lists.linux-m68k.org

The macro TEST_VERIFY_AREA can never be defined as there's no
wp_works_ok variable. So just remove the dead code.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Mathias Krause <minipli@googlemail.com>
---
 arch/m68k/mm/sun3mmu.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
index b5b7d53f7283..177d776de1a0 100644
--- a/arch/m68k/mm/sun3mmu.c
+++ b/arch/m68k/mm/sun3mmu.c
@@ -44,9 +44,6 @@ void __init paging_init(void)
 	unsigned long zones_size[MAX_NR_ZONES] = { 0, };
 	unsigned long size;
 
-#ifdef TEST_VERIFY_AREA
-	wp_works_ok = 0;
-#endif
 	empty_zero_page = alloc_bootmem_pages(PAGE_SIZE);
 
 	address = PAGE_OFFSET;
-- 
1.7.10.4
