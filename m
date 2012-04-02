From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH] m68k/atari: EtherNAT patch series - resent as attachments
Date: Mon, 02 Apr 2012 13:15:36 +1200
Message-ID: <4F78FDB8.5060004@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org> <4F4B2BB6.900@gmail.com> <4F77C245.5090002@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030304030803010609020609"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:57888 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753730Ab2DBBPw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Apr 2012 21:15:52 -0400
Received: by iagz16 with SMTP id z16so3447574iag.19
        for <linux-m68k@vger.kernel.org>; Sun, 01 Apr 2012 18:15:52 -0700 (PDT)
In-Reply-To: <4F77C245.5090002@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

This is a multi-part message in MIME format.
--------------030304030803010609020609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

due to patch file mangling in my previous mails, here's the whole series 
again, as attachments. Apply in order, to Geert's git tree as of March 20.

Cheers,

  Michael

>
> The following patch is one in a series of patches in relation to 
> getting interrupt-driven Ethernet and USB drivers supported on the 
> Atari Falcon EtherNAT board. Whoever does have a Falcon with EtherNAT 
> (and CT60, preferably) running Linux please try out this patch series 
> to help testing these drivers. For convenience of testing, build the 
> Ethernet and USB drivers as modules please.
>
> Patches are relative to Geert's v3.3.0 (commit 
> 29c8d8820b6eba2fb6cb2702fd06095a48083595).
>
> Part 1 (this): make room for the EtherNAT interrupts - they appear at 
> vectors 0xc3 (USB ISP1160) and 0xc4 (SMC91C111)
> Part 2: add platform data for the ISP1160 driver, fix the 91C111 
> interrupt source number (the 91C111 platform data had been added quite 
> some time ago)
> Part 3: make sure the platform devices are added only if the EtherNAT 
> card is actually present
> Part 4: add usb/isp116x.h header to fix compile errors introduced in 2)
> Part 5: add Kconfig flag necessary to enable compilation of the 
> ISP1160 driver
>
> Both functions of the EtherNAT are correctly detected with this patch 
> series. Some mysterious hardware fault in my Falcon does prevent the 
> card to function properly, however (though at least the 91C111 part 
> with timer polling did use to work in thee past).
>
> The card interrupts are not being enabled by these patches yet. I need 
> to discuss with Geert the best way of enabling them as close to the 
> module loading time as possible.
>
> Cheers,
>
>  Michael
>
> Signed-off-by: Michael Schmitz <schmitz@debian.org>
>


--------------030304030803010609020609
Content-Type: text/x-patch;
 name="3.3.0-ethernat-1.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3.3.0-ethernat-1.diff"

 arch/m68k/include/asm/atariints.h |    2 +-
 arch/m68k/include/asm/irq.h       |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/atariints.h b/arch/m68k/include/asm/atariints.h
index 656bbbf..4e82683 100644
--- a/arch/m68k/include/asm/atariints.h
+++ b/arch/m68k/include/asm/atariints.h
@@ -30,7 +30,7 @@
 #define TTMFP_SOURCE_BASE  24
 #define SCC_SOURCE_BASE    40
 #define VME_SOURCE_BASE    56
-#define VME_MAX_SOURCES    16
+#define VME_MAX_SOURCES    152
 
 #define NUM_ATARI_SOURCES   (VME_SOURCE_BASE+VME_MAX_SOURCES-STMFP_SOURCE_BASE)
 
diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index c1155f0..e905b3f 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -9,9 +9,9 @@
  */
 #if defined(CONFIG_COLDFIRE)
 #define NR_IRQS 256
-#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_SUN3X)
+#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_SUN3X) || defined(CONFIG_ATARI)
 #define NR_IRQS 200
-#elif defined(CONFIG_ATARI) || defined(CONFIG_MAC)
+#elif defined(CONFIG_MAC)
 #define NR_IRQS 72
 #elif defined(CONFIG_Q40)
 #define NR_IRQS	43

--------------030304030803010609020609
Content-Type: text/x-patch;
 name="3.3.0-ethernat-2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3.3.0-ethernat-2.diff"

 arch/m68k/atari/config.c |   63 ++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index af78731..12a76ab 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -663,7 +663,7 @@ static void atari_get_hardware_list(struct seq_file *m)
  */
 
 #define ATARI_ETHERNAT_PHYS_ADDR	0x80000000
