Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035612;
	b=m6c59r1x6KFIxkjGQX7MIzuteRvzpevfcAQGjL28QCzrB+LGR9toorcdEXtreB/B+K0A
	 u6of/mrpZnLfkibLFnLfpMAerIILKT6tftoGhnVVhkes52G8+QRmC9npHKReB0kMcNK/L
	 2ij6E0S87LTIekD7KWumCEagE17IxnqgJEQCVOY5m/remSl/7REeXLKcvnoTe1zcYh4Zg
	 ZIwhj73hcNsv08cndOEPKYWJAo8+3iWoqvIMWThdDeR+4uVJeC6dfdPSi+CxPcGpnFo14
	 C6vojzv2FAEiu5HfqiKxHEYN5tIi1SbaypIRG/Gsvjh1abfEDbwBnKN5NrfAyFihQfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bXN0J+AK1P53RMwKn3F1Co6ZRwoaPYRSkShLnpvY7YU=;
	b=Ts341+EbLIOUz4vmTMQyBEGO+rRXURAstKhe1Wjk+b9u/44NrybbhVktadKeOb5BnNOX
	 kCA9W2fDG15Wvxfk8vemZ82ynaLZVzJIWaC/E04mdO9Ejweo8RS4ACF0b+PN5sqHi1Cbs
	 2S7U/+J6Qts0fnuaafhIN8tmW/OrA0SdH5lWCGnyaXtra1vw3hCW5re/AXXyAQLEcIGtj
	 EaWa+XG9nHnwvPEOZ3ZlU9q3tKdA/+hvVubOf997WkAk57ARpHc/TbU5vdLgnwTuCpyVd
	 +QoGNbWX4wDbI9ZMH3vqpRacxPsusZedk0JEq5vYLF9AfiBsfrJ9Ys4Jhw3GfiDwjPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMbuTt5U;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D23606A33B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Nov 2026 21:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D23606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMbuTt5U
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso718620f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Nov 2026 13:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035611; x=1795640411; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXN0J+AK1P53RMwKn3F1Co6ZRwoaPYRSkShLnpvY7YU=;
        b=XMbuTt5UTFjVrTJ57pLUoa9lAEfg+qE8fABf23CHQ0v5ucMGfEVPs7U5M/O+J8QUEA
         Byi3Oh5GF24JYY7ZtBQJc62srxO8gM75Z3S6iCXUPkC2qKLqmKo+nrwa+djVHZz3seWb
         GPWkTkTn5tVUW2g24ZoOOI0DFlXLF+yBo65YsjMRR6y6EEMGnIVheFNHSNk/k8EvG8qB
         FaM+iz8AFLbkG58NVe/+4VkXJXjwVoRyWLKzCPw3o5BCE6Qn4Zci5UFpCL9OO9tmgvXp
         jKO34Uy9QZSEuLBTkbsGfRWrfM39N+iakgSBFKoIf+DQxD3cArqePdKrEQRyydOdLlFJ
         PlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035611; x=1795640411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bXN0J+AK1P53RMwKn3F1Co6ZRwoaPYRSkShLnpvY7YU=;
        b=RxPj553xrWlyB13ECsf7BguzUK9DQ6tLzcPJDo84Ws/B+DKS689kU28y+i5i2y1b+V
         8+Dh/AtrEIvzBrAXmJsjMVmRzci3KKHQX+zlkvUBOpszLcXGaTrinxJ3M9WeDkKdhhAT
         gVOqpMrntccG20Vfdu98Dl7PT2ZMwBYiXaUEctnfxAAcO4fxwEO99b4m+Z+4vYtDs3Vz
         cDW2wlRABj7gNSLexTSoBONt55YYl2pEqU3xbc4T9EAIZURCGHhVBj2hLE1eo0PdSW3H
         K1PJRrIYBEyGcoj4HRsd+SBrTsXPZCZgCifWEOUTGCG1f2py3dU2i8fE6cAJ1g7gIoq3
         CbMA==
X-Forwarded-Encrypted: i=1; AL+hErFzYPnpHhqmXf59gnWRPV8dQhIcmPR1CGtFotvMiX19JIguWXBJ/tDoOyJlVMJ7uzwHfGQNuvaxcbRh@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/bAktXWIrXu3K+1GfWrqnBclTm9mVR+13fs2d7f9Nky9UdfjGU
	fAWFywiGdgu/UKbLl3PCyIbsTaD4AnCyZAbic2swy/Xn63zgrtN8qTfi
