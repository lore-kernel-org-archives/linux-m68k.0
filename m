Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF081F76D9
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Dec 2024 16:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733241866; cv=none; b=qhPgNX/Lnk8Y+nCckWSfKhr6IJePhu8GC48G/jQqZ7YJG2wIT/M+OspSiSCU45XJmjf3ntU3wcaGZBKTCI8RYZkjiRdIRRQL9Bldj02KkInhkyKKmUmaBciOFFg8P+zjKnWugGxPlZp29YfASWkKrzZwsfaE+npSzC9T0nBd2bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733241866; c=relaxed/simple;
	bh=kPBA1uGXckS3skb4j5MBMZfRIEk4RHoHqbIXz3T9tqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuRi2rexjDUCa4n5OcHoQxxE4h2/m9Q9tU+ckRcVIWsp4lgSdUej7jDIF3db4KDm1NNhixGGZ4H0Fzv2u4Ls76kGoLq8k608q/HlK4SSuBXOkHJ2yoSIkAe6h/arUY9eEramAAcdUD78NvbKVTluZSIPE5IIIxI8TsDwM+7cPX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o1gKWlRH; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o1gKWlRH"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EAD25C6ACA;
	Tue,  3 Dec 2024 16:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4E0C4CECF;
	Tue,  3 Dec 2024 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733241863;
	bh=kPBA1uGXckS3skb4j5MBMZfRIEk4RHoHqbIXz3T9tqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o1gKWlRHBZYBenWn5blUhI8iJOfNaD749znasEqofWKF7H0esKt7j2XvV0F4PU5tY
	 506bdcyggB3ZKJ7tJ7yv5mxdWMC1x155CileYr2IqdQSrcTP487nVwJkHpLZYc2gTO
	 esw/kNdOk6UbiEWsVtEWikNpsCCLNArE65AIP6ak=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Antonio Quartulli <antonio@mandelbit.com>,
	Greg Ungerer <gerg@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12 512/826] m68k: coldfire/device.c: only build FEC when HW macros are defined
Date: Tue,  3 Dec 2024 15:43:59 +0100
Message-ID: <20241203144803.729180619@linuxfoundation.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203144743.428732212@linuxfoundation.org>
References: <20241203144743.428732212@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Antonio Quartulli <antonio@mandelbit.com>

[ Upstream commit 63a24cf8cc330e5a68ebd2e20ae200096974c475 ]

When CONFIG_FEC is set (due to COMPILE_TEST) along with
CONFIG_M54xx, coldfire/device.c has compile errors due to
missing MCFEC_* and MCF_IRQ_FEC_* symbols.

Make the whole FEC blocks dependent on having the HW macros
defined, rather than on CONFIG_FEC itself.

This fix is very similar to commit e6e1e7b19fa1 ("m68k: coldfire/device.c: only build for MCF_EDMA when h/w macros are defined")

Fixes: b7ce7f0d0efc ("m68knommu: merge common ColdFire FEC platform setup code")
To: Greg Ungerer <gerg@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
Signed-off-by: Greg Ungerer <gerg@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/m68k/coldfire/device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index 7dab46728aeda..b6958ec2a220c 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -93,7 +93,7 @@ static struct platform_device mcf_uart = {
 	.dev.platform_data	= mcf_uart_platform_data,
 };
 
-#if IS_ENABLED(CONFIG_FEC)
+#ifdef MCFFEC_BASE0
 
 #ifdef CONFIG_M5441x
 #define FEC_NAME	"enet-fec"
@@ -145,6 +145,7 @@ static struct platform_device mcf_fec0 = {
 		.platform_data		= FEC_PDATA,
 	}
 };
+#endif /* MCFFEC_BASE0 */
 
 #ifdef MCFFEC_BASE1
 static struct resource mcf_fec1_resources[] = {
@@ -182,7 +183,6 @@ static struct platform_device mcf_fec1 = {
 	}
 };
 #endif /* MCFFEC_BASE1 */
-#endif /* CONFIG_FEC */
 
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 /*
@@ -624,12 +624,12 @@ static struct platform_device mcf_flexcan0 = {
 
 static struct platform_device *mcf_devices[] __initdata = {
 	&mcf_uart,
-#if IS_ENABLED(CONFIG_FEC)
+#ifdef MCFFEC_BASE0
 	&mcf_fec0,
+#endif
 #ifdef MCFFEC_BASE1
 	&mcf_fec1,
 #endif
-#endif
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	&mcf_qspi,
 #endif
-- 
2.43.0



