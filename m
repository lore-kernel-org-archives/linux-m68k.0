From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/5] m68k/atari: EtherNAT - change number of Atari interrupts
 to make room for EtherNAT interrupts
Date: Wed, 04 Apr 2012 09:15:44 +1200
Message-ID: <4F7B6880.9050605@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>	<4F4B2BB6.900@gmail.com>	<4F77C245.5090002@gmail.com>	<CAMuHMdUm8Mot6ioYemQVacCZxgYKBGBDGUz2X4Xh_zJf_ZPgKQ@mail.gmail.com>	<CAOmrzkJqkLC=dhsY0AUduv3Mm7PVmbtHrsjgS6v=V14eXuuA8g@mail.gmail.com>	<CAMuHMdXnVU2ZuCVLWA27RaCm2COi_AdDE9F2hj=qBGQLB6KxuA@mail.gmail.com> <CAOmrzkJGonrmY4jztegh3JqZRW17H1sF7en765=Em+_G7SodXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080903050502080708010200"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:55604 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751552Ab2DCVP7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Apr 2012 17:15:59 -0400
Received: by iagz16 with SMTP id z16so179777iag.19
        for <linux-m68k@vger.kernel.org>; Tue, 03 Apr 2012 14:15:58 -0700 (PDT)
In-Reply-To: <CAOmrzkJGonrmY4jztegh3JqZRW17H1sF7en765=Em+_G7SodXw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

This is a multi-part message in MIME format.
--------------080903050502080708010200
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,
> The definition of  NUM_ATARI_SOURCES will need to be changed again;
> we'd best hardcode it to 140:
> For one, allowing for 152 VME interrupts will exceed the boundaries of
> the allocated bitmap (i.e. trash other memory).
> We won't need the full 200 either (I seem to have got the EtherNAT
> source numbers wrong in my earlier patch).
>
>   
See attached - the 3.3.0-ethernat patches implement switching over to 
the mainstream 91Cx driver (card detected on my Falcon, link brought up 
but not detected by the driver due to hardware problems). The 
3.3.0-atari-cleanup-num-irqs.diff sets the number of interrupt sources 
to 141 on Atari, setting the number of VME sources back to 16 so we 
don't accidentially trash memory contiguous with the free_vme_irq bitmap.

For some reason, I have to set NUM_ATARI_SOURCES to 141 to actually get 
interrupt source 140 to register. Off-by-one error somewhere in the 
generic interrupt code I'd think, but I've not been able to spot it. 
(Just increasing the number of interrupts that are registered by 
atari_init_IRQ results in 'unexpected interrupt from 112' until the cows 
come home. And yes, it happens in ARAnyM, too.)

That pretty much wraps it up for EtherNEC and EtherNAT - EtherNEC is 
fully tested by me, EtherNAT needs testing on Christian's Falcon or by 
someone else with fully functional hardware. Next project : SCSI, SCC 
serial, or what?...

Cheers,

  Michael


--------------080903050502080708010200
Content-Type: text/x-patch;
 name="3.3.0-atari-cleanup-num-irqs.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3.3.0-atari-cleanup-num-irqs.diff"

diff --git a/arch/m68k/include/asm/atariints.h b/arch/m68k/include/asm/atariints.h
index 4e82683..9229626 100644
--- a/arch/m68k/include/asm/atariints.h
+++ b/arch/m68k/include/asm/atariints.h
@@ -30,9 +30,9 @@
 #define TTMFP_SOURCE_BASE  24
 #define SCC_SOURCE_BASE    40
 #define VME_SOURCE_BASE    56
-#define VME_MAX_SOURCES    152
+#define VME_MAX_SOURCES    16
 
-#define NUM_ATARI_SOURCES   (VME_SOURCE_BASE+VME_MAX_SOURCES-STMFP_SOURCE_BASE)
+#define NUM_ATARI_SOURCES  141
 
 /* convert vector number to int source number */
 #define IRQ_VECTOR_TO_SOURCE(v)	((v) - ((v) < 0x20 ? 0x18 : (0x40-8)))
diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index e905b3f..8bd9c7f 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -9,8 +9,10 @@
  */
 #if defined(CONFIG_COLDFIRE)
 #define NR_IRQS 256
-#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_SUN3X) || defined(CONFIG_ATARI)
+#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_SUN3X) 
 #define NR_IRQS 200
