Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED902F56
	for <linux-m68k@vger.kernel.org>; Sun, 12 Jan 2025 15:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736694353; cv=none; b=aiRN6PeF3+K6eZ0jxE77HwnMLwPlPobqUqBcVSu8Q/NqfMdEaqimKtaRP1clRx7xvEuxEPOJBJvKzErHWH5CXrdntSU/SNdVK91I5WN1TXnBeXjrMJiB/QxYqnwfiDxAHKCRdPOKg/ChWxcUPLh+VYJuH3x1ScpMdVZ8Zo0h8xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736694353; c=relaxed/simple;
	bh=9DCCu3OwNYgjWEk47nubVjcY8u6KBN3yRZuCRZQo4zg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ejqt6hR30rU1oFyOhMkjoS6u+Z4aZpXjdQ8pB2BarrsKjdBzo7zMo3xyHbSird/GwiwH11eLaDOvtFNH4vRu3MvrDuClcm7VeuyDza4R7OGWLvZdpmYgZ6o8alY4c3fgfrb5zZycUZrNop7Nk9/hDH27QMhi6y8YKRsobF5QuP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqGW/x7W; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqGW/x7W"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso37436105e9.2
        for <linux-m68k@vger.kernel.org>; Sun, 12 Jan 2025 07:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736694349; x=1737299149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xY6rSKM0qrZVyHnafJS6d/bRNYMtKpnagCyDV1sVsoI=;
        b=UqGW/x7W6rnClQPNVGszQrBkUQFUryRB++AXI7FRFNG6vkWh8l9F/zmcStqH5Hq/Fv
         dfCkUj7bbvnRBCN0sCR8VgEMn4xACxY/RyIT5CIwOTwxSU92Z8BurhHE+kZC+PmbCDhy
         oRtVqrddPmXDLm67sGqeoXroVK7ecxqUeILq3ZzEXLOn+S07oMexGHvUtUdyFd1fH0Dq
         OGedA0vRue5x6EZ5KJQd1vmHWSzSPRvWS/gesE7mmLpHlysBkYbXA9ULvnGHUeqNTvLS
         CQoQrZ+npJWD6gOcEhJw9O7e5q2Y8RliND6mhge46mXq81dMV/uDRz7cbyiGa8OncnCd
         mbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736694349; x=1737299149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xY6rSKM0qrZVyHnafJS6d/bRNYMtKpnagCyDV1sVsoI=;
        b=vAC5YkYYxnb53xl++ABv1mSP7meEsdQ1KTevVDFK1RDcBVZdKxXIj6gaJr5zKwWzBm
         WBf5Kk2C15aUyWIaG6xH/0ywnyA8RiYCnrTaUjkhSnj710r5VkRD4d5UpKCjSIfZiOtJ
         3tFmMClC+DFuQLMriYEgL0F1CWYw4e+WHzHDXZi7Lh7gW8VKywt7KGop4WL9ZiVPvaj9
         IwnuvEgiI1uJsrxTx1htz1fTr9GbkJHp6ToektBqrgSe1c9RWNwTsKnBklAAWr02K/9u
         s4U0iVkc20cZsK/pvM6UPNMsAsGZnszGGXtlZ2lXclLZPFuKDRFSCZcqkmzrPHY1nnV9
         mbLw==
X-Gm-Message-State: AOJu0YxCFnMCZ+8tX9VP+mSBPK3Bl9tAQMEpGpjuyG4gvcwLTbkEAKkV
	KkiiKODK34VhBJhIkbZW/cTRVdnHi99qsZ6my3F47aaPtQhh3+Hr+4eSuPq9
