Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E6A25393B
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Feb 2026 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771832658; cv=none; b=pjVIxZE0OJLvqqWB9iz7j6r5qhsQE37yEHHYstLXWq+NYBIlSKKtfTmt+LEdX66GZpmYBqQHH4BhbzI4e7EuJPP56RQ4m4xnDzZC1Z8EcPWuQe+wdlXAw+nZleBRWyDRr3yG3Z4IbKhltSN9E3SKVQlxeP9+wNxEMcz1tKLPCh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771832658; c=relaxed/simple;
	bh=9dUBd+OF+0CqomzfnDtRR65AqgFVaesBXRZjrFGsVFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UgWJuStI9l0PINQQSuFPDMqZA6qTmASpqk/nV1uT9txv90pOugkt8W1LcEfH5PNdnQOmdStkCYhsdtNJMEzkIho7ErpZPIMvz3ZXt2g1uKCS1NZan8eqxcntP9CPp2kcTY2/8raacxIMx7qvrlmN79wBEnF1RaeDqff6oHPbvGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FSH8t80R; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FSH8t80R"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771832654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GP5CLuP/IYJOq9fa0ybOYCzVUwcR9j1eHgWZPjcvcWE=;
	b=FSH8t80RCDVkEGdCJsR7gBLdiTL6qAbcC7fNBx9Pi/Fb+Pdv73P6ZzibkhIRixOhvBnfwZ
	eRSlQ8Xw0kiRerjGm9d8cuRSo4RWrGlif8qVuYLglzGPhvfotuk+jm+3nwJb3jdvscSW0q
	lIKRqZE76wItiexm9RjJ2HU4wuxJPUg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: q40: Remove commented out code
Date: Mon, 23 Feb 2026 08:43:10 +0100
Message-ID: <20260223074311.322070-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The pr_info() call has been commented out since 2016 and printq40() has
been disabled ever since commit 1da177e4c3f4 ("Linux-2.6.12-rc2").
Remove both.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/q40/config.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/m68k/q40/config.c b/arch/m68k/q40/config.c
index 5a4258697622..ed59a742baae 100644
--- a/arch/m68k/q40/config.c
+++ b/arch/m68k/q40/config.c
@@ -74,7 +74,6 @@ static int __init q40_debug_setup(char *arg)
 {
 	/* useful for early debugging stages - writes kernel messages into SRAM */
 	if (MACH_IS_Q40 && !strncmp(arg, "mem", 3)) {
-		/*pr_info("using NVRAM debug, q40_mem_cptr=%p\n",q40_mem_cptr);*/
 		_cpleft = 2000 - ((long)q40_mem_cptr-0xff020000) / 4;
 		register_console(&q40_console_driver);
 	}
@@ -83,20 +82,6 @@ static int __init q40_debug_setup(char *arg)
 
 early_param("debug", q40_debug_setup);
 
-#if 0
-void printq40(char *str)
-{
-	int l = strlen(str);
-	char *p = q40_mem_cptr;
-
-	while (l-- > 0 && _cpleft-- > 0) {
-		*p = *str++;
-		p += 4;
-	}
-	q40_mem_cptr = p;
-}
-#endif
-
 static int halted;
 
 #ifdef CONFIG_HEARTBEAT
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

