Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531711CBEB7
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Aug 2024 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724228470; cv=none; b=bfkbWvHIbe4v10r63HCmXRHaw3Dk9ZlSrTxRBLn10QsAf7olKEgcHcWqe1bIJ9h+9NJZhZMzP5pSuqcx1z07uSeHaaU9ajQrjgz3CcIJoGMnZZVZ6axJfOAGqIEI4TuplfqY5eGaak+qyfTas/YzZxHf3ltw7ycwkr2YFxyXBvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724228470; c=relaxed/simple;
	bh=qm/0t0ecsNYQoWQiGZfIDlHDwzC9t2+fWKS06rvLHAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gaL1U74Ed3AhrhdlRRPjMfKQwRNODm9teEXmd87SaOcW3WJLx0FzqgBucasilVRNlovGhDaCFVAenHnJw2KqxQaZwKHkbLAA0eqxWhupDDFBvIPksQYdU/MLKPjPtCXXqgOcMrYiqANxBEcOX7kZro2krQaNllRMYQ1QFrBRx5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=EQvKMQLd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="EQvKMQLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724228464;
	bh=mbsQ7HQ9AJbv8oqx4aaxoEjhC30iKIQUF2ManMs8PGc=;
	h=From:To:Cc:Subject:Date:From;
	b=EQvKMQLdMrs4Wt4MrVCMOlxgopbmfAnRtBzrkquDk+0zS/JB+1R1+/5zxsYIivnCV
	 KT+mmP+bEiy2tl812imCZsnKOkv/3CJWBF4U5d6Jj1t1mjMi8BKMj3WUdfUhbSYotS
	 wASYlQhiCHUI1pEQfroyj/+JS6tMlEgL/BspUS/ztaVzFMj86uurwWJ7LZs5biSq6e
	 9/GohLZ7pKfp6LNvXszKyJokitKihhfir8C+E4WzyuTGYbhHTiTzg3e5q7LLjuPFhD
	 wrxZkMgvyMxWt9xVRrvc89ixLgiR/mx2ckRy4uAFOqfWNDAit4g8/AKhTXGwe42Xgv
	 WsZ+ypFgn7K1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WpfRg6bJzz4x5M;
	Wed, 21 Aug 2024 18:21:03 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: linux-m68k@lists.linux-m68k.org,
	geert@linux-m68k.org
Subject: [PATCH] macintosh/via-pmu: register_pmu_pm_ops() can be __init
Date: Wed, 21 Aug 2024 18:21:01 +1000
Message-ID: <20240821082101.877438-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_pmu_pm_ops() is only called at init time, via
device_initcall(), so can be marked __init. The driver can't be built as
a module.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/macintosh/via-pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 7b7808281292..2f131ab9bb15 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -2334,7 +2334,7 @@ static const struct platform_suspend_ops pmu_pm_ops = {
 	.valid = pmu_sleep_valid,
 };
 
-static int register_pmu_pm_ops(void)
+static int __init register_pmu_pm_ops(void)
 {
 	if (pmu_kind == PMU_OHARE_BASED)
 		powerbook_sleep_init_3400();
-- 
2.46.0

