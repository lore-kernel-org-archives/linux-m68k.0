Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795255014;
	b=4LdeTs8cmu1dd+eqnMIL3ih+cLpMqngoVRyF0CErIqBRM9bOyizHyHYXIIkpEgFRQfUQ
	 PBRNRy9ebLtUegXOKSdy5F1FKCpvDNmfyJFbyhC8Q8AsoL7hb7OwSVmDw5mfvy8/AfBEe
	 vdMvq9UGiRZIqrwpDLq7nge/1Miog7A1nNYIQXn+1vSnIqjN0jdX+tbsmNwKIjhULsooM
	 UChmWB+sq/vtq1urgQpi4NK2p5ykuDh6P20LYJfCxatzQySeMK+nLBG1uFr22NspqJqZe
	 G3mhyeo7P2VgoS/Oo6MuqJ95lYDqT/9lUktct1soIRCIn7e22Sc/g8S/4J3MmAdr97g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795255014;
	h=DMARC-Filter:Received:Received:DKIM-Signature:X-ME-Sender:
	 X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:
	 From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type;
	bh=u9tsFDPxYmUVPDyHv2cJaPACOxPRNY4LUQNXciLBaiM=;
	b=CWaWgzIgCsnaBK/4QoUXwZqxE8SJ4Ztt+S2NoEfGKS9tc6KBsuOONy/S7bARj8xudBkq
	 rl6rDKMclwifKXziPCOJlt1l9Ix0ejAQJowxBBSs0zWiAy5scyFnsFvdq+Vtf6UowPrjf
	 M7bl2S6jC5DBEeSTr1O1n1Pyd6JMSxdYY0FCvLD33KBHM3+4kchfyjF0Fg7XM4sjEinOj
	 tMKxtZdG1M93jSJGVCSHiInKFt9cHIUKEteNRN/Q/pu1AwhNcI94nbqM87RE6Mo6r9ZqI
	 6MqtVB5iCfM2AdiiJepjPo5hQ6FQznOLQINvWz7CZDze6FumNIkeQUaXAPGvDIjmRrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=none smtp.mailfrom=linux-m68k.org;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Du9v7uSL;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41A3606A320
	for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Nov 2026 09:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A41A3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Du9v7uSL
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 92A0714003BA;
	Sat, 21 Nov 2026 04:56:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sat, 21 Nov 2026 04:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795255012; x=1795341412; bh=u9tsFDPxYmUVPDyHv2cJaPACOxPRNY4LUQN
	XciLBaiM=; b=Du9v7uSLjVRDtjReFbzqveaidXjfL2Ud5a13Ykfr9WtupLLdfM7
	HmlOaE3dcplgZ0Cqpub4d734GKaqfyjC+QYVZOLzOwjqiETLLVtosRbaJ+j+ysb9
	HbiA4/2fRrR2iazO3/sGfAwYx29kWMW0ZjSKJ6Am/weAa8CpGCGHHkSv+ZlU6UiE
	gk/psyoCl0BbBB+bFO7cHp5UDTTfszpDW6uVSMPpb1/JVe/b2FwteggNhXbP8icC
	o3SLvwkhy26/9DQDJl8eLzshovFIn8sNtanltT+k7ou2iPOrNOcifuUfBRMc+gL/
	0UmSRluXnxTb9mrX6knO23XEqHhxPElv2qw==
X-ME-Sender: <xms:5GoBayRvCICMIsZid4PaFzXZm-mVngBxgRJUDKBryfk2Y12-aQIjdw>
    <xme:5GoBa1m4wZ0xULH3f2kU7I_BNYwFFk5_ZR1T9wmmiMS7LoUVmHAfexbEIc5hN1zWp
    mM3KnHLcJP-HUOr9yaf3gW2tB9bJeCnFRGNmYaqzakWV6dviZLE98zd>
