Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B21D3B7742
	for <linux-m68k@lists.linux-m68k.org>; Fri, 31 Jul 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491073; cv=none; b=Q3Rr/dRIFyASeBWExiL+ibQUMzWRsHQaePZoIKGdn8f4+NvoUvulU544DE16S5o1KpmapbM/Xje10ezvRJ+mNUvHfyXvrRWQJEyDh/CbgAtdeHLDcgJy9htOTG+F6DIlBIbbjLGADPLbeDWd5fDNGmVozqI6mz95o6OrQLra0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491073; c=relaxed/simple;
	bh=izNGDiObYmWQYaDCCL26mHeBsTBRhTSqSA48xbXznmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=egzxaaiByeeuyTTDJO1Vlh5RIdKX5nawSYYm14o9H7KNqUng20YNV6ZZUhmENJCyO0u6GKNcFPW+eUTCMNE3ullCmZj0CPo+AqI4GJNJVrX1bs2pDw7WMnUb3GR9SHDxqqtPTo1fZRPWKizr1ygeki+xGh1EEHapfhSZHMYqk1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RNz+XWIj; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RNz+XWIj"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785491068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gpMu4RNb2kjI8UxUymbZX5KkVz3zQvsUUOv48i+J2MM=;
	b=RNz+XWIjD8/2SPnfdtvEGqTDiBRZ/MbyjEWKUi32ODxY9LoWTncWB2OqiWEfa6KgHQeESB
	SumBAGwRoTrzvNzOeDKZsDk+tH+VD+qORiywgsmbfBFd5oQjm+XZgQCTnPzlTGQjUBY5sg
	zKky4ziiBvWBzo8U5QKY7rnl0A5nNsY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] m68k/serial: Use generic BASE_BAUD in asm/serial.h
Date: Fri, 31 Jul 2026 11:44:00 +0200
Message-ID: <20260731094402.741645-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=thorsten.blum@linux.dev; h=from:subject; bh=izNGDiObYmWQYaDCCL26mHeBsTBRhTSqSA48xbXznmc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk5eUlhR07rhpdatUxbYan7vyx+u5NhzD9bj0Qbyf/tj Hximw51lLIwiHExyIopsjyY9WOGb2lN5SaTiJ0wc1iZQIYwcHEKwERieBkZbs/216nZZPzFWSX+ rb/2tBuLP7AkVK4x0Vv+WinpDMMdJkaGmff/PLiua5bR5xAa6O9slcG2Z3X+ojf7NT+WbAhc8C+ OHwA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Include asm-generic/serial.h and use the generic BASE_BAUD definition
instead of redefining it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/include/asm/serial.h | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/serial.h b/arch/m68k/include/asm/serial.h
index 3f76bc7b9edb..e215b48975d5 100644
--- a/arch/m68k/include/asm/serial.h
+++ b/arch/m68k/include/asm/serial.h
@@ -7,15 +7,7 @@
  *
  */
 
-
-/*
- * This assumes you have a 1.8432 MHz clock for your UART.
- *
- * It'd be nice if someone built a serial card with a 24.576 MHz
- * clock, since the 16550A is capable of handling a top speed of 1.5
- * megabits/second; but this requires the faster clock.
- */
-#define BASE_BAUD ( 1843200 / 16 )
+#include <asm-generic/serial.h>
 
 /* Standard COM flags (except for COM4, because of the 8514 problem) */
 #ifdef CONFIG_SERIAL_8250_DETECT_IRQ
