Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995552;
	b=3HrAQZsk2l4zH1EcSs3wwf4Ett8Iv3eV99IbtDCtOyscRPyr48EjwtEq1cnBMAAUn7CU
	 JBuzUk7t4KdpTRwd0csbBZYvRecP98E0+EJnVL0R73F8Sj8Yl4ZphjXqQ0t0yxsgCEBCH
	 6wQG/plWZ84U+1mNrE0fK23/4aXgscWEPQxZMIFE0i99GhDubmS9Y37N8wt5B+C7MCvXO
	 aCVpzquDPazbPQwBu2bkyUBrsQBYsBnRSuLSylAK4yUmJmzl4JMUC/8tLaC2RvkuXr9Lq
	 7BiW9WgbyMmJqaiOhNeLFzdKPiafOD4CvMJdPJVOAZ+TSWUTHTQ46+XFTBUYeLopqxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995552;
	h=DMARC-Filter:Received:Received:DKIM-Signature:X-ME-Sender:
	 X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:
	 From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type;
	bh=08GNxqqcutlPCHrAJDR+Yvcn0JpVtFjAgWOb3wtjwsY=;
	b=IQaQclAPtTT+t9YWbB2bC6sxD9VH/UjD8P+ar/01dJZgJ3Xvb1Cz9uS+o2cbJ1a1CXvs
	 jdHQGsZaS3UB0MjAIAXIPDqetRGCemOZni9hBmWMM9gWXfTjBGAt+y/X5UWZseQTd+1An
	 61sd0AcO6WWBI6vnSvh4lsDdYy4ZfXcRkkxIPERFHenk188IIKQm7rvD+E17DogyU59I1
	 ZpQ78oB3dpJu16vfwbMd9m8kJLpwXUqsdOS5NbYOuwek3CpNcdqxiBIT4nzR0H8LL1ENU
	 PHvImJWsKQ+mpZXqj2jkqbtuVZtMkxm40dkrdKUcXcc2O3p/mI7RihzgdLN2nx1HSGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=none smtp.mailfrom=linux-m68k.org;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CZeDPVBK;
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FA8606A31C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Nov 2026 09:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7FA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CZeDPVBK
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F1A267A0033;
	Wed, 18 Nov 2026 04:52:30 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 04:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794995550; x=1795081950; bh=08GNxqqcutlPCHrAJDR+Yvcn0JpVtFjAgWO
	b3wtjwsY=; b=CZeDPVBKmFsYWo5rOcms9u/XhMwfGlcpOsqtkxV13VQsVqq4Ji4
	9h7MbqERyDCtpkOe/0UgjQShFtvhyEy9gIM7+P8vxPqi68d9SjF0+FX1pmliet8g
	/BlbNwaW0AVS6g61epOJ/6VhmyZYg0L0FZrBpDbCKpGdHFOOrssP1xf6bWuwbMd1
	6QYPLqEv1oWTJehamUD7DdT9nEMP4CwT2n74YcBCQouIGyO05BDxYoRoWn6wZ0Zp
	8+343rPUi+pAKow8iNMVQZWYNdRYeQxAsWoi2dbbxl/lWC1PmUGCeYSz17vmIlKG
	fzTceHrgDHNzcyYJXXKKsZHZFo/YUMJbRmw==
X-ME-Sender: <xms:XnX9auYEqCNMnmh0RdtfEZXFB9L111362E3bKSTAlr19L_BJxJ82hw>
    <xme:XnX9avPHGPTKei-j1BqVhRe11J2n0umOalj_3pNhCJTxc19C20EkPz8IGU30fdR5E
    xOUo4AzGWTa5BytbSDcSRsorcJ6HMXGtuDGkDxFr-xcnzbh519Lmx-7>
