Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580718;
	b=oAWjz+YdJKnNxSi5pfzX/TRONm2Y1eRiH2w+xh/qLT1igTpCzxT6GK1xqHLhKv9c+BT0
	 6iY6toK0cMbqO3S3lBOA2ph2f9DYQiT78i1Me7PNJK6KbgYY/v78nOcleMZjRGmpWxhT2
	 IK1Xq3ElC7zoK9QNxRfKIbypDgYB8gaXqMx7gGOfzWScM6kd1nnMaAYoKI1MYIzOGZeM6
	 8WhYSNJPusHeVTpuTJGkb7rOZ1HNBmpipz00n0jor0/T9xHpY1T6YLZ1YVqRvkwO0DICA
	 5iMz1IZPz9CkCxP6wDS/X8NrjFa3yptezKOMqqaxkJJll7d3shBZ+ngYI35W5NamA1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tD1P6BYH+TZyZF390atjXANoQij02Bx3ASCtdtlPU2c=;
	b=OZqiI4o9KcrHEpBBpiBX3wizKyyRqkr9ADOt8f1g6/m1DOQqe/6feHtGKxnIRzacLbO6
	 xD4YMNI/CwkZFqlnvluGkKL5+LioYklbLqv6kUDvKDMz4XxmGy2FVCTlf3nBHWhKa8s69
	 Hq3X2kYBCDYgIuBAJmljul1u/YGVA2o94gNxxt237xodGzuSs5nHqIdHlDEO8rMfSpfK2
	 60jmF7rf8oz7hMMeDQ7xUMdjhgkS7z9vbdNPwZ6Vt0kAzyR9Mb512QqcIT6pluzVEJ0qf
	 FVSpwfY0xJiebFYIuer/25fmwSvz734i0j/SLjvgdWWMVMU/vyCtDtrtl1xJGEkdz2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DrayMkm0;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE79606A32D
	for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Nov 2026 14:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE79606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DrayMkm0
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so469944f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Nov 2026 06:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794580717; x=1795185517; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tD1P6BYH+TZyZF390atjXANoQij02Bx3ASCtdtlPU2c=;
        b=DrayMkm0hkour3+cGj0VBE6bUBFGtmFLAf9KyNUdFZcLqRQLCYFYNjbPggUTNHr+nP
         4v/ZPvUyChvvsiiqtX5G/jyKvOVeiflkY75nBevCkGpUvAz98oRgt7dQ6E/kApxdJiYe
         xRzlzYkV9cK+x08IbN6eKk6KMZp1DsEIR0VwFBVDX7y1SlcqjPTK5JCaGZPIno2A6XOC
         YH/1rFEAMcuYnjIJgZhi3KOhR/8Z36ESFtaXxuLSnlahjMr2LcAQIYdCeIUtaGpiRtzC
         bwb/mdOOPYJ+uXqhMdyXGZexKMigw7iYahNHFGNiZd6CKsUhYqRen541k7sITmrHJGh3
         mX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580717; x=1795185517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tD1P6BYH+TZyZF390atjXANoQij02Bx3ASCtdtlPU2c=;
        b=Wejg5MDGeTxR2/x9625TVwt9spHG9jyjEgsg/Mgh6VZ8k5hfein7Fbn3ncUj1X23gc
         0sucZcDd6P+NHr5Gatm9+rqE9Nudq1ZzxBO0nDoj75/00YnzXjeG5epoAY6aXdSyIlmc
         U5ZhLXosDxFBlzqijjp54zUKHwu7cTXx/v0lxkJvU1kvfejQc+RlRyuEFQRORi2t7HPY
         X3WYSM3aXxQ2BJIVQQGasEz+B+mEnW7pulHc2vvxvUBDsPl7p8jvTEkge6HuktE5erRF
         pobq8aHSN2jxKOm+TJ9Zm9K4VtccujkRxs1KOIE2CMSQQzHl6tz6W1Idf5dXUdbrvDQ2
         8yPA==
