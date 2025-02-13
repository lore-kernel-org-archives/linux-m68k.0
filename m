Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D17628134D
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Feb 2025 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455897; cv=none; b=K46GlDWYpoFyPXY1rR6SZcMTNx5h5qCUaXvx0Chd61XKuV0wqTOe//4cXKqDf80M02pSDPmMROZzqHfNmSr24chYf2vQYPI+2EN89Zc7MMJRwbKkW7RWf6z69WknLCuQZC3Nw2YH8E0mcyWGBBTjAuL13/7eGJ0w8hCiJbkTQqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455897; c=relaxed/simple;
	bh=eKMNUVNp8UMGTQa3NsP+iAJSkExx3OGQxHufDdcpSL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hzOGQzpAgLbCS3GqUio4dkxhrSw0+wQo2HTMCib1Q08JKPWTVGKYryJ3CQowWJWRNcvcIYCQqWruQFxhphgBK7g9+HlCd/z0I0eaooXWjNPJ9d8rrL9hxVC8cc9ALqxXUk/IHc4yDKjnQeIwmMNbfzzHN0NMuHTIkj7KQ/qkD08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xEm3AUDN; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xEm3AUDN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739455891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mGI8wtS2DOrObIqxm/I1fLkkBiivD5c0wK4M4TqD720=;
	b=xEm3AUDNgBrj+p52hVtsBlhjtjf9EcfAnTnO1s8r3MVBpyjmRSkEEQntGTFIo0/T9yISuQ
	Gy/wWa7EpGUwxOt5ea7Y5oy5HTa2hzJskP6cRZcNTPmHRiNbV/lmHCz+GRfFpyMJEr5JoG
	W8oQQFbydGb8zH7JdLbQ2hdknqCjycs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hardening@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: mm: Replace deprecated strncpy() with strscpy()
Date: Thu, 13 Feb 2025 15:10:36 +0100
Message-ID: <20250213141037.50394-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strncpy() is deprecated for NUL-terminated destination buffers. Use
strscpy() instead and remove the manual NUL-termination.

Compile-tested only.

Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/kernel/setup_mm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 15c1a595a1de..48ce67947678 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -243,8 +243,7 @@ void __init setup_arch(char **cmdline_p)
 	setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
 
 #if defined(CONFIG_BOOTPARAM)
-	strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
-	m68k_command_line[CL_SIZE - 1] = 0;
+	strscpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
 #endif /* CONFIG_BOOTPARAM */
 	process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
 	*cmdline_p = m68k_command_line;
-- 
2.48.1

