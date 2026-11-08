Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145578;
	b=QJR+RAKFpJqyqSzVKLVYcy9y79lB0i+m7n9nw55qgHJw1mtpRAB8nL4EDknAtPSS0Poo
	 Cf1Uy53hNO693Mhu1neGMRzW36xDwryMCuNBGPWbcvNo3sZEB8CNt7CX7/nbA8Jjy0MWn
	 pv7AR99xe+su3UpFovH2yMpX1vHwjpGsG8YgCRQ9MDuQHm4A6n3WSL0WsTmhztEuy8cUv
	 lsyH1t9EBmKE+U8QsSp7Jx/aEBRdQhSN9+prWUfWJCWIsbSF+Ve8A3MnX7zsz2k0bk9MJ
	 jUU9enPQPqOpzWxf7c/W8w07tjhEhme4qV8Ipf3Ncnr0O5z2d9mSt0hD7oGZx6DkEMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145578;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=kISgTnHIfHTm0e8ym4nUx3sMj5w1C3/m/dreB4Iw6v8=;
	b=Rq8C0eJ7nMK2tyU8hIDvwMMC+lM+yHOpsKBgSdE+Rg8Fn0IcSkj9FhqwAO5hNiub6mLU
	 NnvO7sHw65ZPqmrIA4SueqIHjyw+PsI5tu9WdSnQ8NwoLgI39oHBbNd9vRNysLs3LaWwu
	 suoIF8wxlnTOj1+ePkWA9ocni+Zet8c6ZFxzjUOFJYXzuI2JpMEa4Y1MypooE9xPssZYw
	 WyrLd8roIO1z6Idj0gpWLpDHhPDe+IPfs6oCGRxVnCPFMHV4XhrWC9mfZU6INMNy8GpsH
	 3TIY0ErnVS0xgKMnNHeCwusuuezT30EvQi6pSCX11uouyN/ORhZMSGmi0zU9nmQrp0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g69A2wiH;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9AC606A320
	for <linux-m68k@lists.linux-m68k.org>; Sun,  8 Nov 2026 13:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC9AC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g69A2wiH
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D9A840236;
	Sun,  8 Nov 2026 13:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FFF1F0089F;
	Sun,  8 Nov 2026 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145577;
	bh=kISgTnHIfHTm0e8ym4nUx3sMj5w1C3/m/dreB4Iw6v8=;
	h=From:To:Cc:Subject:Date;
	b=g69A2wiH3xaIcxnOAqJqeo+UtllGuNeCcNaNQwNeNfpG7b7pw6hmL6zNnjVh12kIo
	 ao+nn5vylhg33G5M+o6n/2CEl6BQVJGe0q7NQn8Zl1nywoYhQHlt/3DdDlgB+6/YF6
	 urfvAuV5zXYsA42sBBhzul17wJEKJVSDV9QFjvhvR6gveiMeBW9aZGgIVEATS5T8oj
	 dfXjXGmNtcSrXMrxCLogYKa0WM/+5pfUfTgoYODpA3cq3ABOW35DyJLD5rW2Q6WsAv
	 n3rg+LglcVJw7QBQ7xAcSnYyXeKnQT3SykIP4r+469/JAuo6SLyh/RjdNJSR2B+mdg
	 frlRYR24t4Hfg==
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] m68k: amiga: Mark sine_data as __initconst
Date: Sun,  8 Nov 2026 14:45:00 +0100
Message-ID: <20261108134501.404852-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=679; i=blum@kernel.org; h=from:subject; bh=n+7czhDIYW9szePk+kbNWzEOMsoBqv0mHCZBTb3GoVs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfau5OOPD/zb/+jR+ib7/133toetM3lndvM6utTjx7r txQyl92pKOUhUGMi0FWTJHlwawfM3xLayo3mUTshJnDygQyhIGLUwAmUvKJkeG/iazctLlhChJO 0wO+8GYmdy1cu3wha2+I8s48t9Att1cz/HfnZ8pyCzPq9J+81kfhV/DCClOBaR1HXp5aM69xknn yKyYA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

sine_data is only read by the __init function amiga_init_sound().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/m68k/amiga/amisound.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/amiga/amisound.c b/arch/m68k/amiga/amisound.c
index 5fd93dfab809..5ae1f017b39b 100644
--- a/arch/m68k/amiga/amisound.c
+++ b/arch/m68k/amiga/amisound.c
@@ -19,7 +19,7 @@
 #include "amiga.h"
 
 static unsigned short *snd_data;
-static const signed char sine_data[] = {
+static const signed char sine_data[] __initconst = {
 	0,  39,  75,  103,  121,  127,  121,  103,  75,  39,
 	0, -39, -75, -103, -121, -127, -121, -103, -75, -39
 };
