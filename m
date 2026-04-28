Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4543DA4F
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 15:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391856; cv=none; b=lyW8IMp4ny1J0JecX33QUPdsI9ElxiOFEfU+vgCSZGxln9B9I6+im4efijTXRQDNO425+j/8DsVQvz1mE4IexuL71lgrw9RD+IB/KEgBKtOr656xiVcauQxk7jleuavd39EnSZ86gYvOPPGOuJfi4cns1yBj30VS6Apqq3e6MV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391856; c=relaxed/simple;
	bh=ELPLNWEdhv27CtXGcowWE2M8MhTaAbuHQctUhBNkFz0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U+XIJGKg0ouAckz1ea7EQlAWo12X3JJOoKSZ05E1Ol6rAH5NMlv/GdnfiqEgS60mCSW1Np0C+4srMNfB57Rhrdisyz+dgbBmHh7T6ynpL8g6A9hV1tUO9FSqXp9sIqd8H/sQMuq1q+6vAtSBzSUKjDgOyqOew9mkwVsA5r/0M60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTkLtESf; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTkLtESf"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CACF4168C;
	Tue, 28 Apr 2026 15:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51560C2BCFD;
	Tue, 28 Apr 2026 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777391854;
	bh=ELPLNWEdhv27CtXGcowWE2M8MhTaAbuHQctUhBNkFz0=;
	h=From:To:Cc:Subject:Date:From;
	b=jTkLtESfu2NhI33JhkYsCFkaGuycQb1Ytm9Iipm8gTYfuc5loa4jMpeOkNAJxOIkT
	 udotOULtGBEt1aecqCCe6I+O09YUsE8VEg/MR9vLPMDrRWL8T041paQuwTsdS3/8R7
	 0QzLnfXJnQpFjucr8i8ygLX1CXB6t8ayV49Iawoo9/EuM5TskvLMYaFJYkxBL3qPAU
	 +n5yDGAmMcbjZTOj8hL/EYMyOqmGZ9UlqHj4pW9Hz5ZYi86rfeou6ZoSwU+aW+2QBn
	 HemgiIiLLUiO+P1fYipaxmPlUn5WEvf3+hrk/FdHiuKWf8b3+pIwvcXIXlrt3wR1dR
	 E+q7KpDnSAhMQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: coldfire: select legacy gpiolib interface for mcfqspi
Date: Tue, 28 Apr 2026 17:57:19 +0200
Message-Id: <20260428155729.3278685-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