-#define ATARI_ETHERNAT_IRQ		0xc3
+#define ATARI_ETHERNAT_IRQ		196
 
 static struct resource smc91x_resources[] = {
 	[0] = {
@@ -687,8 +687,67 @@ static struct platform_device smc91x_device = {
 	.resource	= smc91x_resources,
 };
 
+#define ATARI_USB_PHYS_ADDR	0x80000010
+#define ATARI_USB_IRQ		195
+
+static struct resource isp1160_resources[] = {
+	[0] = {
+		.name	= "isp1160-data",
+		.start	= ATARI_USB_PHYS_ADDR,
+		.end	= ATARI_USB_PHYS_ADDR + 0x1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.name	= "isp1160-regs",
+		.start	= ATARI_USB_PHYS_ADDR + 0x2,
+		.end	= ATARI_USB_PHYS_ADDR + 0x3,
+		.flags	= IORESOURCE_MEM,
+	},
+	[2] = {
+		.name	= "isp1160-irq",
+		.start	= ATARI_USB_IRQ,
+		.end	= ATARI_USB_IRQ,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static void isp1160_delay(struct device *dev, int delay)
+{
+	ndelay(delay);
+}
+
+/* (DataBusWidth16|AnalogOCEnable|DREQOutputPolarity|DownstreamPort15KRSel ) */
+static struct isp116x_platform_data isp1160_platform_data = {
+	/* Enable internal resistors on downstream ports */
+	.sel15Kres		= 1,
+	/* On-chip overcurrent protection */
+	.oc_enable		= 1,
+	/* INT output polarity */
+	.int_act_high		= 1,
+	/* INT edge or level triggered */
+	.int_edge_triggered	= 0,
+
+	/* WAKEUP pin connected - NOT SUPPORTED  */
+	/* .remote_wakeup_connected = 0, */
+	/* Wakeup by devices on usb bus enabled */
+	.remote_wakeup_enable	= 0,
+	.delay			= isp1160_delay,
+};
+
+static struct platform_device isp1160_device = {
+	.name		= "isp116x-hcd",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(isp1160_resources),
+	.resource	= isp1160_resources,
+	.dev			= {
+		.platform_data	= &isp1160_platform_data,
+	},
+
+};
+
 static struct platform_device *atari_platform_devices[] __initdata = {
-	&smc91x_device
+	&smc91x_device,
+	&isp1160_device
 };
 
 int __init atari_platform_init(void)

--------------030304030803010609020609
Content-Type: text/x-patch;
 name="3.3.0-ethernat-3.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3.3.0-ethernat-3.diff"

 arch/m68k/atari/config.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 12a76ab..92bf83a 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -752,7 +752,18 @@ static struct platform_device *atari_platform_devices[] __initdata = {
 
 int __init atari_platform_init(void)
 {
-	return platform_add_devices(atari_platform_devices, ARRAY_SIZE(atari_platform_devices));
+	int rv = -ENODEV;
+	unsigned char *enatc_virt;
+
+	if (!MACH_IS_ATARI) 
+		return -ENODEV;
+
+	enatc_virt = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0xf);
+	if (hwreg_present(enatc_virt)) 
+		rv = platform_add_devices(atari_platform_devices, ARRAY_SIZE(atari_platform_devices));
+	iounmap(enatc_virt);
+
+	return rv;	
 }
 
 arch_initcall(atari_platform_init);

--------------030304030803010609020609
Content-Type: text/x-patch;
 name="3.3.0-ethernat-4.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3.3.0-ethernat-4.diff"

 arch/m68k/atari/config.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 92bf83a..aceebc2 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -32,6 +32,7 @@
 #include <linux/delay.h>
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
+#include <linux/usb/isp116x.h>
 #include <linux/vt_kern.h>
 #include <linux/module.h>
 

--------------030304030803010609020609
Content-Type: text/x-patch;
 name="3.3.0-ethernat-5.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3.3.0-ethernat-5.diff"

 arch/m68k/Kconfig.machine |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 7cdf6b0..8c31cdf 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -15,6 +15,7 @@ config ATARI
 	bool "Atari support"
 	depends on MMU
 	select MMU_MOTOROLA if MMU
+	select USB_ARCH_HAS_OHCI if USB_SUPPORT
 	help
 	  This option enables support for the 68000-based Atari series of
 	  computers (including the TT, Falcon and Medusa). If you plan to use

--------------030304030803010609020609
Content-Type: text/x-patch;
 name="3.3.0-ethernat-6.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3.3.0-ethernat-6.diff"

 drivers/net/ethernet/smsc/smc91x.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index 799d494..987755c 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -255,6 +255,8 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 #define RPC_LSA_DEFAULT         RPC_LED_100_10
 #define RPC_LSB_DEFAULT         RPC_LED_TX_RX
 
+#define SMC_IRQ_FLAGS		(IRQF_SHARED)
+
 #define SMC_DYNAMIC_BUS_CONFIG
 
 #elif defined(CONFIG_ARCH_MSM)

--------------030304030803010609020609--
