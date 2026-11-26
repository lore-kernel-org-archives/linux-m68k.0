Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719115;
	b=j35cV0VCwj3Vvv3K7+Cmc+rKcTUv87Bv16Q1DblGxjgU5jDN+338FavIUhCbGg5gbE2c
	 pYAYPoJTMYJWZc912K3NZKqgLulyy0qqvqJY1OpE9btGtN1hdYt9BXbcMEpkjbkQU+Ced
	 CGdl30zNH30vNar0R8+GUxf8DcNh3SQBYJ2OcN2jxV1c2/LcBhL2sMmInFBJGJki7M7hj
	 fWrMRBooAXm1i98gjOATgXSsv54XYkHTsioA0kE64/Zsr0XeWLs/U3rRocD86qnCCSylq
	 jbaTt/QdLkRf9UV3XopuZR251fswaT5re1YXoC74/CKqIwx6ze1flTXtPhZgPBuqBhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k/bH4I6U0mY9o7t78YHEQqDOSqpSnGp+1NNP37/DkUA=;
	b=Ch4Pqu/p9aRE1gezh4+kN+T+vHGFaexDi7CHCeSqQbiHnn/RomKjac4e8uY2+e0+XIJ6
	 xBYYhEb6HqMMyR878yPccyVYe3TlDocSwIB7zSAA5OxozHyNsVFBwDqBn+FD6HO+igO1z
	 XaGL7sU7SsvcDtTlb+Vh293NDVAMJc91G/TCTRkjsZ5Cwsx/DGZ+TTO9LGSa9kmse5JEb
	 Jii3MaC1UO1Y4w1D9D2uUWjjOBTFuLAhtACyQ0ezRx8QsObqPo0XQu0t7lLDFfi8nFSbB
	 PGe+HqVwnnu/xo7D2kHIThdjyKVfZPD2pzAfHU+kXkZQmJIMN/wlgGbh8jDooCEejtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LOvg82hn;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094E2606A333
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 094E2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LOvg82hn
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f066274caeso34605315ad.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719114; x=1796323914; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/bH4I6U0mY9o7t78YHEQqDOSqpSnGp+1NNP37/DkUA=;
        b=LOvg82hn85UAWpupGTL6HXFUdgtqEtP6M+kokSHmjFSS1NQ2tyKJAa3S84lgd1dqZt
         rQcN59vCLEzPlmUZOMsS6/FqbUSva4TWj1cQ9qku378RAu6j6E6basbDoYZelgxltqio
         N8FzfSEOpWSOBP7Rf9k7Iqp64PMQ26BPEGlNrT2KVWmXc87T5l5cegRToOOsNRbN4uOV
         cc6G4xaUlApGvYkTAYMPpRcTd1ZjTjfUCvRooLGwGQX2nRlqFYjPwLHPXPCO9Vfhl67f
         Ie8Bo++FZXON9qe/wkiu5THWqJDOltVNBGq1xoiMlPCKPo6fBjR7WCddJxuL+TIhDe1B
         Ha5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719114; x=1796323914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k/bH4I6U0mY9o7t78YHEQqDOSqpSnGp+1NNP37/DkUA=;
        b=cfORUkONFG2g7yqJTxFgqUYf0e0IWEcv/3ObcLf3lLXw7W1TMzmfGFeWXyQT9IKZNn
         rdobECFotNFBmsFGcS1wMqZsCWkz3DCfT0+j3ewznnLzYhjAXvEoG3HVJmAwj6mV9Kup
         jzkRoIDjRg9azCy1mnMLLCh0pftMEXB6hMyiUMHQjPR4R+3Trd5C4RmRgn1THnB/egY9
         QGU2TYWbC6hUjuZm6CLFawDc8ErZ1/3E05KtcqFoWM8sPNniDzGBSyl7rLXJiqv5G7/r
         ovrUFLqfJcOoASCv9m9IJYryPixuCf1e/XMKAUSnxU0YTDF7Crka6h367u2wy+CpwAuK
         nwzw==
