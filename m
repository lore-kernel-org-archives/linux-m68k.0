From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [RFC] fix race in drivers/char/random.c:get_reg()
Date: Sun, 30 Apr 2017 19:49:21 +1200
Message-ID: <1493538561-5075-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36715 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968649AbdD3Hta (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Apr 2017 03:49:30 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: tytso@mit.edu, linux-kernel@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>

get_reg() can be reentered on architectures with prioritized interrupts
(m68k in this case), causing f->reg_index to be incremented after the
range check. Out of bounds memory access past the pt_regs struct results.
This will go mostly undetected unless access is beyond end of memory.

Prevent the race by disabling interrupts in get_reg().

Tested on m68k (Atari Falcon, and ARAnyM emulator).

Kudos to Geert Uytterhoeven for helping to trace this race.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/char/random.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 1ef2640..7d1799b 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1115,12 +1115,16 @@ static void add_interrupt_bench(cycles_t start)
 static __u32 get_reg(struct fast_pool *f, struct pt_regs *regs)
 {
 	__u32 *ptr = (__u32 *) regs;
+	unsigned long flags;
 
 	if (regs == NULL)
 		return 0;
+	local_irq_save(flags);
 	if (f->reg_idx >= sizeof(struct pt_regs) / sizeof(__u32))
 		f->reg_idx = 0;
-	return *(ptr + f->reg_idx++);
+	ptr += f->reg_idx++;
+	local_irq_restore(flags);
+	return *ptr;
 }
 
 void add_interrupt_randomness(int irq, int irq_flags)
-- 
1.7.0.4
