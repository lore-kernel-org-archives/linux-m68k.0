Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580658;
	b=rVJ4kzs5wpOAkHrh1zWKMq1dU0V4sClT33E/jN9hu+rmbHcHXXbMwcjsA/KF3f7lHqQx
	 dFUp8br5sIB5QHBrECnv+u1z7S+MfYdf1pCnK0DREXg+BC5sUYTtr4RqwXxlV16WE1Wlf
	 DNG6H7xJWkVgu9/vZsfl3Jh+Qv4hcHy5AI2TSELXYgBGid/g05hzW9qtgxqIhd0oK0R/U
	 MIGalRdZ/JE8GrpZ18tILNbsGibVNZuZSLDH57JRUMckkPRgWy76/okPB5Hk2qYMJH2bE
	 2trJeTnOxbhaqrEtKIKOW641BI3d//tpCI+K/Gshy3YIoA9bPy+u99NN3j1MOKgGoKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=C5Ue2mVGxATydDR5iWTMkIC6d9KHtdsgRln9EnTdDBs=;
	b=yn4+R7cJuF0PDuGJ8VR04jpcz1QQZ82tAZPfkQN19JpQO8R0rIycBbQV+3giNHIgxvNe
	 XEuc78YJYXSp3alpcSzprh3/zMeF3BBICjy8jagsGBJRD2iFQzqOpnQFWNPvRp7Z2tV2M
	 Ee01T2nGAlTT7K4k1sYOkUIcgBqK2oaw6rNEqyDBCWfMjdeTGHTYPCQpYuAF6GVn+K20H
	 DzbXl1lpc+bDEJ9XwSURD4TFES9hA73JZXn8ib5FBGgZfY0U6LcK9C/rvfpvKV4uLW1P4
	 u/lSNg6OU+x5q5CCpdwMPmq067wmTlU+z+MeuBwOI4Kg453fogjJwGAbQTqK+PIRgNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WR0Yk/P1";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5AE606A334
	for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Nov 2026 14:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5AE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WR0Yk/P1
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so7319865e9.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Nov 2026 06:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794580657; x=1795185457; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5Ue2mVGxATydDR5iWTMkIC6d9KHtdsgRln9EnTdDBs=;
        b=WR0Yk/P1E3Yfnnzbmt7lQJTEsyuh/Xxa68VCf30i4OLJNGJA6NHmkHB/ELiqypaM4B
         tnhpRGrNwDtvLaVg/l4/8Qw9WBuw1m4bXkcRsgA4gPEWnIeYTI6L/8you4EXZaFsv8ur
         w8VLIynMIVGf5ndc7eNX5S4odGHF8mW7Z8kvk97o/DGJndazGs7IOHXyBzepzhitfqKh
         z10YD2xhcO91qwR275tDw2Rhg2h/+LbPRTF3syx64Xss9HktmGztSn/00/RfZMYuO14N
         VtbCvAj96PMzCT8nUFhvQ6piqypsdkcAEOVZlVJuR0qnV9EDvs+W4IgeoOyu2i0ozhmQ
         3iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580657; x=1795185457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5Ue2mVGxATydDR5iWTMkIC6d9KHtdsgRln9EnTdDBs=;
        b=ej+GMnw2ErWcO8rxWiET8rO0bTVfM5E4WXg/xdu6iFHZ/v+jbctFBQoPqWyCSH0m45
         HgzYs1t+wBVkskFyNAvlKhUWfEl7DNdVAVyWUctKmnAKWuBDSlVXuMxMb9igTZXqx9H1
         0n5JxzDeZkZHNg9Vs1/Pzet4elvFq8v9wPrJ2D2PtL4TA94KftLo+EoCeGqBJ+gXyPJu
         nDigcZ6dazJUDfPVTk87EzLcHEGA9laO57/JJnQ0OuJyXQMYuFzRlPIHoYy74SfxEKYT
         RgGUil4okv7JvO4oNS3BgRB9b08kZLQwS4dQrWE2sQifj5p9pSjqQTRrWzDoC+VkUxj8
         hD2w==
X-Gm-Message-State: APuU4Z+wglT8guoT/aVYqh1/rkN95RpLkqEqNQYFdWzX5cb/EjYepirj
	o3LIMdcfuO6phlvy3F5tCijZkSg0pu5y8L6KtohBIIZrIuK8ubxwpxeu
