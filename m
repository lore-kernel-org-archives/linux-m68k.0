Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C818370AE8
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2026 12:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734727; cv=none; b=hOu8DIpIEAXQ9b5PhFtJr/Gt/YFW6snJ6m3zDRIIGyfRP2KVh6H0wmjxwoje65nZ1yl8O09LhC6oJKF20aj60lD/zdFRD2qLsDSD5GIxUSdBbq3B6+6AZoMxWu6OhLnQZIt8Cgcy1QAV5w0icy1u3c9XX3mLQXtI4byhage2YTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734727; c=relaxed/simple;
	bh=OJHv0h1ALrZPV2RGc6DI/pVNSwcy/zxIT7cnQS20A2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRa4yooDU4r3NXDaF2+sc4JvYxF51qbvQ7NZtN2bYxZy9uzv8qVHx561hRWNOf0320uCac6Y2v02GcjcqRMkXpveHP3UBSwrCK1MoIvro0AcRcQqoZUP8/5d/xmKa8nyBpbxyKtkTmSWvmpKZn6OkrpXREzNIikBui/Ty2+V/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GTiGcihA; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GTiGcihA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782734714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=61s2G8Opo3Ch1l/DHBbyzh9xVhOoOjhwgmG2+mZe8GE=;
	b=GTiGcihAzWUAYJ4h6nvyGQMGfuWXTyuiUklPBhAGj8AD65q9KrCj1QFX2VuiWb3UWzB2XS
	ZNrqKdZmJB7zzDdyzf2qTYrcVkMVVtOu/HDc8ubuqr9p5uGMjPUUgfgoARQCnyblYZd1Jf
	OYFTwZTL4vMIzFDI3AHbTgeyekXE3Qk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Daniel Palmer <daniel@thingy.jp>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] m68k: amiga: remove redundant amiga_reset prototype
Date: Mon, 29 Jun 2026 14:04:27 +0200
Message-ID: <20260629120426.680032-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=thorsten.blum@linux.dev; h=from:subject; bh=OJHv0h1ALrZPV2RGc6DI/pVNSwcy/zxIT7cnQS20A2A=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlO8V5SZr7blt9zi364sfbhxG/G29Xd051/NnAqKn+MS uMwsRHvKGVhEONikBVTZHkw68cM39Kayk0mETth5rAygQxh4OIUgInY8jH8T5heprfN5c+nBaFC c9h/JsaK5nzj25f8WLHZwOzf+mWT+hkZ9rz8foBJfP/smzF6MhM/tF3J+nXqsnvJhDV19kfSpap OswAA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove the redundant amiga_reset() prototype and mark the first one as
__noreturn instead.

Tested-by: Daniel Palmer <daniel@thingy.jp>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v3:
- Fix patch description and drop __noreturn from the definition (Geert)
- v2: https://lore.kernel.org/r/20260626145731.64010-2-thorsten.blum@linux.dev/

Changes in v2:
- Specify the __noreturn attribute before the function name to avoid a
  compile-time error (Daniel)
- v1: https://lore.kernel.org/r/20260626104142.3782-2-thorsten.blum@linux.dev/
---
 arch/m68k/amiga/config.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 242d18e750b0..6e89e7f7e98b 100644
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
@@ -543,8 +543,6 @@ static u64 amiga_read_clk(struct clocksource *cs)
 	return ticks;
 }
 
-static void amiga_reset(void)  __noreturn;
-
 static void amiga_reset(void)
 {
 	unsigned long jmp_addr040 = virt_to_phys(&&jmp_addr_label040);
