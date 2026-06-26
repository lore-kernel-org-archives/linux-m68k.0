Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B3237F007
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485915; cv=none; b=F4khmFE6I35W/OcrT/ctIK3aqXLxVa/SYcUKZF23z2DZSspJyJuKba9qqLaxd556N3Ea8N4DI77g7yDDa4ZJz5GLAQ9iz3E0gFlMv7+Yo5J5rRhCr70GAkme+3C48ZUVig10JF87dTEswb4WipGKBQ/jOEX8yRtn8swPl9uq+cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485915; c=relaxed/simple;
	bh=RRtbczirTUs+DLp/c6ZCkzhZ5TfF5RRLcFEk8lDvOL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MxqXnEk9J8dxEpskcGXzyus2YyOcC1h++4H8cTenRHfkAx9jldWHQevVI7eX7/ngoVAIaEzX1pGKXlqWxao/3b2OLpAzl7EcsUP0EcorWWm87YDiOwCWcbhKz0mV72sR6GWDduYytn/hm7O4wOk+/AFaJKHLc3wiDRTcDN04NPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DtgCbkW8; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DtgCbkW8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782485909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HEPfIIrkL2yv4vdFjdvNY0+oIwlTUsUlcOoOk9P2Epo=;
	b=DtgCbkW8eooI4ys3In7etmxFCt9A3YKc0zKXfXsYXvFPePnQpufBHwCcJHhST2szAvkybz
	+fz3IP9OUrKuygQbP0D58R9PQO8Y9a2FRnq0MODF55PKqwD6KkpyhJYruYNxTjp2ic8hzK
	v4gVYNH8f6DQRph1UD2Hd9JJQ2kyrT8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] m68k: amiga: Mark amiga_reset() as __noreturn
Date: Fri, 26 Jun 2026 16:57:31 +0200
Message-ID: <20260626145731.64010-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407; i=thorsten.blum@linux.dev; h=from:subject; bh=RRtbczirTUs+DLp/c6ZCkzhZ5TfF5RRLcFEk8lDvOL8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl2k6N1Vm6cLLTvYzGnZpNNzYfyN7IsvyN+HNhxwVQyX iH6TveKjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZhIYAgjQ9PUw1rWiYsidnlN M9jkfrG+p1L06MvZTQVrZ73UWlApPJ2R4ZrEjPU/zhzrXMjasTvCMezV5tsKmi7SutP6OUpZD7H 84QYA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Mark both the forward declaration and the function definition as
__noreturn, and remove the redundant redeclaration.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Specify the __noreturn attribute before the function name to avoid a
  compile-time error (Daniel)
- v1: https://lore.kernel.org/r/20260626104142.3782-2-thorsten.blum@linux.dev/
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
+static void __noreturn amiga_reset(void);
 static void amiga_mem_console_write(struct console *co, const char *b,
 				    unsigned int count);
 #ifdef CONFIG_HEARTBEAT
@@ -543,9 +543,7 @@ static u64 amiga_read_clk(struct clocksource *cs)
 	return ticks;
 }
 
-static void amiga_reset(void)  __noreturn;
-
-static void amiga_reset(void)
+static void __noreturn amiga_reset(void)
 {
 	unsigned long jmp_addr040 = virt_to_phys(&&jmp_addr_label040);
 	unsigned long jmp_addr = virt_to_phys(&&jmp_addr_label);
