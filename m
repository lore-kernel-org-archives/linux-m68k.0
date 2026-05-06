Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787047F2CF
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 May 2026 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077061; cv=none; b=qn6IJGtbq9TtiEGt7b214L/z89w3dD6+g73wX2VVuu45l8RychePQ2qBj5OQrJW9UYwFGLP5SgB+Ld+D4jIhNjjnYmcrt2jk+FkT8f5P0kiIH/7u04OOnjVyVvgLM9Nx2Js+MsEEuQhycvadmjRnfVlIZJfw2RGGsmFCcdmq93U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077061; c=relaxed/simple;
	bh=FTgeTsPxFPNtV8jSGk8PNLDBJoFpKTLAXzx0fS9uM6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVx1Yjf/RkiV8iXKRdLIzDdsrKUlVul6E9C/jAkb3CVh8Uw9syTeYOn7FDB4t+GPoyejpb9v01ef7VZBplk+NvkcrkLu2qm5mM2hbAyaoUpZD65V/jrsTC/4FO+P0qEzRtXRu0GCpY/lwY+F10F8MmmfhZ+hzcP09SpIB7XdkE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DDDA60132;
	Wed,  6 May 2026 14:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B0BC2BCB0;
	Wed,  6 May 2026 14:17:34 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	arnd@kernel.org,
	netdev@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-spi@vger.kernel.org,
	olteanv@gmail.com,
	wei.fang@nxp.com,
	frank.li@nxp.com,
	shenwei.wang@nxp.com,
	nico@fluxnic.net,
	adureghello@baylibre.com,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [RFC 0/4] m68k: coldfire: fix non-standard readX()/writeX() functions
Date: Thu,  7 May 2026 00:11:41 +1000
Message-ID: <20260506141629.3233399-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This odd collection of patches is aimed at fixing the non-standard ColdFire
set of readX()/writeX() IO access functions. Instead switching to using the
asm-generic definitions in include/asm-generic/io.h. The difficulty comes
in trying not to break any drivers with this change.

The implementation of the readX()/writeX() family of IO access functions
is non-standard on ColdFire platforms. They either return big-endian (that
is native endian) data, or on platforms with PCI bus support check the
supplied address and return either big or little endian data based on that
check. This is non-standard, they are expected to always return
little-endian byte ordered data. Unfortunately this behavior also means
that ioreadX()/iowroteX() and their big-endian counter parts
ioreadXbe()/iowriteXbe() are currently broken because they are implemented
using the readX()/writeX() functions.

Patches 1, 2 and 3 in this series are specific driver changes that can be
made independently of the final ColdFire readX()/writeX() change.

Patch 4 is the actual switch to ColdFire building using asm-generic
readX()/writeX(), but also contains three driver fixes that are not easily
handled independently.

Looking for comments on the approach taken here, or if there is a better
way forward?

Note also that I don't have access to all supported hardware needed to
fully test all these changes. I have tested what I have, a bunch of the
standard Freescale ColdFire eval boards, and inspected generated code
for differences.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/io_no.h             |   68 --------
 drivers/dma/mcf-edma-main.c               |   14 -
 drivers/mmc/host/sdhci-esdhc-mcf.c        |   24 +-
 drivers/net/can/flexcan/flexcan-core.c    |    1 
 drivers/net/ethernet/freescale/fec.h      |   15 +
 drivers/net/ethernet/freescale/fec_main.c |  254 +++++++++++++++---------------
 drivers/net/ethernet/freescale/fec_ptp.c  |   78 ++++-----
 drivers/net/ethernet/smsc/smc91x.h        |   12 -
 drivers/spi/spi-fsl-dspi.c                |    2 
 9 files changed, 217 insertions(+), 251 deletions(-)

