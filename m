From: sfking@fdwdc.com
Subject: [PATCH 13/13] generic GPIO support misc files.
Date: Fri, 19 Jun 2009 18:11:12 -0700
Message-ID: <1245460272-4329-14-git-send-email-sfking@fdwdc.com>
References: <1245460272-4329-1-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-2-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-3-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-4-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-5-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-6-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-7-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-8-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-9-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-10-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-11-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-12-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-13-git-send-email-sfking@fdwdc.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1245460272-4329-13-git-send-email-sfking@fdwdc.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: linux-kernel@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: linux-m68k@vger.kernel.org

The definition of MCFSIM_PADDR and MCFSIM_PADAT now has MCF_BAR already added in.

Signed-off-by: Steven King <sfking@fdwdc.com>
---
 arch/m68k/include/asm/mcfsmc.h |    6 +++---
 arch/m68k/include/asm/nettel.h |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/mcfsmc.h b/arch/m68k/include/asm/mcfsmc.h
index 2d7a4db..527bea5 100644
--- a/arch/m68k/include/asm/mcfsmc.h
+++ b/arch/m68k/include/asm/mcfsmc.h
@@ -167,15 +167,15 @@ void smc_remap(unsigned int ioaddr)
 	static int		once = 0;
 	extern unsigned short	ppdata;
 	if (once++ == 0) {
-		*((volatile unsigned short *)(MCF_MBAR+MCFSIM_PADDR)) = 0x00ec;
+		*((volatile unsigned short *)MCFSIM_PADDR) = 0x00ec;
 		ppdata |= 0x0080;
-		*((volatile unsigned short *)(MCF_MBAR+MCFSIM_PADAT)) = ppdata;
+		*((volatile unsigned short *)MCFSIM_PADAT) = ppdata;
 		outw(0x0001, ioaddr + BANK_SELECT);
 		outw(0x0001, ioaddr + BANK_SELECT);
 		outw(0x0067, ioaddr + BASE);
 
 		ppdata &= ~0x0080;
-		*((volatile unsigned short *)(MCF_MBAR+MCFSIM_PADAT)) = ppdata;
+		*((volatile unsigned short *)MCFSIM_PADAT) = ppdata;
 	}
 	
 	*((volatile unsigned short *)(MCF_MBAR+MCFSIM_CSCR3)) = 0x1180;
diff --git a/arch/m68k/include/asm/nettel.h b/arch/m68k/include/asm/nettel.h
index 0299f6a..4dec2d9 100644
--- a/arch/m68k/include/asm/nettel.h
+++ b/arch/m68k/include/asm/nettel.h
@@ -48,14 +48,14 @@ extern volatile unsigned short ppdata;
 static __inline__ unsigned int mcf_getppdata(void)
 {
 	volatile unsigned short *pp;
-	pp = (volatile unsigned short *) (MCF_MBAR + MCFSIM_PADAT);
+	pp = (volatile unsigned short *) MCFSIM_PADAT;
 	return((unsigned int) *pp);
 }
 
 static __inline__ void mcf_setppdata(unsigned int mask, unsigned int bits)
 {
 	volatile unsigned short *pp;
-	pp = (volatile unsigned short *) (MCF_MBAR + MCFSIM_PADAT);
+	pp = (volatile unsigned short *) MCFSIM_PADAT;
 	ppdata = (ppdata & ~mask) | bits;
 	*pp = ppdata;
 }
-- 
1.5.6.5

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