X-ME-Received: <xmr:5GoBa6SpaAQfkopQBjI51sfsjWyn0PG0dcg5xArPkxvpMfmyKLEudpQItXp-_p690H02BsTbzZ_wpGFE1rFvN2v3t47_y5T_Qd8>
X-ME-Proxy-Cause: dmFkZTEtuqN4aEX2fWu0pFKG1gRgAbhoGxyUReBIRrdnFNp+JbGDGFdf/qtyE2MJLSuDpa
    q6XS8AdEoRoC1m2DLzQ4ZOtlR0e4El4sbHrd7Vjd9wk7yNYLrGMDK4cez2CxyD2TKFV9F2
    mVi9UpO+u6TnXNiQIXZDJHUzMXHikivct9ltn5z2S/EQwyTsOYymc7TxXzS6iuWa41aged
    rCN743BK8rq7fmUZbm9EnR5MMgQBQOwMriOrL9yfo6VyRuHmTTU6LMzuJJa4SX/Kr4zONe
    v8Rb0Na2bvJ6R6ijXYzhsGRzFq1IBh+TxwVjlvDJq+N0w48qUtWatv+D4uqLBrejzj3GXy
    eRc3r95SlQ+zSAJHByZGuuM4SnnCbf9mkZGeZBC83O+Goy1pY3/Bnm10JhOp0lCZ3NfQOL
    WQxn1uzECo4Zb60oxtXKBcvKcsuHDRUqcA7+RWPpHl7Zx3ZFAegiAxO55+Dxxt74li4d3B
    9kIdGVtPton7OtVNuooPlp5V2UeH/BUTjQYTKhjlQcFmsl6k+oqACGLyiGpBYkeM0YOXU6
    YG/wd+Gh/cu3JZjQT+ojDIydhtvYPy+4GOM+GBIKnP4aWk1bOGztaCwTId1mRdUZpCxq6D
    pWXhf/huicEP67iKELxQZYSgqJTN0eS0cvWhksQm+GH9iZdEjzT9AjpJcsHQ
X-ME-Proxy: <xmx:5GoBa7Pgv9IGrMFNFEHq_6p8osKGV5XKmIM6y8RMX7DUINALtvpahg>
    <xmx:5GoBa7WRggairNDxFfpcFooNvOGiOYd70j-OZ45Megc847DJi0WjaQ>
    <xmx:5GoBa6eOiXjgExTe-f357N77chMQ3B1f0plY_xpc-rXO0sVZmb6ZtA>
    <xmx:5GoBa_tZwt_EPCZwlpZIGdT3ebAdOGKVVms6ooGbUhWjur6SknFguw>
    <xmx:5GoBawADN0TXqa57I6_bnPqgPwQ7pJQG-QrxbzQ0hheIeFMVGyZujD09>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Nov 2026 04:56:50 -0500 (EST)
Date: Sat, 21 Nov 2026 20:56:42 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Graeme Harker <graeme.harker@gmail.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: delay: Fix rounding of short udelay() and
 ndelay()
In-Reply-To: <20261120164322.1034075-1-graeme.harker@gmail.com>
Message-ID: <31cf41a9-a2c2-6ae6-b12e-50e54875d0d1@linux-m68k.org>
References: <5783b448-b34a-58a5-0bc0-98b1a806f182@linux-m68k.org> <20261120164322.1034075-1-graeme.harker@gmail.com>
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


On Fri, 20 Nov 2026, Graeme Harker wrote:

> > test_ndelay(40)	 191E-09 -> 17.0E-09
> 
> I think this one has wrapped the timer as well. 400000 calls only fit in 
> T2's 83.7 ms if each takes less than 209 ns, and 17 ns is less than one 
> clock on the LC040. With one wrap it would be 226 ns, which is longer 
> than before, as ndelay(400) now is. 40000 calls should show it.
> 

Well, the problem with 40 ns x 40000 calls (or 1.6 ms) is that such a 
short interval will usually encounter no tick interrupt, and the 
measurement would be erratic (if interrupts were enabled).

The measurements below were made with interrupts disabled so add 4% if you 
want to account for the tick interrupt.

test_udelay(10)	    10.8E-06  ->  11.8E-06
test_udelay(20)	    19.7E-06  ->  21.5E-06
test_udelay(40)	    37.8E-06  ->  41.1E-06
test_udelay(100)    92.3E-06  ->  99.7E-06
test_udelay(200)     192E-06  ->   198E-06
test_udelay(400)     392E-06  ->   393E-06
test_udelay(1000)    973E-06  ->   980E-06

