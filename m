Received: from welho-filter1.welho.com (welho-filter1b.welho.com [83.102.41.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CAD148849
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jun 2024 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240609; cv=none; b=NhS4hEXpmVVAq6izadM82B/8WRQl9LvRgHLkQ2h/xOGbGMU/JIWN6525fuuaX059XAj8I32wJwSq4/D910BI5rDigE+ypob9hLrlLmRUYSALENQbN7pVqe1fgAuN/ltGJi5iqVHaMtRtWkbNjOu6WpFNSeyk3ArsarG7zVRmMNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240609; c=relaxed/simple;
	bh=EAfjxjs82jS6xhphVBCAFm5QUpcBybJ8D7Pp6fASxJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uRi2m1nwdQrR/jLg7L4sAumJsEB+kZo0WiTJa5j0U1i1460i+d9Vu7FRGi3vu50oiCvNKnQ9KZozy6+rWSToBoVESIBJn5lsSusIErFsEcFYOA7WSX8G9aGeGU8mWAjtC75eix1WWr5OQPmdk1KmmqfyLewPUD+kCH9LiLN4PA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter1.welho.com (Postfix) with ESMTP id 51657201DC;
	Mon, 24 Jun 2024 17:49:53 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp3.welho.com ([IPv6:::ffff:83.102.41.86])
	by localhost (welho-filter1.welho.com [::ffff:83.102.41.23]) (amavisd-new, port 10024)
	with ESMTP id FeKwwphB__cd; Mon, 24 Jun 2024 17:49:52 +0300 (EEST)
Received: from localhost.localdomain (84-253-227-129.bb.dnainternet.fi [84.253.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by welho-smtp3.welho.com (Postfix) with ESMTPSA id CDA892309;
	Mon, 24 Jun 2024 17:49:45 +0300 (EEST)
From: Eero Tamminen <oak@helsinkinet.fi>
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Eero Tamminen <oak@helsinkinet.fi>,
	Christian Zietz <czietz@gmx.net>,
	=?UTF-8?q?Nicolas=20Pomar=C3=A8de?= <npomarede@corp.free.fr>
Subject: [PATCH v2] m68k: fix TT bootup freeze / unexpected (SCU) interrupt messages
Date: Mon, 24 Jun 2024 17:49:01 +0300
Message-Id: <20240624144901.5236-1-oak@helsinkinet.fi>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Avoid freeze on Atari TT / MegaSTe boot with continuous messages of:
	unexpected interrupt from 112

Which was due to VBL interrupt being enabled in SCU sys mask, but
there being no handler for that any more.

v2: commit description checkpatch fixes

Fixes: 1fa0b29f3a43 ("fbdev: Kill Atari vblank cursor blinking")

Tested-by: Christian Zietz <czietz@gmx.net>

(Bug and fix were first verified on real Atari TT HW by Christian,
this patch later on in Hatari emulator.)

Reported-by: Nicolas Pomarède <npomarede@corp.free.fr>
Closes: https://listengine.tuxfamily.org/lists.tuxfamily.org/hatari-devel/2024/06/msg00016.html

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>

Link: https://lore.kernel.org/all/9aa793d7-82ed-4fbd-bce5-60810d8a9119@helsinkinet.fi

Signed-off-by: Eero Tamminen <oak@helsinkinet.fi>
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

