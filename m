Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795149297;
	b=LGrd3jh8qW3aWiPSu+/cDHnpKrJ5xJ6H4FpbCEX9eylr2CwG9v5HKsOh6ob035Xnh6xK
	 3HtBs+GW1wxuMUHEYt3wvs2fDsMvNX0hQWMIRu8NXhTZDftEmNcB4wryHOrgyvhgDO9ch
	 MPemZQOVlxF/0oi4hMyhRWbqDlr7nkp8Y2i5DvdYC1L7MfX8hItb5ugRTSMh1MjA7lWJk
	 oipqEB53pCj++wWQ+9W0guvxUDbCSF0WPNyMO/FbFFox9uyoiDt0+/sZxmh8G8dMbKrcz
	 rFlS0xdCmzzaEQ7SP6d83/KgdVEohDKcI6K6d7noljvcQqALiL42zONVmEbma7PFneg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795149297;
	h=DMARC-Filter:Received:Received:DKIM-Signature:X-ME-Sender:
	 X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:
	 From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type;
	bh=o5cbZa/CKFNHwxxN/1udfnU91JGStNmWV5mTiYbwbH8=;
	b=xCNpD2iepwMfljbmQl3OGfaPRCfN214xo4nk/yfXqfdEDH1sqIFlBkCkPg1BeYrHn7R2
	 l4RULZAfS9UAvXKPQF1La+TiFPPnSsOIDx5eqx8pNVREI+uCS2ruYrp8BM3n+1/3wyXlY
	 yA/H47ySjcvOgKzE6FnfLgkmnxTtzPNKgD5iqX15NhtCHf9Wool95exGqumUAAtDu7Vv7
	 6rlim5zNLBHqdIRKk5W9DsCnJRA7Z76iOzBnK2dwaKDXBQDPCX9tfdPX3It7ssYsgm9yr
	 asBPxff9AbGaTYopkztvmkWWAHp/BfGvzKY2wwrVEYJ4mHu4BCi0s6bH8Wc8jGGl37A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=none smtp.mailfrom=linux-m68k.org;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=i3TqCscb;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA12606A320
	for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Nov 2026 04:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA12606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=i3TqCscb
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EBBCC7A02D0;
	Thu, 19 Nov 2026 23:34:55 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 19 Nov 2026 23:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795149295; x=1795235695; bh=o5cbZa/CKFNHwxxN/1udfnU91JGStNmWV5m
	TiYbwbH8=; b=i3TqCscbjVXP5n2Orc2v3h/SulVyzFaTPKNh2qCBegB+hVK/FX3
	vlMZKDVYrJIX33o6poUsclWSO4kUWNqHl2fclnAYUD2zuKVLgjIhMF3fA63/YbpD
	Yfd2KB0KjLXEReeMSkTkc29oYmn0ljhxFGIDdzhe6CV6PVdyZDxX8+yiVM2prvr7
	8eRplxbz8fg9QFKrMhYU00fwqyh5xXGr8s+wcFeUMmfVY99y2AGIySyDuP5y0Zzm
	8YEzerog3h8i9+B8/EFk8Lq+/HziNQdnWWnlGQy3TpK612pdlT3VUCgFTtuxwkzC
	OeWCJDT5BLPo2Jk/oGgdKOITyJUssM4k1Sg==
X-ME-Sender: <xms:783_ajm_yMABFRz-D4atqAzJIzy50cKiOHYRcoiLbCLzNQqUUEJxWw>
    <xme:783_akqv8gBxgwCVvGxdH3uFg5zsHPufHOdYe3lq6DeInjWQtlcv69XneENwyJkJt
    _orP90zlqFX0Au6CQj0GFfwnO8uW-tg7D0aONXRmew2-XWAinpspFI6>
