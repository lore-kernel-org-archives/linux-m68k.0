From: Greg KH <gregkh@suse.de>
Subject: [117/244] genirq: Make irq_shutdown() symmetric vs. irq_startup again
Date: Wed, 28 Sep 2011 15:01:21 -0700
Message-ID: <20110928220137.657830411__39307.7565859587$1317251817$gmane$org@clark.kroah.org>
References: <20110928220225.GA27128@kroah.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20110928220225.GA27128@kroah.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@kernel.org
Cc: stable-review@kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, alan@lxorguk.ukuu.org.uk, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Thomas Gleixner <tglx@linutronix.de>

3.0-stable review patch.  If anyone has any objections, please let us know.

------------------

From: Geert Uytterhoeven <geert@linux-m68k.org>

commit ed585a651681e822089087b426e6ebfb6d3d9873 upstream.

If an irq_chip provides .irq_shutdown(), but neither of .irq_disable() or
.irq_mask(), free_irq() crashes when jumping to NULL.
Fix this by only trying .irq_disable() and .irq_mask() if there's no
.irq_shutdown() provided.

This revives the symmetry with irq_startup(), which tries .irq_startup(),
.irq_enable(), and irq_unmask(), and makes it consistent with the comment for
irq_chip.irq_shutdown() in <linux/irq.h>, which says:

 * @irq_shutdown:	shut down the interrupt (defaults to ->disable if NULL)

This is also how __free_irq() behaved before the big overhaul, cfr. e.g.
3b56f0585fd4c02d047dc406668cb40159b2d340 ("genirq: Remove bogus conditional"),
where the core interrupt code always overrode .irq_shutdown() to
.irq_disable() if .irq_shutdown() was NULL.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Link: http://lkml.kernel.org/r/1315742394-16036-2-git-send-email-geert@linux-m68k.org
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 kernel/irq/chip.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -178,7 +178,7 @@ void irq_shutdown(struct irq_desc *desc)
 	desc->depth = 1;
 	if (desc->irq_data.chip->irq_shutdown)
 		desc->irq_data.chip->irq_shutdown(&desc->irq_data);
-	if (desc->irq_data.chip->irq_disable)
+	else if (desc->irq_data.chip->irq_disable)
 		desc->irq_data.chip->irq_disable(&desc->irq_data);
 	else
 		desc->irq_data.chip->irq_mask(&desc->irq_data);
