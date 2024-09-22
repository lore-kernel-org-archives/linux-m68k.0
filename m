Received: from welho-filter2.welho.com (welho-filter2b.welho.com [83.102.41.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B04EEEC5
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Sep 2024 21:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727042142; cv=none; b=UCDC3XmqMri3fuob5N322EoIg43NqgNgBzbWsb+9eWSS4Fn3e47AAndbUQmbMTWt78OhWNT/+STftgiJkPg16SRc0M+VgbPwTQsYMpMKnkFUbyj4FZnd1bTceufNCSAb+2Ww3MpDBpQw69+qSY6EEJATXVvh+LLeJeHzGjTv9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727042142; c=relaxed/simple;
	bh=Si/gJ2RqZYcsuDsKSjodJb+zBgzWE0pbgJ3mZq6Qju8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t0BzjpPa/k1KznCSiCK1TPRasw87glsp4Sn9Sw+BS/UEQ+tgEtTZPNZPrmFNiAkybuAx0FttO7UICCD+SClqw0eo3s1xnF7P5PVgJhLsObr68lvbJexVQALr9sKfE+sg6xh4lN8n6QQCdLyuNgNCrFAs9R2PnEy4ycxsLzUy2Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter2.welho.com (Postfix) with ESMTP id 4D81D3FE68;
	Mon, 23 Sep 2024 00:49:18 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp3.welho.com ([IPv6:::ffff:83.102.41.86])
	by localhost (welho-filter2.welho.com [::ffff:83.102.41.24]) (amavisd-new, port 10024)
	with ESMTP id DoSyUUnDCtiB; Mon, 23 Sep 2024 00:49:18 +0300 (EEST)
Received: from localhost.localdomain (87-92-110-153.bb.dnainternet.fi [87.92.110.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by welho-smtp3.welho.com (Postfix) with ESMTPSA id B8F4C2309;
	Mon, 23 Sep 2024 00:49:13 +0300 (EEST)
From: Eero Tamminen <oak@helsinkinet.fi>
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Eero Tamminen <oak@helsinkinet.fi>
Subject: [PATCH 1/2] m68k: Drop Atari EtherNAT support when it's not configured in
Date: Mon, 23 Sep 2024 00:48:20 +0300
Message-Id: <20240922214821.16818-1-oak@helsinkinet.fi>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not having it configured, but crash backtraces going through its IRQ
handling code, is confusing (found while debugging issues in Atari
emulation).

Signed-off-by: Eero Tamminen <oak@helsinkinet.fi>
---
 arch/m68k/atari/ataints.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index 0465444ce..fa189eeb7 100644
--- a/arch/m68k/atari/ataints.c
+++ b/arch/m68k/atari/ataints.c
@@ -179,6 +179,7 @@ static struct irq_chip atari_mfptimer_chip = {
 };
 
 
+#ifdef CONFIG_ATARI_ETHERNAT
 /*
  * EtherNAT CPLD interrupt handling
  * CPLD interrupt register is at phys. 0x80000023
@@ -251,6 +252,7 @@ static struct irq_chip atari_ethernat_chip = {
 	.irq_enable	= atari_ethernat_enable,
 	.irq_disable	= atari_ethernat_disable,
 };
+#endif
 
 /*
  * void atari_init_IRQ (void)
@@ -343,12 +345,13 @@ void __init atari_init_IRQ(void)
 			stmfp_base.name, &stmfp_base))
 		pr_err("Couldn't register %s interrupt\n", stmfp_base.name);
 
+#ifdef CONFIG_ATARI_ETHERNAT
 	/*
 	 * EtherNAT ethernet / USB interrupt handlers
 	 */
-
 	m68k_setup_irq_controller(&atari_ethernat_chip, handle_simple_irq,
 				  139, 2);
+#endif
 }
 
 
-- 
2.39.5