X-ME-Received: <xmr:783_akFUSuJ5YPs-mpTRvOoh907PEGgu230uI9Ohkes9ct8fgknQg12i6Z4-XFdw52MoArSilfbEqFXLMryjCjTdUWzChHzjT6Q>
X-ME-Proxy-Cause: dmFkZTGybfOZ/ba/ZfyqCqdfL0Ctmmyy3a2Bizjne4AAbm+ofzWPmXJVFODUxt2CI7oJkp
    0eFtIFnu0BNygqwr5YYld+oGgrdbHWYHCy2N+0O7OmABzwDvX8MoQXZRZQqjU4U/KrublA
    n+0YotKw0QcrHu1XOK7/N1xQw85TRIjnmt1WDhPq7Gt/TSp+f/G7JPQXdA58Y/bKCAgwAP
    CTfxeVB1stDX30yEh1LrZwUR6qLVwpd4376spwf4MXuAuSjNhoTpQ7POymUGyGUNZExkLJ
    qyUGUmdAPVVWlKrzXiVBtEQIdFRVaxI5UBlpvl/LnYt6/vQ83VoYXU6cFkaTOmebkTperk
    D6CcjvgnpsdUzUYxXb7wuYccNeWqMWPAVYtAgfwR6qnE9LpuEfAdorObZU+5+Ns4sqSuLc
    t7tAZSmlhM9752bSon5E5/Tacz3eHePwMyu/eXCS7/i7I/WcBMOSqGDbtAs/6hViZQKUYh
    VnxI+8aRRb0HEERp0upN03HZg/z1VuEJySSV0LVE7F7ACXI5dfgaUZZGsjQCXwIwM4+XFZ
    Oe7hGN2dLEo0Aa9og2txQSf2MjXrk7Ytkw3lMjru5/k9lNU7GarPEkh9N4OeDy5/DxI2Xd
    L2A+Dp2JoWk3aD6YVY5KjO/adrGdPOvODSviotaIgOunfDw9bWYAvNyW0HaQ
X-ME-Proxy: <xmx:783_aoyT2nl2Y7lOePg7f7b3rXB-NTTupTUnELcPhWWD-wMIdNseWQ>
    <xmx:783_ahqumzc-4QYyDwQs-6ImuVlRHZgOa3Ws1aGVNBWP-3mwdzaUvg>
    <xmx:783_aqhj2bI30KSedJ_q5ywST5vWD1qoRczqDsZrXMyLiy9Cd9hxpA>
    <xmx:783_amjxCqhAFvShyoS0UtnfyErH-zfb8t6f0S5T5zoTsWuD9ZjQ3w>
    <xmx:783_akHDITlynDGaNaSAS6H6eMJgkoaZZVeif2mFvhWz3QBqfFk3zXQJ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 23:34:52 -0500 (EST)
Date: Fri, 20 Nov 2026 15:34:46 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Graeme Harker <graeme.harker@gmail.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: delay: Fix rounding of short udelay() and
 ndelay()
In-Reply-To: <20261118210008.927764-1-graeme.harker@gmail.com>
Message-ID: <5783b448-b34a-58a5-0bc0-98b1a806f182@linux-m68k.org>
References: <ae768ed3-a517-3223-5c86-a1599ff6c8e5@linux-m68k.org> <20261118210008.927764-1-graeme.harker@gmail.com>
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


On Wed, 18 Nov 2026, Graeme Harker wrote:

> 
> > Which clocksource driver are you using for jiffies?
> 
> The jiffies clocksource itself; the board has no sub-tick clocksource 
> yet. The tick is a periodic clock_event_device on the DUART's 
> counter/timer (GENERIC_CLOCKEVENTS, not LEGACY_TIMER_TICK), and my 
> figures were 1 s of each call timed by jiffies with interrupts on, so 
> they include the tick's own cost. Yours are the better numbers.
> 

Maybe. But this clock oscillator is running at some frequency which I 
haven't actually measured. Also, I'm measuring wallclock time, which may 
be inappropriate if the udelay() interval is derived from loops_per_jiffy.

> > ndelay(400) 536E-09 -> 239E-09 seconds
> 
> I think the patched ndelay() count has wrapped your 16-bit timer. The 
> patched ndelay(400) asks __delay() for at least 466 ns of calibrated 
> loops whatever loops_per_jiffy is (8000 * loops_per_jiffy * 25 / 2^32 
> loops, plus the one __delay() adds), and it now does a mulu.l on every 
> call, which the old code did not (its arithmetic is plain C, so GCC can 
> hoist it out of your unrolled loop). If a call takes about 1.08 us, 
> 100000 calls take 107.6 ms, more than the 83.7 ms that T2 can count at 
> 783360 Hz, and what is left after one wrap is 23.9 ms, or 239 ns a call.
> 
> Could you try ndelay(400) with 40000 invocations instead of 100000?

Here's what I measured with interrupts disabled:

test_udelay(10)	     11.0E-06 -> 11.7E-06
test_udelay(20)	     19.7E-06 -> 21.5E-06
test_udelay(50)	     47.0E-06 -> 50.8E-06
test_udelay(100)     92.3E-06 -> 99.7E-06
test_udelay(1000)     973E-06 ->  979E-06
test_ndelay(40)	      191E-09 -> 17.0E-09
test_ndelay(400)      673E-09 -> 1.49E-06
test_ndelay(4000)    6.03E-06 -> 5.58E-06
test_ndelay(40000)   38.7E-06 -> 46.5E-06
test_ndelay(400000)   366E-06 ->  456E-06