X-Gm-Message-State: APuU4Z/VQKun1WAPurlkPklhhfYVGCNuCU1OTM66q9JtH+6sm3I1WtIU
	KhSTmiMQzVhMKQUS5iFk4vOUszgAGhT0cqOWDqEDowVfyJc/S+taunpI
X-Gm-Gg: AYBFou0DxDqnQG4XvblHh5KftoTATChCVXhMfYbJVoMmSZsUVqnZ8hH//BuRHPYsZxs
	xjwqsI5PPzU2Lb8/OkeesY68U5GoBiHBzd5PHEVMrm8ORrRZPzr3qErzp6Id7raflGlGbsSY2lE
	eFFNobtQ0bnTWjtGLX2TMdxrqiVMUQTEKP/MxqM3PQ3XBLxbppSOZL02r9T1azNjA9XmpI8QMy1
	W4XFYm+5GIO+pMQZ//9oFc0g9x9MhLwwO0JnbKBKS027mwujxrgcovjTNue/t3cd33UcGzV+E/p
	Cn98T3QNf9LKV4uxdxVZ3YM0HeSy3wK9A5Rm3HdfREfFLT8gEVV/VyFJEsjB176u1nOm0kZOAvm
	e3QTEdFdXHY1ggPY7KtveFkGVoRNNdXraW+jp6L1e43JrMqeIkfxcx1M+r0VEXyP3T+0sJFF0uW
	6GQThq7RCxyhH26dUc3aR42JoxaXMCKXDwRAvtNqqXJbdWk7olFgHCZTnvyT5cMt9ZNyVeosZQj
	CzeYtoA3+jFT8IQ7uFqaSukSC2nRGO2wAUkU3mwidnMUFmKpLpCVoWyieHUDKvDLn2SfOas2p6R
	7jCrMJM3EoQlvE7ivsuomBJ9Iis6tUdvuy2sc+YeGTm90sBLxkJ6PFJB0DH6ys5UQh0RFtR8sKT
	ZqsvoJ3k=
X-Received: by 2002:a05:6000:4555:b0:492:820d:1e with SMTP id ffacd0b85a97d-49c73259d2cmr3894871f8f.11.1794580716427;
        Fri, 13 Nov 2026 06:38:36 -0800 (PST)
