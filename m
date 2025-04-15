Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5914310F2
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Apr 2025 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701907; cv=none; b=PE0ZCDnjIpgFIX+f3h7BqpWr5+KMMr0kiPjdpWjYn+gckGGCjA7PTNSl9oYI8TsqY0L6sihlgQqVh8ErgJ6v5srL9hWX05YVoDVpFOm6/CiTioIpQXsWn3xKomvdGsUuqUSLddD1dnm29Gwk0gPCn6zm8kJOqNeV92YiZ5o2VeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701907; c=relaxed/simple;
	bh=BU6O+NubHhjGcJfP27cn4PD2YhdPGLO7llLZhiVwy6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uvaqYreCrS5Omr4s4YCPM/7/Ht1WQ5pI/f+xrqWvzPORiMH4G1Bf+rS2jjudBxGOS76c1K+ExqadYR6HkSkF8UBeL3EhXe3z20ZjRa6zXjLOerza8JF3rtA48AXvIsMtkqLqk43/PkQ53gtM/X2xdD5QMEN+78SHMm21ZiArn58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hwV4loqy; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hwV4loqy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744701890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K2cUzsr+7KU4/BspvOOXPyRXKt4F0O5T8WgvvrWtIrg=;
	b=hwV4loqy4js3MLXDnXPfQSxq0ONB8P2CW8MJhdCDcYCRxioYfaU9+LPGXObi/wXHgEtYUS
	75SqbNB1pZdW9ClJ/Y2/qs4OaBsW4nXYm/pTdFpyZzhl3Qws0HzSEXwq7QeaK9wxw7gt1j
	+VPF8SE0DnpAlbForsVidq7vEvSp0Ro=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: Replace memcpy() + manual NUL-termination with strscpy()
Date: Tue, 15 Apr 2025 09:24:33 +0200
Message-ID: <20250415072433.75505-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use strscpy() to safely copy the command-line string instead of memcpy()
followed by a manual NUL-termination.

The source string is also NUL-terminated and meets the __must_be_cstr()
requirement of strscpy().

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/kernel/setup_no.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index f9872098f5ca..f724875b15cc 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -145,8 +145,7 @@ void __init setup_arch(char **cmdline_p)
 
 	/* Keep a copy of command line */
 	*cmdline_p = &command_line[0];
-	memcpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
-	boot_command_line[COMMAND_LINE_SIZE-1] = 0;
+	strscpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
 
 	/*
 	 * Give all the memory to the bootmap allocator, tell it to put the
-- 
2.49.0

