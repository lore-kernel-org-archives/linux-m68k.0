Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3807082F
	for <linux-m68k@vger.kernel.org>; Sat, 26 Oct 2024 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957366; cv=none; b=g/I3l8aOzL/OgEQV71L2bYLEkZNpzSkAs/U+yzjf3KfJi2iPv/8PzZoqm874/GR63rRL3zcxZFE6txr9dC4lvsdh+Ue95Rl9hP3rgalICZFlgGBfjfi4F+ULF/lGRNVwFzTEsnIJg6TkYNGqO4lsibLzuVMiltdkCjeID+Z4YUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957366; c=relaxed/simple;
	bh=ODAYUSgZb0kOCYRtCyWUqNeCeroPxmg+BDUQHbWj/uE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ug460v7wFwN7CqahCm1WjVNwSYy0SgrwCq90+ILCI2AHHL6nWMumZcqnr02va6ZaZla84/FhX4rHNXF8kDPWtReWdDeFSqnHB/GqvjshSmLjIw1A+KrVwkerzPFwIE6L1PWm8MnadiyaPu5uDHlGnMT03mWReuYCQrbeMkEQMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVBP7Es1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVBP7Es1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cbb6166c06so2024432a12.0
        for <linux-m68k@vger.kernel.org>; Sat, 26 Oct 2024 08:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729957361; x=1730562161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgsVGw/+SSx/csXDNyGAB5mj/p9fsRU5/kBjCEtLGdw=;
        b=YVBP7Es1CAQrFjauV1+E3OMAygLvF/5fS/QiqzGsvE81OpPPbEhe7UvBH0m0hAQ/lu
         c+t0cTanm1fyzvyL2rFAjiIzEcbJlE+WE8rGaI4PoN1MxmMxC4S+YzUc+m2uHPMimwO3
         wSqAgcdzn3uSrsNb4UffSMWk0Cm9YVYUIsAg/xUg7hUFAtTUbT/TtNP1c1GjjYxAo5qG
         +zRNQe+l9CQ/tmKG02DHo+DMyvPKbc8fA8wXaeUJAZQTfgO1t0Om8Lhc+wVTxpcxYEvS
         hDaBsniFacFiCDPsURjRsSTS3jG0pONCtaJ9NRdBFspf9v4u5qsjMmI9GsHmBNw+fXzD
         P8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957361; x=1730562161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgsVGw/+SSx/csXDNyGAB5mj/p9fsRU5/kBjCEtLGdw=;
        b=MEhUw/dNJ311v/bcMFVvUMOVXKHEo1EYvNCjkZhLyEOJFHNJNglfExDF8XOHwVu8cL
         zzF80jCNi2VEysYY2TIN+OjvilVUQhdd7fPfadv1CnlcN6LPXB5ND54CwdRdSzZ9B6hi
         HhKN5/0jqaBSTQ7fJNNkJy4IzaeSB9rWtBqok8MHSIOYxkjwTQW1mrSigl0c6R353eI0
         i3Ua7S22FTaaPKHIM49nppUJ+2luCRXR+gs/etMFiGpbyns4lUx3Av5Fy4oIS+Z9nh4H
         LNt/MrILwTxsm2AbmevXswCAkZSKqUDEOntB8+guZq7C6iOgrMzETVuo3WYOBoCnB9Cm
         wBBQ==
X-Gm-Message-State: AOJu0Yxz6poBRicQkTgffDn74olc6dJtA6v74BvasWnKQH8omrzIgxB9
	4LtMdwkXuZFGf/7htuQghNC7tkhmWkcYBIVt5nS6zEc8VQXWw2hmYbm5Mw==
X-Google-Smtp-Source: AGHT+IGnvMTaGtICGDJEskxoByBNc+GIopIKwus+vPHufM9UOs9nNIEFt2/3DTffx1CuiVbgzLcu/g==
X-Received: by 2002:a17:907:1c12:b0:a99:7177:3f6a with SMTP id a640c23a62f3a-a9de62f4b79mr251617666b.63.1729957360683;
        Sat, 26 Oct 2024 08:42:40 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:e191:6b6d:340e:d5c5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30d6fdd1sm187192466b.170.2024.10.26.08.42.38
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:42:40 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k <linux-m68k@vger.kernel.org>
Subject: [PATCH 1/1] pcmcia: gayle: initial support
Date: Sat, 26 Oct 2024 17:42:33 +0200
Message-Id: <20241026154233.351261-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241026154233.351261-1-p.pisati@gmail.com>
References: <20241026154233.351261-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/amiga/pcmcia.c          |   5 +
 arch/m68k/amiga/platform.c        |  29 +++
 arch/m68k/include/asm/amipcmcia.h |  11 ++
 drivers/pcmcia/Kconfig            |   8 +
 drivers/pcmcia/Makefile           |   1 +
 drivers/pcmcia/gayle.c            | 307 ++++++++++++++++++++++++++++++
 6 files changed, 361 insertions(+)
 create mode 100644 drivers/pcmcia/gayle.c

