Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264D64E50D1
	for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Oct 2026 12:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412003; cv=none; b=sLX9YyJeI2K9F4mP4pP+y/SV6QnNo8476QOZLIBO88CzbeptNLhenNdQZvwdlOt/E9+5a47Eq59KP+J033WTPzzJcxQRSJc2Xp4b4TXKxYs0Nr71/WxB83UQVTf3iZZ8pYt9nls2zY0R3ozlolrkFtvmPzteyCnW2xkh0VNz1ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412003; c=relaxed/simple;
	bh=eL2jUj+tgn+GjTJZF5CuRa/yMJxBjWDunpHjuij3WlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jrxw098XVftdOUwvdgvL5E1/BnN60NWKL9ecQmaaKMhB/TIefqtD3LT3zmZC4Jaxyvxy81EmhSmTvENvv2FvTe7vtboNNREfIOhXjWYKez+4EaJE1OiXavSpgluM9681kBsHLi060dc++SkvQzm1//1GsOf9vWiqd5xjMTfRiso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C73B440732;
	Mon, 19 Oct 2026 12:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655101F000C4;
	Mon, 19 Oct 2026 12:13:20 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v7.4
Date: Mon, 19 Oct 2026 14:13:17 +0200
Message-ID: <20261019121317.669372-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-for-v7.4-tag1

for you to fetch changes up to af32c3cb72529b14bfb2685bbdaa2b1514496b58:

  m68k: defconfig: Enable ATARI_SVETHLANA and ETHOC (2026-09-27 16:21:49 +0200)

----------------------------------------------------------------
m68k updates for v7.4

  - Add and enable support for the SVEthLANa Ethernet interface on the
    Atari SuperVidel FPGA expansion card,
  - Enable support for the IDE interface on the Amiga CS-Lab Warp
    expension card,
  - Defconfig updates,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Daniel Palmer (1):
      m68k: apollo: Fix interrupt setup

Geert Uytterhoeven (2):
      m68k: defconfig: Update defconfigs for v7.3-rc1
      m68k: defconfig: Enable ATARI_SVETHLANA and ETHOC

Miro Kropacek (1):
      m68k: Add support for SVEthLANa

Paolo Pisati (1):
      m68k: defconfig: Enable PATA_CSWARP

Peng Fan (1):
      zorro: Use assign_bit() where applicable

Thorsten Blum (2):
      m68k: Use generic BASE_BAUD in asm/serial.h
      m68k: Add include guard to asm/serial.h

 arch/m68k/Kconfig.devices            | 12 ++++++
 arch/m68k/apollo/dn_ints.c           |  6 +++
 arch/m68k/atari/config.c             | 75 ++++++++++++++++++++++++++++++++++++
 arch/m68k/configs/amiga_defconfig    |  4 ++
 arch/m68k/configs/apollo_defconfig   |  3 ++
 arch/m68k/configs/atari_defconfig    |  5 +++
 arch/m68k/configs/bvme6000_defconfig |  3 ++
 arch/m68k/configs/hp300_defconfig    |  3 ++
 arch/m68k/configs/mac_defconfig      |  3 ++
 arch/m68k/configs/multi_defconfig    |  6 +++
 arch/m68k/configs/mvme147_defconfig  |  3 ++
 arch/m68k/configs/mvme16x_defconfig  |  3 ++
 arch/m68k/configs/q40_defconfig      |  3 ++
 arch/m68k/configs/sun3_defconfig     |  3 ++
 arch/m68k/configs/sun3x_defconfig    |  3 ++
 arch/m68k/include/asm/atariints.h    |  2 +-
 arch/m68k/include/asm/irq.h          |  6 +--
 arch/m68k/include/asm/serial.h       | 21 +++-------
 drivers/zorro/zorro.c                |  5 +--
 19 files changed, 145 insertions(+), 24 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
