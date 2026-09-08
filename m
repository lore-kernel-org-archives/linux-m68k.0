Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A1513550
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Sep 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860470; cv=none; b=VOgc17wlqio7CsXC8nmGVkSGfIFd/cMeqgIXQ7DesdPy9tgRZdFHGxCEPpEuiTofu1TBg64hTo0oYFpT+CnjEidhLA75aQ1ImIa4vCOWIy7vd5ogYLyCdiKbASTL2GXKeFxamwWJQS/Hr3/N/xbQn09jc70Ogj/d+HzhfzlLvOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860470; c=relaxed/simple;
	bh=ymrWWchYGLjkNxZZNJjEWYLE5L5GJlodkp3U06kQKLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hy/k7es25U/4cB/xgukZjldjHOuhQlFQhGmuPJycOvvDXcGPoW+4Vg6G4Gp1JZabGu2vI8DpM4hn/txEZ0/Pue/q9CdI6S1GF4kMldVRBLSyw4b+6jj6GnGwswpkau7yWNveXDtEpD3DFL8jlFDPlO4uyWtX57q6hGCFBLruIW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYO6sgKe; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYO6sgKe"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so4761125a12.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Sep 2026 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860468; x=1789465268; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2aAMCf2SpXVpQaOpvFq2x8nEqjxcR4A/9rWT4hksgxQ=;
        b=sYO6sgKeZbxPMY8FkU0mwjf2JdKZfOmoG8ZRmVCOFgrHSdhABRWFi3SLCKEgG8QwZr
         vrBzqKkCSkQPtjXLhXCEpulVZMQGKf5Ltn2WNhMl3hiU21Lz+rSYsS+Xx2U34SCXesoY
         CPVtKoSo1RyCfGUsq+VpU6IX1c/YQNZwWjooTpn5dekGR4sIYow9pDiPbLyoGOh26RpC
         hJ7QksrZofkJH7cducBTD06D9dBgPRfGR1NsaFL5/uic7EH1+7e2jDRT3W6XVv6dZmlX
         SUkLRqKeMVMf4tODoeuxJLJMZCWTeAwVcVOFFGFJSb0Hza6Afcm9jT7SvE/KiTje1tk0
         /mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860468; x=1789465268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2aAMCf2SpXVpQaOpvFq2x8nEqjxcR4A/9rWT4hksgxQ=;
        b=MRVlCGZPTel7FLr70IVZDjqsAOvuMOkmhFfPl4VDizhINCAX35HtoJJmZaPEGN7Adn
         EFfA2FbAMvnUOsTmahD0/cbJpiE4XWfvLxkAILtry+C1iMlPwwt9ogMEe7cffrB3StzI
         J7VU6LIinq22AcnBpnT6tFupK78FTMNqWrnhQ3A2Ey+UAXO+tGE4Y6L5rPTl2h80pH6a
         7+m5RYS+gFTA4yCGJIbcK/AMoNWAashI/3lat/HleVq/wM6MJN4j58gN8P64Xnwm/MEq
         i30p9JMpqEDsl+dbRiCd6SnOuX8i1gEk57wuyPOkA365/xfoeIgXDVYR5fZGlZslaj+r
         FGig==
X-Forwarded-Encrypted: i=1; AKwUvBwbq+74WQ+v4AhEMEOwjoXiZAseHZyzVu5phTidan03+Lkro0uoCbUdDWr9FecHWMLtZhXN+S2iOcvv@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nR+F4v8DuiUZjt6OZOfSuAlzFsIVEXMOFsxMPsUwAqSmBFa3BV
	lToqMttoBf/04lm2Wm+LQvsqxyDYa1hDDYJ+GZ37r9oZfNh8cpAVmXfB
X-Gm-Gg: AYBFou1PJ9MW19oR9hCXWTXeSlOOvN36TA2IbL9L9LOGZH/V+/StSMELhEiSGWFTKdq
	+hcNK248+oyoi1TU3Lsz8PQftyKRq9rb+Hjmp8FFOBZvP4zreZIJkVOzeQ3R0ZooKJLvGkX+Tkd
	WZbR2sq8G86CZISE5AZre43u4J4tMh0Ux7/mFikByK3TDa7iKBzgiCYxr7W4YAHK9ftDOzWX1+E
	8snNjdEhYJ0etaNwOxPWMeXFNPoZsH5Yd7AeY0+y+vgndPnE77NTuv0EjF5QeWEqVvd9f9bMgr0
	4uoOlTxrhCGPjr9tp9uBMDiOEBfPjYjXgqmA4kYKrNH8D6eS4xFfXTA/ZwX/9Pkf77zlFcKDJ9V
	Vg2FUDoYuv8YmoajSLbYG3IdLqdlz4Fi+dbL3HU6JNWKifDd5URPQtB25wpwDknRKG/BrHLcaeM
	8ljPdVsz9Dj2NVOXb4PR0FJhN/LVYSPdZffTPnmdJh9FTfEBQYo5OK9P0q6KteceT03p/c+NsGS
	kPpZfE6GprpBeyjH/NpDSfKItTrS8Jh92mfkptSC8j/Vp8GrLQvdk9yKZLig9dULt1jZ70Z5yma
X-Received: by 2002:a17:90b:2ccd:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39b260d7297mr49355163a91.8.1788860468117;
        Tue, 08 Sep 2026 02:41:08 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:41:07 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 6/6] m68k: virt: Switch to generic goldfish-pic driver
Date: Tue,  8 Sep 2026 09:40:16 +0000
Message-ID: <20260908094016.1997918-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
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
2.55.0.979.g7e5102b832-goog