ndelay(400) and ndelay(40) seem to be anomalous. I don't know why.

> If I'm right it should come out at about 1.08 us. That would mean it is 
> longer than before, not shorter. As the commit message says, ndelay() 
> now pays for the 64-bit multiply, so very short ndelay()s cost more. If 
> that cost matters on the 040, I could keep the old ndelay() and only fix 
> udelay().
> 
> Your udelay(1000) at 978 us is still 2 % short with interrupts off. I 
> believe that is calibrate_delay() running with the tick enabled, so the 
> tick's time is counted as loop time. That is separate from this patch, 
> and I have left it alone.
> 

Here's the same thing, but interrupts were enabled this time:

test_udelay(10)      11.4E-06 -> 12.2E-06
test_udelay(20)      20.5E-06 -> 22.3E-06
test_udelay(50)      48.8E-06 -> 52.7E-06
test_udelay(100)     96.1E-06 ->  103E-06
test_udelay(1000)    1.01E-03 -> 1.02E-03
test_ndelay(40)      77.5E-09 -> 57.1E-09
test_ndelay(400)      776E-09 -> 1.55E-06
test_ndelay(4000)    6.23E-06 -> 5.77E-06
test_ndelay(40000)   40.7E-06 -> 48.5E-06
test_ndelay(400000)   384E-06 ->  476E-06

In general, delays are about 4% longer when interrupts are enabled. I 
think that's just the overhead associated with a bunch of VIA chip 
accesses every 10 ms. Other platforms should fare better.

---

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index b745cf20a71f..66e80aa230ff 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -65,6 +65,83 @@ static void __init mac_sched_init(void)
 	via_init_clock();
 }
 
+#define GET_VIA1_TIMER2() \
+({ \
+	unsigned long flags; \
+	local_irq_save(flags); \
+	u8 high = via1[vT2CH]; \
+	u8 low = via1[vT2CL]; \
+	torn = via1[vT2CH] != high; \
+	local_irq_restore(flags); \
+	1 + low + (high << 8); \
+})
+
+#define DELAY_LOOP(n, arg) \
+do { \
+	int d, i, I = n / 40; \
+	u16 t1, t2; \
+	bool torn; \
+	do { t1 = GET_VIA1_TIMER2(); } while (torn); \
+	for (i = 0; i < I; ++i) { \
+		arg; arg; arg; arg; arg; arg; arg; arg; arg; arg; \
+		arg; arg; arg; arg; arg; arg; arg; arg; arg; arg; \
+		arg; arg; arg; arg; arg; arg; arg; arg; arg; arg; \
+		arg; arg; arg; arg; arg; arg; arg; arg; arg; arg; \
+	} \
+	t2 = GET_VIA1_TIMER2(); \
+	d = t1 - t2; \
+	if (d < 0) d += 0x10000; \
+	if (torn) pr_info("torn\n"); \
+	else pr_info("%10d, %20s, %10d\n", I * 40 , #arg, d); \
+} while (0)
+
+static inline void test_udelay(unsigned long t)
+{
+	volatile unsigned long vt = t;
+
+	udelay(vt);
+}
+
+static inline void test_ndelay(unsigned long t)
+{
+	volatile unsigned long vt = t;
+
+	ndelay(vt);
+}
+
+static void measure_delays(void)
+{
+	// Given ECLK is 783360 Hz, the 16 bit counter can measure up to 80 ms.
+	// Loops of 40ms of udelay() calls:
+	DELAY_LOOP(4000, test_udelay(10));
+	DELAY_LOOP(2000, test_udelay(20));
+	DELAY_LOOP( 800, test_udelay(50));
+	DELAY_LOOP( 400, test_udelay(100));
+	DELAY_LOOP(  40, test_udelay(1000));
+	// Loops of 16ms of ndelay() calls:
+	DELAY_LOOP(400000, test_ndelay(40));
+	DELAY_LOOP( 40000, test_ndelay(400));
+	DELAY_LOOP(  4000, test_ndelay(4000));
+	DELAY_LOOP(   400, test_ndelay(40000));
+	DELAY_LOOP(    40, test_ndelay(400000));
+}
+
+static int __init measure_delays_init(void)
+{
+	unsigned long flags;
+
+	via1[vACR] &= ~0x20; // free running T2 with no port B output
+
+	local_irq_save(flags);
+	measure_delays();
+	local_irq_restore(flags);
+	measure_delays();
+
+	return 0;
+}
+
+subsys_initcall(measure_delays_init);
+
 /*
  * Parse a Macintosh-specific record in the bootinfo
  */