+#elif defined(CONFIG_ATARI)
+#define NR_IRQS 141
 #elif defined(CONFIG_MAC)
 #define NR_IRQS 72
 #elif defined(CONFIG_Q40)

--------------080903050502080708010200
Content-Type: text/x-patch;
 name="3.3.0-ethernat-fix-irqs.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3.3.0-ethernat-fix-irqs.diff"

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 6cff09f..af273d9 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -695,7 +695,7 @@ static struct platform_device *atari_ethernec_devices[] __initdata = {
 
 
 #define ATARI_ETHERNAT_PHYS_ADDR	0x80000000
-#define ATARI_ETHERNAT_IRQ		196
+#define ATARI_ETHERNAT_IRQ		140
 
 static struct resource smc91x_resources[] = {
 	[0] = {
@@ -721,7 +721,7 @@ static struct platform_device smc91x_device = {
 
 
 #define ATARI_USB_PHYS_ADDR	0x80000010
-#define ATARI_USB_IRQ		195
+#define ATARI_USB_IRQ		139
 
 static struct resource isp1160_resources[] = {
 	[0] = {

--------------080903050502080708010200
Content-Type: text/x-patch;
 name="3.3.0-ethernat-smc91x.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3.3.0-ethernat-smc91x.diff"

diff --git a/drivers/net/ethernet/smsc/Kconfig b/drivers/net/ethernet/smsc/Kconfig
index 01893aa..c34f5ac 100644
--- a/drivers/net/ethernet/smsc/Kconfig
+++ b/drivers/net/ethernet/smsc/Kconfig
@@ -29,6 +29,22 @@ config ATARI_ETHERNAT
 	  CT/60 extension port. The driver works by polling instead of
 	  interrupts, so it is quite slow.
 
+	  To compile this driver as a module, choose M here. The module
+	  will be called smc91x.
+
+config ATARI_ETHERNAT_OLD
+	tristate "Atari EtherNAT Ethernet support - obsolete driver"
+	select CRC32
+	select MII
+	depends on ATARI
+	help
+	  Say Y to include support for the EtherNAT network adapter for the
+	  CT/60 extension port. The driver works by polling instead of
+	  interrupts, so it is quite slow.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called atari_91C111.
+
 config SMC9194
 	tristate "SMC 9194 support"
 	depends on (ISA || MAC && BROKEN)
diff --git a/drivers/net/ethernet/smsc/Makefile b/drivers/net/ethernet/smsc/Makefile
index ef228db..ac30abb 100644
--- a/drivers/net/ethernet/smsc/Makefile
+++ b/drivers/net/ethernet/smsc/Makefile
@@ -2,7 +2,8 @@
 # Makefile for the SMSC network device drivers.
 #
 
-obj-$(CONFIG_ATARI_ETHERNAT) += atari_91C111.o
+obj-$(CONFIG_ATARI_ETHERNAT) += smc91x.o
+obj-$(CONFIG_ATARI_ETHERNAT_OLD) += atari_91C111.o
 obj-$(CONFIG_SMC9194) += smc9194.o
 obj-$(CONFIG_SMC91X) += smc91x.o
 obj-$(CONFIG_PCMCIA_SMC91C92) += smc91c92_cs.o
diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index 987755c..36c17c1 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -231,7 +231,7 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 
 #include <unit/smc91111.h>
 
-#elif defined(CONFIG_ATARI_ETHERNAT) || defined(CONFIG_ATARI_ETHERNAT_MODULE)
+#elif IS_ENABLED(CONFIG_ATARI_ETHERNAT) || IS_ENABLED(CONFIG_ATARI_ETHERNAT_OLD)
 
 #define SMC_CAN_USE_8BIT        1
 #define SMC_CAN_USE_16BIT       1
@@ -1144,7 +1144,7 @@ static const char * chip_ids[ 16 ] =  {
 		}							\
 	} while (0)
 
-#if defined(CONFIG_ATARI_ETHERNAT) || defined(CONFIG_ATARI_ETHERNAT_MODULE)
+#if IS_ENABLED(CONFIG_ATARI_ETHERNAT) || IS_ENABLED(CONFIG_ATARI_ETHERNAT_OLD)
 /*
  * MSch: EtherNAT is 32 bit, so the misaligned data buffer hack applies.
  * This appears to hurt quite a lot ... we actually need to byte swap the

--------------080903050502080708010200--