X-ME-Received: <xmr:XnX9ajaqdu1wJ2sZU7SXzN9Xh1SgEgwN2tKSfUmZqzX9RBXqD67jvN5SYNzK>
X-ME-Proxy-Cause: dmFkZTGR4I22bLJwTwt2FWJhq+VEuyYwDblgcFrUmwnBJBinx2IsuzNOeMg5ScpVIFQLkD
    dCX/Htnj6gduANGrr29dLqPLoA/sqWleUgQbcBnI46vXFeeHWPbpWG/uh4lXKUPdxrw7UE
    TonLtq6N26xm0S5drgwXeI0l7IfrVmc96dzfQHOtgijMbj+2wH5JSTKHBcnN0m1YkXn50B
    32YY3dNmrkbpeJ1eh0IxIiXEY3+vYfo6A1eiLaxcPDm7Ui8Ago9wkjNnhnpV8o8PC88I1S
    R/enjdUceHxvOO9AkRW91IEkvwc8NPwchpDsGkPX/bN8AITx+sGeaIkoFyeyDpAGMXIiJ3
    Nvt6fUpmvPPc/Zj0YhfNvLkTiXgu7sGbfOvqFE6L1vNUxneQd+CFI/0CoqNSGbBALW8QnV
    M05xJ6XaHmH2eTqz9tLKboBP0BhR5aFolGmLGrdB4oyepjtHmE/0zAoJdDd7eoa7Vv0doE
    ZrObc8QwxRX8IFmsSbuji576pcbJBdDRMblnfFXq81Pek7FvOucrQHjj9cSSWXQNIkj7/v
    2PAOw2+k/Fn0VfOjQw3xH6S61CSm7rU8DoaRorWL5dfAomF+M0Z0xwTqZg7tshpHQ6yebS
    oyIgv5GNK/kWbNLhwMYOAmN9q7eGNIxaMLBoAc+Z7a+KHCs9rVlPz+DXqixg
X-ME-Proxy: <xmx:XnX9at1K0cR6oQfDNVBz_sCyXyWQqOq_meofSWU2_ecjaoGiDOgvbw>
    <xmx:XnX9apeBBghT4A7WyX_76md47K60Qshvre3mbve0oIBWGNnmtZJU9Q>
    <xmx:XnX9auG9k8fR6DTS7wdX4RtSIv-iIluOlHevT_WQzOWj2aAGWd56cA>
    <xmx:XnX9aq2R_oJJhqXf-xC2dEO4H9wKM8fBD2qMcCcFeqkhSgOAJdJE_A>
    <xmx:XnX9arq-pAxmiND6S4avF2n4EFu4rD4F_M00XKJMd8yy1q3Y3k2SfV7G>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 04:52:28 -0500 (EST)
Date: Wed, 18 Nov 2026 20:52:16 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Graeme Harker <graeme.harker@gmail.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: delay: Fix rounding of short udelay() and
 ndelay()
In-Reply-To: <20261113143832.168233-1-graeme.harker@gmail.com>
Message-ID: <ae768ed3-a517-3223-5c86-a1599ff6c8e5@linux-m68k.org>
References: <20261113143832.168233-1-graeme.harker@gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 13 Nov 2026, Graeme Harker wrote:

> __xdelay() takes the high word of xloops * loops_per_jiffy and only then
> multiplies by HZ, so the loop count is truncated to a multiple of HZ.
> On a 16 MHz 68030 (loops_per_jiffy 17792, HZ 100) every udelay() below
> 57 us becomes __delay(0): measured on such a machine, udelay(10),
> udelay(20) and udelay(50) all take the same 8 us, the call overhead,
> and udelay(100) takes 67 us.
> 
> Multiply by loops per second instead and keep the high word, which
> truncates by less than one loop; __delay() runs one more loop than it
> is given, so the delay is never short.  As on x86, a factor of 4 is
> moved from loops per second to xloops, so that the product
> loops_per_jiffy * HZ only overflows above 2**34 loops per second
> (34000 BogoMIPS).
> 
> ndelay() works out loops per microsecond from loops_per_jiffy rounded
> down to a multiple of 2048, which on this CPU is 1 instead of 1.78.
> With a 64-bit multiply available, use __xdelay() as udelay() does,
> with 5 (2**32 / 10**9 rounded up) as on x86.  The CPU_HAS_NO_MULDIV64
> variants are unchanged.
> 
> Measured on the 68030 (1 s of each, timed by jiffies, interrupts on),
> time per call before -> after:
> 
>   udelay(10)     8.0 us ->   18.2 us
>   udelay(20)     8.0 us ->   29.0 us
>   udelay(50)     8.5 us ->   61.5 us
>   udelay(100)   67   us ->  114   us
>   udelay(1000) 1020  us -> 1070   us
>   ndelay(400)    1.8 us ->    7.9 us
> 
> About 8 us of each is the call and the 64-bit multiply on this CPU.
> ndelay() now pays for that multiply too, so very short ndelay()s cost
> more; they are no longer short when loops_per_jiffy is small.

