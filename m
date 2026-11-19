Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091986;
	b=Hl4+KfnyShDTBbtN5n54Yc+3Xd2QVHV17yROsKpRrEzKc6QKcmenJmbByHbvz2KStVk0
	 sck9bePW17JtZiLKKVyhJrTfSumbsz8VMVFGFef9WynlV4iR/uqnztUiD3stYSeC8oS0y
	 xED6ereR9mmxKTmY2KzRGpASZmZ6+yd4NKkf/cX/yiin2aqRY22c0TEp68kL3arvSyu0g
	 3SFh9TOOHFD4ZnB7l/7KgB/tiGHEB5OCkGSj2Eq2gv2+y7lHle8rnHKNJxdQzHsqG0Nsh
	 4ejdPQW0zHp3RAbxU/99QTHTryklJQnlCrORZKR/JwKWe5fPYQdK0zOtK50hKC26F3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZOzDteHpiC1ToAU60pHoyywRyeM7vqQ7i9clemCjSH4=;
	b=s/ex1n7aKrLz2NU3jeCINiv9o2fskmudIuXJpuFlbDQhZ/h2nqtnZkRF20yDJPy3oiL6
	 DdDWBQFzskQf7b7GpZ/E5a5h/xDX5Wop0kHShwha5y9YyobBQ9dzadggbTynmwyFMfb9E
	 6G5eahOPOgO5uYicKyS2OgbGty3RymB5kWTYcQKqTLFktm2qeLNXgXFiaF68bhavQa3Me
	 YACTGXw+2/egrTNn3E1OKo2srE5eBDAGYCJyV+R1P91PJWJmaaxRyy6sMdXQ10IQjF4tn
	 5vCatXhNq9EjOXNO6V2q5s+HD24iUOG6am4aCa/JJL7Jpdcxu+Q3/jTPOD7DftzJVZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=fj63Cze7;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061BE60A263C
	for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 12:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 061BE60A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=fj63Cze7
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e987a2ba0cso15980415ad.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 04:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795091985; x=1795696785; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOzDteHpiC1ToAU60pHoyywRyeM7vqQ7i9clemCjSH4=;
        b=fj63Cze7zb0HpCDDbvrP6RnnTwag19s0xtWMRsrgrefSinY8zjTxu3au5Zm5bjxXzY
         o075aLx9PSUi2LOgYsKQaNsIhhvrK+c6f92skfJubomj/eGm71g2EZgyJbBJZ2a4L7dZ
         SKjJJHm4Q/2N0claWPbuwgOU7Jot3tfJ27bxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091985; x=1795696785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOzDteHpiC1ToAU60pHoyywRyeM7vqQ7i9clemCjSH4=;
        b=pRncMNiJU+U+/dA9h6DY/uzlXV+WljxywHaclDQBZfsujqD2/3Na7YXxS5nAZFRw1r
         NbXuMbvQA8VDRyQXvJfBAYR3HnNifAYJFtjLWW7WA0UVC36RmjTjrCp2HAYw0MY51Lni
         XKA/0Or0Mj3YKYoBWBPH2AkZBgBX7D2wgmTRMK+BZPyKSjLzlVfJrNlBfvq52jhg4l4y
         2hQPUNCFchrXDzg3oU8YtyBXv1M8aU3OVO5XUmodqwtjGsv559c9T4JwDWiVHIKzVc8w
         awbtH++XoUKg4sACuJ5trHTzK10JEwgioafyezJE5QxCLKPlRMfGLLwiQSNHVHGhj+Q8
         Ztdw==
X-Forwarded-Encrypted: i=1; AL+hErHvr5lKmzx093tgY/BSZ9ll6143JR2MBy8TPO7HutvsIXuaBOvCXzLKbu5PuS77JkocE+Fb8Dzgskhk@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8Sd27y6fiUkEoKQ+nSADd51/6m0om3hvAc9UHd7a033YqnZ3vz
	Wuje2UGy+cCklSG8Z/FF5ZIViuM8ljFMztg4yTRp3/RATNedAUP9slV15ZfAt3/G1jo=