X-Gm-Gg: ASbGncvcdm+KC8icunSExaHKuATsZ57Y4N0cVtKe7tidW6jZB/tWx3FX/39TyrSHPko
	uyGNtYa0Q0SB7ytDsSO+Vkvz9rm/PLSQmycWZjRUsxUl7Y2gdMrLIIIgGisxqyjaA0w/zbQcH6k
	Igg2J3GeK07tvYywFU1Fm77RWVkanhqrJAVTxsvFnIRI9Li4oRrFBbz8FlZBAHVGH4jTrfhuD+f
	rUGT/6/wSZrcxXxl9f0gO75uwY8Nz+g2h9sipnslLhRfarkEo2Hego=
X-Google-Smtp-Source: AGHT+IFTG+e7WNnbAuOwSeXMELz8HvBRIOmL1e1+oOGCBhtzcoEALSSEm2cqNgyVtGz/9qT3hm6HJw==
X-Received: by 2002:a05:600c:5801:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-436e26adf89mr172863915e9.18.1736694348832;
        Sun, 12 Jan 2025 07:05:48 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:bb2d:c803:9e9d:5dfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89f29sm148218765e9.28.2025.01.12.07.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 07:05:47 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k <linux-m68k@vger.kernel.org>
Cc: Kars de Jong <jongk@linux-m68k.org>
Subject: [PATCH 1/1] pcmcia: socket driver for Commodore's Gayle
Date: Sun, 12 Jan 2025 16:05:42 +0100
Message-Id: <20250112150542.413179-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250112150542.413179-1-p.pisati@gmail.com>
References: <20250112150542.413179-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/amiga/pcmcia.c          |  59 ++++++
 arch/m68k/amiga/platform.c        |  29 +++
 arch/m68k/include/asm/amipcmcia.h |  20 ++
 arch/m68k/include/asm/io_mm.h     |  20 +-
 drivers/pcmcia/Kconfig            |   9 +
 drivers/pcmcia/Makefile           |   1 +
 drivers/pcmcia/gayle.c            | 306 ++++++++++++++++++++++++++++++
 7 files changed, 440 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pcmcia/gayle.c

diff --git a/arch/m68k/amiga/pcmcia.c b/arch/m68k/amiga/pcmcia.c
index 63cce6b590df..21dcd2719319 100644
--- a/arch/m68k/amiga/pcmcia.c
+++ b/arch/m68k/amiga/pcmcia.c
@@ -13,20 +13,37 @@
 */
 
 #include <linux/types.h>
+#include <linux/delay.h>
 #include <linux/jiffies.h>
 #include <linux/timer.h>
 #include <linux/module.h>
 
+#include <pcmcia/ss.h>
 #include <asm/amigayle.h>
 #include <asm/amipcmcia.h>
 
 /* gayle config byte for program voltage and access speed */
 static unsigned char cfg_byte = GAYLE_CFG_0V|GAYLE_CFG_150NS;
 
+/* PCMCIA I/O maps */
+static struct pccard_io_map gayle_io_maps[MAX_IO_WIN];
+
+/*
+ * according to NetBSD (commit e26e7a8a2278 and 100db321d09e in [1])
+ * and depending on Gayle's revision, there are two methods for a PCMCIA
+ * soft-reset
+ *
+ * 1: https://github.com/NetBSD/src.git
+ */
 void pcmcia_reset(void)
 {
 	unsigned long reset_start_time = jiffies;
 
+	gayle.intreq = 0xff;
+	udelay(10);
+	gayle.intreq = 0xfc;
+	udelay(20);
+
 	gayle_reset = 0x00;
 	while (time_before(jiffies, reset_start_time + 1*HZ/100));
 	READ_ONCE(gayle_reset);
@@ -65,6 +82,11 @@ int pcmcia_copy_tuple(unsigned char tuple_id, void *tuple, int max_len)
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
@@ -119,3 +141,40 @@ void pcmcia_write_disable(void)
 }
 EXPORT_SYMBOL(pcmcia_write_disable);
 