diff --git a/arch/m68k/amiga/pcmcia.c b/arch/m68k/amiga/pcmcia.c
index 7106f0c3639b..4bdd8ca1a481 100644
--- a/arch/m68k/amiga/pcmcia.c
+++ b/arch/m68k/amiga/pcmcia.c
@@ -66,6 +66,11 @@ int pcmcia_copy_tuple(unsigned char tuple_id, void *tuple, int max_len)
 }
 EXPORT_SYMBOL(pcmcia_copy_tuple);
 
+unsigned char pcmcia_get_voltage(void) {
+	return gayle.config & 0x03;
+}
+EXPORT_SYMBOL(pcmcia_get_voltage);
+
 void pcmcia_program_voltage(int voltage)
 {
 	unsigned char v;
diff --git a/arch/m68k/amiga/platform.c b/arch/m68k/amiga/platform.c
index d34029d7b058..2dd6c788e5a0 100644
--- a/arch/m68k/amiga/platform.c
+++ b/arch/m68k/amiga/platform.c
@@ -110,6 +110,26 @@ static const struct gayle_ide_platform_data a1200_ide_pdata __initconst = {
 	.explicit_ack	= 1,
 };
 
+static const struct resource a1200_pcmcia_resource[] __initconst = {
+	[0] = {
+		.name	= "Gayle memory",
+		.start	= GAYLE_RAM,
+		.end	= GAYLE_RAM+GAYLE_RAMSIZE-1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.name	= "Gayle attribute",
+		.start	= GAYLE_ATTRIBUTE,
+		.end	= GAYLE_ATTRIBUTE+GAYLE_ATTRIBUTESIZE-1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[2] = {
+		.name	= "Gayle I/O",
+		.start	= GAYLE_IO,
+		.end	= GAYLE_IO+(2*GAYLE_IOSIZE)-1,
+		.flags	= IORESOURCE_MEM,
+	}
+};
 
 static const struct resource a4000_ide_resource __initconst = {
 	.start	= 0xdd2000,
@@ -190,6 +210,15 @@ static int __init amiga_init_devices(void)
 						 sizeof(a1200_ide_pdata));
 		if (error)
 			return error;
+
+	}
+
+	if (AMIGAHW_PRESENT(PCMCIA)) {
+		pdev = platform_device_register_simple("amiga-gayle-pcmcia", -1,
+						       a1200_pcmcia_resource,
+						       ARRAY_SIZE(a1200_pcmcia_resource));
+		if (IS_ERR(pdev))
+			return PTR_ERR(pdev);
 	}
 
 	if (AMIGAHW_PRESENT(A4000_IDE)) {
diff --git a/arch/m68k/include/asm/amipcmcia.h b/arch/m68k/include/asm/amipcmcia.h
index 6f1ec1887d82..281345bea41e 100644
--- a/arch/m68k/include/asm/amipcmcia.h
+++ b/arch/m68k/include/asm/amipcmcia.h
@@ -19,6 +19,7 @@
 
 void pcmcia_reset(void);
 int pcmcia_copy_tuple(unsigned char tuple_id, void *tuple, int max_len);
+unsigned char pcmcia_get_voltage(void);
 void pcmcia_program_voltage(int voltage);
 void pcmcia_access_speed(int speed);
 void pcmcia_write_enable(void);
@@ -51,6 +52,16 @@ static inline void pcmcia_disable_irq(void)
 
 #define PCMCIA_INSERTED	(gayle.cardstatus & GAYLE_CS_CCDET)
 
+static inline void pcmcia_disable_ccdet_irq(void)
+{
+	gayle.inten &= ~GAYLE_IRQ_CCDET;
+}
+
+static inline u_char pcmcia_wena(void)
+{
+	return (gayle.cardstatus & GAYLE_CS_WR);
+}
+
 /* valid voltages for pcmcia_ProgramVoltage */
 
 #define PCMCIA_0V	0
diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index dddb235dd020..98883bafc95e 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -253,4 +253,12 @@ config PCCARD_NONSTATIC
 config PCCARD_IODYN
 	bool
 
+config PCMCIA_GAYLE
+	tristate "Amiga Gayle bridge support"
+	depends on PCMCIA && AMIGA && AMIGA_PCMCIA && !APNE
+	help
+	  Say Y here to include support for PCMCIA host bridges that
+	  are register compatible with Commodore's Gayle. This is found on
+	  Amiga systems. If unsure, say N.
+
 endif	# PCCARD
diff --git a/drivers/pcmcia/Makefile b/drivers/pcmcia/Makefile
index 31e0e34011bb..b89bcde972f9 100644
--- a/drivers/pcmcia/Makefile
+++ b/drivers/pcmcia/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_OMAP_CF)				+= omap_cf.o
 obj-$(CONFIG_ELECTRA_CF)			+= electra_cf.o
 obj-$(CONFIG_PCMCIA_ALCHEMY_DEVBOARD)		+= db1xxx_ss.o
 obj-$(CONFIG_PCMCIA_MAX1600)			+= max1600.o
+obj-$(CONFIG_PCMCIA_GAYLE)			+= gayle.o
 
 sa1111_cs-y					+= sa1111_generic.o
 sa1111_cs-$(CONFIG_ASSABET_NEPONSET)		+= sa1111_neponset.o
diff --git a/drivers/pcmcia/gayle.c b/drivers/pcmcia/gayle.c
new file mode 100644
index 000000000000..c951fcc4f9f7
--- /dev/null
+++ b/drivers/pcmcia/gayle.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Commodore's Gayle PC Card controller driver
+ *
+ * Copyright (c) 2024 Paolo Pisati <p.pisati@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <asm/amigaints.h>
+#include <asm/amigayle.h>
+#include <asm/amipcmcia.h>
+
+#include <pcmcia/ss.h>
+
+/* in case of emergency, break the glass */
+/* #define DEBUG */
+
+struct gayle_pcmcia_sock {
+	struct pcmcia_socket	socket;
+
+	phys_addr_t	phys_io;
+	void		*virt_io;
+	phys_addr_t	phys_attr;
+	phys_addr_t	phys_mem;
+
+	int	card_irq;
+};
+
+#define to_gayle_socket(x) container_of(x, struct gayle_pcmcia_sock, socket)
+
+static int gayle_sock_set_socket(struct pcmcia_socket *skt,
+				 struct socket_state_t *state)
+{
+	struct gayle_pcmcia_sock *sock = to_gayle_socket(skt);
+
+	dev_dbg(&skt->dev, "%s flags 0x%x csc_mask 0x%x io_irq 0x%x "
+		"Vcc %d Vpp %d\n",
+		__func__, state->flags, state->csc_mask, state->io_irq,
+		state->Vcc, state->Vpp);
+
+	if (state->Vpp && (state->Vcc != state->Vpp)) {
+		pr_err("pcmcia: unsupported Vpp %d\n", state->Vpp);
+		return -EINVAL;
+	}
+
+	if (state->flags & SS_RESET) {
+		pcmcia_reset();
+		msleep(500); /* give card time to inizialize */
+		pr_err("%s cardstatus: 0x%x\n", __func__, gayle.cardstatus);
+		pr_err("%s inten: 0x%x\n", __func__, gayle.inten);
+	}
+
+	/*
+	 * XXX shouldn't we apply power only when state->flags & SS_OUTPUT_ENA?
+	 * but if so, what's the point of setting a Vcc without powering the
+	 * socket on?
+	 */
+	switch (state->Vcc) {
+	case 0:
+		pcmcia_program_voltage(PCMCIA_0V);
+		break;
+	case 50:
+		pcmcia_program_voltage(PCMCIA_5V);
+		break;
+	default:
+		pr_err("pcmcia: unsupported Vcc %d\n", state->Vcc);
+	}
+
+	return 0;
+}
+
+static int gayle_sock_get_status(struct pcmcia_socket *skt,
+				  unsigned int *value)
+{
+	unsigned int status;
+
+	status = PCMCIA_INSERTED ? SS_DETECT : 0;
+
+	switch(pcmcia_get_voltage()) {
+		case GAYLE_CFG_5V:
+		case GAYLE_CFG_12V:
+			status |= SS_POWERON;	/* power is applied to the card */
+			break;
+		case GAYLE_CFG_0V:
+			break;
+		default:
+			status |= SS_XVCARD;	/* treated as unsupported in core */
+	}
+
+	status |= pcmcia_wena() ? 0 : SS_WRPROT;	/* card is write protected */
+
+	if (status & (SS_DETECT | SS_POWERON))
+		status |= SS_READY;
+
+	dev_dbg(&skt->dev,"%s status: 0x%x\n", __func__, status);
+	*value = status;
+
+	return 0;
+}
+
+static int gayle_sock_init(struct pcmcia_socket *skt)
+{
+	dev_dbg(&skt->dev, "%s::%d\n", __func__, __LINE__);
+	return 0;
+}
+
+static int gayle_sock_suspend(struct pcmcia_socket *skt)
+{
+	dev_dbg(&skt->dev, "%s::%d\n", __func__, __LINE__);
+	return 0;
+}
+
+static int gayle_sock_set_io_map(struct pcmcia_socket *skt,
+				    struct pccard_io_map *map)
+{
+	struct gayle_pcmcia_sock *sock = to_gayle_socket(skt);
+	dev_dbg(&skt->dev, "%s::%d\n", __func__, __LINE__);
+
+	map->start = sock->phys_io;
+	map->stop = map->start + GAYLE_IOSIZE;
+
+	return 0;
+}
+
+static int gayle_sock_set_mem_map(struct pcmcia_socket *skt,
+				     struct pccard_mem_map *map)
+{
+	struct gayle_pcmcia_sock *sock = to_gayle_socket(skt);
+	dev_dbg(&skt->dev, "%s::%d %s card_start: 0x%x\n", __func__, __LINE__,
+		(map->flags & MAP_ATTRIB) ? "ATTR" : "MEM", map->card_start);
+
+	if (map->flags & MAP_ATTRIB)
+		map->static_start = sock->phys_attr + map->card_start;
+	else
+		map->static_start = sock->phys_mem + map->card_start;
+
+	return 0;
+}
+
+static struct pccard_operations gayle_pcmcia_operations = {
+	.init			= gayle_sock_init,
+	.suspend		= gayle_sock_suspend,
+	.get_status		= gayle_sock_get_status,
+	.set_socket		= gayle_sock_set_socket,
+	.set_io_map		= gayle_sock_set_io_map,
+	.set_mem_map		= gayle_sock_set_mem_map,
+};
+
+struct gayle_pcmcia_sock *sock;
+
+static irqreturn_t gayle_stschg_irq(int irq, void *data)
+{
+	unsigned char pcmcia_intreq;
+	struct gayle_pcmcia_sock *sock = data;
+
+	pcmcia_intreq = pcmcia_get_intreq();
+	if (!(pcmcia_intreq & (GAYLE_IRQ_SC | GAYLE_IRQ_DA | GAYLE_IRQ_WR |
+			       GAYLE_IRQ_IRQ)))
+		return IRQ_NONE;
+
+	pr_debug("%s::%d intreq: 0x%x\n", __func__, __LINE__, pcmcia_intreq);
+	pcmcia_ack_int(pcmcia_get_intreq());
+	pr_debug("%s::%d intreq: 0x%x\n", __func__, __LINE__, pcmcia_get_intreq());
+	pcmcia_parse_events(&sock->socket, SS_STSCHG);
+	pr_debug("%s::%d intreq: 0x%x\n", __func__, __LINE__, pcmcia_get_intreq());
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t gayle_ccdet_irq(int irq, void *data)
+{
+	unsigned char pcmcia_intreq;
+	struct gayle_pcmcia_sock *sock = data;
+
+	pcmcia_intreq = pcmcia_get_intreq();
+	if (!(pcmcia_intreq & GAYLE_IRQ_CCDET))
+		return IRQ_NONE;
+
+	pr_debug("%s::%d intreq: 0x%x\n", __func__, __LINE__, pcmcia_intreq);
+	gayle.intreq = GAYLE_IRQ_IDE | GAYLE_IRQ_SC | GAYLE_IRQ_DA |
+		GAYLE_IRQ_WR | GAYLE_IRQ_IRQ;
+	pr_debug("%s::%d intreq: 0x%x\n", __func__, __LINE__, pcmcia_get_intreq());
+	pcmcia_parse_events(&sock->socket, SS_DETECT);
+	pr_debug("%s::%d intreq: 0x%x\n", __func__, __LINE__, pcmcia_get_intreq());
+
+	return IRQ_HANDLED;
+}
+
+
+static int gayle_pcmcia_init(struct platform_device *pdev) {
+	struct resource *r;
+	int ret;
+
+	dev_dbg(&pdev->dev, "%s::%d\n", __func__, __LINE__);
+
+	sock = kzalloc(sizeof(struct gayle_pcmcia_sock), GFP_KERNEL);
+	if (!sock)
+		return -ENOMEM;
+
+	/* card: irq assigned to the card itself. */
+	sock->card_irq = IRQ_AMIGA_PORTS;
+
+	/* PCMCIA Attribute area address */
+	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "Gayle attribute");
+	sock->phys_attr = r->start;
+
+	/* PCMCIA Memory area address */
+	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "Gayle memory");
+	sock->phys_mem = r->start;
+
+	/* PCMCIA IO area address */
+	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "Gayle I/O");
+	sock->phys_io = r->start;
+
+	sock->virt_io = (void *)(ioremap(sock->phys_io, 2*GAYLE_IOSIZE));
+	dev_dbg(&pdev->dev, "%s::%d ioremap: 0x%px\n", __func__, __LINE__,
+		sock->virt_io);
+	sock->virt_io -= GAYLE_IO;
+	dev_dbg(&pdev->dev, "%s::%d ioremap: 0x%px\n", __func__, __LINE__,
+		sock->virt_io);
+	if (!sock->virt_io) {
+		pr_err("pcmcia: cannot remap IO area\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+	sock->socket.io_offset  = (unsigned long)sock->virt_io;
+
+	sock->socket.ops	= &gayle_pcmcia_operations;
+	sock->socket.owner	= THIS_MODULE;
+	sock->socket.pci_irq	= sock->card_irq;
+	sock->socket.features	= SS_CAP_STATIC_MAP | SS_CAP_PCCARD;
+	sock->socket.map_size	= GAYLE_RAMSIZE;
+	sock->socket.dev.parent	= &pdev->dev;
+	sock->socket.resource_ops = &pccard_static_ops;
+
+	platform_set_drvdata(pdev, sock);
+
+	if (request_irq(IRQ_AMIGA_PORTS, gayle_stschg_irq, IRQF_SHARED, "pcmcia_stschg",
+			sock)) {
+		dev_dbg(&pdev->dev, "unable to setup stschg interrupt\n");
+		goto out;
+	}
+
+	if (request_irq(IRQ_AMIGA_EXTER, gayle_ccdet_irq, IRQF_SHARED, "pcmcia_ccdet",
+			sock)) {
+		dev_dbg(&pdev->dev, "unable to setup ccdet interrupt\n");
+		goto out1;
+	}
+
+	dev_dbg(&pdev->dev, "%s::%d\n", __func__, __LINE__);
+	ret = pcmcia_register_socket(&sock->socket);
+	if (ret) {
+		pr_err("pcmcia failed to register\n");
+		goto out2;
+	}
+
+	gayle.inten |= GAYLE_IRQ_CCDET | GAYLE_IRQ_SC | GAYLE_IRQ_DA |
+		GAYLE_IRQ_WR | GAYLE_IRQ_IRQ;
+	pr_err("%s inten: 0x%x\n", __func__, gayle.inten);
+
+	pr_info("Gayle pcmcia @ io/attr/mem %09x %09x %09x  card irqs @ %d\n",
+		sock->phys_io, sock->phys_attr, sock->phys_mem,
+		sock->card_irq);
+
+	return 0;
+out2:
+	free_irq(IRQ_AMIGA_EXTER, &pdev->dev);
+out1:
+	free_irq(IRQ_AMIGA_PORTS, &pdev->dev);
+out:
+	iounmap(sock->virt_io);
+	kfree(sock);
+	return ret;
+}
+
+static int gayle_pcmcia_exit(struct platform_device *pdev) {
+	dev_dbg(&pdev->dev, "%s::%d\n", __func__, __LINE__);
+
+	pcmcia_disable_irq();
+	pcmcia_disable_ccdet_irq();
+	free_irq(IRQ_AMIGA_PORTS, sock);
+	free_irq(IRQ_AMIGA_EXTER, sock);
+	iounmap(sock->virt_io);
+	pcmcia_reset();
+	pcmcia_unregister_socket(&sock->socket);
+	kfree(sock);
+
+	return 0;
+}
+
+static struct platform_driver gayle_pcmcia_driver = {
+	.driver = {
+		.name	= "amiga-gayle-pcmcia",
+	},
+	.probe		= gayle_pcmcia_init,
+	.remove		= gayle_pcmcia_exit,
+};
+
+module_platform_driver(gayle_pcmcia_driver);
+
+MODULE_AUTHOR("Paolo Pisati");
+MODULE_DESCRIPTION("Commodore's Gayle PC Card controller driver");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

