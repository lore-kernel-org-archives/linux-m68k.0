Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53513195F9
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Nov 2025 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146166; cv=none; b=m2y3ddhNmOYC9R5oBOJaEB8lMA4dLf8o8Q6UO709f54B/yz329TOUrAvVSBaW+241RlcX07O9QBKOh1+ipyCuXUI8vPCd+GwZDaGNUtmuiaMcQr/fgACEmM36s8MF727opPfrryZGKUrzh0SYNFMtEWCRj9kXaPEPpGixzDi8lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146166; c=relaxed/simple;
	bh=nd+pFsIerpdXVlUEPgldk3qgziMj5gCsybyDQWOCukY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzjPDyYKUqrGAycMU8ccXmO5WDtbvP20BN86+a4fLutEdkhOduAGIOumPHmSKEJ5xw2e4pl9s8tPEF9uBYfDa7zGyk66MQatjbwufrMgaORCitxdk5EoMwcLHtFTUq0Fh/VQEIVlB3a9DuM3XsFvAE9nw6z5q4VkKzxdZGgOIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEjUtsSN; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEjUtsSN"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 499684448E;
	Wed, 26 Nov 2025 08:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F921C19423;
	Wed, 26 Nov 2025 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764146164;
	bh=nd+pFsIerpdXVlUEPgldk3qgziMj5gCsybyDQWOCukY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KEjUtsSNE/fMvbVVhk4Skb1fhge4ota8yCkFNW8gOh9edVKPfySI0X3flm/dFf6A8
	 W24VZDBpNeY1S51wCzk1DcvICJlawv+mkBwpzlR+NLolIxF+b6P21agZlKk1oPNPMk
	 81+RzVtQbQHxttxgbrmewwcuoVV2yeNPzZmmfX9CE+IcYsWQ50rbv/cZyt2bTh21P8
	 ANO8ZXw65MigftjOglfRCB5OoxIt5KJ3VFkBU+U3cxVUm1qddTbRjIrITduM6US5AQ
	 AcfsZUFRWMfjU2YBOKPJh5eg9ORIvsxi2Qur8QNsMdPwJgJctLd0lJA8NO/YuuiNi4
	 0pGy8P9qWq9pQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EE9D10381;
	Wed, 26 Nov 2025 08:36:04 +0000 (UTC)
From: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>
Date: Wed, 26 Nov 2025 09:36:04 +0100
Subject: [PATCH v2 3/5] dma: mcf-edma: Fix interrupt handler for 64 DMA
 channels
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-dma-coldfire-v2-3-5b1e4544d609@yoseli.org>
References: <20251126-dma-coldfire-v2-0-5b1e4544d609@yoseli.org>
In-Reply-To: <20251126-dma-coldfire-v2-0-5b1e4544d609@yoseli.org>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Angelo Dureghello <angelo@sysam.it>
Cc: Greg Ungerer <gerg@linux-m68k.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764146162; l=1734;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=HaOGswepi6CQhV7Li1tzKCLUeD5NEzStbHTwZzESV9o=;
 b=uFIDruW6J6TJ+c/uGZMkDzQ/D/jTLyW/AytHC0gVcBXZ66liZBJ8QDBtWrrynsG1Cls5WGZ8J
 GuJc3xn1sxaDlDURdqZcfavyBHNAI+E2XOyQpcFkJWXJRWsFH+fzsJU
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-Endpoint-Received: by B4 Relay for
 jeanmichel.hautbois@yoseli.org/20240925 with auth_id=570
X-Original-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Reply-To: jeanmichel.hautbois@yoseli.org

From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Fix the DMA completion interrupt handler to properly handle all 64
channels on MCF54418 ColdFire processors.

The previous code used BIT(ch) to test interrupt status bits, which
causes undefined behavior on 32-bit architectures when ch >= 32 because
unsigned long is 32 bits and the shift would exceed the type width.

Replace with bitmap_from_u64() and for_each_set_bit() which correctly
handle 64-bit values on 32-bit systems by using a proper bitmap
representation.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 drivers/dma/mcf-edma-main.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
index 6a7d88895501..6353303df957 100644
--- a/drivers/dma/mcf-edma-main.c
+++ b/drivers/dma/mcf-edma-main.c
@@ -18,7 +18,8 @@ static irqreturn_t mcf_edma_tx_handler(int irq, void *dev_id)
 {
 	struct fsl_edma_engine *mcf_edma = dev_id;
 	struct edma_regs *regs = &mcf_edma->regs;
-	unsigned int ch;
+	unsigned long ch;
+	DECLARE_BITMAP(status_mask, 64);
 	u64 intmap;
 
 	intmap = ioread32(regs->inth);
@@ -27,11 +28,11 @@ static irqreturn_t mcf_edma_tx_handler(int irq, void *dev_id)
 	if (!intmap)
 		return IRQ_NONE;
 
-	for (ch = 0; ch < mcf_edma->n_chans; ch++) {
-		if (intmap & BIT(ch)) {
-			iowrite8(EDMA_MASK_CH(ch), regs->cint);
-			fsl_edma_tx_chan_handler(&mcf_edma->chans[ch]);
-		}
+	bitmap_from_u64(status_mask, intmap);
+
+	for_each_set_bit(ch, status_mask, mcf_edma->n_chans) {
+		iowrite8(EDMA_MASK_CH(ch), regs->cint);
+		fsl_edma_tx_chan_handler(&mcf_edma->chans[ch]);
 	}
 
 	return IRQ_HANDLED;

-- 
2.39.5


