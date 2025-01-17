Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035521FECA1
	for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Jan 2025 12:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737115618; cv=none; b=Nu4cQNSmuNnKm+jQJNufkUwiEa7Ob4hH/nTaMSSy8QRMGw9nj64MK519fmFICxKcxl5poM0qVMhFIu8ClpSKVqXyGQ1e1fppSH0M9be/OoJU1UPP+6SpOlDYML5JDSHDwf+EHn3Yuvslyt/+/mLPZiClIE5DwiPKBqikic9an9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737115618; c=relaxed/simple;
	bh=LwZFrM/XsuYmhQpSR3PZiM6obBKlchG80VqbQ+2fENU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BHzJbcJU8zev7YLxOL7VdJ12ntSmsnm91/394Etp7zxyQCeFBrS+wUs5AyvB+gDm7CYrgzzCDRAhEk+ugvlPF60e3Kuj0tSSqxebo0DuhIdECBqwVhcw1n83PM4vqsd1cApf45yKiQqxOVWw6utjFRhP+raythfIaAthdk3wiKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fyh6CnAN; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fyh6CnAN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737115612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+WcLMzeuShLiV7569Ni6f8H4Tw1QZvxEvhAP/TMDpNc=;
	b=Fyh6CnANcASTHMXBIu2fPx/dd5NkJkQEHsW29iqUx8z/jtgYOOA47++CyZiFEdHOIJwmyj
	Qbe2Yy2pHgIacmYpd/OcYEJNcdsIpuANul82I34jTstF5xZzqTVII6DS02cCxCKPiohsHb
	rOCfopRXnFl/92P+4L14Noslgb9LME0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Sam Creasey <sammy@sammy.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: sun3: Use str_read_write() helper in mmu_emu_handle_fault()
Date: Fri, 17 Jan 2025 13:06:05 +0100
Message-ID: <20250117120605.126941-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/sun3/mmu_emu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/sun3/mmu_emu.c b/arch/m68k/sun3/mmu_emu.c
index 119bd32efcfb..7b15cc12637b 100644
--- a/arch/m68k/sun3/mmu_emu.c
+++ b/arch/m68k/sun3/mmu_emu.c
@@ -17,6 +17,7 @@
 #include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/sched/mm.h>
+#include <linux/string_choices.h>
 
 #include <asm/setup.h>
 #include <asm/traps.h>
@@ -371,7 +372,7 @@ int mmu_emu_handle_fault (unsigned long vaddr, int read_flag, int kernel_fault)
 
 #ifdef DEBUG_MMU_EMU
 	pr_info("%s: vaddr=%lx type=%s crp=%p\n", __func__, vaddr,
-		read_flag ? "read" : "write", crp);
+		str_read_write(read_flag), crp);
 #endif
 
 	segment = (vaddr >> SUN3_PMEG_SIZE_BITS) & 0x7FF;
-- 
2.48.0

