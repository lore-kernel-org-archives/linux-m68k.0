Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB5B31A55A
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Nov 2025 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146167; cv=none; b=q/x7zgg5eTebOHWjrcg7K19qRrvHyYsuiKBJy8SzXnfFZUBdME/wRARkp7/8Jl3IQkx3wWdl0OKkK7mMyEMYx1AmEOpVk9WkSJNuXuyddnEZgQh3lhItCbg4wWRx/e2QVIGEFRYXPaNP54qrf+ycwExColSU5kDsCuo/ijTnmEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146167; c=relaxed/simple;
	bh=fOmsUHpgbUfm96TRpWCT/YXCIOrIrgwM+3sS66JgI0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OeEX8Ue20laKzXHGnRdmjrO8Jn+edKwStRdkOajLxcYP8ySjAdgnLDnt4anrg6L7Wwuu3ejn7s9myBM35ObMvozA8lBTe99KcSfh9rN5oK50uYwIJSvVoJvFnBREh8mHnUyemrTajzHwqJkIjgHTV7X0XL+3aHWpMQO49am9hPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuxdDgFF; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuxdDgFF"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7633A44490;
	Wed, 26 Nov 2025 08:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57A70C19422;
	Wed, 26 Nov 2025 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764146164;
	bh=fOmsUHpgbUfm96TRpWCT/YXCIOrIrgwM+3sS66JgI0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VuxdDgFFABklqYuk8Yd+YQ3AC27lYGUrzliQ+s5JYPOZNMvMPErQzI8QYsuRfUFLN
	 XvDu6GFPWlrkAYmbQqlHOFL+37TSg6iOGIkL5PC1WjzcIxWbj2umYOrpi3qvQO6pu8
	 EiHweKQcDU1q2yAy5dXtIBc34TZIIHGfWhXTxMTW1iJ6nUZ8GHPDJaqZJHeaYjutxT
	 Daieh0isDzXYWPI5Rg2TmCE9FOHD+XFsCqqfRpTLysi4aPsGnHiqfK727liajCo+m6
	 qdWYgnLaDIz28S9Y/WriIr6t9av53LKyoPtahoHrwRVrBgenD9SZHhomKWPHDhvvhW
	 Zi803ecakGfaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F99D10390;
	Wed, 26 Nov 2025 08:36:04 +0000 (UTC)
From: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>
Date: Wed, 26 Nov 2025 09:36:05 +0100
Subject: [PATCH v2 4/5] dma: fsl-edma: Move error handler out of header
 file
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-dma-coldfire-v2-4-5b1e4544d609@yoseli.org>
References: <20251126-dma-coldfire-v2-0-5b1e4544d609@yoseli.org>
In-Reply-To: <20251126-dma-coldfire-v2-0-5b1e4544d609@yoseli.org>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Angelo Dureghello <angelo@sysam.it>
Cc: Greg Ungerer <gerg@linux-m68k.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764146162; l=1782;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=gG4IzOttHb1mDGj3hSrbOa5uG61+wAi/EXuAZ5+EKHs=;
 b=5CVOve8F7k3DV8CGTn4M0M42Wyr47VbbF4O7r9xtQ9Sn+z5nbv+OkMjMHKv/r01wvrdsOus8+
 anmIioJWRw5AtV1EwbXG6XX1iUJ9GqER/P/0xmNI7nj2eQibHashL2k
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-Endpoint-Received: by B4 Relay for
 jeanmichel.hautbois@yoseli.org/20240925 with auth_id=570
X-Original-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Reply-To: jeanmichel.hautbois@yoseli.org

From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Move fsl_edma_err_chan_handler from an inline function in the header
to a proper function in fsl-edma-common.c. This prepares for MCF
ColdFire eDMA support where the error handler needs to be called from
the MCF-specific error interrupt handler.

No functional change for existing users.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 drivers/dma/fsl-edma-common.c | 5 +++++
 drivers/dma/fsl-edma-common.h | 6 +-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 4976d7dde080..49d5dca216b6 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -44,6 +44,11 @@
 #define EDMA64_ERRH		0x28
 #define EDMA64_ERRL		0x2c
 
+void fsl_edma_err_chan_handler(struct fsl_edma_chan *fsl_chan)
+{
+	fsl_chan->status = DMA_ERROR;
+}
+
 void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan)
 {
 	spin_lock(&fsl_chan->vchan.lock);
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 4c86f2f39c1d..64b537527291 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -478,11 +478,7 @@ static inline struct fsl_edma_desc *to_fsl_edma_desc(struct virt_dma_desc *vd)
 	return container_of(vd, struct fsl_edma_desc, vdesc);
 }
 
-static inline void fsl_edma_err_chan_handler(struct fsl_edma_chan *fsl_chan)
-{
-	fsl_chan->status = DMA_ERROR;
-}
-
+void fsl_edma_err_chan_handler(struct fsl_edma_chan *fsl_chan);
 void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan);
 void fsl_edma_disable_request(struct fsl_edma_chan *fsl_chan);
 void fsl_edma_chan_mux(struct fsl_edma_chan *fsl_chan,

-- 
2.39.5


