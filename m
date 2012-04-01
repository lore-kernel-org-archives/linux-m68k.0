From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 6/5] m68k/atari: EtherNAT - use correct irq flag in atari_91C111
Date: Sun, 01 Apr 2012 16:57:13 +1200
Message-ID: <4F77E029.1090605@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org> <4F4B2BB6.900@gmail.com> <alpine.DEB.2.00.1203071053360.3196@ayla.of.borg> <4F77C726.9020106@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59234 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971Ab2DAE5U (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Apr 2012 00:57:20 -0400
Received: by pbcun15 with SMTP id un15so3313539pbc.19
        for <linux-m68k@vger.kernel.org>; Sat, 31 Mar 2012 21:57:20 -0700 (PDT)
In-Reply-To: <4F77C726.9020106@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Michael Schmitz wrote:
> Part 5 in the EtherNAT series: actually enable the necessary USB HCD 
> support option to be able to chose the ISP116x USB driver on Atari.
>
And another one (I feel a Monty Python pun coming on): make sure the 
91C111 driver is prepared to share the interrupt, otherwise it won't 
load if the EtherNEC driver has already claimed the timer interrupt 
(atari_91C111 still uses the timer as of now).

Further patches that deal with fixing a problem related to the unhandled 
interrupt watchdog as well as a rewrite of the EtherNEC driver based on 
ne.c follow.

Signed-off-by: Michael Schmitz <schmitz@debian.org>

--
 drivers/net/ethernet/smsc/smc91x.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.h 
b/drivers/net/ethernet/smsc/smc91x.h
index 799d494..987755c 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -255,6 +255,8 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 #define RPC_LSA_DEFAULT         RPC_LED_100_10
 #define RPC_LSB_DEFAULT         RPC_LED_TX_RX
 
+#define SMC_IRQ_FLAGS          (IRQF_SHARED)
+
 #define SMC_DYNAMIC_BUS_CONFIG
 
