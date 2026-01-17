Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0772E54D3
	for <linux-m68k@lists.linux-m68k.org>; Sat, 17 Jan 2026 20:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681358; cv=none; b=gT/QJ2Pw+Q9BhbD0s7SRtmQtsM3h/RpuZRyenY3RGWTG5HjE3L06G/e25iw8K8Pct0oSGI27csDgH6yjuRUju5tdinZ3SuXjCV1cbAevsh57B4V+b7P4l7S46kUiRa9LiIgshcaAbCdwth42MpTcBxJKKkfiai/oKvdW2WJe23M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681358; c=relaxed/simple;
	bh=yGD1YJgvWRdqj7X7nsz5Qh5554QvGjGsYhFMz3bhAW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMM47G5s8dZQBSN3dvpO03iRZoZ43/OMX2IMN/V01NglhtfjWnBC4lGRFjq3kc3q72ReopQhVF7ZEGiWd1Sjtg0CtSYI080iwjKjh+Un6zzjYTywAbeNpBxEidxHlhZg1/iGmp97oYPfVW5dU5cKVahxej67bDh35sjIh7MYpoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QqfjF41R; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QqfjF41R"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768681354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lcL3mQ/91iky6JcTHx6b3bdMSwiFYwOVfMPldDOjSAk=;
	b=QqfjF41R0zVZ1gT31BX2+RWSsPZuqEuCNixR1h+jbeXImB5krq5b0bmgWT3dW6eC5owPK/
	PGoph4Kdneleay6a9/tBdFSrc/vxAB9P1YahihGYPByOcNAUCTvrWh7lTCjjjp6B5A5LOM
	USUpdteI6XYUh4yjxyCPlRXMUMPxlXg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Sam Creasey <sammy@sammy.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: sun3: Replace vsprintf() with bounded vsnprintf()
Date: Sat, 17 Jan 2026 21:21:50 +0100
Message-ID: <20260117202152.1036278-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

vsprintf() performs no bounds checking and can overflow - replace it
with the safer vsnprintf().

Also remove the useless '+ 1' that is a leftover of commit 66ed28ea096c
("m68k: sun3: Remove unused vsprintf() return value in prom_printf()").

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Compile-tested only.
---
 arch/m68k/sun3/prom/printf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/sun3/prom/printf.c b/arch/m68k/sun3/prom/printf.c
index db5537ef1250..cb4934d39833 100644
--- a/arch/m68k/sun3/prom/printf.c
+++ b/arch/m68k/sun3/prom/printf.c
@@ -30,9 +30,9 @@ prom_printf(char *fmt, ...)
 
 #ifdef CONFIG_KGDB
 	ppbuf[0] = 'O';
-	vsprintf(ppbuf + 1, fmt, args) + 1;
+	vsnprintf(ppbuf + 1, sizeof(ppbuf) - 1, fmt, args);
 #else
-	vsprintf(ppbuf, fmt, args);
+	vsnprintf(ppbuf, sizeof(ppbuf), fmt, args);
 #endif
 
 	bptr = ppbuf;
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

