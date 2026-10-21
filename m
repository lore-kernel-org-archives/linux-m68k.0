Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603761;
	b=LGoi5Tjexrn24FlA8NWsPAHTxuuSNZgCaxk2GoxDPIZNV5zRaUna79pHJYDN6IT0t7RZ
	 nnsibeLL8L7e6QS8sUiH4O3Id39+mhGOAMlpaqOX+sGo2ai99SM4NQPJOUDbglDYGw6nJ
	 zTfQXXzr5CxhT4r+3aaASr1Q77TF9xa7P/uDJC0Q/+Ec2Sz2sakv3L5wkC8/JKvRZ2+w8
	 63xDUdW95ZbnhTt9d/aPgkXwK94xXak5FE3Y4sRBIRK41vLuhQGM8P+LOn/4pNrEQnd38
	 C0GEUfBNemc0YV5LbXRRA74goimyARwKDkt9yJX7o7PRjB5LDUEF6kLwR3H4hFJFh2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gE35wcdnAB3wSBBpdAPfT4fxqBZkRv+u5qmeGYm/fwA=;
	b=Ho5Tqh6lMGMtUhetUNeGxLmPrlpYEFLvPj84XqHWniGq7v/4ULKcy+StccXjcYclMaMn
	 4R/AOCN1JMYgEkFHOgPhU6fFNKd/RQshRsCG8wEav6FGsCMnAWzXUahynjere6t8Nw77p
	 txShuV5ictmay385nA55FADol3B2IJxLw4pHuW8RoZAHX+ZIvx3FsGR0B8zYuEwiieZnW
	 u0UfHyrdaVxcuTxy4pb1y5J03mObrXR1LeAn75MSJQ4c/49eJIBZ0W37CDxlLRM14sb6H
	 oguhtYlKjtz/Tmunmebnfrj/3jhlrpAvA9T1gx30mv7Nim2egrZ0U+7N0dsU5Zh/Xmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EURsnuQG;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5C2606A326
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 17:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E5C2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EURsnuQG
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso10156305e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 10:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603759; x=1793208559; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gE35wcdnAB3wSBBpdAPfT4fxqBZkRv+u5qmeGYm/fwA=;
        b=EURsnuQGOoJ0E0Qvjsd8MwwRKmUoNL5Etmat7rPtKpXmRCeRex6a8jDX4fIOMHMLK4
         bON/Dhmcuj+EnSnxYDFIPhrCvJFnH7sTDqVgxqFKa7wq6FbSa1PV91oG11o6lSNOaRKT
         htJFHPhbP+XEvpeLlaChIIdT1IvLX9Y6F6Q+pvOcCKZGRlvPl5cdjsfVRg2wP31cvRjD
         Q5BzB8yZO9wYC5inghv9/Wpjp1lUIoH5C66PWze5oLbE3gyu048BQd+pLIsTfT8WnJ4W
         qlseT90t9BEaAJvJhIE6bkZWg7kfvybxbHj0iTvJ4ClksjOoXsyzF7t3dz3f/VIyC0aB
         b2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603759; x=1793208559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gE35wcdnAB3wSBBpdAPfT4fxqBZkRv+u5qmeGYm/fwA=;
        b=yLub//+tg90+Yqt/OhuCTfWqtKAd+ihOfvnh5x5SCwE6QCxzGYebs7YXFcdlwMpcjZ
         szhqJRceWJ+gsU+B/F77t5j7nyt++0gvYnuku7T6ax1ySu855e4Z+vzKltAx/5R5ePAy
         MOC2QQvRFoXy0WRBKcxx3mqxs/19wKOBgTXgPuOf1aXlm/ipNl5Nl1Wxn6Lrk+pjbwip
         CZtu/TrYAAFFNK8YfkYeHuWpHF27121XWO8fzAdKO2iaaUHs8INNp5NPoxcNYDGtdHt/
         3fpYu/cBClKeeFUXCo2sen2/duHycBYIG494ymhkVHuGrQK7IS6TEOgXFL5uZPDKNdtx
         aKlA==