+void gayle_set_io_win(int win, unsigned char flags, unsigned int start, unsigned int stop)
+{
+	struct pccard_io_map *map = &gayle_io_maps[win];
+
+	map->flags = flags;
+	map->start = start;
+	map->stop = stop;
+}
+
+unsigned long gayle_get_byte_base(unsigned long port)
+{
+	struct pccard_io_map *map;
+	int i;
+
+	/* Simple case first */
+	if (!(port & 1)) {
+		return (GAYLE_IO + port);
+	}
+
+	for (i = 0, map = gayle_io_maps; i < MAX_IO_WIN; i++, map++) {
+		if ((map->flags & MAP_ACTIVE) &&
+		    (port >= map->start) && (port <= map->stop)) {
+			if (map->flags & MAP_16BIT) {
+				return (GAYLE_IO + port);
+			} else {
+				/* Assume MAP_AUTOSZ works this way */
+				return (GAYLE_IO + port + ((port & 1) * GAYLE_ODD));
+			}
+		}
+	}
+
+	/* Sometimes an I/O access is done after a card has been removed. */
+	return (GAYLE_IO + port);
+}
+
+EXPORT_SYMBOL(gayle_set_io_win);
+EXPORT_SYMBOL(gayle_get_byte_base);
diff --git a/arch/m68k/amiga/platform.c b/arch/m68k/amiga/platform.c
index d34029d7b058..aff2dcfbcc98 100644
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
+		.end	= GAYLE_IO+GAYLE_IOSIZE-1,
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
index 6f1ec1887d82..7df336934fb2 100644
--- a/arch/m68k/include/asm/amipcmcia.h
+++ b/arch/m68k/include/asm/amipcmcia.h
@@ -19,10 +19,14 @@
 
 void pcmcia_reset(void);
 int pcmcia_copy_tuple(unsigned char tuple_id, void *tuple, int max_len);
+unsigned char pcmcia_get_voltage(void);
 void pcmcia_program_voltage(int voltage);
 void pcmcia_access_speed(int speed);
 void pcmcia_write_enable(void);
 void pcmcia_write_disable(void);
+void gayle_set_io_win(int win, unsigned char flags, unsigned int start, unsigned
+		      int stop);
+unsigned long gayle_get_byte_base(unsigned long port);
 
 static inline u_char pcmcia_read_status(void)
 {
@@ -39,6 +43,12 @@ static inline void pcmcia_ack_int(u_char intreq)
 	gayle.intreq = 0xf8;
 }
 