test_ndelay(20)	     401E-09  ->   612E-09
test_ndelay(40)	     401E-09  ->  1.06E-06
test_ndelay(100)    2.49E-06  ->  1.17E-06
test_ndelay(200)    2.55E-06  ->  1.22E-06
test_ndelay(400)    2.75E-06  ->  1.50E-06
test_ndelay(1000)   3.30E-06  ->  2.14E-06
test_ndelay(2000)   4.24E-06  ->  3.33E-06
test_ndelay(4000)   6.07E-06  ->  5.63E-06
test_ndelay(10000)  11.6E-06  ->  12.5E-06
test_ndelay(20000)  20.8E-06  ->  23.9E-06
test_ndelay(40000)  39.2E-06  ->  46.9E-06

> > test_ndelay(40000) 38.7E-06 -> 46.5E-06
> > test_ndelay(400000) 366E-06 -> 456E-06
> 
> These show a real problem with the patch: long ndelay()s now run about 
> 15% long.
> 
> The 5 I took from x86 is 2^32 / 10^9 rounded up, but 2^32 / 10^9 is 
> 4.295, so every ndelay() asks for 16.4% more loops than it should. 
> Combined with your udelay(1000) of 979 us (2% short), that predicts 453 
> us for ndelay(400000), and you measured 456 us. The old code was short 
> instead, from rounding loops_per_jiffy down to a multiple of 2048.
> 
> I can't explain the old ndelay(4000) of 6.03 us without knowing 
> loops_per_jiffy. What does your machine calibrate to?
> 

It logs "Calibrating delay loop... 21.55 BogoMIPS lpj=107776)".

> I can see three ways to go, and I'd like to know which you and Geert 
> would prefer:
> 
> 1. Keep 5, as x86 does. Delays are never short, but up to 16% long.
> 
> 2. Use a closer constant, e.g. __xdelay(nsec * 4 + ((nsec * 1209) >> 
>    12)), which is 4.29517, within 0.005% of 2^32 / 10^9 and still never 
>    short. It costs another multiply and a shift on every call, and the 
>    second term overflows for delays above 3.5 ms, which ndelay() should 
>    not be asked for anyway.
> 
> 3. Leave ndelay() as it is and fix only udelay().
> 
> Option 2 seems the most accurate, but ndelay() is mostly used for short 
> delays, and for those the call overhead you measured matters more than 
> the constant.
> 

I note that the API documentation warns callers that "ndelay(), udelay() 
and mdelay() may return early for several reasons". So I think I'll defer 
to the arch maintainers on this one.

---

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index b745cf20a71f..9e3547698619 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -65,6 +65,90 @@ static void __init mac_sched_init(void)
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
+	DELAY_LOOP(1000, test_udelay(40));
+	DELAY_LOOP( 400, test_udelay(100));
+	DELAY_LOOP( 200, test_udelay(200));
+	DELAY_LOOP( 100, test_udelay(400));
+	DELAY_LOOP(  40, test_udelay(1000));
+	// Loops of 1.6ms of ndelay() calls:
+	DELAY_LOOP(80000, test_ndelay(20));
+	DELAY_LOOP(40000, test_ndelay(40));
+	DELAY_LOOP(16000, test_ndelay(100));
+	DELAY_LOOP( 8000, test_ndelay(200));
+	DELAY_LOOP( 4000, test_ndelay(400));
+	DELAY_LOOP( 1600, test_ndelay(1000));
+	DELAY_LOOP(  800, test_ndelay(2000));
+	DELAY_LOOP(  400, test_ndelay(4000));
+	DELAY_LOOP(  160, test_ndelay(10000));
+	DELAY_LOOP(   80, test_ndelay(20000));
+	DELAY_LOOP(   40, test_ndelay(40000));
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
+
+	return 0;
+}
+
+subsys_initcall(measure_delays_init);
+
 /*
  * Parse a Macintosh-specific record in the bootinfo
  */
