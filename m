From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] SUN3: Fix intruction faults
Date: Sun, 11 Nov 2012 13:28:37 +0100 (CET)
Message-ID: <20121111122837.1955C1DBC3@solo.franken.de>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: sammy@sammy.net, geert@linux-m68k.org

We need to bring in the page where the instruction fault happened.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---

 arch/m68k/kernel/traps.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 388e5cc..cbc624a 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -506,7 +506,7 @@ static inline void bus_error030 (struct frame *fp)
 		addr -= 2;
 
 	if (buserr_type & SUN3_BUSERR_INVALID) {
-		if (!mmu_emu_handle_fault (fp->un.fmtb.daddr, 1, 0))
+		if (!mmu_emu_handle_fault(addr, 1, 0))
 			do_page_fault (&fp->ptregs, addr, 0);
        } else {
 #ifdef DEBUG
