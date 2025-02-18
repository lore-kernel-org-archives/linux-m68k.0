Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E1F26138A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883164; cv=none; b=CL2O9O5/9NHOK4lWqH0uVk9IbG4q6l83OTO0pUx7qlCHaPK9IDynUF0fesNvs8q8pUdszZeAln7WJi5l39n1aC5JXEBdmQ00oqRlFU+tYnpDQF1y5RtUxgyAi7aQvPC7+tEmGG5MQVSI5S+i+fQwTb64QcMWHRdOj5+BdnW1lRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883164; c=relaxed/simple;
	bh=KDMz52UVzD/xe5/dxCC6Ir1DqA6mQkxOOtKDhTsqtyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQvCIZ+ccGG1+9N5spbFhhlZPZy/bKH+refJQ0XoJGQYwWqdVXFzOt8ZoDo6SZ4JBS9+FWsHJ/hA7v+ZzvFDx2pH097TuavW0/WbsRJ2s+iJvhET5PjJDiDnPpz8cHXAI5lSTyz7fVo+hDNSL0tzWhphf1FiHcuhf1ej1z12J7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE7FFA40B42;
	Tue, 18 Feb 2025 12:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B957AC4CEE2;
	Tue, 18 Feb 2025 12:52:40 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 02/13] serial: mcf: add devicetree support
Date: Tue, 18 Feb 2025 22:46:22 +1000
Message-ID: <20250218125124.2692982-3-gerg@linux-m68k.org>
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

Add basic support for probing the ColdFire UARTS via a devicetree.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 drivers/tty/serial/mcf.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/mcf.c b/drivers/tty/serial/mcf.c
index fd8cf3399855..d83f05d9e150 100644
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
@@ -463,6 +464,7 @@ static const struct uart_ops mcf_uart_ops = {
 };
 
 static struct mcf_uart mcf_ports[10];
+static int mcf_numports;
 
 #define	MCF_MAXPORTS	ARRAY_SIZE(mcf_ports)
 
@@ -573,6 +575,8 @@ static int mcf_probe(struct platform_device *pdev)
 	struct uart_port *port;
 	struct resource *res;
 
+	if (pdev->id == -1)
+		pdev->id = mcf_numports;
 	if (pdev->id >= MCF_MAXPORTS)
 		return -ENODEV;
 	port = &mcf_ports[pdev->id].port;
@@ -598,6 +602,8 @@ static int mcf_probe(struct platform_device *pdev)
 	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
 
 	uart_add_one_port(&mcf_driver, port);
+
+	mcf_numports++;
 	return 0;
 }
 
@@ -617,11 +623,17 @@ static void mcf_remove(struct platform_device *pdev)
 
 /****************************************************************************/
 
+static const struct of_device_id mcf_uart_dt_ids[] = {
+	{ .compatible = "fsl,mcfuart", },
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
2.43.0