X-Gm-Gg: AZFdTZd/MkIRSibaWb64e2sYmPg4ooRkyZjFS5CQ322GRZBBbf9ibGHhdC5W9QuRHYo
	2E3kFo1eIP8Aj4XvyVkFVeWaJQEGta/l38BLpXBI3WvqT4AkzF1TNPKKh8x4JauCcwNSShf4Bas
	MLtVmwgygmCb68MTRTYG/wHO7UKMInqACgFsDfCYy+1fbUcOpNb/L6irOSshswCqe+5nkUMnZQe
	jFEkLGIg63h2tAXetBAvABGNCi1Unlq96TnrPEqh0XYKMVsZI8FLDhw5dspkots4Q8HrvczhrQx
	dfRc15SLj6whYbCw3Zm1Ra+K4MBYqjbx+FdxOuRwM620BfhVMEh4sT9RMWtxwT622cwV6axoPxE
	xUx2JpOdPWHLcEXHbuq2qyEVqs5Q4qDjIkDwqHpgN1540O+UsqbnbkOv5qEF3NSrY47I3MFEIQO
	f/R1L3xsUBd2CLQ3ABAembrnbhpnHdCb9ozMAhMQLmDy3xnDcxBCoeUjjPrAin4qajTJt9XB2rW
	Epgf3T99IxZHUk/GpDKl43XQRRsptVd0cq1DxZHa1UI5Zu5NMtrKTUmTBiEJXxGkanEDAt5fmL3
	c3YG9oxGdEKRrAQ/3dt6Le2B5Pe6AnanZ5ADXJTfXM7PkTVL73QNB+e01xo8JZnU+gXpIuSVDSW
	HXxeBSXc=
X-Received: by 2002:a5d:64cf:0:b0:4a6:4862:28f5 with SMTP id ffacd0b85a97d-4a6486229b8mr8177844f8f.3.1795035610516;
        Wed, 18 Nov 2026 13:00:10 -0800 (PST)
Received: from beelink0 (host86-181-68-246.range86-181.btcentralplus.com. [86.181.68.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm5332421f8f.15.2026.11.18.13.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:00:09 -0800 (PST)
From: Graeme Harker <graeme.harker@gmail.com>
To: fthain@linux-m68k.org
Cc: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: delay: Fix rounding of short udelay() and ndelay()
Date: Wed, 18 Nov 2026 21:00:08 +0000
Message-ID: <20261118210008.927764-1-graeme.harker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ae768ed3-a517-3223-5c86-a1599ff6c8e5@linux-m68k.org>
References: <ae768ed3-a517-3223-5c86-a1599ff6c8e5@linux-m68k.org>
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

Hi Finn,

Thanks for testing it on real hardware, and with a better method than
mine.

> Which clocksource driver are you using for jiffies?

The jiffies clocksource itself; the board has no sub-tick clocksource
yet. The tick is a periodic clock_event_device on the DUART's
counter/timer (GENERIC_CLOCKEVENTS, not LEGACY_TIMER_TICK), and my
figures were 1 s of each call timed by jiffies with interrupts on, so
they include the tick's own cost. Yours are the better numbers.

> ndelay(400) 536E-09 -> 239E-09 seconds

I think the patched ndelay() count has wrapped your 16-bit timer. The
patched ndelay(400) asks __delay() for at least 466 ns of calibrated
loops whatever loops_per_jiffy is (8000 * loops_per_jiffy * 25 / 2^32
loops, plus the one __delay() adds), and it now does a mulu.l on every
call, which the old code did not (its arithmetic is plain C, so GCC can
hoist it out of your unrolled loop). If a call takes about 1.08 us,
100000 calls take 107.6 ms, more than the 83.7 ms that T2 can count at
783360 Hz, and what is left after one wrap is 23.9 ms, or 239 ns a
call.

Could you try ndelay(400) with 40000 invocations instead of 100000? If
I'm right it should come out at about 1.08 us. That would mean it is
longer than before, not shorter. As the commit message says, ndelay()
now pays for the 64-bit multiply, so very short ndelay()s cost more.
If that cost matters on the 040, I could keep the old ndelay() and
only fix udelay().

Your udelay(1000) at 978 us is still 2 % short with interrupts off. I
believe that is calibrate_delay() running with the tick enabled, so the
tick's time is counted as loop time. That is separate from this patch,
and I have left it alone.

Graeme