X-Gm-Gg: AYBFou0S0RNCdgbaSsPkVZZJ3+nq7ITU144Yz5M3eZcn/VHqA7I9XOgTKVU4OyFn6h0
	TGMpRUZWSVyoCKqlVLJdERWWHjYA+vSTv/tRV5Ic8atOUGSNajbYA8be8Xe9JiD3lBssaB34vDD
	y//lu7ISYv4YVgH9AMgOOkf0b1wTpXDoff2oFGv03NM4Gw7+kwRFN6h/lSzOU9lw+nCiwq2Auay
	Y9UlPQ3V0uL18p/1W1S6z0IV8RXiqOeyS22IZiF2V1o0saTrNcrLc97fapJWSrTGpxpr/qYVox/
	i7o/GsqaEFcEn1gC5gaV/jE8qLiSkM9MKiwLTroU4V9ZBCQOg8PUdR+TtxUxZkAyQH9XC86BiVb
	xBdWjwVYG9K2SdJIa8oDX22JZz/nhRo0fFu1iqzAkjaTBYsP5pY9tLuGmt1yMOymX0BMVizb07M
	K8BgS1FXl8gPi8dDg79oByCZFDMA+bBLkzd0iZ9Mv229B35d8aXbPeY/5PCYZNhseFgWFj22cUf
	NmzuwhQyyTSZiEr2p9qeaMnMFfhWbLPqj2kp/T4pFWFyKkdSq0SjHgSTyvO9lO7mxg+nM2d5LvW
	I3drModV4t3ETuqauJycx4dyQb9ygSrDFByO9AmfwxzlKVJSZkjhKkKkN2Id+pfFvTARCyNSZwk
	epyd/7LPi
X-Received: by 2002:a05:600c:19d4:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4bb55a5af8cmr59550145e9.20.1794580656582;
        Fri, 13 Nov 2026 06:37:36 -0800 (PST)
Received: from beelink0 (host86-181-68-246.range86-181.btcentralplus.com. [86.181.68.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a68c65sm68940435e9.2.2026.11.13.06.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:37:35 -0800 (PST)
From: Graeme Harker <graeme.harker@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	tsbogend@alpha.franken.de,
	Graeme Harker <graeme.harker@gmail.com>
Subject: [PATCH] m68k: irq: Fix irq numbering in m68k_setup_user_interrupt()
Date: Fri, 13 Nov 2026 14:37:31 +0000
Message-ID: <20261113143731.167962-1-graeme.harker@gmail.com>
X-Mailer: git-send-email 2.53.0
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

m68k_setup_user_interrupt() is meant to set up the user vector
interrupts IRQ_USER to IRQ_USER + cnt - 1, as its BUG_ON() check
assumes.  Since the change to irq_set_chip_and_handler(), however, it
sets up interrupts 0 to cnt - 1 instead, having lost the IRQ_USER
offset on the way.

The VME boards pass a count of 192, so the user vector interrupts they
use are still covered.  Sun-3 passes 128 but requests IRQ_USER + 127,
interrupt 135, which has been left without a chip, so its vec255
handler has failed to register ever since.  All of them have also had
user_irq_chip put on the autovector interrupts 1 to 7.  A machine with
only a few user vectors, such as one with a single vectored interrupt
source and cnt = 1, is left with its interrupt on handle_bad_irq().

Restore the offset.  Only tested on a machine that calls this with
cnt = 1; the VME, Sun-3, Atari and Apollo callers have not been
tested.

Fixes: 378f7ca6aa22 ("m68k/irq: Vector ints need a valid interrupt handler")
Signed-off-by: Graeme Harker <graeme.harker@gmail.com>
Assisted-by: Claude:claude-opus-5.5
---
The machine with cnt = 1 is a homebrew 68030 board whose support is
not upstream: one vectored interrupt source (a 68681 DUART, vector 64),
which stayed on handle_bad_irq() until this change.

The Sun-3 statement is from reading the code, not from running it:
sun3_init_IRQ() passes 128, so interrupts 0-127 got the chip, and then
requests IRQ_USER + 127 = 135.

Build-tested on m68k master (v7.4-rc2) with multi_defconfig,
sun3_defconfig and virt_defconfig.

 arch/m68k/kernel/ints.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index cf2b13488476..eb41aace61d4 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -97,7 +97,8 @@ void __init m68k_setup_user_interrupt(unsigned int vec, unsigned int cnt)
 	BUG_ON(IRQ_USER + cnt > NR_IRQS);
 	m68k_first_user_vec = vec;
 	for (i = 0; i < cnt; i++)
-		irq_set_chip_and_handler(i, &user_irq_chip, handle_simple_irq);
+		irq_set_chip_and_handler(IRQ_USER + i, &user_irq_chip,
+					 handle_simple_irq);
 	*user_irqvec_fixup = vec - IRQ_USER;
 	flush_icache();
 }

base-commit: 8c9ddebb300c719362a52a2d465f44e7d055778d
-- 
2.53.0

