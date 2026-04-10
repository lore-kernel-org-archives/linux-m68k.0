Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37AB3CCFDD
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Apr 2026 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823553; cv=none; b=bUEOMjSnuZJfj6DAAy5rB6m3iYUHJDpZoiVTUNK6NAA8Qxw2B0aZuh+WfraLVv+c+yyBY/OdpA6n63d2noYwaysXfP8TKVwZ5c4BRqADhrPub6V2j3TYz33jCGmU50xUAowR2AQ/SkAByrm9Om0c0og5QPWSEbpAIx5nZ8KZjvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823553; c=relaxed/simple;
	bh=bea3byi4f+lJwA9RE9L4RIIWG0LfPmc09XAUdHtlAlE=;
	h=Date:Message-ID:From:To:Subject:References:MIME-Version:
	 Content-Type:cc; b=YFLa7GUJDlVuiJIM5cf1bEG/xcj458Y/rOfyTFxSq2T7b2lU1sFysPyZoiaT2nTW0gLjWzbkOmfMP7i3wMHFqyFV14fncS9qLGaobFZIjmRiFI8dGTLado6389GBi6Krcherdw6j1kDGehgMuI6V5104ridtf7r43BXLvM5LQtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwhpP/sf; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwhpP/sf"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32D916024D;
	Fri, 10 Apr 2026 12:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455B0C2BC87;
	Fri, 10 Apr 2026 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823550;
	bh=bea3byi4f+lJwA9RE9L4RIIWG0LfPmc09XAUdHtlAlE=;
	h=Date:From:To:Subject:References:cc:From;
	b=YwhpP/sfl2uNAokHMGyDzPyXqsYG5Z3HHapkhzwVASiSkGSv1ImeSFBY018VYZGU6
	 EPRk8H/tD4bE94DCGFfik82fydH/mvkzeKH2zcGHFzmiPQlK2yTJNXmBvp6CR6/aKP
	 ZUXJ1ridIfNl+octSklnUsCiAFVq0bMAbDZHArZ2XlGiEpILEnKNdARJlXe1YoLGU7
	 gTGiAjrmuKfAH7Stm5YSWpKnJ3J0WABG0fiD/+Dm/7aJCfY6aDBkC0dcXhqkELemEA
	 OLCKD9b/UmnIij2UMaT5laELpK9/RUq1POEHXDOcdk6mujQiavRoj/L2U3OHpVV16q
	 LiEll066ex31A==
Date: Fri, 10 Apr 2026 14:19:08 +0200
Message-ID: <20260410120318.121043259@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 08/38] x86/tsc: Use rdtsc() instead of get_cycles()
References: <20260410120044.031381086@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
cc: Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org

This code knows that TSC is available so there is no point to use the TSC
feature guarded get_cycles().

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 arch/x86/kernel/tsc.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -371,12 +371,12 @@ static u64 tsc_read_refs(u64 *p, int hpe
 	int i;
 
 	for (i = 0; i < MAX_RETRIES; i++) {
-		t1 = get_cycles();
+		t1 = rdtsc();
 		if (hpet)
 			*p = hpet_readl(HPET_COUNTER) & 0xFFFFFFFF;
 		else
 			*p = acpi_pm_read_early();
-		t2 = get_cycles();
+		t2 = rdtsc();
 		if ((t2 - t1) < thresh)
 			return t2;
 	}
@@ -468,13 +468,13 @@ static unsigned long pit_calibrate_tsc(u
 	outb(latch & 0xff, 0x42);
 	outb(latch >> 8, 0x42);
 
-	tsc = t1 = t2 = get_cycles();
+	tsc = t1 = t2 = rdtsc();
 
 	pitcnt = 0;
 	tscmax = 0;
 	tscmin = ULONG_MAX;
 	while ((inb(0x61) & 0x20) == 0) {
-		t2 = get_cycles();
+		t2 = rdtsc();
 		delta = t2 - tsc;
 		tsc = t2;
 		if ((unsigned long) delta < tscmin)
@@ -553,9 +553,9 @@ static inline int pit_expect_msb(unsigne
 		if (!pit_verify_msb(val))
 			break;
 		prev_tsc = tsc;
-		tsc = get_cycles();
+		tsc = rdtsc();
 	}
-	*deltap = get_cycles() - prev_tsc;
+	*deltap = rdtsc() - prev_tsc;
 	*tscp = tsc;
 
 	/*

