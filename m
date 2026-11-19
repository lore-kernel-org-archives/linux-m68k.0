Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091988;
	b=p0h1fQCcEMXwzE7qKOKI4dKH5TQHV8GmLjXdrX7LmG3iAm3Uol0WpnlWgbvhChsIlpyx
	 H79yymOeT3ZSYXYSkfZxOwINCysKPGouHmW8iGwpM9qcmMY0pdGH0naJkhmAatDz/fubr
	 0Rkf1I6z2MqkUW5munTOizoo9zpQlddid5v03xXTdonRkvthNmiis5C2U6gKLnYjWcysw
	 lKtXKa035g/x9ovagYi8g+pesupZ4gFMG1eJdr/63ArjoFOtb8HRFydOKr6I988nKKZKz
	 5qu3O/Uh2FrLgP6lnZ2RRVPhSo+ILIzANRk+xtRb9b3ImlU7U7iCqkWi0x4fv/8qcTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZXV/NDYa2Pdkzz6z2M2q6Z+cuiaS+tSo+VUJSEvKuDA=;
	b=r8n873T7/wfaoYgSK4sIP0rcvOOpDNUszEoIqRYlswoBwwb5/8MyU6gSeNUDnV4Oojme
	 Zp344IPjrIXFvlWcwY8NcEJnHoEI45X44lXNxnh75zP7VGuNvMaHxI2uvA2N7iPxfnyCg
	 osKKlrmSxhr53da3yl+cAi7HCvmrNwD0eEbnYgmAgPDnvH4pTSSEE+k+tgzxslf42gBne
	 7nU1XrBXc6mmP1kuNRobr2z9VXkHfP4jY6CWG7iahbXJNKOrRZ86m0Tsh3JhB7RdFnHyG
	 6+aCM2TbKRpn0vYdiofkro+C2qulzCQM2TNCHaeQRmI45EoZEuM3MVUQQB++vvdSDxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Wp78b2+k;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B709460A380A
	for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 12:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B709460A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Wp78b2+k
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ccca948203aso1569620a12.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 04:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795091987; x=1795696787; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXV/NDYa2Pdkzz6z2M2q6Z+cuiaS+tSo+VUJSEvKuDA=;
        b=Wp78b2+ksenCflqiw4ePbw/pOfE68YLmnjHQHKvvpOhWrTRVxp3V0LVAso09gWFusA
         MPeZGDPjHsZBQJyzW0TKVrf2Y4jvaHjM3ib9brOVN591puwxAJKmMfL7lp28AVE8TKBG
         eDME55uakPMpLwjlwGAwHEpfX/Y732Hs2W61M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091987; x=1795696787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXV/NDYa2Pdkzz6z2M2q6Z+cuiaS+tSo+VUJSEvKuDA=;
        b=cqmRuElOjOunHttZt12NNsEgmQFgD4Zo09UuZuocLPHWwMAcCm/LaNcEEITdzM+3S3
         f8d2UySHHiqHdS7z89YOg1VvBPOGvQEJMglbsKYWDVsDexhJFedeJKOffCSrpKwXYyaX
         zht0rm4cYQdJ/p5K6LlyebxKMWvlnys3wIOFTFQdNArb3BI81x7p41dgpDb74+098Cxk
         w5DX/XKEufrpdGejT+KBdOPDq3L4aio5NygTyu0mTxdk7HJwt5fvpYGB0LeSVR370gVE
         GpgxPNvhPa0ZdAyHP3h1eCLRhu+W7Q0iRzv2ZEuqkaPGmcGhDI6EgGGPkC651F2o0B7A
         k9Uw==
X-Forwarded-Encrypted: i=1; AL+hErFvMNk7yuLbOUcG/ofzjNyIKuRVLlyfyA+3DTfXN21aTj1MtVm86XBPE6EpnArdjEZNHIDeQXEN5+qy@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8piA71i9mZWScMuI86OH/5NUQReYrFtH57EdyQnLk9iP1ImyY/
	kG1+0r2M2cZE0YCsWSoJQpMtJN92nfVt8af1OCaEtgoV0YwIBzDG+fkY8QcsPV2ZCYU=
