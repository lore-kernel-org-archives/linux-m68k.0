Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAD025E443
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883163; cv=none; b=f14UuEkBjkcnrHaiXcZLM4bFgX5AOYrWUmGdgCul8g94i6cSdsnTrvE+UnvwdOySWvtHXPGMavcYMUvEQgTeyLRYN+qAFq27g2O6kgScJ2b0UTTjL+taoKdJK8Rlb4eavtWRPXVfoIP4v2eRM7pk6UVeHXEl+bnosO1x4mgFjYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883163; c=relaxed/simple;
	bh=+lfKqyhCPiFHuw0RbdAsFWfN+SJv+fCW6JyDwgKga+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGGRAeAsm+BJGtWdIumoODhPzUekdgXagjiw5llafCXubjvbo/cZ2aFBimCirUUkmydnzk1r2hDmjVrqJnClgPAoKfqWx0efpTd8h8E+2xEleHYpLtATRqh81Nb5ldNiHJMECbVxlnAEqGEZYWcrRTNyhh0dI9sk2MmgiaGOtrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A432BA40BA3;
	Tue, 18 Feb 2025 12:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF61C4CEE2;
	Tue, 18 Feb 2025 12:52:38 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 01/13] serial: mcf: convert to use proper platform resources
Date: Tue, 18 Feb 2025 22:46:21 +1000
Message-ID: <20250218125124.2692982-2-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218125124.2692982-1-gerg@linux-m68k.org>
References: <20250218125124.2692982-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ColdFire SoC device setup code supplies a non-standard array of
hardware address information (memory address and IRQ) for initializing
the UARTS - which it does as a single blob. The mcf serial probe
function processes the whole set in one go from a single platform entry.

Convert this setup to use the proper resource structures, with one for
each UART present on a platform. Modify the probe function to process
a single platform device per call, and use the proper platform resource
API to get the memory and IRQ addresses. This results in the proper
entries now being present in /proc/iomem.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/device.c     | 221 +++++++++++++++++++++++++++-----
 arch/m68k/include/asm/mcfuart.h |  12 +-
 drivers/tty/serial/mcf.c        |  49 +++----
 3 files changed, 218 insertions(+), 64 deletions(-)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index b6958ec2a220..8d7cec28f4d9 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -1,7 +1,7 @@
 /*
  * device.c  -- common ColdFire SoC device support
  *
- * (C) Copyright 2011, Greg Ungerer <gerg@uclinux.org>
+ * (C) Copyright 2011,2025 Greg Ungerer <gerg@linux-m68k.org>
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file COPYING in the main directory of this archive
@@ -18,8 +18,8 @@
 #include <asm/traps.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
-#include <asm/mcfuart.h>
 #include <asm/mcfqspi.h>
+#include <linux/platform_device.h>
 #include <linux/platform_data/edma.h>
 #include <linux/platform_data/dma-mcf-edma.h>
 #include <linux/platform_data/mmc-esdhc-mcf.h>
@@ -27,71 +27,205 @@
 /*
  *	All current ColdFire parts contain from 2, 3, 4 or 10 UARTS.
  */
-static struct mcf_platform_uart mcf_uart_platform_data[] = {
+static struct resource mcf_uart0_resources[] = {
 	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
+		.start		= MCFUART_BASE0,
+		.end		= MCFUART_BASE0 + 0x80 - 1,
+		.flags		= IORESOURCE_MEM,
+	},
+	{
+		.start		= MCF_IRQ_UART0,
+		.end		= MCF_IRQ_UART0,
+		.flags		= IORESOURCE_IRQ,
 	},
+};
+static struct platform_device mcf_uart0 = {
+	.name			= "mcfuart",
+	.id			= 0,
+	.num_resources		= ARRAY_SIZE(mcf_uart0_resources),
+	.resource		= mcf_uart0_resources,
+};
+
+#ifdef MCFUART_BASE1
+static struct resource mcf_uart1_resources[] = {
 	{
-		.mapbase	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
+		.start		= MCFUART_BASE1,
+		.end		= MCFUART_BASE1 + 0x80 - 1,
+		.flags		= IORESOURCE_MEM,
 	},
+	{
+		.start		= MCF_IRQ_UART1,
+		.end		= MCF_IRQ_UART1,
+		.flags		= IORESOURCE_IRQ,
+	},
+};
+static struct platform_device mcf_uart1 = {
+	.name			= "mcfuart",
+	.id			= 1,
+	.num_resources		= ARRAY_SIZE(mcf_uart1_resources),
+	.resource		= mcf_uart1_resources,
+};
+#endif
 #ifdef MCFUART_BASE2
