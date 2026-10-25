Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896323;
	b=3rZ9LrCCMJEe9mYjU7ihS08lE602sFLWaLuGNp8ZYDI6cABbVkYLZ8hcl4LaYQNIHpxf
	 xD/Y8QXjEHwDcy03+SAtAOlCSuFErJ2qVph2L+z+faCDthBM6vy1FthzouKE/wnCuJQ0+
	 zW8fvI/8KVWmzboQPd0GjnCvTzyc0cKAe4s2lgV4IQaoIuBOvKqOho+vg0EK68b2skaAV
	 FRKUG30NZHlnJkOiXIs0tz7cDi5NEg7e4q6JNfxpmPdBP7klRt3gD+GsyL/EpEZXeW1m9
	 2TN3wI2ldzcMSo+KyOF0usMLh76UA2tVO5TLK0bWNlwVhEUWZny1cJPl1GxttW6sCIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WpjUZLKhw/tvYFR10QM0neivX8YIU0hqUruPnucpBLM=;
	b=P4/Q4iYQPfYeVqM713wAguz1zZwrj0MBWhtREi5O+0TLoBtp1KzsfR/M1HjhNg+1kLhe
	 sQRJnLhe7sqipN/IaipT+QYRyLyOcrn7INUNoG/BW2qZGhOBDs9PSDLDGOx1LGTC2kSBt
	 rHI9bnZEnSsbDH9cCyV9Q4KgCNh8xKa81WuYnHgk/0pZhGpob2krQUvfmRsA6Eq//n3UZ
	 Fm3Jw25VkPQBLPt2GYlcVu4/f5xJ3dCbWAKpWUwArv8F5WXj9voXReX2atMvnI5/yNGGU
	 877dCWDOIHQ9nrd8YbKj1sd7UDJgdPDXIqrUiYcdVmlwv8XHBCVD83KsSnq6H5swUag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=qhrD8lJI;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9C6606A31B
	for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Oct 2026 02:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F9C6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=qhrD8lJI
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5331837eec.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 24 Oct 2026 19:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792896321; x=1793501121; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WpjUZLKhw/tvYFR10QM0neivX8YIU0hqUruPnucpBLM=;
        b=qhrD8lJIJfhNzcBAvQWV7Gt2JZIceGcEG/AawWkADmnfI+xdA/5IXS3PExOUwFhIvp
         NwDy+UoHHTpyGBbNl2klaxSswwJYT5xx/m9mdJ7HOlzwCmSNn8rPX/vKEasMbii/phkP
         jpkIUJo5jjBdxASEYMR8iNe8CrIsIRzYdIXpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896321; x=1793501121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpjUZLKhw/tvYFR10QM0neivX8YIU0hqUruPnucpBLM=;
        b=YQBCpmxSMrTLKtMPklC7dyjZ/gBBn/JAfBw0qLi4x++aI+5Q1cqGFdcESSIRP/Dqvf
         Zn80wjg6APN3RUs0yFqkWnurudj6oYDlrLkpEeiJNcnPFe/0E/5N4D7ptYyCauELRnZA
         utHWWVGBe4BFqHzJiOeK1nnAFJ318RTHndz+Nm8ATpcUCzKjrjs7AwGPe4jGl6n+A5Go
         1+jbu63Jxr4O4MAEhkN6xK72MQVQmN07udspd6zK2wfcmrzaGpWz+X1cGfyDmbCUj0Wj
         48sUEWhPWhlSPL+DD7uFxaRdjlZpPtDrP+LDPN1ll6sIq7saRqjmXCv86rOkSgEuUzF2
         kcIg==
X-Forwarded-Encrypted: i=1; AKwUvBxixJZHIocTsG3VALA1Fi7teDAvLuNYwxH3blxyryUESsuZnjtIFjnWCB6FVa1S+uo/8Gyf3D/Ag9Bz@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYK8SJmWFIULcKGuSZnP52txcMv4hCYXiCxoN2ffUpDRsOV9yXO0
	FKtytz0iZOksbgbEuqRLwDeaAlzm3plp1Ill16rYiWjWjd6JWO3MxTJezSRohs7QAtg=
