Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADA53019CC
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Nov 2025 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988640; cv=none; b=A4uedO0LOajK2RYOuMZy9oDYYTtByzZuJ5PKPv2N4MB15hePWW2rZoDKckrW3lrCGvDON9/m2EnMSgTs8g07MMOj0Md/u4HScfMtuC8vZXjdmVTdheqpjxplyl31Gqs7en+yzR/IKQhqSrZ26C3xkcbdkntAFeB/OZ9OUhxbkBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988640; c=relaxed/simple;
	bh=va9Btmq0fbQ8/UccRYS5f0pnh1pGaTMnXaLt4GgFyE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxZvqbAwyNB29/dKAFaDB9nGUJcx66q2Yc/EDE79j88+oy65f9axp32LZ5wj2QV03g/Ckz408OoluZlCzJDrZXG4jd4Sum9lT1kJHeoDdY2NXGi6uYPrDgL9mSiY1GeSSGE+v4wSTHdQggRijCkoe84uIZSq6aaI8/d7TNdAnJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=dCE/EADP; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="dCE/EADP"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E70A443F2;
	Mon, 24 Nov 2025 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1763988631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ZtBQiByJLXTd7tTZYVsrh3HjYSN2tUwTsUZ2S4eorM=;
	b=dCE/EADPCiUx/BmWcaQ91hKfGmfXq+LjtqIgKmF2lGiKgn4/nJ78cHSVJ4jjRpaLCF4xjm
	7gZ+XdXJ1Jq3198HOrbDyTCr1lZZQXKf03PUji7c4V5uz15ivq26BLLmld6iepm042U+hm
	6J3DqpJU4jAVWgzrz7rnE+HvXtaNxed1wdLeducplH2ILL4SCMnESkg/KFZIZkX/9aVwrl
	iJPoJM8OBrLV+TgZl3+QdMiUSnKv4e26vgpFpmgO9rOCU64rqYfIsLcSHjwD0Oj/iuwmUH
	jdcwD7AQ85d5xSIgRhpN21S+6DXcVM7DaPMk9etinKnVlj4Y1W1ZoQUZR/xBFw==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Mon, 24 Nov 2025 13:50:26 +0100
Subject: [PATCH 5/7] dma: fsl-edma: Move error handler out of header file
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-dma-coldfire-v1-5-dc8f93185464@yoseli.org>
References: <20251124-dma-coldfire-v1-0-dc8f93185464@yoseli.org>
In-Reply-To: <20251124-dma-coldfire-v1-0-dc8f93185464@yoseli.org>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763988624; l=1852;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=va9Btmq0fbQ8/UccRYS5f0pnh1pGaTMnXaLt4GgFyE4=;
 b=U+7OL0mSSRtoc1L1IzHaoAh3XKB++Gghc/o8riySTGs8840ZQW83gYZJVA9DyfGUs/Ojx8q5p
 NVkDcnZ1NJlDVcCR8Uo9EWSysAc5TiM58JZliwIUv+fK1JQRRZKdOWY
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeekieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeffjefhtdelhffhheevheeutefghfefteeluedvudfhgeegteeitddtuefhhfelteenucfkphepvdgrtddumegvtdgrmeduieelmeejudegtdemkeeksgefmeehudehfeemtgdvieegmeegfhgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemkeeksgefmeehudehfeemtgdvieegmeegfhgspdhhvghlohephihoshgvlhhiqdihohgtthhordihohhsvghlihdrohhrghdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepkedprhgtphhtthhopegumhgrvghnghhinhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhrt
 ghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Move fsl_edma_err_chan_handler from an inline function in the header
to a proper function in fsl-edma-common.c. This prepares for MCF
ColdFire eDMA support where the error handler needs to be called from
the MCF-specific error interrupt handler.

No functional change for existing users.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 drivers/dma/fsl-edma-common.c | 5 +++++
 drivers/dma/fsl-edma-common.h | 6 +-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index db36a6aafc910364d75ce6c5d334fd19d2120b6b..40ac6a7d8480b9ed2c6a2bdec59b4fda5fcb6271 100644
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
index 4c86f2f39c1db9a812245fe85755ec8d1169c44c..64b537527291795964a77a9021192a39756b6987 100644
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