X-Gm-Message-State: AFq9FYISDDBQJ4NkofDKX0wmInrBeu6e9c4jrKD3YHvUNRBXaprJwP+s
	aumTh5eU29jMy3E/FreZbpL+6x0EFRGUFo6k/SJ5DSKVgd/5vWk8URAdKo839Q==
X-Gm-Gg: AYBFou2yMaH6sD2caYIyfRDAZKAr8Ru0atw6gTLI1TLrkSO9BEja2F2xudPWNNovvvU
	Ia8BbcOpOgkJhNAh+fWn6J+E+6bluSIKlseEaz1N66+xlYO2iSYxT5P75Yfm3FJw4sXM/K+ywqh
	oLt4aUqDaWle2M5RCZyuybQnI9K4hQQ78cXena03tnudUbP/ehA4mUVF1RUKi8CWuzAMTsYVj4j
	0IpLyMkRNTWPya5Kzh+SvTj71rCoZ3N6PQmqvugRs6n5pZjQTiV05llakD9gNAM3HuF0SyJkqf3
	FBvPiYMV1rNqfTFiu1o8X4fh+CIEtaHy1j/Fv6ZLXl+vgx98rmsOtJtwvpSlx2tyZ2yMAxUQP8Y
	K20Pxysj8xcgKUcooxkB+Gz9DKDcJE+fiYPtXP7+uA4XmdsrKhPOBPRdSoTsWPdnU8kG3ZVYkRJ
	eU3z1tGcNTLS3zWPGGnfS/JEfoRdyiCQ9XhiIoKoAGZ/gbblyFCZR38qZD8piCGX6+zzvyG8io3
	F3ioGemU/71Gq7fYPop/s9zqpj7WLe8o1UBGnB0muzMSzpVfqlMleDPsN315T2VUoD8WUDlzvi2
	0XE/4ulc2AjDT9sf84LqdMpp8qGA9CfoOa1Zzsw=
X-Received: by 2002:a05:600c:524f:b0:4a1:ad27:e797 with SMTP id 5b1f17b1804b1-4a1fdaf71f5mr55204955e9.6.1792603759222;
        Wed, 21 Oct 2026 10:29:19 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:6d99:38f4:72d4:7bf7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583f25asm6468083f8f.45.2026.10.21.10.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:29:18 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC PATCH 4/8] zorro: warp mfd: add the dual-port RAM command channel and expose the board identity
Date: Wed, 21 Oct 2026 19:29:06 +0200
Message-ID: <20261021172910.134838-5-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021172910.134838-1-p.pisati@gmail.com>
References: <20261021172910.134838-1-p.pisati@gmail.com>
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

The ARM co-processor is reached through a dual-port RAM window and an
interrupt control register: the 68k writes a command frame, rings the
ARM, and the ARM acknowledges and then answers in the same buffer,
raising a flag for each on the shared IRQ_AMIGA_PORTS line.

The protocol header describes only what the driver uses: the control
bits, GetDiag and its reply frame, laid out as the 68k sees it, with
static_assert()s pinning the offsets - the firmware decides them, not
the compiler.

Use it for the first attributes: boardname, hwver and fmwver, read from
a fresh diagnostic frame on every access.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/zorro/warp-mfd.c | 258 ++++++++++++++++++++++++++++++++++++++-
 drivers/zorro/warp-mfd.h | 118 +++++++++++++++++-
 2 files changed, 373 insertions(+), 3 deletions(-)

diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index 0e80e82ab0d1..2c5b9254651a 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -9,19 +9,44 @@
  * and the IDE interface and RTG display controller, which the 68k drives
  * directly.
  *
- * This driver claims the Zorro device and hands the IDE window to pata_cswarp
- * as an mfd cell.
+ * This driver claims the Zorro device, talks to the co-processor over the
+ * dual-port RAM to expose the board's configuration and telemetry in sysfs,
+ * and hands the IDE window to pata_cswarp as an mfd cell.
  */
 
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/bits.h>
+#include <linux/completion.h>
+#include <linux/mutex.h>
 
 #include <linux/zorro.h>
+#include <asm/amigaints.h>
 
 #include <linux/mfd/core.h>
 
 #include "warp-mfd.h"
 