+static struct resource mcf_uart2_resources[] = {
 	{
-		.mapbase	= MCFUART_BASE2,
-		.irq		= MCF_IRQ_UART2,
+		.start		= MCFUART_BASE2,
+		.end		= MCFUART_BASE2 + 0x80 - 1,
+		.flags		= IORESOURCE_MEM,
 	},
+	{
+		.start		= MCF_IRQ_UART2,
+		.end		= MCF_IRQ_UART2,
+		.flags		= IORESOURCE_IRQ,
+	},
+};
+static struct platform_device mcf_uart2 = {
+	.name			= "mcfuart",
+	.id			= 2,
+	.num_resources		= ARRAY_SIZE(mcf_uart2_resources),
+	.resource		= mcf_uart2_resources,
+};
 #endif
 #ifdef MCFUART_BASE3
+static struct resource mcf_uart3_resources[] = {
+	{
+		.start		= MCFUART_BASE3,
+		.end		= MCFUART_BASE3 + 0x80 - 1,
+		.flags		= IORESOURCE_MEM,
+	},
 	{
-		.mapbase	= MCFUART_BASE3,
-		.irq		= MCF_IRQ_UART3,
+		.start		= MCF_IRQ_UART3,
+		.end		= MCF_IRQ_UART3,
+		.flags		= IORESOURCE_IRQ,
 	},
+};
+static struct platform_device mcf_uart3 = {
+	.name			= "mcfuart",
+	.id			= 3,
+	.num_resources		= ARRAY_SIZE(mcf_uart3_resources),
+	.resource		= mcf_uart3_resources,
+};
 #endif
 #ifdef MCFUART_BASE4
+static struct resource mcf_uart4_resources[] = {
 	{
-		.mapbase	= MCFUART_BASE4,
-		.irq		= MCF_IRQ_UART4,
+		.start		= MCFUART_BASE4,
+		.end		= MCFUART_BASE4 + 0x80 - 1,
+		.flags		= IORESOURCE_MEM,
 	},
+	{
+		.start		= MCF_IRQ_UART4,
+		.end		= MCF_IRQ_UART4,
+		.flags		= IORESOURCE_IRQ,
+	},
+};
+static struct platform_device mcf_uart4 = {
+	.name			= "mcfuart",
+	.id			= 4,
+	.num_resources		= ARRAY_SIZE(mcf_uart4_resources),
+	.resource		= mcf_uart4_resources,
+};
 #endif
 #ifdef MCFUART_BASE5
+static struct resource mcf_uart5_resources[] = {
 	{
-		.mapbase	= MCFUART_BASE5,
-		.irq		= MCF_IRQ_UART5,
+		.start		= MCFUART_BASE5,
+		.end		= MCFUART_BASE5 + 0x80 - 1,
+		.flags		= IORESOURCE_MEM,
 	},
+	{
+		.start		= MCF_IRQ_UART5,
+		.end		= MCF_IRQ_UART5,
+		.flags		= IORESOURCE_IRQ,
+	},
+};
+static struct platform_device mcf_uart5 = {
+	.name			= "mcfuart",
+	.id			= 5,
+	.num_resources		= ARRAY_SIZE(mcf_uart5_resources),
+	.resource		= mcf_uart5_resources,
+};
 #endif
 #ifdef MCFUART_BASE6
+static struct resource mcf_uart6_resources[] = {
 	{
-		.mapbase	= MCFUART_BASE6,
-		.irq		= MCF_IRQ_UART6,
+		.start		= MCFUART_BASE6,
+		.end		= MCFUART_BASE6 + 0x80 - 1,
+		.flags		= IORESOURCE_MEM,
+	},
+	{
+		.start		= MCF_IRQ_UART6,
+		.end		= MCF_IRQ_UART6,
+		.flags		= IORESOURCE_IRQ,
 	},
+};
+static struct platform_device mcf_uart6 = {
+	.name			= "mcfuart",
+	.id			= 6,
+	.num_resources		= ARRAY_SIZE(mcf_uart6_resources),
+	.resource		= mcf_uart6_resources,
+};
 #endif
 #ifdef MCFUART_BASE7