X-Forwarded-Encrypted: i=1; AL+hErGXo16EGr8v1teqwq0H6KgF+Xmhj1e1ZvRS+u90ubeuWFUHwldPMBOC868fdGdwITaUQhTm2KW3YiYQ@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/obgp5HMwlQU0Ef0VtpEDgfZ71qxx/Uhv5s2+WB3TBOBKK2Lyk
	I8Al5Ebbq8WlqT0gtmwiNRYie3cWtHVhIq9uWUQAUG7kDprEi6CWNO56ihao5A==
X-Gm-Gg: AZFdTZf3xTQdP2ryHDnRuXKldy+JJNk1uzKnaJ6E+IQPhiheBzNYpKhljD1ifIYmcgO
	kl/aL7e8k1HgJQ1qlV/YqIC6SCguVyuR2I3yOiB0WSmVWd6D7QxCoclgILagAPDQY29EPqcmC0z
	kmf/rC2ruvnP/SPmrz8f8AT9E44icGIPAIHQsv9PgexA6ealIu3KWr1a+7U6MNJfHXyuvJ0Z9Fg
	VMMrnL6wZy/tJm4oxmeND66Um7b9pjF6lowuVQbWwOIhRMMuMVPlGhE1YEoNjLn0Aw10A7NsTkx
	sA5E1Y+2t/9OniAmrz+RRg93TjWrDyQwY4ooEZ6hICDag94oVmcKB+cCtbjzVknU2+Ze+0MJbZf
	QIKRQeHL88kdkelzsfy3d6xGSDH54HXIVBZNUfqFsJuEqDY1H3t4ISfHGa6JGgpgXW6GAXgQUeL
	a0bTMF+t3kGuHASPa9UuUrq7K9ZhXCjL7djevqT/I+u2VDHhYKuOL/wQGh38PKEW1YssA4DU0I1
	LnyTz3uAadDyATR46rrBkp6r+renEhbqPNSjxV1P0zMTvo8tINAcUZhU67wsIyFPQCm5omDcXoD
	cMOdfPemn8tBa9ev/IWxWpowNXoKxC+cbOMWctVRxeRR85h8GepTLp07ODKN5p662l9hybNchx4
	S/ZfZPnzpF9jFAk3FYnG+gqHehd01cQwLZIIpIqD+G/5S
X-Received: by 2002:a17:903:2c50:b0:2e9:9263:a6b with SMTP id d9443c01a7336-2f03f1b99cemr207242255ad.40.1795719114394;
        Thu, 26 Nov 2026 10:51:54 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:54 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 6/7] m68k: virt: Switch to generic goldfish-pic driver
Date: Thu, 26 Nov 2026 18:51:19 +0000
Message-ID: <20261126185120.3815699-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126185120.3815699-1-visitorckw@gmail.com>
References: <20261126185120.3815699-1-visitorckw@gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The m68k virt platform implements a custom irq_chip and chained handler
in arch/m68k/virt/ints.c to handle its 6 goldfish PIC instances.

Replace this custom implementation with calls to goldfish_pic_init() to
use the generic goldfish-pic driver, and select CONFIG_GOLDFISH_PIC for
CONFIG_VIRT.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/m68k/Kconfig.machine |  1 +
 arch/m68k/virt/ints.c     | 89 ++++-----------------------------------
 2 files changed, 10 insertions(+), 80 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index cff990c319cb..7b15012ffb28 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -130,6 +130,7 @@ config VIRT
 	depends on MMU
 	select GENERIC_CLOCKEVENTS
 	select GOLDFISH
+	select GOLDFISH_PIC
 	select GOLDFISH_TIMER
 	select GOLDFISH_TTY
 	select M68040
diff --git a/arch/m68k/virt/ints.c b/arch/m68k/virt/ints.c
index 896aa6eb8bcc..54da6b1f5ce7 100644
--- a/arch/m68k/virt/ints.c
+++ b/arch/m68k/virt/ints.c
@@ -1,25 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/sched/debug.h>
-#include <linux/types.h>
 #include <linux/ioport.h>
+#include <linux/irqchip/irq-goldfish-pic.h>
 
-#include <asm/hwtest.h>
 #include <asm/irq.h>
 #include <asm/irq_regs.h>
 #include <asm/processor.h>
 #include <asm/virt.h>
 