It's hard to measure anything accurately with interrupts enabled,
without CPU isolation, NO_HZ, HIGH_RES_TIMERS, GENERIC_CLOCKEVENTS etc.

(BTW, I notice that m68k and RISCPC are the last remaining users of
LEGACY_TIMER_TICK...)

Which clocksource driver are you using for jiffies?

I did some measurements with your patch on a Motorola 68040 (Mac LC 630).
This build does not set CONFIG_CPU_HAS_NO_MULDIV64.

My method was a bit different than yours (code is given below): nominal
40ms of each call, measured with a VIA timer, with interrupts disabled.
(The jiffies clocksource on this platform uses the same VIA clock.)

Here's what I measured:

udelay(10)   9.94E-06 -> 10.3E-06 seconds
udelay(20)   19.0E-06 -> 20.1E-06 seconds
udelay(50)   46.2E-06 -> 49.4E-06 seconds
udelay(100)  91.6E-06 -> 98.3E-06 seconds
udelay(1000)  972E-06 ->  978E-06 seconds
ndelay(400)   536E-09 ->  239E-09 seconds

You were right about the delays being short, and you've certainly improved
upon that for udelay(). But ndelay() appears to have regressed in my test.

There is a lot of overhead in my ndelay() measurement so I'm surprised to
see it measure low. I would have expected the opposite. Maybe my method
is just not accurate enough.

Thanks for working on this.

---

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index b745cf20a71f..bc1da6ee014a 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -65,6 +65,54 @@ static void __init mac_sched_init(void)
 	via_init_clock();
 }
 
+#define GET_VIA2_TIMER2() \
+({ \
+	u8 low, high; \
+	do { \
+		high = via1[vT2CH]; \
+		low = via1[vT2CL]; \
+	} while (via1[vT2CH] != high); \
+	1 + low + (high << 8); \
+})
+
+#define DELAY_LOOP(n, cmd) ({ \
+	u32 i, I = n / 40; \
+	u16 t1, t2; \
+	int d; \
+	t1 = GET_VIA2_TIMER2(); \
+	for (i = 0; i < I; ++i) { \
+		cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; \
+		cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; \
+		cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; \
+		cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; cmd; \
+	} \
+	t2 = GET_VIA2_TIMER2(); \
+	d = t1 - t2; \
+	printk("%10d invocations, %20s, %10d timer2 cycles\n", I * 40 , #cmd, d); \
+	})
+
+static int __init measure_delays(void)
+{
+	unsigned long flags;
+
+	via1[vACR] &= ~0x20; // free running T2 with no port B output
+
+	// Given eclk is 783360 Hz, the 16 bit counter can measure up to 80 ms.
+
+	local_irq_save(flags);
+	DELAY_LOOP(4000,   udelay(10));
+	DELAY_LOOP(2000,   udelay(20));
+	DELAY_LOOP(800,    udelay(50));
+	DELAY_LOOP(400,    udelay(100));
+	DELAY_LOOP(40,     udelay(1000));
+	DELAY_LOOP(100000, ndelay(400));
+	local_irq_restore(flags);
+
+	return 0;
+}
+
+subsys_initcall(measure_delays);
+
 /*
  * Parse a Macintosh-specific record in the bootinfo
  */
