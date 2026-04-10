Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAF53D3492
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Apr 2026 12:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823572; cv=none; b=ArHRWjaIO7aNF+8x9zH8hvc7mv/TDIhQSdGVOELmfdKGPrB2NhWGwCw0hZoxr7oqHej7pTduxrJYoL3GPvxCxZMwn1s/L9BozegbA15nwsEuzASzwxb+AbsI/Y5JBTMdYe0Q0pZDweDvsUzOXNc2qaLDu4CPv6p/uidkPSqxre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823572; c=relaxed/simple;
	bh=gx3RztExl/RgjhE+RVjeBSM72TbSvLK5CUYrt3EY96I=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=eUUpsdHwQTJQ0l7kxYXlpaoc7TnMydEhBDCAYPgB+zpaRiqq7Hz9pkt2FP6Kbg6So+dezsytLTSbf+1ToOLdCCCm2Jd24807u6b5ui0huAufDZScZIxTuKlwWZFtWA4fFg37Tze7D00RCAu1yty6qe9vPWBG6LhO0TooHJc3+Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bpuk5rSR; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bpuk5rSR"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51A166091C;
	Fri, 10 Apr 2026 12:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4F4C2BCB0;
	Fri, 10 Apr 2026 12:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823570;
	bh=gx3RztExl/RgjhE+RVjeBSM72TbSvLK5CUYrt3EY96I=;
	h=Date:From:To:Cc:Subject:References:From;
	b=Bpuk5rSRR/rs1jSmitZH/KfJL+3TNuP+dz9xwjVC8e1YVix0oW3s2Pp/y+L8X9oHD
	 FfGXk8B3TY0jbEAZNS2FVq5qwscSTPNozRdmP6S1az7QsSRwh37CnHDegYmWg/dUhl
	 oXkQ09dlNxtpDlZfCfFVBtb5yeQYcj5dZxd8vIShSLkbr1gWWPlcdAHe/FZpu8mplV
	 u5Y93dLHQf7k/6QZkYgksDu7FYlgnX/m++LNPEYIEnDd7dRmUlTkWsJQwVidroG1Bi
	 MdGUi4KzTqg9X+Zn0ce3HiuHIaE9YE1XVzPbK1ak8XvacDL5nVhYnRULjmYf5QSMQ0
	 DvaPTMl303Xmg==
Date: Fri, 10 Apr 2026 14:19:27 +0200
Message-ID: <20260410120318.386500288@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-wireless@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
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
Subject: [patch 12/38] wifi: wil6210: Replace get_cyles() usage
References: <20260410120044.031381086@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

There is no reason why this debug code requires to use get_cycles() for
timing purposes.

Use ktime_get() instead.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: linux-wireless@vger.kernel.org
---
 drivers/net/wireless/ath/wil6210/debugfs.c   |    2 +-
 drivers/net/wireless/ath/wil6210/txrx.c      |    6 +++---
 drivers/net/wireless/ath/wil6210/txrx_edma.c |    4 ++--
 drivers/net/wireless/ath/wil6210/wil6210.h   |    3 ++-
 4 files changed, 8 insertions(+), 7 deletions(-)

--- a/drivers/net/wireless/ath/wil6210/debugfs.c
+++ b/drivers/net/wireless/ath/wil6210/debugfs.c
@@ -151,7 +151,7 @@ static int ring_show(struct seq_file *s,
 			char name[10];
 			char sidle[10];
 			/* performance monitoring */
-			cycles_t now = get_cycles();
+			ktime_t now = ktime_get();
 			uint64_t idle = txdata->idle * 100;
 			uint64_t total = now - txdata->begin;
 
--- a/drivers/net/wireless/ath/wil6210/txrx.c
+++ b/drivers/net/wireless/ath/wil6210/txrx.c
@@ -1976,7 +1976,7 @@ static int __wil_tx_vring_tso(struct wil
 	used = wil_ring_used_tx(vring);
 	if (wil_val_in_range(wil->ring_idle_trsh,
 			     used, used + descs_used)) {
-		txdata->idle += get_cycles() - txdata->last_idle;
+		txdata->idle += ktime_get() - txdata->last_idle;
 		wil_dbg_txrx(wil,  "Ring[%2d] not idle %d -> %d\n",
 			     vring_index, used, used + descs_used);
 	}
@@ -2129,7 +2129,7 @@ static int __wil_tx_ring(struct wil6210_
 	used = wil_ring_used_tx(ring);
 	if (wil_val_in_range(wil->ring_idle_trsh,
 			     used, used + nr_frags + 1)) {
-		txdata->idle += get_cycles() - txdata->last_idle;
+		txdata->idle += ktime_get() - txdata->last_idle;
 		wil_dbg_txrx(wil,  "Ring[%2d] not idle %d -> %d\n",
 			     ring_index, used, used + nr_frags + 1);
 	}
@@ -2531,7 +2531,7 @@ int wil_tx_complete(struct wil6210_vif *
 			     used_new, used_before_complete)) {
 		wil_dbg_txrx(wil, "Ring[%2d] idle %d -> %d\n",
 			     ringid, used_before_complete, used_new);
-		txdata->last_idle = get_cycles();
+		txdata->last_idle = ktime_get();
 	}
 
 	/* shall we wake net queues? */
--- a/drivers/net/wireless/ath/wil6210/txrx_edma.c
+++ b/drivers/net/wireless/ath/wil6210/txrx_edma.c
@@ -1286,7 +1286,7 @@ int wil_tx_sring_handler(struct wil6210_
 				     used_new, used_before_complete)) {
 			wil_dbg_txrx(wil, "Ring[%2d] idle %d -> %d\n",
 				     ring_id, used_before_complete, used_new);
-			txdata->last_idle = get_cycles();
+			txdata->last_idle = ktime_get();
 		}
 
 again:
@@ -1499,7 +1499,7 @@ static int __wil_tx_ring_tso_edma(struct
 	used = wil_ring_used_tx(ring);
 	if (wil_val_in_range(wil->ring_idle_trsh,
 			     used, used + descs_used)) {
-		txdata->idle += get_cycles() - txdata->last_idle;
+		txdata->idle += ktime_get() - txdata->last_idle;
 		wil_dbg_txrx(wil,  "Ring[%2d] not idle %d -> %d\n",
 			     ring_index, used, used + descs_used);
 	}
--- a/drivers/net/wireless/ath/wil6210/wil6210.h
+++ b/drivers/net/wireless/ath/wil6210/wil6210.h
@@ -14,6 +14,7 @@
 #include <linux/timex.h>
 #include <linux/types.h>
 #include <linux/irqreturn.h>
+#include <linux/timekeeping.h>
 #include "wmi.h"
 #include "wil_platform.h"
 #include "fw.h"
@@ -632,7 +633,7 @@ struct wil_txrx_ops {
 struct wil_ring_tx_data {
 	bool dot1x_open;
 	int enabled;
-	cycles_t idle, last_idle, begin;
+	ktime_t idle, last_idle, begin;
 	u8 agg_wsize; /* agreed aggregation window, 0 - no agg */
 	u16 agg_timeout;
 	u8 agg_amsdu;

