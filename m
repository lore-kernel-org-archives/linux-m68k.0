From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH 2/5] m68k/atari: EtherNAT - add ISP1160 platform data
Date: Sun, 01 Apr 2012 14:58:33 +1200
Message-ID: <4F77C459.5090609@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org> <4F4B2BB6.900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:34577 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754123Ab2DAC6k (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Mar 2012 22:58:40 -0400
Received: by pbcun15 with SMTP id un15so3258603pbc.19
        for <linux-m68k@vger.kernel.org>; Sat, 31 Mar 2012 19:58:40 -0700 (PDT)
In-Reply-To: <4F4B2BB6.900@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hi All,

Part 2 in the EtherNAT patch series - USB host controller platform data.

Signed-off-by: Michael Schmitz <schmitz@debian.org>

--
 arch/m68k/atari/config.c |   63 
++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index af78731..12a76ab 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -663,7 +663,7 @@ static void atari_get_hardware_list(struct seq_file *m)
  */
 
 #define ATARI_ETHERNAT_PHYS_ADDR       0x80000000
-#define ATARI_ETHERNAT_IRQ             0xc3
+#define ATARI_ETHERNAT_IRQ             196
 
 static struct resource smc91x_resources[] = {
        [0] = {
@@ -687,8 +687,67 @@ static struct platform_device smc91x_device = {
        .resource       = smc91x_resources,
 };
 
+#define ATARI_USB_PHYS_ADDR    0x80000010
+#define ATARI_USB_IRQ          195
+
+static struct resource isp1160_resources[] = {
+       [0] = {
+               .name   = "isp1160-data",
+               .start  = ATARI_USB_PHYS_ADDR,
+               .end    = ATARI_USB_PHYS_ADDR + 0x1,
+               .flags  = IORESOURCE_MEM,
+       },
+       [1] = {
+               .name   = "isp1160-regs",
+               .start  = ATARI_USB_PHYS_ADDR + 0x2,
+               .end    = ATARI_USB_PHYS_ADDR + 0x3,
+               .flags  = IORESOURCE_MEM,
+       },
+       [2] = {
+               .name   = "isp1160-irq",
+               .start  = ATARI_USB_IRQ,
+               .end    = ATARI_USB_IRQ,
+               .flags  = IORESOURCE_IRQ,
+       },
+};
+
+static void isp1160_delay(struct device *dev, int delay)
+{
+       ndelay(delay);
+}
+
+/* 
(DataBusWidth16|AnalogOCEnable|DREQOutputPolarity|DownstreamPort15KRSel ) */
+static struct isp116x_platform_data isp1160_platform_data = {
+       /* Enable internal resistors on downstream ports */
+       .sel15Kres              = 1,
+       /* On-chip overcurrent protection */
+       .oc_enable              = 1,
+       /* INT output polarity */
+       .int_act_high           = 1,
+       /* INT edge or level triggered */
+       .int_edge_triggered     = 0,
+
+       /* WAKEUP pin connected - NOT SUPPORTED  */
+       /* .remote_wakeup_connected = 0, */
+       /* Wakeup by devices on usb bus enabled */
+       .remote_wakeup_enable   = 0,
+       .delay                  = isp1160_delay,
+};
+
+static struct platform_device isp1160_device = {
+       .name           = "isp116x-hcd",
+       .id             = -1,
+       .num_resources  = ARRAY_SIZE(isp1160_resources),
+       .resource       = isp1160_resources,
+       .dev                    = {
+               .platform_data  = &isp1160_platform_data,
+       },
+
+};
+
 static struct platform_device *atari_platform_devices[] __initdata = {
-       &smc91x_device
+       &smc91x_device,
+       &isp1160_device
 };
 
 int __init atari_platform_init(void)
