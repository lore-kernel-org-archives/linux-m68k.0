Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46F83EEACF
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514357; cv=none; b=iGNcIkT3hDikuyFXCVU5xkr51EfvA0+E3jds9erKHOufnY1fcNsBh6Ey/6bVDhXfh0StlFFBGay2aqWOq5XN5BvlB8h8yeBe4B00dEHcZ0MMwF8eZwTzLunsHJuSlKkWzQlPdlntUnAmeCztg2YaQ8gXZoyGiDlaIgd/ysQ3ED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514357; c=relaxed/simple;
	bh=l9Er6uvG07bcGgFnvZcqFGW2u3kccIzMf72GfRM5kF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nuOPCMmHy1SJO3rUCT2aaEqUlBORGNCPW7rXKBwBGo85VpDU6rwPk02z76F+1Aw5OCz8mpa8U7JeiHvGdZV81BNEW9wtyjbb0fOdHvhffUGojDDysOLG4W+PSrubDnZ8ce/4FeBLqxjIHK3GiTrdBNBQNLMJMsb7zh96Yv42UAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 643F960AB7;
	Sun, 27 Sep 2026 13:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E551F000FF;
	Sun, 27 Sep 2026 13:05:52 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Miro Kropacek <miro.kropacek@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: Enable ATARI_SVETHLANA and ETHOC
Date: Sun, 27 Sep 2026 15:05:50 +0200
Message-ID: <42db3dfd79c69a95475b3b187437efcc162dfbff.1790514278.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for the SVEthLANa network adapter built into the
SuperVidel CT60 FPGA extension, which is compatible with OpenCores
10/100 Mbps Ethernet.

SVEthLANa works fine with phylib's Generic PHY fallback, so there is no
need to enable any PHY drivers.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v7.4.
---
 arch/m68k/configs/atari_defconfig | 2 ++
 arch/m68k/configs/multi_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 4673a7f6b14e2225..6ee43f42827c2b71 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -27,6 +27,7 @@ CONFIG_NFBLOCK=y
 CONFIG_NFCON=y
 CONFIG_NFETH=y
 CONFIG_ATARI_ETHERNAT=y
+CONFIG_ATARI_SVETHLANA=y
 CONFIG_ATARI_ETHERNEC=y
 CONFIG_ATARI_DSP56K=m
 CONFIG_MODULES=y
@@ -331,6 +332,7 @@ CONFIG_TUN=m
 CONFIG_VETH=m
 CONFIG_ATARILANCE=y
 CONFIG_NE2000=y
+CONFIG_ETHOC=y
 CONFIG_SMC91X=y
 CONFIG_PPP=m
 CONFIG_PPP_BSDCOMP=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index e87757629aedb01e..06d3ef94af977d66 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -40,6 +40,7 @@ CONFIG_NFBLOCK=y
 CONFIG_NFCON=y
 CONFIG_NFETH=y
 CONFIG_ATARI_ETHERNAT=y
+CONFIG_ATARI_SVETHLANA=y
 CONFIG_ATARI_ETHERNEC=y
 CONFIG_ATARI_DSP56K=m
 CONFIG_AMIGA_BUILTIN_SERIAL=y
@@ -386,6 +387,7 @@ CONFIG_MAC8390=y
 CONFIG_NE2000=y
 CONFIG_APNE=y
 CONFIG_ZORRO8390=y
+CONFIG_ETHOC=y
 CONFIG_SMC91X=y
 CONFIG_PLIP=m
 CONFIG_PPP=m
-- 
2.43.0