-#define GFPIC_REG_IRQ_PENDING           0x04
-#define GFPIC_REG_IRQ_DISABLE_ALL       0x08
-#define GFPIC_REG_IRQ_DISABLE           0x0c
-#define GFPIC_REG_IRQ_ENABLE            0x10
-
 static struct resource picres[6];
 static const char *picname[6] = {
 	"goldfish_pic.0",
@@ -50,43 +39,6 @@ static const char *picname[6] = {
  * CPU IRQ #7 -> NMI
  */
 
-static u32 gfpic_read(int pic, int reg)
-{
-	void __iomem *base = (void __iomem *)(virt_bi_data.pic.mmio +
-					      pic * 0x1000);
-
-	return ioread32be(base + reg);
-}
-
-static void gfpic_write(u32 value, int pic, int reg)
-{
-	void __iomem *base = (void __iomem *)(virt_bi_data.pic.mmio +
-					      pic * 0x1000);
-
-	iowrite32be(value, base + reg);
-}
-
-#define GF_PIC(irq) ((irq - IRQ_USER) / 32)
-#define GF_IRQ(irq) ((irq - IRQ_USER) % 32)
-
-static void virt_irq_enable(struct irq_data *data)
-{
-	gfpic_write(BIT(GF_IRQ(data->irq)), GF_PIC(data->irq),
-		    GFPIC_REG_IRQ_ENABLE);
-}
-
-static void virt_irq_disable(struct irq_data *data)
-{
-	gfpic_write(BIT(GF_IRQ(data->irq)), GF_PIC(data->irq),
-		    GFPIC_REG_IRQ_DISABLE);
-}
-
-static unsigned int virt_irq_startup(struct irq_data *data)
-{
-	virt_irq_enable(data);
-	return 0;
-}
-
 static irqreturn_t virt_nmi_handler(int irq, void *dev_id)
 {
 	static int in_nmi;
@@ -102,40 +54,12 @@ static irqreturn_t virt_nmi_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irq_chip virt_irq_chip = {
-	.name		= "virt",
-	.irq_enable	= virt_irq_enable,
-	.irq_disable	= virt_irq_disable,
-	.irq_startup	= virt_irq_startup,
-	.irq_shutdown	= virt_irq_disable,
-};
-
-static void goldfish_pic_irq(struct irq_desc *desc)
-{
-	u32 irq_pending;
-	unsigned int irq_num;
-	unsigned int pic = desc->irq_data.irq - 1;
-
-	irq_pending = gfpic_read(pic, GFPIC_REG_IRQ_PENDING);
-	irq_num = IRQ_USER + pic * 32;
-
-	do {
-		if (irq_pending & 1)
-			generic_handle_irq(irq_num);
-		++irq_num;
-		irq_pending >>= 1;
-	} while (irq_pending);
-}
-
 void __init virt_init_IRQ(void)
 {
 	unsigned int i;
-
-	m68k_setup_irq_controller(&virt_irq_chip, handle_simple_irq, IRQ_USER,
-				  NUM_VIRT_SOURCES - IRQ_USER);
+	int ret;
 
 	for (i = 0; i < 6; i++) {
-
 		picres[i] = (struct resource)
 		    DEFINE_RES_MEM_NAMED(virt_bi_data.pic.mmio + i * 0x1000,
 					 0x1000, picname[i]);
@@ -144,8 +68,13 @@ void __init virt_init_IRQ(void)
 			return;
 		}
 
-		irq_set_chained_handler(virt_bi_data.pic.irq + i,
-					goldfish_pic_irq);
+		ret = goldfish_pic_init((void __iomem *)(virt_bi_data.pic.mmio + i * 0x1000),
+					virt_bi_data.pic.irq + i,
+					IRQ_USER + i * 32, NULL);
+		if (ret) {
+			pr_err("Failed to initialize %s\n", picname[i]);
+			return;
+		}
 	}
 
 	if (request_irq(IRQ_AUTO_7, virt_nmi_handler, 0, "NMI",
-- 
2.56.1.839.g22a8290db9-goog

