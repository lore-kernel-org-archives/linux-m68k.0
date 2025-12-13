Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED4E19E992
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Dec 2025 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765627456; cv=none; b=Dyg1N2XPS3Ad52kyndHfPe3oun+QRCCF5xL+RoYXzSWmVD2nHH2lrERCM+wuEGowNwaux1GYr1OFA8xq919FRjyxkGZuj4rTxqjGrY0jXWufD9UXcf+Z7KNdmqZAwAQ+wINsKEHKVcNOS2ujHTmqTn4wkmHWHnW6RJEl93NctFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765627456; c=relaxed/simple;
	bh=yzs67KyH1NIfYYY657ZCVGTMcWOvRK6GdTbAsd2x7iE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWYDGmxa43o9KWfzmpBvALiG5w/V80N+OSZutBj/gO9a0Zewwz5M/uz9nQcQ7wvcFBSYmlJVi6o5JFvqKKNqimtTrDxw4yJ6U0paoOwFeJnNA13vA1OsxdX4280AMUei7lW8Ko6gUs+egvvlI3cx+Pnu/5583V1SD7ylyHjKjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=M9uNvXFy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="M9uNvXFy"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso2207112b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Dec 2025 04:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1765627452; x=1766232252; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ei8ywdXlXxvDh5vQP6qyXiLudvOCTn5oljiolbISDvU=;
        b=M9uNvXFyy7gEtgpJ8nCe1ltmtOoX7ZvhCWHB6Eu+tSi2ZWIAgRR3/ASjV9+91eNUk0
         H8ndCNXsJMFx2BCfJb7xHkJcrtS0ZwQCvg0FUdxujEC3U5Nts3YyL9bN8rb07WZrfEmd
         vVPs3a8knV7YqaFuq376fRSRy0AVx9uifQwC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765627452; x=1766232252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ei8ywdXlXxvDh5vQP6qyXiLudvOCTn5oljiolbISDvU=;
        b=PtdRe8K/RWBZ0AnkuPzO8+EYJcBNtty9GGNM5YzRo/B8ULozCVW6TRSfLrt19UU6kT
         kye5MoM5BKIdyz4QHrGylF9xV9jsdrCYH0o3XvU9iNaVy/GdVupxy3hDyr5ArIsNxX0g
         4MoeLUsYYigp18GzlJR8cTMyNIqIdleQBewYsf+Uf2z+RXV9YdXX3AVdtCyvc2mAuiIs
         5nCgIi7DasWqpSk2bzqL4ool2EoL2DdCnkP3Wkrlpl1fu+noxHQxv/yncf18Omd58uCj
         RwYGCOZulDFV3nro0wP/jnhZPN8JOqLUEZs+aI8yegnJBx/7EVeMJDbrsfGw7SRtBjdF
         4TbQ==
X-Gm-Message-State: AOJu0Ywoy/CEI01XGOfY2Uj7PUW4l6uv5Apf7Fc7OqI/lNfjLlbA8wKf
	5PSkquvW2iF5RIWLuyJ/PS9wFl+BSEogXee1RAtUCHPYTDi9VPZiY5qr1BhIsk4s9rQ=
X-Gm-Gg: AY/fxX6VQcxilThANepnOU9sdteJuxtgYk82EE35dvZ8NwKMgIS3hm2Vjx80E9iDYiA
	N0GnCCIS1M0AN61cav4DIcVqYjDbYv5Q+wUHxfNDOO+Fkv1SKhnwXHS4w8agvg1tPVuk1LFoSNd
	f9Nw2ugiP6FmlybFM9brTTvYr0Q5oS0EnmC0PlcgkX8/3fsEXu6GUITP9j5bXq0K9gBVcY8QRYz
	2atBiNWz5j8DEDB40WgPUDOh3N4RItI6DSm1E2Agi37HJV+ANZoSrsIFOiPhpJ9moxsGOaJUCA8
	DUzbAnmYMdlaXV2iFbfvWZBWkdVcHjsbpH2LICPI1xX+nBsq/pH+bOmmcMceq7916Q4gGsbTGJS
	Lm0+zgwXA+e0E6vG9Pfucw0wv98/5j3zN7Wzh4RP1Iq2ONa24Ag56uYCEIA21X1yj1fpszER5nG
	Bm/HGvkHaUnJbjb5f05IEQAd6gVMYUQ/FCX/hyx1A7jjNHch7y1GcorXbbrHyIQ9wRarhBGEUHD
	kw=