+static inline void pcmcia_ack_ccdet(void)
+{
+	/* reset GAYLE_IRQ_CCDET */
+	gayle.intreq = 0xbb;
+}
+
 static inline void pcmcia_enable_irq(void)
 {
 	gayle.inten |= GAYLE_IRQ_IRQ;
@@ -51,6 +61,16 @@ static inline void pcmcia_disable_irq(void)
 
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
diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index 090aec54b8fa..567048692999 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -56,7 +56,9 @@
 #ifdef CONFIG_AMIGA_PCMCIA
 #include <asm/amigayle.h>
 
-#define AG_ISA_IO_B(ioaddr) ( GAYLE_IO+(ioaddr)+(((ioaddr)&1)*GAYLE_ODD) )
+extern unsigned long gayle_get_byte_base(unsigned long);
+
+#define AG_ISA_IO_B(ioaddr) ( gayle_get_byte_base(ioaddr) )
 #define AG_ISA_IO_W(ioaddr) ( GAYLE_IO+(ioaddr) )
 
 #ifndef MULTI_ISA
@@ -199,20 +201,30 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
 
 
 #define isa_inb(port)      in_8(isa_itb(port))
+#define isa_outb(val,port) out_8(isa_itb(port),(val))
+#define isa_readb(p)       in_8(isa_mtb((unsigned long)(p)))
+#define isa_writeb(val,p)  out_8(isa_mtb((unsigned long)(p)),(val))
+
+#ifdef CONFIG_PCMCIA_GAYLE
+#define isa_inw(port)	   in_le16(isa_itw(port))
+#define isa_inl(port)	   in_le32(isa_itl(port))
+#define isa_outw(val,port) out_le16(isa_itw(port),(val))
+#define isa_outl(val,port) out_le32(isa_itl(port),(val))
+#define isa_readw(p)	   in_le16(isa_mtw((unsigned long)(p)))
+#define isa_writew(val,p)  out_le16(isa_mtw((unsigned long)(p)),(val))
+#else
 #define isa_inw(port)      (ISA_SEX ? in_be16(isa_itw(port)) : in_le16(isa_itw(port)))
 #define isa_inl(port)      (ISA_SEX ? in_be32(isa_itl(port)) : in_le32(isa_itl(port)))
-#define isa_outb(val,port) out_8(isa_itb(port),(val))
 #define isa_outw(val,port) (ISA_SEX ? out_be16(isa_itw(port),(val)) : out_le16(isa_itw(port),(val)))
 #define isa_outl(val,port) (ISA_SEX ? out_be32(isa_itl(port),(val)) : out_le32(isa_itl(port),(val)))
 
-#define isa_readb(p)       in_8(isa_mtb((unsigned long)(p)))
 #define isa_readw(p)       \
 	(ISA_SEX ? in_be16(isa_mtw((unsigned long)(p)))	\
 		 : in_le16(isa_mtw((unsigned long)(p))))
-#define isa_writeb(val,p)  out_8(isa_mtb((unsigned long)(p)),(val))
 #define isa_writew(val,p)  \
 	(ISA_SEX ? out_be16(isa_mtw((unsigned long)(p)),(val))	\
 		 : out_le16(isa_mtw((unsigned long)(p)),(val)))
+#endif
 
 #ifdef CONFIG_ATARI_ROM_ISA
 #define isa_rom_inb(port)      rom_in_8(isa_itb(port))
diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index dddb235dd020..62da9717d78e 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -253,4 +253,13 @@ config PCCARD_NONSTATIC
 config PCCARD_IODYN
 	bool
 
+config PCMCIA_GAYLE
+	tristate "Amiga Gayle bridge support"
+	depends on PCMCIA && AMIGA && AMIGA_PCMCIA && !APNE
+	select PCCARD_IODYN
+	help
+	  Say Y here to include support for PCMCIA host bridges that
+	  are register compatible with Commodore's Gayle. This is found on
+	  Amiga systems. If unsure, say N.
+
 endif	# PCCARD
diff --git a/drivers/pcmcia/Makefile b/drivers/pcmcia/Makefile
index c9d51b150682..1ebbf6c776bb 100644
--- a/drivers/pcmcia/Makefile
+++ b/drivers/pcmcia/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_OMAP_CF)				+= omap_cf.o
 obj-$(CONFIG_ELECTRA_CF)			+= electra_cf.o
 obj-$(CONFIG_PCMCIA_ALCHEMY_DEVBOARD)		+= db1xxx_ss.o
 obj-$(CONFIG_PCMCIA_MAX1600)			+= max1600.o
+obj-$(CONFIG_PCMCIA_GAYLE)			+= gayle.o
 
 sa1111_cs-y					+= sa1111_generic.o
 sa1111_cs-$(CONFIG_ASSABET_NEPONSET)		+= sa1111_neponset.o
