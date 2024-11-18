Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2986726AD0
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Nov 2024 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731934052; cv=none; b=ZU2bw9GuuXbIWl19ub1u0sKoXlnAbgMDR53gFE0iyHXR2tgCf0oJOkPAkfFfdGo4T2YgGjWEYDhi1M/pxwvaPm+A3p64rBVU0+5PZuOu2IDhzobB6nhEetqAnSN+YQxiTKfY0m5fwMDUChOaXfVpkXcU6tYsKezOPsgrWDf5S5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731934052; c=relaxed/simple;
	bh=7aZsjxaVStHdLdFrr1YMq6ZzlzYrk8LLz29hzjmM+hQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IeJhVFqJZfqwvB1sumWRfZLGWNMLu2ND6Fvpa74Vnn9gticGJKw56OTP1/KbaJCml/MCQt2ByIgAHAXV1CeEk/eeUiamw8SrL5jW0HQ5Ryos+vudwVBxiw2s/9PnXXzYtwwMy+0QXG1BC5Q8v6B8v2BzIzWfbAR83hOT/VbQbJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5694:511b:a530:b0e])
	by albert.telenet-ops.be with cmsmtp
	id eCnM2D00H56PXV606CnMnA; Mon, 18 Nov 2024 13:47:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tD19f-007SfA-6e;
	Mon, 18 Nov 2024 13:47:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tD1A1-00E19l-CP;
	Mon, 18 Nov 2024 13:47:21 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v6.13
Date: Mon, 18 Nov 2024 13:47:20 +0100
Message-Id: <20241118124720.3341025-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:

  Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.13-tag1

for you to fetch changes up to 647619b6bd27d2b7c3c6055f3f0d996e61884202:

  m68k: defconfig: Update defconfigs for v6.12-rc1 (2024-11-11 13:53:58 +0100)

----------------------------------------------------------------
m68k updates for v6.13

  - Revive SCSI and early console support on MVME147,
  - Fix early kernel parameters using static keys,
  - Prevent and improve handling of kernel configurations that lack
    specific platform, CPU, or MMU support, to avoid build failures,
  - Miscellaneous fixes and improvements,
  - Defconfig updates.

Thanks for pulling!

----------------------------------------------------------------
Arnd Bergmann (2):
      m68k: Move Sun 3 into a top-level platform option
      m68k: Select M68020 as fallback for classic

Daniel Palmer (3):
      m68k: mvme147: Make mvme147_sched_init() __init
      m68k: mvme147: Fix SCSI controller IRQ numbers
      m68k: mvme147: Reinstate early console

Geert Uytterhoeven (2):
      m68k: Make sure NR_IRQS is never zero
      m68k: defconfig: Update defconfigs for v6.12-rc1

Jean-Michel Hautbois (1):
      m68k: Initialize jump labels early during setup_arch()

Thorsten Blum (1):
      m68k: kernel: Use str_read_write() helper function

 arch/m68k/Kconfig                    | 11 +++++------
 arch/m68k/Kconfig.cpu                | 36 +++++++++++++++++++++++-------------
 arch/m68k/Kconfig.machine            | 25 -------------------------
 arch/m68k/configs/amiga_defconfig    |  1 +
 arch/m68k/configs/apollo_defconfig   |  1 +
 arch/m68k/configs/atari_defconfig    |  1 +
 arch/m68k/configs/bvme6000_defconfig |  1 +
 arch/m68k/configs/hp300_defconfig    |  1 +
 arch/m68k/configs/mac_defconfig      |  1 +
 arch/m68k/configs/multi_defconfig    |  1 +
 arch/m68k/configs/mvme147_defconfig  |  1 +
 arch/m68k/configs/mvme16x_defconfig  |  1 +
 arch/m68k/configs/q40_defconfig      |  1 +
 arch/m68k/configs/sun3_defconfig     |  1 +
 arch/m68k/configs/sun3x_defconfig    |  1 +
 arch/m68k/include/asm/irq.h          |  4 +---
 arch/m68k/include/asm/mvme147hw.h    |  4 ++--
 arch/m68k/kernel/Makefile            | 12 ++----------
 arch/m68k/kernel/early_printk.c      |  5 ++++-
 arch/m68k/kernel/setup_mm.c          |  6 +++++-
 arch/m68k/kernel/time.c              |  4 ++--
 arch/m68k/kernel/traps.c             | 16 ++++++++--------
 arch/m68k/mvme147/config.c           | 34 ++++++++++++++++++++++++++++++++--
 arch/m68k/mvme147/mvme147.h          |  6 ++++++
 24 files changed, 102 insertions(+), 73 deletions(-)
 create mode 100644 arch/m68k/mvme147/mvme147.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
