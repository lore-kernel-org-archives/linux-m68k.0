Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C1C3812EB
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782470549; cv=none; b=q5nrToiD0pXxOTAv50uegDa/vBDqBGdWDDUqWcpBBKJvlSnIADlZTtaOKgzDbfVYjHrGhjuXlUNwlned1AhDugF+PsVW0DfbIzVVjXzU+6nBktP07QjAvgFtWpEggTi2mjDAknTypUW9QE695+SinL+5VjRz+sXEsRoNe4yAVk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782470549; c=relaxed/simple;
	bh=dr9KhOzfEUc6hl7W6rkhWtjCs3Av2mWSu77/j+AffD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WrQ/y/k6OLoQ5z4QLXfVAYSwNYf8HPKMOsU1meGwIFlc8Pd+mMNsRV73M578v6SNEhnoTCyusqmXO9FRCHmvK4mN3YDr9cFeIaaHjaJ2sm+D/y8mC7KsB6yiY9hlHI3eMup3ooe8G7eqpELjEAwhtWP7aDGwy6/mLjxAPfIl1Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xHuQ2bfv; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xHuQ2bfv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782470545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Dfv0jBcCTscZE7mKBNTeCCie5if0XdeznLFF3LjoMVI=;
	b=xHuQ2bfvM+rRgHOd3nZDulZqM8kcV9KkRQZk7g1VpCpyhMi+LsXK07QRGL9yYji0OjSjr8
	uzIZXuy1m1a4C4vviG+bkEikLYjoyyrpvTlipd47hSTPiUKOotpi8xL8KiSYs9AdpOvE9A
	gqI5A99czqaKypvLcxgiy1mL4+4EBRA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: amiga: Mark amiga_reset() as __noreturn
Date: Fri, 26 Jun 2026 12:41:42 +0200
Message-ID: <20260626104142.3782-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=thorsten.blum@linux.dev; h=from:subject; bh=dr9KhOzfEUc6hl7W6rkhWtjCs3Av2mWSu77/j+AffD0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl24WkvmVNupZ9Z/eNl5P6gJymTXZqv6XbHRh4K+/y+y LyhJHtaRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExE+yDD/8LG+mubmVgqt/+p c2Wvkn+XkfrEzrb7tFve9t5Nm2XM2xkZ9l/Un36Js+ZJzoMnFuabBAUO2iw79qN4h3XCqUWHWf/ 5sgAA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Mark both the forward declaration and the function definition as
__noreturn, and remove the redundant redeclaration.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/amiga/config.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 242d18e750b0..7b72d964577a 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -96,7 +96,7 @@ static char amiga_model_name[13] = "Amiga ";
 static void amiga_sched_init(void);
 static void amiga_get_model(char *model);
 static void amiga_get_hardware_list(struct seq_file *m);
-static void amiga_reset(void);
+static void amiga_reset(void) __noreturn;
 static void amiga_mem_console_write(struct console *co, const char *b,
 				    unsigned int count);
 #ifdef CONFIG_HEARTBEAT
@@ -543,9 +543,7 @@ static u64 amiga_read_clk(struct clocksource *cs)
 	return ticks;
 }
 
-static void amiga_reset(void)  __noreturn;
-
-static void amiga_reset(void)
+static void amiga_reset(void) __noreturn
 {
 	unsigned long jmp_addr040 = virt_to_phys(&&jmp_addr_label040);
 	unsigned long jmp_addr = virt_to_phys(&&jmp_addr_label);
