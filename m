Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB2D1F0E48
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jan 2025 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456865; cv=none; b=a2IHCpz7BezgxcO4GQ50/yzkaKBv/n/h8dWUS4L8iO0x75bE4iD/e5gD07AeAe1rOESX/SJtoBp44OHrGpJ9b8Fu+CziUxZiJMg4Xras+vG45VXvdfINYf7R+qAwj4Z8zUff49P3oZBifeg2sklXERNjiJA0Aefl1UjLYlzTP68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456865; c=relaxed/simple;
	bh=g7vLI+NjvgO1yU0awWGKoIU6t2+0okrAGXE4XzhJMuA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nLhwFFgNV+hGpUJa833G1O9kOHiXCn1rlW9V0Llwaeg+Q2jYJ2c5mkglCG3oWmwv0Lop2/d260GLzbQpmUj7+qIK7QuG98nDp2nWTfCsnpmu2WBFk104R7acyXK5LCyAGm1W7gr8JliA3b5l4Zk/gd4XXFH7NR0HOxXbu0++siA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=mHH5BM1s; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="mHH5BM1s"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 856DA1C000B;
	Tue, 21 Jan 2025 10:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1737456859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bw4KYBNqEviPu+MiEZxX/VQPUdl7tMYgs7nmkisDWUI=;
	b=mHH5BM1swXn6fIeL7+1CHiRbbtW8/49yGFq71szb1XG5uAfHwZtOvNFNHwKHlVUcboPPYx
	/bzCOoWIA7YUPFm+Xzk/GpFS+YgcAGdNW9kTlUeL8kkTgEPJLIWDucLjw+E/5V2zVpYJEh
	Z6pf/5HoipgLPH4CCWytzuA4/UFvspYIKnRx0jP5/wsIXKziLmerJvrR/Siv2IBDsTZkj0
	5JWgRYDpADu36d+k37loG4eO+e/82ncXVcl42PPv9j/CLmqGMk70YOOpAf58/iorE2n6Je
	mHKP0saGwhfTWhPbdFe4lE7YJKKUHKCneqbgO86kwJxw4g2RA7Bw2jGr/Q3ydg==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH 0/2] m68k: Add basic support for DMA global coherent pool
Date: Tue, 21 Jan 2025 11:54:12 +0100
Message-Id: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANR8j2cC/x3MTQqAIBBA4avErBtI+xG6SrSwHG1AmlCIQLp70
 vJbvFcgU2LKMDcFEt2cWc4K1TawH/YMhOyqQXd67JQyuEt0nhNhiLLZiJdIRG2NcaqfBrNNUNM
 rkefn3y7r+35ZXuMYZgAAAA==
X-Change-ID: 20250117-coldfire-global-pool-2a77d13647b6
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737456859; l=2425;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=g7vLI+NjvgO1yU0awWGKoIU6t2+0okrAGXE4XzhJMuA=;
 b=gmdzbr/cxHsyLWsmfX9ZXLC1g5rTWTSezfa8db9GWRfS8tWfXwT66JULaS9vNnU+AY2T4WYIf
 F/fQHESirnKD/35cik9ZGEPtGPg2bN5W+tuLg5yoeRHG1Jp0hlX5Z4b
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

The coldfire M5441x family can't use coherent allocations, because the
cache does not support snooping (cache coherency is not supported while
external or DMA masters use the bus).

In order to make it possible to use coherent memory, the only way is to
disable the cache for specific adresses. This patch series introduces
the global coherent pool allocation along with a different cache
configuration. This is tested on M54418 only.

The CONFIG_DMABASE is fixed to 0x4f000000 in my configuration file.
When booting with memblock=debug, we can see:
memblock_reserve: [0x4f000000-0x4fffffff] cf_bootmem_alloc+0x9a/0x11c

Which corresponds to the memblock_reserve call in cf_bootmem_alloc().

Later, I have a SPI NOR, which is detected, and the dma_alloc_coherent
is successful:
[    3.940000] fsl-dspi fsl-dspi.0: registered host spi0
[    3.940000] spi spi0.0: DSPI controller timing params: CS-to-SCK delay 100 ns, SCK-to-CS delay 100 ns
[    3.940000] spi spi0.0: setup mode 0, 8 bits/w, 31250000 Hz max --> 0
[    3.970000] Creating 1 MTD partitions on "Micron mt25ql01G SPI Flash chip":
[    3.970000] 0x000000000000-0x000008000000 : "w25q01"
[    4.010000] fsl-dspi fsl-dspi.0: registered child spi0.0
[    4.020000] DSPI: Coldfire DSPI Slave driver

The FEC driver is not modified and still uses the hack cache flush,
because I have an issue when DMA is used intensively:
fec enet-fec.0 eth0: rcv is not +last

I could not figure out why it appears, so some help on this would be
great :-).

I also could not modify the ACRs successfully, and I am not sure if it is
needed or not.

Thanks !

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Jean-Michel Hautbois (2):
      m68k: Enable DMA support for Coldfire M5441x
      arch: m68k: Add DMA mapping operations for Coldfire M5441x

 arch/m68k/Kconfig.cpu        |   2 +
 arch/m68k/Kconfig.machine    |  15 +++++
 arch/m68k/coldfire/Makefile  |   2 +
 arch/m68k/coldfire/dma_ops.c | 131 +++++++++++++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/dma.h  |   1 -
 arch/m68k/kernel/dma.c       |  10 ++++
 arch/m68k/mm/mcfmmu.c        |   5 ++
 7 files changed, 165 insertions(+), 1 deletion(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250117-coldfire-global-pool-2a77d13647b6

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

