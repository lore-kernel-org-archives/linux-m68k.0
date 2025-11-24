Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13EF3002AD
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Nov 2025 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988636; cv=none; b=rmkCHvEP8G6msTovW0Tkq+oED+C7HRuDDM1bc1BKvumv9E/hplpF5OCOQz+7FArAv0lntwTQViHj/6kZ3WsNHDlwh4lux1xsBQphRXL/2cwI0JITZ5/ywWUfis+rhTvz36PfLWbkF89CpIJNrrIOzwAws/UUd/Oyi5ekWHmbFf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988636; c=relaxed/simple;
	bh=FKaWobWJViggwPnsZtfIAribt87lp1BCi3e4jWWfCu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSNgjK+sYCg8/HlRiTsCdlZPupNXo4ubBmKnom4/EXAmb+QCZQ8MuRo3iJTm6b0I+kvSMmn39mTAbBhbdz6lmCxB1NzbnGO2HG2rZmUmAkSubMVH8v0uz1KbdRlz0NjFU9TuIdasI77JwADs9CpJYDZFO1n+U9zaNmdoO2CZabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=U15TD4HS; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="U15TD4HS"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FC6B443B9;
	Mon, 24 Nov 2025 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1763988633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFRCqjmZTDjYwXs9mHTwQzP6v0YfpJFAmMSvBfVoyHo=;
	b=U15TD4HSkHAMYItwQM7vgmkCbaMyiG3kyDRBFaP2O/KBbGwQj5GrzmTqqROk/aFmUxzUbq
	4rIjnPLXZYH1vb59EClBZlAxQlrAS9UqXDw+OQuYeTfGJS86JOi3TvboKSvweq20u0Sp65
	F8BXhrLFan5PJzJU05z3EL+FcX2kWn4tjvAY2fYNGlAHzd3wzi+D6EkdPQWTjnS3r/PAJw
	GyK+uEynZcAJ02L++y2CwHCRaFhuuGvZOIbXRzNTFkqmrZH612LRTpqtrQ1AQ6KAJhSQkA
	qYEc+fyNrShgSqsqlb/HhDY0sdxvLqJmWs41q5dFMONG4y/+oPfCKB6lVMea/Q==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Mon, 24 Nov 2025 13:50:28 +0100
Subject: [PATCH 7/7] dma: fsl-edma: Support source stride for interleaved
 DMA transfers
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-dma-coldfire-v1-7-dc8f93185464@yoseli.org>
References: <20251124-dma-coldfire-v1-0-dc8f93185464@yoseli.org>
In-Reply-To: <20251124-dma-coldfire-v1-0-dc8f93185464@yoseli.org>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763988624; l=1817;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=FKaWobWJViggwPnsZtfIAribt87lp1BCi3e4jWWfCu4=;
 b=ZCvvR4NFd0F1MK2oKb9mLxd1UhjGQdDhiI93WRdjZ8MUKl+Tun9eVHJkDV+PuaxjlNBCCM579
 V56STaWPPNZAxi75LsvF9ncwbF4axnDWG15e2rq6Bwf3k9ny25yVMFd
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeekieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeffjefhtdelhffhheevheeutefghfefteeluedvudfhgeegteeitddtuefhhfelteenucfkphepvdgrtddumegvtdgrmeduieelmeejudegtdemkeeksgefmeehudehfeemtgdvieegmeegfhgsnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemkeeksgefmeehudehfeemtgdvieegmeegfhgspdhhvghlohephihoshgvlhhiqdihohgtthhordihohhsvghlihdrohhrghdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepkedprhgtphhtthhopegumhgrvghnghhinhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhrt
 ghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Add support for using src_port_window_size to configure the source
address stride (SOFF) in DMA transfers. This enables interleaved
memory access patterns needed for applications like stereo audio
de-interleaving.

When src_port_window_size is set, the source offset is calculated as:
  SOFF = src_port_window_size * dst_addr_width

This allows DMA to skip samples in memory while writing consecutive
samples to the device, enabling efficient stereo-to-mono de-interleaving
without CPU intervention.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 drivers/dma/fsl-edma-common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 40ac6a7d8480b9ed2c6a2bdec59b4fda5fcb6271..e510cab24382fa557a2623465393c852b616fef3 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -647,6 +647,9 @@ struct dma_async_tx_descriptor *fsl_edma_prep_dma_cyclic(
 			doff = fsl_chan->is_multi_fifo ? 4 : 0;
 			if (fsl_chan->cfg.dst_port_window_size)
 				doff = fsl_chan->cfg.dst_addr_width;
+			if (fsl_chan->cfg.src_port_window_size)
+				soff = fsl_chan->cfg.src_port_window_size *
+					fsl_chan->cfg.dst_addr_width;
 		} else if (direction == DMA_DEV_TO_MEM) {
 			src_addr = fsl_chan->dma_dev_addr;
 			dst_addr = dma_buf_next;
@@ -714,6 +717,9 @@ struct dma_async_tx_descriptor *fsl_edma_prep_slave_sg(
 			dst_addr = fsl_chan->dma_dev_addr;
 			soff = fsl_chan->cfg.dst_addr_width;
 			doff = 0;
+			if (fsl_chan->cfg.src_port_window_size)
+				soff = fsl_chan->cfg.src_port_window_size *
+					fsl_chan->cfg.dst_addr_width;
 		} else if (direction == DMA_DEV_TO_MEM) {
 			src_addr = fsl_chan->dma_dev_addr;
 			dst_addr = sg_dma_address(sg);

-- 
2.39.5