+static struct resource mcf_uart7_resources[] = {
+	{
+		.start		= MCFUART_BASE7,
+		.end		= MCFUART_BASE7 + 0x80 - 1,
+		.flags		= IORESOURCE_MEM,
+	},
 	{
-		.mapbase	= MCFUART_BASE7,
-		.irq		= MCF_IRQ_UART7,
+		.start		= MCF_IRQ_UART7,
+		.end		= MCF_IRQ_UART7,
+		.flags		= IORESOURCE_IRQ,
 	},
+};
+static struct platform_device mcf_uart7 = {
+	.name			= "mcfuart",
+	.id			= 7,
+	.num_resources		= ARRAY_SIZE(mcf_uart7_resources),
+	.resource		= mcf_uart7_resources,
+};
 #endif
 #ifdef MCFUART_BASE8
+static struct resource mcf_uart8_resources[] = {
+	{
+		.start		= MCFUART_BASE8,
+		.end		= MCFUART_BASE8 + 0x80 - 1,
+		.flags		= IORESOURCE_MEM,
+	},
 	{
-		.mapbase	= MCFUART_BASE8,
-		.irq		= MCF_IRQ_UART8,
+		.start		= MCF_IRQ_UART8,
+		.end		= MCF_IRQ_UART8,
+		.flags		= IORESOURCE_IRQ,
 	},
+};
+static struct platform_device mcf_uart8 = {
+	.name			= "mcfuart",
+	.id			= 8,
+	.num_resources		= ARRAY_SIZE(mcf_uart8_resources),
+	.resource		= mcf_uart8_resources,
+};
 #endif
 #ifdef MCFUART_BASE9
+static struct resource mcf_uart9_resources[] = {
 	{
-		.mapbase	= MCFUART_BASE9,
-		.irq		= MCF_IRQ_UART9,
+		.start		= MCFUART_BASE9,
+		.end		= MCFUART_BASE9 + 0x80 - 1,
+		.flags		= IORESOURCE_MEM,
+	},
+	{
+		.start		= MCF_IRQ_UART9,
+		.end		= MCF_IRQ_UART9,
+		.flags		= IORESOURCE_IRQ,
 	},
-#endif
-	{ },
 };
