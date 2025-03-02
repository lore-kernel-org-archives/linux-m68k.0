Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0344165F13
	for <linux-m68k@lists.linux-m68k.org>; Sun,  2 Mar 2025 23:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740956837; cv=none; b=YVjZXXnVZB4dDRIKCCF1R3GPmHvA1MZQ0aAe1L3B9El0ht3/xcARVlQAWubTWMgKRHP89Xov0wuPYfbBdNSeFvGfXkU+RZeipAd+A2lzY3CpTdAbLwUWdpgg3PDHWMKeKJoyBFBDpRSioXkJZpWVYKSCq+LtcFeeoWWVyDM61xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740956837; c=relaxed/simple;
	bh=pJAxxXfcJLMfHuNjgZL2b12uz2Th6oxd1zsUQPZrPXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s8IyMS5qt2xXmi6X7QGq5zrTG3g4bPQ2gkFoJ0i5dGQcdG90hv37YHDyH7n/noyjxHwVo6joT1lCUE/ht7um5FnILMNDR3FdxlHcM/e2UP1Ssbn+C1xr+KBlGROynKsIzBdDhxnDq+zortpkyNVTaEO8DaP0zisPRDg07Ym5Icc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bC31zpPJ; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bC31zpPJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740956832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v6aFye1NuKEqpQNncI0J1sMx38HrM9C1bGH0aP6/+Is=;
	b=bC31zpPJutYccOtbNK5m1qSWRuMPqZXf1SyiLw/IVq4R/X+5c7Ndd0ThVe119hBMg5K+3+
	WfBeegkaTFH/ZijQvlBNc9q6D9I3Txa69zxpkXAmFU+1lv8P45fN60FVY/IpCLSKbL6AgL
	JQLbrlA4G73tgZLYzgGgaKasGF0/fVg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: mm: Remove size argument when calling strscpy()
Date: Mon,  3 Mar 2025 00:05:31 +0100
Message-ID: <20250302230532.245884-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The size parameter of strscpy() is optional and specifying the size of
the destination buffer is unnecessary. Remove it to simplify the code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/kernel/setup_mm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 48ce67947678..0fba32552836 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -147,8 +147,7 @@ static void __init m68k_parse_bootinfo(const struct bi_record *record)
 			break;
 
 		case BI_COMMAND_LINE:
-			strscpy(m68k_command_line, data,
-				sizeof(m68k_command_line));
+			strscpy(m68k_command_line, data);
 			break;
 
 		case BI_RNG_SEED: {
-- 
2.48.1