X-Gm-Gg: AZFdTZdHwZvhdq273218JubYRj1JktUsdtJTF6Or59Lc1ya6HCO4F8AViWMLSmcshBz
	xmdXj4dPBTSi0NmfsEPvCbmSlIst82yP7ym37DFw0+ZZmJjUxn0TM4hpj012WNbMAMkyK6QgEPM
	U3de14hR0QcngIqowS6maBQ9+VuSjpWIEKGk5+4pXdduoiPqOmKjMgTJ7H7UjM35Elw9eBNTFYk
	qM9SILhasRhygoEO0y7ZJ6ZetvaGHrfuHvm2RetvxglQ/IBeQH63Dm3rdupBcJ+whFANdCrawfP
	TWT2AmtSsc8jzrdMz5gUSQE4X5zm8oG8llBZKg3DEF6EeKiSBMMFhAiDGd86DDfOCwYk0Y62Ib7
	RFI8/3Mudq67ZehRvB3ZXlf8/OrzKhdEmBPoM/fOKNx0nOltB8uBgYp6aMOx4/yYG3SAqInT2VU
	fCBIYdd8hL+dk4FdWMuQkvU4VGPg5kUd3y1G4j/REah0lq7ZtUbzE871MoxqNpnP8Rc6Qr/emIj
	7SVjSCVv4OEic4/QHMoaaHo8vDg8SuBQewpyCQtHS4dytisWPDCfC1klWaeliiVmzBvSNqEpicR
	f2DDa3DwQ1NchwLa5Ggff+us5Zx/hLnXRwAlaIOLuo/1LRfsU6ezaST1Nfb1HYsnrmWFmaI=
X-Received: by 2002:a17:90b:1dcb:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3b3d064115fmr6130281a91.3.1795091985385;
        Thu, 19 Nov 2026 04:39:45 -0800 (PST)
Received: from shiro (p1799054-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.155.54])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm2696299a91.5.2026.11.19.04.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:39:44 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/4] m68k: Add and use defines for 68060 PCR register
Date: Thu, 19 Nov 2026 21:35:56 +0900
Message-ID: <20261119123558.2108296-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119123558.2108296-1-daniel@0x0f.com>
References: <20261119123558.2108296-1-daniel@0x0f.com>
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

Add some defines for the various bits in the 68060s
PCR register and then remove the magic numbers in the
places that use them.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/include/asm/m68060.h | 15 +++++++++++++++
 arch/m68k/kernel/head.S        |  3 ++-
 arch/m68k/kernel/setup_mm.c    |  6 ++++--
 3 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 arch/m68k/include/asm/m68060.h

diff --git a/arch/m68k/include/asm/m68060.h b/arch/m68k/include/asm/m68060.h
new file mode 100644
index 000000000000..a69ccde11693
--- /dev/null
+++ b/arch/m68k/include/asm/m68060.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_M68K_M68060_H
+#define _ASM_M68K_M68060_H
+
+/* From MC68060 User's Manual (section 3.2.2.5) */
+#define M68060_PCR_ID		0xffff0000
+#define M68060_PCR_ID_68060	0x0430
+#define M68060_PCR_ID_68LC060	0x0431		/* LC or EC */
+#define M68060_PCR_REVISION	0x0000ff00
+#define M68060_PCR_EDEBUG	0x00000080	/* internal state on idle bus cycles */
+#define M68060_PCR_I14		0x00000020	/* Reserved: errata I14 workaround */
+#define M68060_PCR_DFP		0x00000002	/* disable the FPU */
+#define M68060_PCR_ESS		0x00000001	/* enable superscalar dispatch */
+
+#endif /* _ASM_M68K_M68060_H */
diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index 502eeae49eaf..7d90069e9af1 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -264,6 +264,7 @@
 #include <asm/entry.h>
 #include <asm/page.h>
 #include <asm/asm-offsets.h>
+#include <asm/m68060.h>
 #ifdef CONFIG_MAC
 #  include <asm/machw.h>
 #endif
@@ -1484,7 +1485,7 @@ L(cache68060):
 	/* MMU stuff works in copyback mode now, so enable the cache */
 	movec	%d0,%cacr
 	/* enable superscalar dispatch in PCR */
-	moveq	#1,%d0
+	moveq	#M68060_PCR_ESS,%d0
 	.chip	68060
 	movec	%d0,%pcr
 
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 51b5881078cd..7abff6266837 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -9,6 +9,7 @@
  * This file handles the architecture-dependent parts of system setup
  */
 
+#include <linux/bitfield.h>
 #include <linux/kernel.h>
 #include <linux/cpu.h>
 #include <linux/mm.h>
@@ -35,6 +36,7 @@
 #include <asm/fpu.h>
 #include <asm/irq.h>
 #include <asm/io.h>
+#include <asm/m68060.h>
 #include <asm/machdep.h>
 #ifdef CONFIG_AMIGA
 #include <asm/amigahw.h>
@@ -232,10 +234,10 @@ void __init setup_arch(char **cmdline_p)
 
 		asm (".chip 68060; movec %%pcr,%0; .chip 68k"
 		     : "=d" (pcr));
-		if (((pcr >> 8) & 0xff) <= 5) {
+		if (FIELD_GET(M68060_PCR_REVISION, pcr) <= 5) {
 			pr_warn("Enabling workaround for errata I14\n");
 			asm (".chip 68060; movec %0,%%pcr; .chip 68k"
-			     : : "d" (pcr | 0x20));
+			     : : "d" (pcr | M68060_PCR_I14));
 		}
 	}
 
-- 
2.55.0