-
-static struct platform_device mcf_uart = {
+static struct platform_device mcf_uart9 = {
 	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= mcf_uart_platform_data,
+	.id			= 9,
+	.num_resources		= ARRAY_SIZE(mcf_uart9_resources),
+	.resource		= mcf_uart9_resources,
 };
+#endif
 
 #ifdef MCFFEC_BASE0
 
@@ -623,7 +757,34 @@ static struct platform_device mcf_flexcan0 = {
 #endif /* MCFFLEXCAN_SIZE */
 
 static struct platform_device *mcf_devices[] __initdata = {
-	&mcf_uart,
+	&mcf_uart0,
+#ifdef MCFUART_BASE1
+	&mcf_uart1,
+#endif
+#ifdef MCFUART_BASE2
+	&mcf_uart2,
+#endif
+#ifdef MCFUART_BASE3
+	&mcf_uart3,
+#endif
+#ifdef MCFUART_BASE4
+	&mcf_uart4,
+#endif
+#ifdef MCFUART_BASE5
+	&mcf_uart5,
+#endif
+#ifdef MCFUART_BASE6
+	&mcf_uart6,
+#endif
+#ifdef MCFUART_BASE7
+	&mcf_uart7,
+#endif
+#ifdef MCFUART_BASE8
+	&mcf_uart8,
+#endif
+#ifdef MCFUART_BASE9
+	&mcf_uart9,
+#endif
 #ifdef MCFFEC_BASE0
 	&mcf_fec0,
 #endif
diff --git a/arch/m68k/include/asm/mcfuart.h b/arch/m68k/include/asm/mcfuart.h
index a1f35352f328..8bf626af3817 100644
--- a/arch/m68k/include/asm/mcfuart.h
+++ b/arch/m68k/include/asm/mcfuart.h
@@ -4,7 +4,7 @@
 /*
  *	mcfuart.h -- ColdFire internal UART support defines.
  *
- *	(C) Copyright 1999-2003, Greg Ungerer (gerg@snapgear.com)
+ *	(C) Copyright 1999-2003, 2025 Greg Ungerer (gerg@linux-m68k.org)
  * 	(C) Copyright 2000, Lineo Inc. (www.lineo.com) 
  */
 
@@ -13,16 +13,6 @@
 #define	mcfuart_h
 /****************************************************************************/
 
-#include <linux/serial_core.h>
-#include <linux/platform_device.h>
-
-struct mcf_platform_uart {
-	unsigned long	mapbase;	/* Physical address base */
-	void __iomem	*membase;	/* Virtual address if mapped */
-	unsigned int	irq;		/* Interrupt vector */
-	unsigned int	uartclk;	/* UART clock rate */
-};
-
 /*
  *	Define the ColdFire UART register set addresses.
  */
diff --git a/drivers/tty/serial/mcf.c b/drivers/tty/serial/mcf.c
index 93e7dda4d39a..fd8cf3399855 100644
--- a/drivers/tty/serial/mcf.c
+++ b/drivers/tty/serial/mcf.c
@@ -4,7 +4,7 @@
 /*
  *	mcf.c -- Freescale ColdFire UART driver
  *
- *	(C) Copyright 2003-2007, Greg Ungerer <gerg@uclinux.org>
+ *	(C) Copyright 2003-2007,2025 Greg Ungerer <gerg@linux-m68k.org>
  */
 
 /****************************************************************************/
@@ -570,31 +570,34 @@ static struct uart_driver mcf_driver = {
 
 static int mcf_probe(struct platform_device *pdev)
 {
-	struct mcf_platform_uart *platp = dev_get_platdata(&pdev->dev);
 	struct uart_port *port;
-	int i;
+	struct resource *res;
 
-	for (i = 0; ((i < MCF_MAXPORTS) && (platp[i].mapbase)); i++) {
-		port = &mcf_ports[i].port;
+	if (pdev->id >= MCF_MAXPORTS)
+		return -ENODEV;
+	port = &mcf_ports[pdev->id].port;
 
-		port->line = i;
-		port->type = PORT_MCF;
-		port->mapbase = platp[i].mapbase;
-		port->membase = (platp[i].membase) ? platp[i].membase :
-			(unsigned char __iomem *) platp[i].mapbase;
-		port->dev = &pdev->dev;
-		port->iotype = SERIAL_IO_MEM;
-		port->irq = platp[i].irq;
-		port->uartclk = MCF_BUSCLK;
-		port->ops = &mcf_uart_ops;
-		port->flags = UPF_BOOT_AUTOCONF;
-		port->rs485_config = mcf_config_rs485;
-		port->rs485_supported = mcf_rs485_supported;
-		port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
-
-		uart_add_one_port(&mcf_driver, port);
-	}
+	port->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(port->membase))
+		return PTR_ERR(port->membase);
+	port->mapbase = res->start;
+
+	port->irq = platform_get_irq(pdev, 0);
+	if (port->irq < 0)
+		return port->irq;
 
+	port->line = pdev->id;
+	port->type = PORT_MCF;
+	port->dev = &pdev->dev;
+	port->iotype = SERIAL_IO_MEM;
+	port->uartclk = MCF_BUSCLK;
+	port->ops = &mcf_uart_ops;
+	port->flags = UPF_BOOT_AUTOCONF;
+	port->rs485_config = mcf_config_rs485;
+	port->rs485_supported = mcf_rs485_supported;
+	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
+
+	uart_add_one_port(&mcf_driver, port);
 	return 0;
 }
 
@@ -654,7 +657,7 @@ static void __exit mcf_exit(void)
 module_init(mcf_init);
 module_exit(mcf_exit);
 
-MODULE_AUTHOR("Greg Ungerer <gerg@uclinux.org>");
+MODULE_AUTHOR("Greg Ungerer <gerg@linux-m68k.org>");
 MODULE_DESCRIPTION("Freescale ColdFire UART driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:mcfuart");
-- 
2.43.0

