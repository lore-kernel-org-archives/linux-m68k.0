Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFE627FD7C
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767899185; cv=none; b=O7jiVHYlE+nBqe5Hxry/mCAvN21fboBLCfLfKO3Vjth/isdDQYg+KDtUq7plT1x2JTy99uBOLo6tMfh4/hExgmplsPUSl16h9T3n1QCUmOTtCnRsUC8IcoA8FXkengQ56sFNeTsXT3MCk9j1q9rnITwv091bxrxCJ0L/i901Jk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767899185; c=relaxed/simple;
	bh=/PRAWLk1+pSHIN+oE7HMAv23it2DWPyzsrdtDMwQB9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TwH6N50Qdrzot6SnTF/TghkpsXMRDXwdUFrib6eyTbFyFxTbxDPMOIbwdpgfAzalBOKAVCAW+pdaGxeZh6QDZEzSfzCjcWUu3HcyNCRMTXO3N5jjHMKn+hZrpbr6wDZl8iT2kG0JDi2Yj7gt3Na8TZQVh3KX7r2TGp56oDtdrAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwpkY7F0; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwpkY7F0"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8245243D29;
	Thu,  8 Jan 2026 19:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B3AC19422;
	Thu,  8 Jan 2026 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767899178;
	bh=/PRAWLk1+pSHIN+oE7HMAv23it2DWPyzsrdtDMwQB9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mwpkY7F0Iu0FcR3SP6Il22zWmZ1elNrSPEjTHengfCKA96zgl7tca+G7Yzfz4bozK
	 uz3YW5Pfq0aR/G8H2DetyGzIWga26t2vPR20Op2CQ3UmEGZc6C8ZYCXF+L85TkxzrV
	 4wqqiSo1QyfdmbH+Rb7ZKLit8nEzjp3hhbpB1MzBlxYXRGHZoZx/yXB4V7Gwv9JnMV
	 WetgwnC+jrWNzSDdNEW6BJ6vlCYDDlGDIqrab2O237FRy7nIc3SR8OVMSXaIQPwEkS
	 AlrVsAGyV8Coln1IOdXAHBu+RyWX2wy/98eWNwBgHtQoffWWgaGQjNp7XQeUZigphw
	 0/qTeGC0l01uw==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 08 Jan 2026 20:04:49 +0100
Subject: [PATCH v3 1/7] video/logo: remove orphan .pgm Makefile rule
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-custom-logo-v3-1-5a7aada7a6d4@kernel.org>
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
In-Reply-To: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=/PRAWLk1+pSHIN+oE7HMAv23it2DWPyzsrdtDMwQB9k=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJkJDDw/926vlPZ5/iO2LOtt1dqDf7+bnWAu3Sn5ql7Oq
 yXjaLZIx0QWBjEuBksxRZZl5ZzcCh2F3mGH/lrCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjpAJgMXpwBM9cIvDP8rSkT0zd/yfddf8ZNX80fH3XlSrT0r63xzF6z89EP9lbQxwx/OGxmGkzJ
 OZKYlcXb9+dD8UN7jucHnTN2dR7MUNnjODWYHAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

The kernel has no actual grey-scale logos. And looking at the git
history, it seems that there never was one (or maybe there was in the
pre-git history? I did not check that far…)

Remove the Makefile rule for the .pgm grey scale images.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 drivers/video/logo/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/logo/Makefile b/drivers/video/logo/Makefile
index 895c60b8402e..8b67c4941a4c 100644
--- a/drivers/video/logo/Makefile
+++ b/drivers/video/logo/Makefile
@@ -30,8 +30,5 @@ $(obj)/%.c: $(src)/%.pbm $(obj)/pnmtologo FORCE
 $(obj)/%.c: $(src)/%.ppm $(obj)/pnmtologo FORCE
 	$(call if_changed,logo)
 
-$(obj)/%.c: $(src)/%.pgm $(obj)/pnmtologo FORCE
-	$(call if_changed,logo)
-
 # generated C files
-targets += *_mono.c *_vga16.c *_clut224.c *_gray256.c
+targets += *_mono.c *_vga16.c *_clut224.c

-- 
2.52.0

