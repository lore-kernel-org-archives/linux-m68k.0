Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03BE3B9DA5
	for <linux-m68k@lists.linux-m68k.org>; Fri, 31 Jul 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491076; cv=none; b=qA0JRNipf+kabKMYxp9dDRjaHmMBfa+MAA1vU3buS2I3BgU6lgKK9DnIdVQX2xPN9Rp73UxnyWPcDYsWywzPtgmFZOG0ZZPXBrkPGYYLvVL3YuDrQTAOJYRi28E1gEA0v3CQBDrL1YtGncbTrRQ7moxN5e5Tm/ZOLdF2ayYvvNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491076; c=relaxed/simple;
	bh=3XARNsmtS5tVZbmv5LRD69VUfHFNoi1/Jwa0Q9lQlow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvx+kd0Jdq/ob3DUzwRLOcAGETV90X335fjuZvX3o77bqnPRIOtXLvtCrFyYUuZ0yvrkM2EM27JuXHnXHYIJux0Z3DluOnbBRT05eoPFLyYM4MZTnHJd6d4BsKJ+68mJ9ZjHUHO+IENaHgjAHr82vI6DSJJQk2C74U0AYGpAxQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fe/XQXJT; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fe/XQXJT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785491072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YF/KtYGJPSBRPKaKUUPLw1IZ6ShXm5VTTkwFtbBokAY=;
	b=fe/XQXJTqymNuka4bMG9aGeMrw08Y92c6WxNTVbq/GrD7yw4CmOoutMS3I1g+KrRDmZwk5
	AVOlBtNklXfL6H1eGX1+UQdXiHWEaebwPjDJ7PFTcGBOuCZnrLOVbJCLuOmVvw49/ZRZ1i
	P/gyAJC3nYRCW/6htiyt0m+V4savtgc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] m68k/serial: Add include guard to asm/serial.h
Date: Fri, 31 Jul 2026 11:44:01 +0200
Message-ID: <20260731094402.741645-4-thorsten.blum@linux.dev>
In-Reply-To: <20260731094402.741645-3-thorsten.blum@linux.dev>
References: <20260731094402.741645-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=thorsten.blum@linux.dev; h=from:subject; bh=3XARNsmtS5tVZbmv5LRD69VUfHFNoi1/Jwa0Q9lQlow=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk5ecWPbHWZmY477rxqd+TnZeNX7d7aoXLLd2WcEuC7f MHwcCtbRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEykcxYjw5evv9aGGzxU2+OV PzFY2thtmUir/j9+dT72bWdOnAyUsmH4KzFnxe+X/C1SPe8bs2znM09n817tvGz+zHaWzBfnT0i bMgEA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add an include guard and remove the stale comment while at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/include/asm/serial.h | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/include/asm/serial.h b/arch/m68k/include/asm/serial.h
index e215b48975d5..866ef25a74a2 100644
--- a/arch/m68k/include/asm/serial.h
+++ b/arch/m68k/include/asm/serial.h
@@ -1,11 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/*
- * include/asm-m68k/serial.h
- *
- * currently this seems useful only for a Q40,
- * it's an almost exact copy of ../asm-alpha/serial.h
- *
- */
+#ifndef _ASM_M68K_SERIAL_H
+#define _ASM_M68K_SERIAL_H
 
 #include <asm-generic/serial.h>
 
@@ -26,3 +21,5 @@
 	{ 0, BASE_BAUD, 0x3E8, 4, STD_COM_FLAGS },	/* ttyS2 */	\
 	{ 0, BASE_BAUD, 0x2E8, 3, STD_COM4_FLAGS },	/* ttyS3 */
 #endif
+
+#endif /* _ASM_M68K_SERIAL_H */
