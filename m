Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF244FDA67
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Oct 2026 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893473; cv=none; b=A9MGiy+Iui950dagi5OPmNBMyNi0Yd1DkUhL7oPngPluK2PCAVNDSAWodXYks6HWPRAkW3utHGvXagVo1Cz/AZCHmYr7qP5JhqvK3OjNVykndFei13SQ16NsCBffla5tH/6y/2WvdNEDADxAxMGtxK5ejiR6eZK9xDK2QAoAbko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893473; c=relaxed/simple;
	bh=KgwsQEqpKy4l3iEW0ekyGhjV1rRXyJ71ReqJMe6Me7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5+nklhGSa7PcjzfOt0rm9NZ+kYrIAtyBRJTN22GTAZfekgZV56UHQe93iomxKw4w9YDe5f3jwnIo24av3e9c1yJFm6N3UkSOXFdwXp5t2u5113xGuwvO/qz4cx0lo0RXuXEIjfuOV1Mk4Ql2Dz/GA30Zi/nxl4jXcp3Y3l0Szk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A41A940731;
	Tue, 13 Oct 2026 12:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A8B1F00893;
	Tue, 13 Oct 2026 12:11:11 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org,
	linux-serial@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 5/5] serial: mcf: add devicetree support
Date: Tue, 13 Oct 2026 22:07:03 +1000
Message-ID: <20261013120831.1046590-6-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013120831.1046590-1-gerg@linux-m68k.org>
References: <20261013120831.1046590-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic support for probing the ColdFire UARTs via a devicetree.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 drivers/tty/serial/mcf.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/mcf.c b/drivers/tty/serial/mcf.c
index 7cbe43cbe3a0..01b3ab6e7dba 100644
--- a/drivers/tty/serial/mcf.c
+++ b/drivers/tty/serial/mcf.c
@@ -21,6 +21,7 @@
 #include <linux/io.h>
 #include <linux/uaccess.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
@@ -62,6 +63,7 @@ struct mcf_uart {
 #define MCF_MAXPORTS            10
 
 static struct mcf_uart *mcf_ports[MCF_MAXPORTS];
+static int mcf_numports;
 
 /****************************************************************************/
 
@@ -582,6 +584,8 @@ static int mcf_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct mcf_uart *mp;
 
+	if (pdev->id == -1)
+		pdev->id = mcf_numports;
 	if (pdev->id >= MCF_MAXPORTS)
 		return -ENODEV;
 
@@ -612,6 +616,8 @@ static int mcf_probe(struct platform_device *pdev)
 	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
 
 	uart_add_one_port(&mcf_driver, port);
+
+	mcf_numports++;
 	return 0;
 }
 
@@ -629,11 +635,17 @@ static void mcf_remove(struct platform_device *pdev)
 
 /****************************************************************************/
 
+static const struct of_device_id mcf_uart_dt_ids[] = {
+	{ .compatible = "fsl,mcf-uart", },
+	{ }
+};
+
 static struct platform_driver mcf_platform_driver = {
 	.probe		= mcf_probe,
 	.remove		= mcf_remove,
 	.driver		= {
 		.name	= "mcfuart",
+		.of_match_table = mcf_uart_dt_ids,
 	},
 };
 
-- 
2.55.0