diff --git a/drivers/pcmcia/gayle.c b/drivers/pcmcia/gayle.c
new file mode 100644
index 000000000000..1180da95f84a
--- /dev/null
+++ b/drivers/pcmcia/gayle.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Commodore's Gayle PC Card controller driver
+ *
+ * Partially derived from Kars de Jong <jongk@linux-m68k.org>, v2.6.10 era
+ * previous attempt
+ *
+ * Copyright (c) 2025 Paolo Pisati <p.pisati@gmail.com>
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
+struct gayle_pcmcia_sock {
+	struct pcmcia_socket	socket;
+
+	phys_addr_t	attr;
+	phys_addr_t	io;
+	phys_addr_t	mem;
+};
+
+#define to_gayle_socket(x) container_of(x, struct gayle_pcmcia_sock, socket)
+
+/* apply socket configuration flags */
+static int gayle_sock_set_socket(struct pcmcia_socket *skt,
+				 struct socket_state_t *state)
+{
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
+		pcmcia_write_enable();
+	}
+
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
+/* get card status GetStatus flags */
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
+		default:
+			break;
+	}
+
+	status |= pcmcia_wena() ? 0 : SS_WRPROT;	/* card is write protected */
+
+	if (status & (SS_DETECT | SS_POWERON))
+		status |= SS_READY;
+
+	dev_dbg(&skt->dev,"%s status: 0x%x\n", __func__, status);
+
+	*value = status;
+
+	return 0;
+}
+
+static int gayle_sock_init(struct pcmcia_socket *skt)
+{
+	dev_dbg(&skt->dev, "%s::%d\n", __func__, __LINE__);
+
+	return 0;
+}
+
+static int gayle_sock_suspend(struct pcmcia_socket *skt)
+{
+	dev_dbg(&skt->dev, "%s::%d\n", __func__, __LINE__);
+
+	return 0;
+}
+
+static int gayle_sock_set_io_map(struct pcmcia_socket *skt,
+				    struct pccard_io_map *map)
+{
+	dev_dbg(&skt->dev, "%s::%d map: 0x%x flags: 0x%x speed: 0x%x "
+		"start: 0x%x stop: 0x%x\n", __func__, __LINE__, map->map,
+		map->flags, map->speed, map->start, map->stop);
+
+	if (map->map >= MAX_IO_WIN) {
+		pr_err("%s(): map (%d) out of range\n", __func__,
+		       map->map);
+		return -1;
+	}
+
+	if (map->stop == 1)
+		map->stop = PAGE_SIZE-1;
+
+	gayle_set_io_win(map->map, map->flags, map->start, map->stop);
+
+	return 0;
+}
+
+static int gayle_sock_set_mem_map(struct pcmcia_socket *skt,
+				     struct pccard_mem_map *map)
+{
+	struct gayle_pcmcia_sock *sock = to_gayle_socket(skt);
+	unsigned long start;
+
+	dev_dbg(&skt->dev, "%s::%d map: 0x%x flags: 0x%x speed: 0x%x\n",
+		 __func__, __LINE__, map->map, map->flags, map->speed);
+	dev_dbg(&skt->dev, "static_start: 0x%x card_start: 0x%x\n",
+		map->static_start, map->card_start);
+	dev_dbg(&skt->dev, "resource: %pr\n", map->res);
+
+	if (map->map >= MAX_WIN) {
+		pr_err("%s(): map (%d) out of range\n", __func__,
+		       map->map);
+		return -EINVAL;
+	}
+
+	pcmcia_access_speed(map->speed);
+
+	if (map->flags & MAP_ATTRIB) {
+		start = sock->attr;
+		if (map->flags & MAP_ACTIVE)
+			pcmcia_access_speed(720);
+	} else
+		start = sock->mem;
+
+	map->static_start = start + map->card_start;
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
+/*
+ * The sole purpose of this handler is to ack the incoming PCMCIA card's
+ * interrupt at gayle's level to avoid an interrupt storm
+ */
+/* on irq 2 / IRQ_AMIGA_PORTS, serves GAYLE_IRQ_IRQ */
+static irqreturn_t gayle_irq_dummy(int irq, void *data)
+{
+	unsigned char pcmcia_intreq;
+	struct gayle_pcmcia_sock *sock = data;
+
+	pcmcia_intreq = pcmcia_get_intreq();
+	if (!(pcmcia_intreq & GAYLE_IRQ_IRQ))
+		return IRQ_NONE;
+
+	dev_dbg(&sock->socket.dev,"%s::%d intreq: 0x%x\n", __func__, __LINE__,
+		pcmcia_intreq);
+
+	pcmcia_ack_int(pcmcia_get_intreq());
+
+	return IRQ_NONE;
+}
+
+/* on irq 6 / IRQ_AMIGA_EXTER, serves GAYLE_IRQ_CCDET */
+static irqreturn_t gayle_irq_ccdet(int irq, void *data)
+{
+	unsigned char pcmcia_intreq;
+	struct gayle_pcmcia_sock *sock = data;
+
+	pcmcia_intreq = pcmcia_get_intreq();
+	if (!(pcmcia_intreq & GAYLE_IRQ_CCDET))
+		return IRQ_NONE;
+
+	dev_dbg(&sock->socket.dev,"%s::%d intreq: 0x%x\n", __func__, __LINE__,
+		pcmcia_intreq);
+
+	pcmcia_ack_ccdet();
+	pcmcia_parse_events(&sock->socket, SS_DETECT);
+
+	return IRQ_HANDLED;
+}
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
+	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "Gayle attribute");
+	sock->attr = r->start;
+
+	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "Gayle I/O");
+	sock->io = r->start;
+
+	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "Gayle memory");
+	sock->mem = r->start;
+
+	sock->socket.owner	= THIS_MODULE;
+	sock->socket.dev.parent	= &pdev->dev;
+	sock->socket.ops	= &gayle_pcmcia_operations;
+	sock->socket.resource_ops = &pccard_iodyn_ops;
+	sock->socket.features	= SS_CAP_STATIC_MAP | SS_CAP_PCCARD;
+	sock->socket.pci_irq	= IRQ_AMIGA_PORTS;
+	sock->socket.irq_mask	= 0;
+	sock->socket.map_size	= PAGE_SIZE;
+	sock->socket.io_offset	= 0;
+
+	platform_set_drvdata(pdev, sock);
+
+	if (request_irq(IRQ_AMIGA_PORTS, gayle_irq_dummy, IRQF_SHARED,
+			"Gayle PCMCIA dummy", sock)) {
+		dev_dbg(&pdev->dev, "unable to setup dummy irq handler\n");
+		goto out;
+	}
+
+	if (request_irq(IRQ_AMIGA_EXTER, gayle_irq_ccdet, IRQF_SHARED,
+			"Gayle PCMCIA socket", sock)) {
+		dev_dbg(&pdev->dev, "unable to setup ccdet irq handler\n");
+		goto out1;
+	}
+
+	ret = pcmcia_register_socket(&sock->socket);
+	if (ret) {
+		pr_err("pcmcia failed to register\n");
+		goto out2;
+	}
+
+	/* put Gayle in a known state */
+	gayle.cardstatus = 0x0;
+	gayle.config = 0x0;
+	gayle.intreq = 0x0;
+	gayle.inten |= GAYLE_IRQ_CCDET | GAYLE_IRQ_IRQ;
+
+	pr_info("Gayle pcmcia @ io/attr/mem %09x %09x %09x\n",
+		sock->io, sock->attr, sock->mem);
+
+	return 0;
+out2:
+	free_irq(IRQ_AMIGA_EXTER, &pdev->dev);
+out1:
+	free_irq(IRQ_AMIGA_PORTS, &pdev->dev);
+out:
+	kfree(sock);
+
+	return ret;
+}
+
+static void gayle_pcmcia_exit(struct platform_device *pdev) {
+	dev_dbg(&pdev->dev, "%s::%d\n", __func__, __LINE__);
+
+	pcmcia_disable_irq();
+	pcmcia_disable_ccdet_irq();
+	free_irq(IRQ_AMIGA_PORTS, sock);
+	free_irq(IRQ_AMIGA_EXTER, sock);
+	pcmcia_unregister_socket(&sock->socket);
+	kfree(sock);
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

