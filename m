From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 09/11] m68k: Atari EtherNAT - include cleanup: slab.h
Date: Wed, 26 May 2010 19:48:51 +0200
Message-ID: <1274896133-19590-10-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from juliette.telenet-ops.be ([195.130.137.74]:53297 "EHLO
	juliette.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757426Ab0EZRtV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:21 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 5a0e3ad6af8660be21ca98a971cd00f331318c05 ("include cleanup: Update
gfp.h and slab.h includes to prepare for breaking implicit slab.h inclusion
from percpu.h")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index ce8bd22..ee8e5e9 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -70,7 +70,6 @@ static const char version[] =
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
-#include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/errno.h>
-- 
1.7.0.4
