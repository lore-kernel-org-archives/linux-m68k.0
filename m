Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B953428C862
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Nov 2025 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764140893; cv=none; b=dCerw3EEsBtzGOYL2PjKR1lNSHtMqv523vwEG1IgJymapVSTu2Tmo/3sXkXBYYdN1y7m1E7LjB64BdeziL17fCw7ll+bOPPt2MXKNm/JAg/K1iMQQ91+DQRQutIxaFIFOik+DPJmRz7KUri5NOhITEHunLrOXeDhlAIvYo8h7eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764140893; c=relaxed/simple;
	bh=Da6NAj4w3l/HOWxmh1R0GzL6Mu+qL67wXcnQ+g/a0Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q15gfDw844WrYRIP0kLJkJSHYI7OCp4TCGhgOcASmcQQ9LgOVX3ytGB0lpw6ecBjbDpVHgm2jPN3zaFU94WVRp6Ep3Odv4wCep+2PnOEH1eM1ENMY30E0W1nWOuFf2YnO6hnAQvz9c3R7IK2qTCRYMNF3xjMBIxcaC/Gu9vDLKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qR6CsCBp; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qR6CsCBp"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9C3460169;
	Wed, 26 Nov 2025 07:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88E35C113D0;
	Wed, 26 Nov 2025 07:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764140890;
	bh=Da6NAj4w3l/HOWxmh1R0GzL6Mu+qL67wXcnQ+g/a0Fo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qR6CsCBpN360yEKVRUpbWBOBxL0pwARl93hC5mXUgF1TT2GHUWqDDYJPjcYtWm9a8
	 QLdacWsnDtI+meVMDglLe/MPSmUoEchUqFRDtjqYvTmgDs2+UJyKJp/EgNyqRlWcE+
	 6ywnf8NiYfeyKLvunf4gdWHDLvvK9t5gOmx1m9xj3M0jCHs0U1sf7vuWgHE53/JHNH
	 wVUgKoB0JK7BKKBNT+n8cRpfvGZS8wUcaOf8dS9vkRz/MvlJy0oCsQ+vLAnYXMdC+5
	 4bKYfFXipllQG6Cs4F/pNJ3ZA1QvVx/ZzOsFeIOtBSd+FJpdWFgSTnQ6HpzA5Ygowc
	 qI0QpozcT7NYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFA2D10384;
	Wed, 26 Nov 2025 07:08:10 +0000 (UTC)
From: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>
Date: Wed, 26 Nov 2025 08:08:09 +0100
Subject: [PATCH v4 1/2] hwrng: imx-rngc: Use optional clock
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
In-Reply-To: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764140889; l=974;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=6yowbDUcruSfT+pB3Hc8Rr8mGdRNN9tkk1YhS+Cu13k=;
 b=fi8KOrh8x9MJfniLee28k496XKjc9mUk+IoZmDHr0DpuL04GI71pXFWvmFsY/KGQjSwyFbnxq
 E+ffkN+R57RDfwfb6dh9Wr/mo9+on+eini+nsUKg/RpJ9EDd3k1D+Tu
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-Endpoint-Received: by B4 Relay for
 jeanmichel.hautbois@yoseli.org/20240925 with auth_id=570
X-Original-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Reply-To: jeanmichel.hautbois@yoseli.org

From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Change devm_clk_get() to devm_clk_get_optional() to support platforms
where the RNG clock is always enabled and not exposed via the clock
framework (such as ColdFire MCF54418).

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 drivers/char/hw_random/imx-rngc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
index 241664a9b5d9..d6a847e48339 100644
--- a/drivers/char/hw_random/imx-rngc.c
+++ b/drivers/char/hw_random/imx-rngc.c
@@ -259,7 +259,7 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
 	if (IS_ERR(rngc->base))
 		return PTR_ERR(rngc->base);
 
-	rngc->clk = devm_clk_get(&pdev->dev, NULL);
+	rngc->clk = devm_clk_get_optional(&pdev->dev, NULL);
 	if (IS_ERR(rngc->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rngc->clk), "Cannot get rng_clk\n");
 

-- 
2.39.5


