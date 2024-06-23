Received: from welho-filter1.welho.com (welho-filter1b.welho.com [83.102.41.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA6B450E2
	for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jun 2024 23:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719185521; cv=none; b=ncN+y8MyWhWjgUTfb3/dR5goOW84Akmbx6nhSnisNfuD2lJxkn0+XDjIb+7kJ6LUpTRQjMu6GzUC349PXO867dEn5s2jEGh1S8kyae9SaYbfIg1ZRuJYFhX2nYZWg606UMC22AezprTe2UuN6BQhBETfIH6wEHkVVRltYNO5bm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719185521; c=relaxed/simple;
	bh=oM0CBRcKmZurBR+63GkwA4RxJgqcmVyOpjWo5nkX4ww=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=oqXFcsrT5x4aLySCKc03BD3VUc7QSlDBgptEukGE2MbfAFPr7pcphrRjzFvt8cenKdqSa457PaGqd/EObQQB9S6I2kEVqqSu0a8y0WsIMvIVlrHtI6XF6DXC9yKowOdFN2n67DQYJ0JC9snoMaBoAm26n/NNO34atQM03eHx1t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter1.welho.com (Postfix) with ESMTP id 5AA5320B63;
	Mon, 24 Jun 2024 02:25:11 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp1.welho.com ([IPv6:::ffff:83.102.41.84])
	by localhost (welho-filter1.welho.com [::ffff:83.102.41.23]) (amavisd-new, port 10024)
	with ESMTP id XJqwIzLI3snZ; Mon, 24 Jun 2024 02:25:11 +0300 (EEST)
Received: from localhost.localdomain (84-253-227-129.bb.dnainternet.fi [84.253.227.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by welho-smtp1.welho.com (Postfix) with ESMTPSA id EA47B28B;
	Mon, 24 Jun 2024 02:25:06 +0300 (EEST)
From: Eero Tamminen <oak@helsinkinet.fi>
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Eero Tamminen <oak@helsinkinet.fi>
Subject: [PATCH] m68k: fix TT bootup freeze / unexpected (SCU) interrupt messages
Date: Mon, 24 Jun 2024 02:25:03 +0300
Message-Id: <20240623232503.9445-1-oak@helsinkinet.fi>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Avoid freeze on Atari TT / MegaSTe boot with continues messages of:
	unexpected interrupt from 112

Which was due to VBL interrupt being enabled in SCU sys mask, but
there being no handler for that any more.

Fixes: 1fa0b29f3a43f9dd

Reported-By: Nicolas Pomarède and Christian Zietz

(Bug and fix verified first on real Atari TT by Christian Zietz,
this patch later on in Hatari emulator.)
---
 arch/m68k/atari/ataints.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index 230203ffb..fa189eeb7 100644
--- a/arch/m68k/atari/ataints.c
+++ b/arch/m68k/atari/ataints.c
@@ -303,11 +303,7 @@ void __init atari_init_IRQ(void)
 
 	if (ATARIHW_PRESENT(SCU)) {
 		/* init the SCU if present */
-		tt_scu.sys_mask = 0x10;		/* enable VBL (for the cursor) and
-									 * disable HSYNC interrupts (who
-									 * needs them?)  MFP and SCC are
-									 * enabled in VME mask
-									 */
+		tt_scu.sys_mask = 0x0;		/* disable all interrupts */
 		tt_scu.vme_mask = 0x60;		/* enable MFP and SCC ints */
 	} else {
 		/* If no SCU and no Hades, the HSYNC interrupt needs to be
-- 
2.39.2

