Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF838D011
	for <linux-m68k@lists.linux-m68k.org>; Fri, 31 Jul 2026 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491399; cv=none; b=Irut6oVW4CCzMRKkjc1K5vjdIVp4uiz70ZS/9pFbLllNpADbilvrA5B+bVRAYG+mWPRVzMNGwn5UYVxWEPHCyP3e0FqYyExoRM/JeMxFLY8wk524NX8vW6kclD2ddLnQ9B3KNj0IZ/3+BHSxxfm9oa+/GbCzEVpyY+2q0J1O4js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491399; c=relaxed/simple;
	bh=L5RrKZiqmq5IoDWZ+KLmS3AcVbbhzg8T89MSGRzRKZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u7W8jRv1IR735fvK8NkwGe/tPnh+NRUCJ994IWpqFfc/X+m8DrxL9Xsmg9a3CxQlwHMyp+2orK3HITWrHiz2S80NEpaSaNx8a7VeTYxBCqr9LCcRBkuT9GY3PipOKyL5Dox2LUwVRG38jUqJF0qLqdv+aonBWy61bkhi/jkjklM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5sFu4xn; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5sFu4xn"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 8051A415FE;
	Fri, 31 Jul 2026 09:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id CC8D11F000E9;
	Fri, 31 Jul 2026 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785491397;
	bh=hY+/qGTWvt2yh9/ZiTTBX7A7Brs5w1y/9TYPvX1ISGw=;
	h=From:To:Cc:Subject:Date;
	b=a5sFu4xnQl+jcgOwUhVJBAm65NyPtYNx/VA3jZfv8RsJ/vlPl6H5LOHv6WAEIBMF3
	 L/wJdliUKba7/ea6OOWhaHvQ7ksebBaLmTr5/LIii8+yY/wuOB4bj6x/U6NQdTXSOK
	 LVMZOvLTPFxucoTXj0j3w2PVAutYXy2vd+ZF4jQfA5xOUNBWl8bDpm6r1NNYstoin9
	 Bi7kfiTBzBwS1GbW3ohFdiqGyBeSGNTqOqF/BZagB4n3rFkmufT5zCewFVrjeRIJpI
	 nnTjiW6aIQPPl+/Bdv9X8lAZzomiU8NwZsjw9ppaBJy5hAoy0Ak8+847m9liMjfR3R
	 CA1qiozaO8mpA==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Gao Xiang <xiang@kernel.org>,
	Michael Bommarito <michael.bommarito@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: Define NR_CPUS to 1
Date: Fri, 31 Jul 2026 11:49:49 +0200
Message-ID: <20260731094950.1988084-2-ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=ukleinek@kernel.org; h=from:subject; bh=L5RrKZiqmq5IoDWZ+KLmS3AcVbbhzg8T89MSGRzRKZw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqbG++V9OsVnztT2kzF0KXXMEerg0B1gUZYqSIP NBZbZI3ZxOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCamxvvgAKCRCPgPtYfRL+ Tly2B/9A0QV8mgwhv1FodO9SvZeJiqRf9b+PMILB+5fxSipZBh6ivf+NAhlh+OiFphtpwZ4BKT3 eZs8WlP6E0ULtpD+/V+t/kRLid1l1ZKBf1TOmMWF4WL9czSrjg7i0oLlmH/iJyWgA5ER3e6aUzi pjbDxuqdF+bLuUrjvPrgHovToudnZd6Cpk4isrdILQuBnIY1VVC6zydgZryHcsWxWENdoUlBNZr 7uFDz8AlkPX6DSuGn18IgqHCRe+oRfPEA3mPaH4QMKuO1xOMP3tGeeExgV6shKqyT+SjCLbufVB rYLOf2ZSQjSPGsjZVZku3ZAtQwWLVmm/WDor/qrdea4jbjjB
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This fixes a Kconfig warning

	fs/erofs/Kconfig:137:warning: range is invalid

which originates from EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS using
NR_CPUS which up to now didn't exist for ARCH=m68k. All other
architectures define this symbol, so fix the outlier.

Fixes: c9b47e6b2311 ("erofs: cap LZMA stream pool size")
Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 arch/m68k/Kconfig.cpu | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 148f8a79d206..5a58cc13229e 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -549,6 +549,10 @@ config CACHE_COPYBACK
 endchoice
 endif # HAVE_CACHE_CB
 
+config NR_CPUS
+	int
+	default "1"
+
 # Coldfire cores that do not have a data cache configured can do coherent DMA.
 config COLDFIRE_COHERENT_DMA
 	bool

base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
-- 
2.55.0.11.g153666a7d9bb

