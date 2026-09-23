Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A0152ED2F
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Sep 2026 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174198; cv=none; b=nc9mf1xV1xxcQDGAe9wva3p2hb5xSz7qI7jOF2JIqVtcFBhL/qsMTxyX4qQSs+s1G0SM9MredrMQeGdFmY9FJ/oTgzu2UDjYAlT8JEz7c3CLyKEjD7akSnz3U8BPJ39Kwa3qzaeS6i0nSLYP4Ejx7ta6cZLqgk98J7W1c+zrlAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174198; c=relaxed/simple;
	bh=Rm/DCpLbi7ml33EASVlakUFCBCMhXmbx52jtnYNOn9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IjZnHN6NCr8XPgPKpUrqFjqz0bIip8OfNaGcP119xrrICxW/W8ay2Qj35DyVE6pqM7vTq/BWCVVPp0HPnjHb37hPyC62+aKwyQAHJIkahNME3dTSdyPtFr830BL929H19Zscuh7sGD3xj8Zv1l4vdhr5OyDa43nYRp3S1zQ5pXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDPAP0Kw; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDPAP0Kw"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 60C624163A;
	Wed, 23 Sep 2026 14:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E47E1F00893;
	Wed, 23 Sep 2026 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790174196;
	bh=ArQR3oRQPhZtdsAuaG6N3AGjxTQW2p6yffX26zIexDQ=;
	h=From:To:Cc:Subject:Date;
	b=fDPAP0KwnfPlafmRrUIG5PPo0GptTcjyytruJFdV6IBd6MTDrIFY8WPgiz5ULspDR
	 tHxYEAcG6ssdAgRGwl3cQ4yaiDJEWMkZMzJdin2RUvO95danDmx/WcXmua8dNpstEW
	 CvBj235UZNhlIi8R6ej2j0kATIvJZEti04E0JrjBq8p+exwRTmDJTB7637oEG0Ftj6
	 Z41aVgR18p2q/rpWOZ8GZZVLZMJhX43FpwDmkBVk0Z2DSOhiTQ/FAYT0jCoikWj41k
	 ItsEyq+KLIu9FWTQN+kcRrqdnomMlpY+smoYERavCI39yd5mPVgWsC6ojCv9KBdu+M
	 GabOa7u1t01sA==
From: Greg Ungerer <gerg@kernel.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: fix compile breakage for 5407 cleopatra board
Date: Thu, 24 Sep 2026 00:35:38 +1000
Message-ID: <20260923143538.2076420-1-gerg@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@linux-m68k.org>

Compiling for the Cleopatra target and specifying the ColdFire 5407 SoC
will fail with the following errors:

  m68k-linux-ld: arch/m68k/coldfire/nettel.o: in function `init_nettel':
  nettel.c:(.init.text+0x74): undefined reference to `ppdata'
  m68k-linux-ld: nettel.c:(.init.text+0x9c): undefined reference to `ppdata'
  m68k-linux-ld: nettel.c:(.init.text+0x6a): undefined reference to `ppdata'
  m68k-linux-ld: nettel.c:(.init.text+0x7a): undefined reference to `ppdata'
  m68k-linux-ld: nettel.c:(.init.text+0x92): undefined reference to `ppdata'

The fix is to define "ppdata" in the same way as is done for the 5307 and
5272 - it is the same register setup in the 5407 as those other SoC parts.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/m5407.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/m68k/coldfire/m5407.c b/arch/m68k/coldfire/m5407.c
index 23a14416241c..1f3e30b33398 100644
--- a/arch/m68k/coldfire/m5407.c
+++ b/arch/m68k/coldfire/m5407.c
@@ -22,6 +22,11 @@
 
 /***************************************************************************/
 
+/*
+ *	Some platforms need software versions of the GPIO data registers.
+ */
+unsigned short ppdata;
+
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
 
-- 
2.55.0

