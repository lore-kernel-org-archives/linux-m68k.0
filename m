Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA3A26560B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776326199; cv=none; b=WkkoWPrJTwH4ecroja6RKg0NW5XUxSrEE317tJeB3gdnYINt1ZWoF4rHB6gpkJD1oiQaCuZqKN7rNot6dyt9MXVs5YrU6rON5jAv0u7JNaHf85N3qpDnV5ytkbtRJ9AwzOzcwFvAGnN170P91/AvRT8CF/8FUiF6HDv82cqt4eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776326199; c=relaxed/simple;
	bh=mk8alaE3b0fBaIs6jRWaRucveKZqGih2pFkhWMCc/ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a2vxNwabqmIqXzxK/+0DT41WvJASjAnuS7/f54wa1MYlY4E1KDeuQVhTRXXhLYG1rvpnkJ84Gzw9LERHXl8iArzp4s+KEahAbU4ws4+ajBtSmpdTmeFyEEB9VKg6oqLqCqTsuAjoRv5unRjCQbI800pipRZAphLlNfWSDn+IdE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 003EF42E20;
	Thu, 16 Apr 2026 07:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F90C2BCAF;
	Thu, 16 Apr 2026 07:56:35 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v7.1
Date: Thu, 16 Apr 2026 09:56:27 +0200
Message-ID: <20260416075627.3110360-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.1-tag1

for you to fetch changes up to 56f295853f38d3202c20fd0d98939e7a4c56c3fb:

  m68k: virt: Switch to qemu-virt-ctrl driver (2026-04-13 12:16:10 +0200)

----------------------------------------------------------------
m68k updates for v7.1

  - Add support for QEMU virt-ctrl, and use it for system reset and
    power off on the virt platform,
  - Defconfig updates,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

P.S. This PR is sent out a bit later than usual, due to the build
     bots reporting an issue last weekend, which is now fixed.
----------------------------------------------------------------
Geert Uytterhoeven (2):
      m68k: defconfig: hp300: Enable monochrome and 16-color linux logos
      m68k: defconfig: Update defconfigs for v7.0-rc1

Kuan-Wei Chiu (2):
      power: reset: Add QEMU virt-ctrl driver
      m68k: virt: Switch to qemu-virt-ctrl driver

Thomas Weißschuh (1):
      m68k: uapi: Add ucontext.h

Thorsten Blum (2):
      m68k: q40: Remove commented out code
      m68k: emu: Replace unbounded sprintf() in nfhd_init_one()

 MAINTAINERS                                 |   6 ++
 arch/m68k/Kconfig.machine                   |   2 +
 arch/m68k/configs/amiga_defconfig           |   2 +
 arch/m68k/configs/apollo_defconfig          |   2 +-
 arch/m68k/configs/atari_defconfig           |   2 +
 arch/m68k/configs/hp300_defconfig           |   4 +-
 arch/m68k/configs/mac_defconfig             |   2 +
 arch/m68k/configs/multi_defconfig           |   2 +
 arch/m68k/configs/q40_defconfig             |   2 +
 arch/m68k/emu/nfblock.c                     |   3 +-
 arch/m68k/include/{ => uapi}/asm/ucontext.h |   5 +-
 arch/m68k/q40/config.c                      |  15 ----
 arch/m68k/virt/config.c                     |  42 +---------
 arch/m68k/virt/platform.c                   |  20 ++++-
 drivers/power/reset/Kconfig                 |  10 +++
 drivers/power/reset/Makefile                |   1 +
 drivers/power/reset/qemu-virt-ctrl.c        | 122 ++++++++++++++++++++++++++++
 17 files changed, 178 insertions(+), 64 deletions(-)
 rename arch/m68k/include/{ => uapi}/asm/ucontext.h (82%)
 create mode 100644 drivers/power/reset/qemu-virt-ctrl.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