X-Gm-Gg: AZFdTZejtCcD186YhruS9pZLnOvw4vKoP7qGdH2MlkAWpzuuqITTaoTcfwZJTPO6RYf
	4OpiT9KkdXWdQAjz56HKs0j2SlBV7OkQ3Se/LfCVYDSaDJnV4TH/nayNxtsl2ldvIqSPaV6JrvT
	c7kTspiasZoW+KRWFDM+G7VqrhD7JFH8aGRr1V66NP00qAckxiAbVVSKjWJM02ln137xQ8kCqFA
	wT2eFe6/Hl/fsxa+DIsfm/Q0lE5jit2M6WNK56FI+TJBa5xWgiITTUVMVJlpPfpVWVZs9V9H4Ni
	nGZkBmuHQgmGN/js34YSmLFBG0kgog/WcycawWdihMDUg6nQGgFlssF1B91x6yQgms2U+/gYn8D
	CQz/x1bdj2pLgX65XlnqDDYsf+Enu/PNxs/f72bwXED230CTL6SP7QRKendgFqIBiMNMHmWNKxI
	iIwuX2A+cQ9Um1km5BjTxNuFb6pcmgbtwDaB/VqUjhl6vQoMyY73mc0lDE424vRx1iKVgjJrzBG
	bYus1LaQIAtOhsQd63ZPWnNYQCQyaOS+bkGCaDFE5kmKNRa8thaTybnKvIbJe9cAFc3Rg/RuZcm
	uv6KOzStKQ9MTYAgVVLgGKwZtlTAKxc9rcm7xtY4NBnkP335fqmz1Ivkxv6qQ4/PGr9n9g==
X-Received: by 2002:a17:90b:2151:b0:3b4:a63:d55c with SMTP id 98e67ed59e1d1-3b40a63d999mr666356a91.30.1795091987154;
        Thu, 19 Nov 2026 04:39:47 -0800 (PST)
Received: from shiro (p1799054-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.155.54])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm2696299a91.5.2026.11.19.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:39:46 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/4] m68k: Add helpers to read and write the 68060's PCR
Date: Thu, 19 Nov 2026 21:35:57 +0900
Message-ID: <20261119123558.2108296-4-daniel@0x0f.com>
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

We access the PCR in a few places and the next commit will
add another so refactor the PCR accesses into a little helper.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/atari/config.c       |  7 ++-----
 arch/m68k/include/asm/m68060.h | 19 +++++++++++++++++++
 arch/m68k/kernel/setup_mm.c    |  7 ++-----
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index bdafc86241b7..a63117891410 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -47,6 +47,7 @@
 #include <asm/hwtest.h>
 #include <asm/io.h>
 #include <asm/config.h>
+#include <asm/m68060.h>
 
 #include "atari.h"
 
@@ -512,11 +513,7 @@ static void atari_reset(void)
 		unsigned long jmp_addr040 = virt_to_phys(&&jmp_addr_label040);
 		if (CPU_IS_060) {
 			/* 68060: clear PCR to turn off superscalar operation */
-			asm volatile ("\n"
-				"	.chip 68060\n"
-				"	movec %0,%%pcr\n"
-				"	.chip 68k"
-				: : "d" (0));
+			m68060_set_pcr(0);
 		}
 
 		asm volatile ("\n"
diff --git a/arch/m68k/include/asm/m68060.h b/arch/m68k/include/asm/m68060.h
index a69ccde11693..3d9d0f1a741f 100644
--- a/arch/m68k/include/asm/m68060.h
+++ b/arch/m68k/include/asm/m68060.h
@@ -12,4 +12,23 @@
 #define M68060_PCR_DFP		0x00000002	/* disable the FPU */
 #define M68060_PCR_ESS		0x00000001	/* enable superscalar dispatch */
 
+#ifndef __ASSEMBLY__
+
+#include <linux/types.h>
+
+static inline u32 m68060_get_pcr(void)
+{
+	u32 pcr;
+
+	asm volatile (".chip 68060; movec %%pcr,%0; .chip 68k" : "=d" (pcr));
+	return pcr;
+}
+
+static inline void m68060_set_pcr(u32 pcr)
+{
+	asm volatile (".chip 68060; movec %0,%%pcr; .chip 68k" : : "d" (pcr));
+}
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_M68K_M68060_H */
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 7abff6266837..41b595256ad1 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -230,14 +230,11 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	if (CPU_IS_060) {
-		u32 pcr;
+		u32 pcr = m68060_get_pcr();
 
-		asm (".chip 68060; movec %%pcr,%0; .chip 68k"
-		     : "=d" (pcr));
 		if (FIELD_GET(M68060_PCR_REVISION, pcr) <= 5) {
 			pr_warn("Enabling workaround for errata I14\n");
-			asm (".chip 68060; movec %0,%%pcr; .chip 68k"
-			     : : "d" (pcr | M68060_PCR_I14));
+			m68060_set_pcr(pcr | M68060_PCR_I14);
 		}
 	}
 
-- 
2.55.0

