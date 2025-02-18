Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2FB1ABEA5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883172; cv=none; b=J53yiiy/DnyOTqvBY964jd9sN/3SdX0X51zomUOWjV/ds39CQYw2O4dEVTw7u0Pq2ayU9HolYxAviwkPLZPCQpnhR+EA9oLIQmTxTqOcLQ+4UHsuU5JIJwAG6EujJJOZ9ehPF7wmkeyLBQBjeP2T+16UlzrcZbaxapsUjEriCr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883172; c=relaxed/simple;
	bh=2q/NTJg++1mk0x81CbM7tpQJRn1ynuVSGwwkHdblquQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGdpH2K0DmNnuJf61SID+KWSpCn//RBVVbOiriOc6xXCHKYq9wA3wdw56Zs/VbzY/ELc+NL7pA3MyTlS7nWkzjIuGOjyTSDllt4ZqPQlsrTZ+b+KRBvfDdVw8ZNCrvWw+YjnuagRgpAmvzyyCttV2iuWDTVgG2OFJJJX6UJ2/sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D5005C0324;
	Tue, 18 Feb 2025 12:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAAFC4CEE2;
	Tue, 18 Feb 2025 12:52:49 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 03/13] net: fec: add device tree support for ColdFire FEC
Date: Tue, 18 Feb 2025 22:46:23 +1000
Message-ID: <20250218125124.2692982-4-gerg@linux-m68k.org>
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

The FEC hardware module used in most Freescale ColdFire SoC parts is a
simpler version of that used on the iMX family of parts. Add a devicetree
compatible entry they can use.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 Documentation/devicetree/bindings/net/fsl,fec.yaml | 1 +
 drivers/net/ethernet/freescale/fec_main.c          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/fsl,fec.yaml b/Documentation/devicetree/bindings/net/fsl,fec.yaml
index 24e863fdbdab..33f73057903a 100644
--- a/Documentation/devicetree/bindings/net/fsl,fec.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,fec.yaml
@@ -24,6 +24,7 @@ properties:
           - fsl,imx6q-fec
           - fsl,mvf600-fec
           - fsl,s32v234-fec
+          - fsl,m5208-fec
       - items:
           - enum:
               - fsl,imx53-fec
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index f7c4ce8e9a26..a0a13afe5b7c 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -179,6 +179,10 @@ static const struct fec_devinfo fec_s32v234_info = {
 		  FEC_QUIRK_HAS_MDIO_C45,
 };
 
+static const struct fec_devinfo fec_m5208_info = {
+	.quirks = FEC_QUIRK_MIB_CLEAR | FEC_QUIRK_HAS_FRREG,
+};
+
 static struct platform_device_id fec_devtype[] = {
 	{
 		/* keep it for coldfire */
@@ -201,6 +205,7 @@ static const struct of_device_id fec_dt_ids[] = {
 	{ .compatible = "fsl,imx8mq-fec", .data = &fec_imx8mq_info, },
 	{ .compatible = "fsl,imx8qm-fec", .data = &fec_imx8qm_info, },
 	{ .compatible = "fsl,s32v234-fec", .data = &fec_s32v234_info, },
+	{ .compatible = "fsl,m5208-fec", .data = &fec_m5208_info, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fec_dt_ids);
-- 
2.43.0