X-Google-Smtp-Source: AGHT+IFhu4El5lM5dBAOIMKdzomSrPTOIqQiG3alVXt/ZNWVrpFkAuaDVRCa4Vc5YmZN1G1ScWJZsQ==
X-Received: by 2002:a05:6a00:4107:b0:7e8:4398:b370 with SMTP id d2e1a72fcca58-7f669c8a7bbmr3801807b3a.67.1765627451246;
        Sat, 13 Dec 2025 04:04:11 -0800 (PST)
Received: from kinako.work.home.arpa (p1344243-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp. [114.145.20.243])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7f4c585cde0sm7761084b3a.69.2025.12.13.04.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 04:04:10 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: gerg@linux-m68k.org,
	geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] m68k: nommu: fix memmove() with differently aligned src and dest for 68000
Date: Sat, 13 Dec 2025 21:04:01 +0900
Message-ID: <20251213120401.3992567-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

68000 has different alignment needs to 68020+.
memcpy() checks if the destination is aligned and does a smaller copy
to fix the alignment and then critically for 68000 it checks if the
source is still unaligned and if it is reverts to smaller copies.

memmove() does not currently do the second part and malfunctions if
one of the pointers is aligned and the other isn't.

This is apparently getting triggered by printk. If I put breakpoints
into the new checks added by this commit the first hit looks like this:

memmove (n=205, src=0x2f3971 <printk_shared_pbufs+205>, dest=0x2f3980 <printk_shared_pbufs+220>) at arch/m68k/lib/memmove.c:82

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---

This is from my "make 68000 work again" backlog.

I have had this fix for years and I think the few other people that
have various 68000 hobby builds must have something similar.

/root # uname -a
uClinux buildroot 6.18.0-12420-gdc1a468a2724 #120 Sat Dec 13 20:42:45 JST 2025 m68k GNU/Linux
/root # cat /proc/cpuinfo
CPU:            68000
MMU:            none
FPU:            none
Clocking:       1179.1MHz
BogoMips:       1758.00
Calibration:    879001600 loops
/root #

 arch/m68k/lib/memmove.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/m68k/lib/memmove.c b/arch/m68k/lib/memmove.c
index 6519f7f349f6..e33f00b02e4c 100644
--- a/arch/m68k/lib/memmove.c
+++ b/arch/m68k/lib/memmove.c
@@ -24,6 +24,15 @@ void *memmove(void *dest, const void *src, size_t n)
 			src = csrc;
 			n--;
 		}
+#if defined(CONFIG_M68000)
+		if ((long)src & 1) {
+			char *cdest = dest;
+			const char *csrc = src;
+			for (; n; n--)
+				*cdest++ = *csrc++;
+			return xdest;
+		}
+#endif
 		if (n > 2 && (long)dest & 2) {
 			short *sdest = dest;
 			const short *ssrc = src;
@@ -66,6 +75,15 @@ void *memmove(void *dest, const void *src, size_t n)
 			src = csrc;
 			n--;
 		}
+#if defined(CONFIG_M68000)
+		if ((long)src & 1) {
+			char *cdest = dest;
+			const char *csrc = src;
+			for (; n; n--)
+				*--cdest = *--csrc;
+			return xdest;
+		}
+#endif
 		if (n > 2 && (long)dest & 2) {
 			short *sdest = dest;
 			const short *ssrc = src;
-- 
2.51.0