+/**
+ * struct warp_mfd - per-board state
+ * @dev:    the zorro device we hang off
+ * @dpram:  mapped dual-port RAM, shared with the ARM co-processor
+ * @reg_cr: mapped dual-port interrupt control register
+ * @recv:   completed when the ARM acknowledges a message
+ * @reply:  completed when the ARM has a reply waiting in @dpram
+ * @lock:   serialises use of @dpram, which is one shared buffer
+ */
+struct warp_mfd {
+	struct device		*dev;
+	void __iomem		*dpram;
+	void __iomem		*reg_cr;
+	struct completion	recv;
+	struct completion	reply;
+	struct mutex		lock;	/* serialises @dpram */
+};
+
 static const struct mfd_cell warp_mfd_cells[] = {
 	{
 		.name		= "warp-pata",
@@ -33,14 +58,243 @@ static const struct mfd_cell warp_mfd_cells[] = {
 	}
 };
 
+static irqreturn_t warp_irq(int irq, void *data)
+{
+	struct warp_mfd *warp = data;
+	u32 cr = z_readl(warp->reg_cr);
+	irqreturn_t ret = IRQ_NONE;
+
+	/*
+	 * More than one of these can be latched by the time we run - the ARM
+	 * acknowledges and answers a GetDiag in quick succession - so test
+	 * them all. Returning after the first would leave the others set and
+	 * their waiter asleep until it times out.
+	 */
+	if (cr & DPREG_CR_MR_ARM) {
+		z_writel(DPREG_CR_CLR | DPREG_CR_MR_ARM, warp->reg_cr);
+		/* the ARM has taken the message out of the dual-port RAM */
+		complete(&warp->recv);
+		ret = IRQ_HANDLED;
+	}
+
+	if (cr & DPREG_CR_MP_68K) {
+		z_writel(DPREG_CR_CLR | DPREG_CR_MP_68K, warp->reg_cr);
+		/* the ARM has left a reply in the dual-port RAM */
+		complete(&warp->reply);
+		ret = IRQ_HANDLED;
+	}
+
+	if (cr & DPREG_CR_IF_ETHRX) {
+		z_writel(DPREG_CR_CLR | DPREG_CR_IF_ETHRX, warp->reg_cr);
+		/*
+		 * Acknowledged only. There is no network driver behind this
+		 * yet; the ARM stops re-raising it once the flag is cleared.
+		 */
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+/*
+ * The AmigaOS library waits on SIGBREAKF_CTRL_C alongside the ARM's signal,
+ * so a user can always break out of a stalled exchange. We have no such
+ * escape from inside a sysfs store, so bound the wait instead - and stay
+ * interruptible, which is the part of that behaviour worth keeping.
+ */
+#define WARP_MSG_TIMEOUT	msecs_to_jiffies(2000)
+
+/* send a message to the ARM coprocessor, optionally waiting for a reply */
+static int warp_send_msg(struct warp_mfd *warp, bool wait_reply)
+{
+	struct completion *done = wait_reply ? &warp->reply : &warp->recv;
+	long ret;
+
+	/* a previous exchange may have timed out and completed late */
+	reinit_completion(done);
+
+	/* enable 68k & ARM interrupts */
+	z_writel(DPREG_CR_SET | DPREG_CR_IE_68K | DPREG_CR_IE_ARM, warp->reg_cr);
+
+	/* send irq to ARM */
+	z_writel(DPREG_CR_SET | DPREG_CR_MP_ARM, warp->reg_cr);
+
+	/* wait for a reply, or just wait for a receiver ack */
+	ret = wait_for_completion_interruptible_timeout(done,
+							WARP_MSG_TIMEOUT);
+
+	/* disable ARM & 68k interrupts */
+	z_writel(DPREG_CR_CLR | DPREG_CR_IE_68K | DPREG_CR_IE_ARM, warp->reg_cr);
+
+	if (ret < 0)
+		return ret;
+	if (!ret) {
+		dev_err(warp->dev, "no answer from the ARM co-processor\n");
+		return -ETIMEDOUT;
+	}
+	return 0;
+}
+
+/*
+ * Submit one command frame and, when @rpl is given, collect the answer.
+ */
+static int warp_exec_cmd(struct warp_mfd *warp, const union warp_cmd *cmd,
+			 union warp_reply *rpl)
+{
+	int ret;
+
+	ret = mutex_lock_interruptible(&warp->lock);
+	if (ret)
+		return ret;
+
+	z_memcpy_toio(warp->dpram, cmd, sizeof(*cmd));
+	ret = warp_send_msg(warp, rpl);
+	if (!ret && rpl)
+		z_memcpy_fromio(rpl, warp->dpram, sizeof(*rpl));
+
+	mutex_unlock(&warp->lock);
+	return ret;
+}
+
+static int warp_get_status(struct warp_mfd *warp, union warp_reply *rpl)
+{
+	union warp_cmd *cmd;
+	int ret;
+
+	cmd = kzalloc_obj(*cmd);
+	if (!cmd)
+		return -ENOMEM;
+	cmd->hdr.cmd = WARP_CMD_GET_DIAG;
+	ret = warp_exec_cmd(warp, cmd, rpl);
+	kfree(cmd);
+	if (ret)
+		return ret;
+
+	/*
+	 * The dual-port RAM still holds the last frame written to it. If the
+	 * board answered something else - or did not answer and we picked up
+	 * a stale completion - the bytes look like a perfectly good reading.
+	 * The vendor library checks this on every command; so do we.
+	 */
+	if (rpl->hdr.rpl != WARP_RPL_DIAG) {
+		dev_err(warp->dev, "unexpected reply %u, wanted a diag frame\n",
+			rpl->hdr.rpl);
+		return -EIO;
+	}
+	return 0;
+}
+
+#define warp_config_uint_attr(name, field, format_string)		\
+static ssize_t name##_show(struct device *dev,				\
+			   struct device_attribute *attr, char *buf)	\
+{									\
+	int ret;							\
+	struct warp_mfd *warp = dev_get_drvdata(dev);			\
+	union warp_reply *rpl;						\
+									\
+	rpl = kmalloc_obj(*rpl);					\
+	if (!rpl)							\
+		return -ENOMEM;						\
+	ret = warp_get_status(warp, rpl);				\
+	if (ret)							\
+		goto out;						\
+	ret = sysfs_emit(buf, format_string "\n", rpl->diag.field);	\
+out:									\
+	kfree(rpl);							\
+	return ret;							\
+}									\
+static DEVICE_ATTR_RO(name)
+
+#define warp_config_string_attr(name, field)				\
+static ssize_t name##_show(struct device *dev,				\
+			   struct device_attribute *attr, char *buf)	\
+{									\
+	int ret;							\
+	struct warp_mfd *warp = dev_get_drvdata(dev);			\
+	union warp_reply *rpl;						\
+									\
+	rpl = kmalloc_obj(*rpl);					\
+	if (!rpl)							\
+		return -ENOMEM;						\
+	ret = warp_get_status(warp, rpl);				\
+	if (ret)							\
+		goto out;						\
+	ret = sysfs_emit(buf, "%.*s\n", (int)sizeof(rpl->diag.field),	\
+			 rpl->diag.field);				\
+out:									\
+	kfree(rpl);							\
+	return ret;							\
+}									\
+static DEVICE_ATTR_RO(name)
+
+warp_config_string_attr(boardname, board_name);
+warp_config_uint_attr(fmwver, fmw_ver, "%04X");
+warp_config_uint_attr(hwver, hw_ver, "%04X");
+
+static struct attribute *warp_attrs[] = {
+	/* RO attr */
+	&dev_attr_boardname.attr,
+	&dev_attr_fmwver.attr,
+	&dev_attr_hwver.attr,
+	NULL
+};
+
+static const struct attribute_group warp_attr_group = {
+	.attrs		= warp_attrs,
+};
+
 static int warp_mfd_probe(struct zorro_dev *z,
 			  const struct zorro_device_id *ent)
 {
 	unsigned long base = z->resource.start;
+	struct warp_mfd *warp;
 	int error;
 
 	dev_info(&z->dev, "Warp at 0x%08lx\n", base);
 
+	warp = devm_kzalloc(&z->dev, sizeof(*warp), GFP_KERNEL);
+	if (!warp)
+		return -ENOMEM;
+	warp->dev = &z->dev;
+	mutex_init(&warp->lock);
+	init_completion(&warp->recv);
+	init_completion(&warp->reply);
+	zorro_set_drvdata(z, warp);
+
+	if (!devm_request_mem_region(&z->dev, base + WARP_OFFSET_DPREG_CR,
+				     sizeof(u32), "warp-mfd")) {
+		dev_err(&z->dev, "cannot reserve the interrupt control register\n");
+		return -EBUSY;
+	}
+
+	if (!devm_request_mem_region(&z->dev, base + WARP_OFFSET_DPRAM,
+				     WARP_DPRAM_SIZE, "warp-mfd")) {
+		dev_err(&z->dev, "cannot reserve the dual-port RAM window\n");
+		return -EBUSY;
+	}
+
+	warp->dpram = devm_ioremap(&z->dev, base + WARP_OFFSET_DPRAM,
+				   WARP_DPRAM_SIZE);
+	warp->reg_cr = devm_ioremap(&z->dev, base + WARP_OFFSET_DPREG_CR,
+				    sizeof(u32));
+	if (!warp->dpram || !warp->reg_cr) {
+		dev_err(&z->dev, "cannot map the dual-port RAM window\n");
+		return -ENOMEM;
+	}
+
+	error = devm_request_irq(&z->dev, IRQ_AMIGA_PORTS, warp_irq,
+				 IRQF_SHARED, "warp-mfd", warp);
+	if (error) {
+		dev_err(&z->dev, "cannot request irq %u\n", IRQ_AMIGA_PORTS);
+		return error;
+	}
+
+	error = devm_device_add_group(&z->dev, &warp_attr_group);
+	if (error) {
+		dev_err(&z->dev, "cannot create sysfs attributes\n");
+		return error;
+	}
+
 	error = mfd_add_devices(&z->dev, z->dev.id, warp_mfd_cells,
 				ARRAY_SIZE(warp_mfd_cells), &z->resource,
 				0, NULL);
diff --git a/drivers/zorro/warp-mfd.h b/drivers/zorro/warp-mfd.h
index 3f44f2b57c76..14d8f9ddd58d 100644
--- a/drivers/zorro/warp-mfd.h
+++ b/drivers/zorro/warp-mfd.h
@@ -1,13 +1,32 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * CS-Lab Warp - board window layout
+ * CS-Lab Warp - 68k <-> ARM dual-port RAM protocol
  *
  * Copyright 2026 Paolo Pisati <p.pisati@gmail.com>
+ *
+ * The Warp boards pair the 68k with an ARM co-processor. The two talk
+ * through a dual-port RAM window and a shared interrupt control register,
+ * both of which sit at fixed offsets inside the board's Zorro space.
+ *
+ * This describes only the small part of that interface this driver uses:
+ * the control register bits, the handful of commands behind the sysfs
+ * attributes, and the diagnostic reply. The board firmware implements many
+ * more commands - see the vendor sources for the full protocol.
+ *
+ * Multi-byte fields are laid out as the 68k sees them, and the wire format
+ * assumes 2-byte alignment for 32-bit members. That is what m68k gcc does
+ * by default, so no packing attribute is needed here - but it does mean the
+ * kernel must not be built with -malign-int, which would push every 32-bit
+ * member to a 4-byte boundary and desynchronise the layout from the board.
+ * The static_assert()s at the end of this file catch that.
  */
 
 #ifndef _WARP_MFD_H
 #define _WARP_MFD_H
 
+#include <linux/build_bug.h>
+#include <linux/types.h>
+
 /* Offsets from the start of the board's Zorro window. */
 #define WARP_OFFSET_DPREG_CR	0x1000	/* dual-port interrupt control reg */
 #define WARP_OFFSET_DPRAM	0x2000	/* dual-port RAM */
@@ -16,4 +35,101 @@
 #define WARP_DPRAM_SIZE		0x2000
 #define WARP_ATA_SIZE		0x1800
 
+/*
+ * Interrupt control register. Writes are read-modify-write requests rather
+ * than plain stores: OR in DPREG_CR_SET to set the named bits, or write them
+ * with DPREG_CR_CLR to clear them. Reads return the raw bit state.
+ */
+#define DPREG_CR_SET		0x80000000	/* set the bits in this word */
+#define DPREG_CR_CLR		0x00000000	/* clear the bits in this word */
+#define DPREG_CR_IE_ARM		BIT(0)		/* ARM irq enable */
+#define DPREG_CR_IE_68K		BIT(1)		/* 68k irq enable */
+#define DPREG_CR_MP_ARM		BIT(2)		/* message pending (ARM) */
+#define DPREG_CR_MP_68K		BIT(3)		/* message pending (68k) */
+#define DPREG_CR_MR_ARM		BIT(4)		/* message received (ARM) */
+#define DPREG_CR_MR_68K		BIT(5)		/* message received (68k) */
+#define DPREG_CR_IE_ETHRX	BIT(6)		/* ethernet rx irq enable */
+#define DPREG_CR_IF_ETHRX	BIT(9)		/* ethernet rx irq flag */
+
+#define WARP_BOARDNAME_LEN	32
+#define WARP_WIFI_SSID_LEN	128
+#define WARP_WIFI_PASS_LEN	128
+
+/* Command opcodes. Only the ones this driver issues are listed. */
+enum warp_cmd_id {
+	WARP_CMD_GET_DIAG	= 6,
+};
+
+/* Reply opcodes, as reported in struct warp_rpl_hdr::rpl. */
+enum warp_rpl_id {
+	WARP_RPL_NOP		= 0,
+	WARP_RPL_DIAG		= 1,
+};
+
+struct warp_cmd_hdr {
+	u32	cmd;			/* enum warp_cmd_id */
+};
+
+union warp_cmd {
+	struct warp_cmd_hdr		hdr;
+};
+
+struct warp_rpl_hdr {
+	u32	rpl;
+};
+
+/*
+ * Reply to WARP_CMD_GET_DIAG. Fields this driver does not expose are kept
+ * so the ones after them land at the right offset.
+ *
+ * turbo_level and tz_corr_secs are reported by the firmware but no longer
+ * maintained by it; treat their contents as stale.
+ */
+struct warp_diag {
+	struct warp_rpl_hdr	hdr;
+	u32			vcc5v;			/* binary32 */
+	u32			vbatt;			/* binary32 */
+	u32			t60_ntc;		/* binary32 */
+	u32			t60_internal;		/* binary32 */
+	u32			t_arm;			/* binary32 */
+	u32			hw_ver;
+	u32			fmw_ver;
+	u32			turbo_level;		/* obsolete, stale */
+	u32			fan_percent;
+	char			board_name[WARP_BOARDNAME_LEN] __nonstring;
+	u32			kickstart_nr;
+	u32			usb_dev_status[2];
+	char			wifi_ssid[WARP_WIFI_SSID_LEN] __nonstring;
+	char			wifi_pass[WARP_WIFI_PASS_LEN] __nonstring;
+	u32			native_ide_enabled;
+	s32			temp_reg_cpu;
+	s32			temp_reg_min_pwm;
+	u8			ide_ior_as;
+	u8			ide_ior_ng;
+	u8			ide_iow_as;
+	u8			ide_iow_ng;
+	u8			ide_ack_as;
+	s32			tz_corr_secs;		/* obsolete */
+	u8			board_type;
+	u32			wifi_state;
+	u32			cpu_freq_mhz;		/* binary32 */
+	u32			cpu_clk_phase_shift_deg; /* binary32 */
+};
+
+union warp_reply {
+	struct warp_rpl_hdr	hdr;
+	struct warp_diag	diag;
+};
+
+/*
+ * The board decides these offsets, not the compiler. If a toolchain change
+ * moves them, every field past the first mismatch decodes as garbage, so
+ * fail the build instead.
+ */
+static_assert(offsetof(struct warp_diag, board_name) == 40);
+static_assert(offsetof(struct warp_diag, wifi_ssid) == 84);
+static_assert(offsetof(struct warp_diag, wifi_pass) == 212);
+static_assert(offsetof(struct warp_diag, wifi_state) == 364);
+static_assert(sizeof(struct warp_diag) == 376);
+
 #endif /* _WARP_MFD_H */
-- 
2.43.0