X-Gm-Gg: AYBFou2Cqd+rucTYbwcpOX/R1XbOK+xoGxt8b2snESb81grSwXicFM2SuYui92DiwHE
	XgKQvn37m4xAY1YxJ9hgmolICjeoqjVeQQpwNtOIlZg2AEh+kKureasoscwC2tjJ6sEfJIK5Rsv
	qayuR5fzXTDk4zRUmDTYSDHRmg8QlC+qE0882HZhImcAVqhi5uWJojTLMFAUV3IYTem7bKDm2aU
	73aJAkYHkVZGuNmADFy6cSKvnzushcjNo/7S++Ki4XsOeaL5O/OJBEr6vcot/MTpxXZo8aJUe68
	CgzuUhUrf5f5MT7GdG3YArFFqICgVTdjCx77Vt5khywOpLZQLzUZhst3avI09KkhJUouVy5Xnzb
	zE4b7C6xud2eqMTiUwc6IkWXgKDD2RTgBKygjJ+F7g/SlGwlY/bF7n+dCc4PZpvmIyAD9HStAB9
	Ar005FqUbCx01zmpXeusB7sQ9Semz/TtdnnSiJocpusA5BEGOiCJEIXyiWPpINIWGPhOp5fdbLe
	5BW6Dhv9ABbjYdSNSthtg7ulOIZdz4dOIir3RB5DwKuqXmvSrL6XdsIXqpdpt0+u/qYsw77OQR9
	3OtHVyetlAZA9ys+a44=
X-Received: by 2002:a05:7300:2442:b0:358:2e30:8e5 with SMTP id 5a478bee46e88-369e836b382mr5953999eec.1.1792896320943;
        Sat, 24 Oct 2026 19:45:20 -0700 (PDT)
Received: from shiro (p1469046-ipxg00b01sizuokaden.shizuoka.ocn.ne.jp. [153.223.97.46])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm23813952eec.23.2026.10.24.19.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:45:20 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Daniel Palmer <daniel@0x0f.com>,
	Denis Ahrens <denis@h3q.com>
Subject: [PATCH] net: i825xx: 82596: use MMIO accessors for the MVME16x PORT/CA registers
Date: Sun, 25 Oct 2026 11:45:14 +0900
Message-ID: <20261025024514.802862-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the MVME16x the two port registers need to be written in order to latch
the correct 32bit value.

The way the code is currently written means that modern GCC can decide to
optimize the writes and break that latching.

Convert the MVME16x specific register accesses to use the proper io
accessors to restore the latching and make the driver functional again.

Reported-by: Denis Ahrens <denis@h3q.com>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

Denis emailed me with his fix for this issue which added volatile to
the struct members to stop the compiler getting too clever. This is
my version of the fix. Dennis, please test it actually works :).

Also, this driver is old and does need to be converted over to being
a platform driver etc. I have a set of patches to do this. I'd like
to just fix the driver first so it works again so the conversion to
a platform driver is working against a working driver.

 drivers/net/ethernet/i825xx/82596.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/i825xx/82596.c b/drivers/net/ethernet/i825xx/82596.c
index 773d7aa29ef5..bb8798b0d3ae 100644
--- a/drivers/net/ethernet/i825xx/82596.c
+++ b/drivers/net/ethernet/i825xx/82596.c
@@ -196,11 +196,10 @@ enum commands {
 #define TX_TIMEOUT	(HZ/20)
 
 
-struct i596_reg {
-	unsigned short porthi;
-	unsigned short portlo;
-	unsigned long ca;
-};
+/* MVME16x: the 82596 PORT and CA registers */
+#define MVME_I596_PORT_HI	0x00
+#define MVME_I596_PORT_LO	0x02
+#define MVME_I596_CA		0x04
 
 #define EOF		0x8000
 #define SIZE_MASK	0x3fff
@@ -375,7 +374,9 @@ static inline void CA(struct net_device *dev)
 {
 #ifdef ENABLE_MVME16x_NET
 	if (MACH_IS_MVME16x) {
-		((struct i596_reg *) dev->base_addr)->ca = 1;
+		void __iomem *regs = (void __iomem *)dev->base_addr;
+
+		__raw_writel(1, regs + MVME_I596_CA);
 	}
 #endif
 #ifdef ENABLE_BVME6000_NET
@@ -392,9 +393,15 @@ static inline void MPU_PORT(struct net_device *dev, int c, volatile void *x)
 {
 #ifdef ENABLE_MVME16x_NET
 	if (MACH_IS_MVME16x) {
-		struct i596_reg *p = (struct i596_reg *) (dev->base_addr);
-		p->porthi = ((c) | (u32) (x)) & 0xffff;
-		p->portlo = ((c) | (u32) (x)) >> 16;
+		void __iomem *regs = (void __iomem *)dev->base_addr;
+		u32 v = (u32)c | (u32)x;
+
+		/*
+		 * The 32bit value is latched on the write of the lo register,
+		 * so the 16bit writes must happen in this order.
+		 */
+		__raw_writew(v & 0xffff, regs + MVME_I596_PORT_HI);
+		__raw_writew(v >> 16, regs + MVME_I596_PORT_LO);
 	}
 #endif
 #ifdef ENABLE_BVME6000_NET
-- 
2.55.0

