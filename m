Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E253283FDC
	for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Aug 2025 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666384; cv=none; b=Qj6vDw6DN+sEiN8jC0MZ/eevleNutPbKRdCWVw5qqS+ByWjt6+c6+ynmQIw9MfuP3tkL4gqAykngJxac6jclCGljBxYK6eLP9h6BFkF2cZDW+l9SK39TBg0fsZFB2HH5bAqxcPvDYiHIJo3EEvZ0QlTuRzwIAuB4AZ3ZPs3p46k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666384; c=relaxed/simple;
	bh=ELPLNWEdhv27CtXGcowWE2M8MhTaAbuHQctUhBNkFz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HpgEpyYZSIV4adz/dZhimAYwOnFFKlYhEnXK2QnBI1l0m/S5nOU0dbab1zymN3X6yv57do8nfTlvGRSnvRt1A8iL5wL7yzX/If4zAh37vsg1Ljb4U2G/zhFTX+y8uuTGRouW2RJL7t3BHlbXKUtCrigGR22D6NStsMLpWSFJLzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXgXAzgD; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXgXAzgD"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9451D601ED;
	Fri,  8 Aug 2025 15:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BE7C4CEF4;
	Fri,  8 Aug 2025 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666381;
	bh=ELPLNWEdhv27CtXGcowWE2M8MhTaAbuHQctUhBNkFz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GXgXAzgDUvvCQ5ddKuKhfHgEyF5F3DVkDhZsxMeAppyP9d449wuxnhDvUQTubn7Ej
	 2Ab3AeRpfGiZ7TUCowuFxOQxrGAmKqUlDpFU/XkFSyzdXyMejWH8FdwaWUBWj3DC96
	 2T28ywnxX3WwVMRiLvhuprbk20zCAbjQENae4jsgRTlkeRNrrOfhG4qRvf2KZyfEWc
	 U/YSJ1OOxm1I21hqwhkwVkB01jtTLBrKsBQMagIykzO2Gr2BoBiGJSOn47VVSoY28a
	 sauApsUotyGnEbOCu85kkthQSfzaaAV6KkqhQvQETq4gwCscPHGW7UO7kXRKzkDc5q
	 yyRKaQprFtxpw==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/21] m68k: coldfire: select legacy gpiolib interface for mcfqspi
Date: Fri,  8 Aug 2025 17:17:46 +0200
Message-Id: <20250808151822.536879-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The common coldfire code uses the old GPIO number based interfaces for
at least the QSPI chipselect lines. Select the required Kconfig symbol
to keep it building when that becomes optional.

Apparently there are no devices attached to a QSPI controller in any of
the coldfire boards, so this is not actually used in upstream kernels.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/Kconfig.cpu | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index c9a7e602d8a4..148f8a79d206 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -30,6 +30,7 @@ config COLDFIRE
 	select CPU_HAS_NO_MULDIV64
 	select GENERIC_CSUM
 	select GPIOLIB
+	select GPIOLIB_LEGACY if SPI_COLDFIRE_QSPI
 	select HAVE_LEGACY_CLK
 	select HAVE_PAGE_SIZE_8KB if !MMU
 
-- 
2.39.5

