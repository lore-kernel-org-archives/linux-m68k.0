Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E31ABEA5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883187; cv=none; b=i7a8rEGQzmjMt/mDAPmPnd8WLMOwX/U13BhsIqnbi4+Lu3taM0ut934coGZw2vAb7OTYBo16Li8hC1UmjC1JwQPwhPxGs588F2NohDETiOSBg54D9Sn6mRbvnC1eT4YyS6YYqHbGQPL7OtSIJPFfBBVUFim3lLLG3io0VrkGLdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883187; c=relaxed/simple;
	bh=EHHCrd6N/ZCzEoPoVUvCCH3zYEixB5Szlqel7tSyVxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TE1lRKujL7VXfl09+96yT1scCZNnilKnpw4J4IoXK1ERQQ+0d51ZRry+IDwJANTXH770jUHRu6OJzfqAs0YzXGj2fHCPoGjkRqyw+RqDDR9Nj/MBY52BzcTUzJZj5GgiZnB7sm9EzjauYOgSCJ+FBALyLg4F03uyltwglfe2g9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 596B85C549C;
	Tue, 18 Feb 2025 12:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8DFC4CEE2;
	Tue, 18 Feb 2025 12:53:04 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 12/13] m68k: coldfire: disable platform device tree entries
Date: Tue, 18 Feb 2025 22:46:32 +1000
Message-ID: <20250218125124.2692982-13-gerg@linux-m68k.org>
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

If devicetree is enabled for ColdFire platforms then remove the devices
that are supported by a devicetree from the platform device table.

This is done conditionally for now, until a full conversion to use of
devicetree has been completed. Specifically the ColdFire UART and the
FEC ethernet module can currently be supported by devicetree entries.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index 8d7cec28f4d9..e802496d9852 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -24,6 +24,7 @@
 #include <linux/platform_data/dma-mcf-edma.h>
 #include <linux/platform_data/mmc-esdhc-mcf.h>
 
+#ifndef CONFIG_OF
 /*
  *	All current ColdFire parts contain from 2, 3, 4 or 10 UARTS.
  */
@@ -317,6 +318,7 @@ static struct platform_device mcf_fec1 = {
 	}
 };
 #endif /* MCFFEC_BASE1 */
+#endif /* !CONFIG_OF */
 
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 /*
@@ -757,6 +759,7 @@ static struct platform_device mcf_flexcan0 = {
 #endif /* MCFFLEXCAN_SIZE */
 
 static struct platform_device *mcf_devices[] __initdata = {
+#ifndef CONFIG_OF
 	&mcf_uart0,
 #ifdef MCFUART_BASE1
 	&mcf_uart1,
@@ -791,6 +794,7 @@ static struct platform_device *mcf_devices[] __initdata = {
 #ifdef MCFFEC_BASE1
 	&mcf_fec1,
 #endif
+#endif /* !CONFIG_OF */
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	&mcf_qspi,
 #endif
-- 
2.43.0

