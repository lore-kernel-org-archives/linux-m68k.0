Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2746631A057
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Nov 2025 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146167; cv=none; b=O3wEpEC1JEyNCpOUv3JqFZKLFNFiL6A6bxPMcC0THPT/9MjpH3854N142gz5uyj1rzo/K3uXzJt3cBzrt23dWS2POVxSQ5V/1xdb/qEpC5dx6R4Mq/7elL2GnuPQI4qtsHZT9Gj2NCziCmcNLtxZfY22AQR6V+IcRukn7JCtGbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146167; c=relaxed/simple;
	bh=6/eSDcaslo9+vYL42NakAq96GQDj2C5lZPUYENmliC4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aOGx2TaxvpICXeDe8c9CU76WaE0amRcFHSnmAk2ZDo1AJgFS0B0kN+xjUqYdv8S/kDTFnxEfjaPZFAIfQNUDNGis2D8sYjCkZ3j1D8hb7rnmv71vGTrz2rKnDQ1YHPYwS82uz2366lIjQSR/vfS1EObrfOTPCH259g/uNrHpl+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLZmXv/X; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLZmXv/X"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FE096016D;
	Wed, 26 Nov 2025 08:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB2A2C16AAE;
	Wed, 26 Nov 2025 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764146163;
	bh=6/eSDcaslo9+vYL42NakAq96GQDj2C5lZPUYENmliC4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eLZmXv/X1ePgxGEQpXg3u6/y83vDaIw18lix3NagTGvASfbaoryDTwHdlL6G4t3ez
	 BD6OHBZ+zlaHxKudVQyLrQh/b9nEfkRX3XYgh9CZEVvb8Sn/YyVKOs/6ZaZRfCmTlz
	 4vapBTrq02BM8xHBMTE81OMILh4DK/IPBUz+FnIN+m7lYEEOvcZvkk7w51Ctkyt1te
	 WLvJ34v6Vwd7tITJPpdh6zGQECKeVP466zfL7rBZWDH6bVD9YNNCektlb/RPpnWGdB
	 XGsc4L5B3PYiw80kxkmHVXCNx1NJlYbVyX9lVtTPeS6iGYi+lXjqKjSyxyBXyV7qzz
	 WxX3JTBCqSnKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF829D10381;
	Wed, 26 Nov 2025 08:36:03 +0000 (UTC)
From: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>
Subject: [PATCH v2 0/5] dma: fsl/mcf-edma: Bug fixes and enhancements for
 ColdFire support
Date: Wed, 26 Nov 2025 09:36:01 +0100
Message-Id: <20251126-dma-coldfire-v2-0-5b1e4544d609@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPG7JmkC/1XMSwrCMBSF4a2UOzbSvEp15D6kg5jctBdqUxIJl
 pK9GwsOHP4HzrdDwkiY4NrsEDFTorDUEKcG7GSWERm52iBaoTkXkrmnYTbMzlNEpr3sDCJX8iG
 hXtaInt4Hdx9qT5ReIW6Hnvl3/UHqH8qctczZ3l8k77Xq1G0LCWc6hzjCUEr5APeA+fepAAAA
X-Change-ID: 20251123-dma-coldfire-5f36aee143b3
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Angelo Dureghello <angelo@sysam.it>
Cc: Greg Ungerer <gerg@linux-m68k.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764146162; l=1724;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=6/eSDcaslo9+vYL42NakAq96GQDj2C5lZPUYENmliC4=;
 b=fC5GVRJPXlfdpSiN+oM08RMzdhnInV/phbe9d8m3soqlu4CGAT57yFCvITtNID/Mhwtzo+rKz
 HymH4w0dgnSCYLt80WZyTR2umnlzBWarKN8YEjIHtMxEOho8dK79CCj
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-Endpoint-Received: by B4 Relay for
 jeanmichel.hautbois@yoseli.org/20240925 with auth_id=570
X-Original-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Reply-To: jeanmichel.hautbois@yoseli.org

This series addresses several bugs in the fsl-edma and mcf-edma drivers
affecting MCF54418 ColdFire processors.

Patch 1 adds the FSL_EDMA_DRV_MCF flag to fix byte-lane addressing for
MCF54418.

Patch 2 adds per-channel IRQ naming for easier debugging.

Patches 3-5 fix the interrupt and error handlers for all 64 DMA
channels:
- Patch 3 fixes the interrupt handler to process all 64 channels
- Patch 4 moves the error handler out of the header file for clarity
- Patch 5 fixes the error handler for all 64 channels with proper types

Tested on a custom MCF54418-based platform with slave DMA transfers.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes in v2:
- Check devm_kasprintf() return value
- Keep request_irq on one line in naming patch
- Remove non needed memory barrier
- Remove the interleave patch for now
- Link to v1: https://lore.kernel.org/r/20251124-dma-coldfire-v1-0-dc8f93185464@yoseli.org

---
Jean-Michel Hautbois (5):
      dma: fsl-edma: Add FSL_EDMA_DRV_MCF flag for ColdFire eDMA
      dma: mcf-edma: Add per-channel IRQ naming for debugging
      dma: mcf-edma: Fix interrupt handler for 64 DMA channels
      dma: fsl-edma: Move error handler out of header file
      dma: mcf-edma: Fix error handler for all 64 DMA channels

 drivers/dma/fsl-edma-common.c |  5 +++
 drivers/dma/fsl-edma-common.h | 11 +++----
 drivers/dma/mcf-edma-main.c   | 72 +++++++++++++++++++++++++------------------
 3 files changed, 52 insertions(+), 36 deletions(-)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251123-dma-coldfire-5f36aee143b3

Best regards,
--  
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>