Received: from beelink0 (host86-181-68-246.range86-181.btcentralplus.com. [86.181.68.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm6246854f8f.45.2026.11.13.06.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:38:36 -0800 (PST)
From: Graeme Harker <graeme.harker@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Graeme Harker <graeme.harker@gmail.com>
Subject: [PATCH] m68k: delay: Fix rounding of short udelay() and ndelay()
Date: Fri, 13 Nov 2026 14:38:32 +0000
Message-ID: <20261113143832.168233-1-graeme.harker@gmail.com>
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

__xdelay() takes the high word of xloops * loops_per_jiffy and only then
multiplies by HZ, so the loop count is truncated to a multiple of HZ.
On a 16 MHz 68030 (loops_per_jiffy 17792, HZ 100) every udelay() below
57 us becomes __delay(0): measured on such a machine, udelay(10),
udelay(20) and udelay(50) all take the same 8 us, the call overhead,
and udelay(100) takes 67 us.

Multiply by loops per second instead and keep the high word, which
truncates by less than one loop; __delay() runs one more loop than it
is given, so the delay is never short.  As on x86, a factor of 4 is
moved from loops per second to xloops, so that the product
loops_per_jiffy * HZ only overflows above 2**34 loops per second
(34000 BogoMIPS).

ndelay() works out loops per microsecond from loops_per_jiffy rounded
down to a multiple of 2048, which on this CPU is 1 instead of 1.78.
With a 64-bit multiply available, use __xdelay() as udelay() does,
with 5 (2**32 / 10**9 rounded up) as on x86.  The CPU_HAS_NO_MULDIV64
variants are unchanged.

Measured on the 68030 (1 s of each, timed by jiffies, interrupts on),
time per call before -> after:

  udelay(10)     8.0 us ->   18.2 us
  udelay(20)     8.0 us ->   29.0 us
  udelay(50)     8.5 us ->   61.5 us
  udelay(100)   67   us ->  114   us
  udelay(1000) 1020  us -> 1070   us
  ndelay(400)    1.8 us ->    7.9 us

About 8 us of each is the call and the 64-bit multiply on this CPU.
ndelay() now pays for that multiply too, so very short ndelay()s cost
more; they are no longer short when loops_per_jiffy is small.

Signed-off-by: Graeme Harker <graeme.harker@gmail.com>
Assisted-by: Claude:claude-opus-5.5
Assisted-by: Claude:claude-fable-5.2
---
The 68030 is a homebrew board whose support is not upstream.  The
timings above were taken on v7.3-rc1 with the multiply written as
xloops * (loops_per_jiffy * HZ).  The form sent here, with the factor
of 4 moved to xloops, gives the same loop count whenever neither
product overflows (compared on the host for loops_per_jiffy from 16896
to 170000000 and every delay the table uses); it has been booted under
QEMU (virt, 770 BogoMIPS) but the table has not been re-measured with
it.

Without the factor of 4 the product would overflow above 8590
BogoMIPS, which a fast QEMU host is within reach of; the old code had
no such limit in practice.

Build-tested on m68k master (v7.4-rc2) with multi_defconfig,
sun3_defconfig, virt_defconfig and m5208evb_defconfig (the
CPU_HAS_NO_MULDIV64 side).

 arch/m68k/include/asm/delay.h | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
index 751712f8beea..2d6b18a23f4e 100644
--- a/arch/m68k/include/asm/delay.h
+++ b/arch/m68k/include/asm/delay.h
@@ -57,14 +57,24 @@ extern void __bad_udelay(void);
 
 #else
 
+/*
+ * xloops is the delay in units of 2**-32 s.  Multiply by loops per second
+ * and keep the high word, so the result is truncated by less than one loop;
+ * __delay() runs one more loop than asked, so the delay is never short.
+ * Scaling by loops_per_jiffy first and by HZ afterwards would truncate in
+ * steps of HZ loops, turning any delay below HZ loops into __delay(0).
+ *
+ * As on x86, a factor of 4 is moved from loops per second to xloops, so
+ * that loops_per_jiffy * HZ may be up to 2**34.
+ */
 static inline void __xdelay(unsigned long xloops)
 {
 	unsigned long tmp;
 
 	__asm__ ("mulul %2,%0:%1"
 		: "=d" (xloops), "=d" (tmp)
-		: "d" (xloops), "1" (loops_per_jiffy));
-	__delay(xloops * HZ);
+		: "d" (xloops * 4), "1" (loops_per_jiffy * (HZ / 4)));
+	__delay(xloops);
 }
 
 /*
@@ -113,6 +123,7 @@ static inline void __udelay(unsigned long usecs)
  */
 #define	HZSCALE		(268435456 / (1000000 / HZ))
 
+#ifdef CONFIG_CPU_HAS_NO_MULDIV64
 static inline void ndelay(unsigned long nsec)
 {
 	__delay(DIV_ROUND_UP(nsec *
@@ -120,6 +131,17 @@ static inline void ndelay(unsigned long nsec)
 			       (loops_per_jiffy >> 11)) >> 6),
 			     1000));
 }
+#else
+/*
+ * The shifts above round loops_per_jiffy down to a multiple of 2048, which
+ * on a slow CPU loses most of it.  With a 64-bit multiply, use __xdelay():
+ * 5 is 2**32 / 10**9 rounded up, as on x86.
+ */
+static inline void ndelay(unsigned long nsec)
+{
+	__xdelay(nsec * 5);
+}
+#endif
 #define ndelay(n) ndelay(n)
 
 #endif /* defined(_M68K_DELAY_H) */

base-commit: 8c9ddebb300c719362a52a2d465f44e7d055778d
prerequisite-patch-id: d8f836f1e047af08e6fff01d411b44e442086214
-- 
2.53.0

