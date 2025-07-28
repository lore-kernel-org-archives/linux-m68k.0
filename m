Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA34C253356
	for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Jul 2025 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695303; cv=none; b=hyuLLsgiLQ+Vfc7I5XslwNv0HWyrNHIbwR94JHsuQ1B5MNIRnRGncT2BoM04cwoCd0+e/lF5d34fNovExuMEfz8RIkRZiXqhwS5y4s5bxfbHgRvBlRroMJji1XB8eV6dnWnP63SIaUg2SuZFVZjBCFMrCkyL7y6cAEYm6VVaC0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695303; c=relaxed/simple;
	bh=nTv/krKUq1pAf23k38ECr9b6F14induhosI1RFjnmPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7gyae5kyTNyaAmFE5Md8kY7aKd7pGL9Bd4uV8dmvkihaAUOOebkOXRCLyLu3wmyOKyomOqaFBm4d+pLY4GNolDpuXMuiFdtPlwmSjoIHWaUukgE1ZfiF1/tR0r6DDvqJ4qSlhzn1HKJSG5wXOaV5DQ1PVYRnyJRd7Gq+7x40SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF7E8600BB;
	Mon, 28 Jul 2025 09:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22144C4CEF4;
	Mon, 28 Jul 2025 09:34:57 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v6.17
Date: Mon, 28 Jul 2025 11:34:37 +0200
Message-ID: <20250728093437.223500-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.17-tag1

for you to fetch changes up to c8995932db2bad6fa093ac64dbaf7a3e8870eafa:

  m68k: mac: Improve clocksource driver commentary (2025-07-06 12:53:21 +0200)

----------------------------------------------------------------
m68k updates for v6.17

  - Ptdescs conversions,
  - Fix lost column on the graphical debug console,
  - Replace __ASSEMBLY__ with __ASSEMBLER__ in headers,
  - Miscellaneous fixes and improvements,
  - Defconfig updates.

Thanks for pulling!

----------------------------------------------------------------
Daniel Palmer (1):
      m68k: Enable dead code elimination

Finn Thain (5):
      m68k: Fix lost column on framebuffer debug console
      m68k: Avoid pointless recursion in debug console rendering
      m68k: Remove unused "cursor home" code from debug console
      m68k: Don't unregister boot console needlessly
      m68k: mac: Improve clocksource driver commentary

Geert Uytterhoeven (1):
      m68k: defconfig: Update defconfigs for v6.16-rc2

Thomas Huth (2):
      m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
      m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

Vishal Moola (Oracle) (4):
      m68k: mm: Convert get_pointer_table() to use ptdescs
      m68k: mm: Convert free_pointer_table() to use ptdescs
      m68k: mm: Convert init_pointer_table() to use ptdescs
      m68k: mm: Convert pointer table macros to use ptdescs

 arch/m68k/Kconfig                         |  1 +
 arch/m68k/Kconfig.debug                   |  2 +-
 arch/m68k/configs/amiga_defconfig         |  9 +++-
 arch/m68k/configs/apollo_defconfig        |  9 +++-
 arch/m68k/configs/atari_defconfig         |  9 +++-
 arch/m68k/configs/bvme6000_defconfig      |  9 +++-
 arch/m68k/configs/hp300_defconfig         |  9 +++-
 arch/m68k/configs/mac_defconfig           |  9 +++-
 arch/m68k/configs/multi_defconfig         |  9 +++-
 arch/m68k/configs/mvme147_defconfig       |  9 +++-
 arch/m68k/configs/mvme16x_defconfig       |  9 +++-
 arch/m68k/configs/q40_defconfig           |  9 +++-
 arch/m68k/configs/sun3_defconfig          |  9 +++-
 arch/m68k/configs/sun3x_defconfig         |  9 +++-
 arch/m68k/include/asm/adb_iop.h           |  4 +-
 arch/m68k/include/asm/bootinfo.h          |  4 +-
 arch/m68k/include/asm/entry.h             |  4 +-
 arch/m68k/include/asm/kexec.h             |  4 +-
 arch/m68k/include/asm/mac_baboon.h        |  4 +-
 arch/m68k/include/asm/mac_iop.h           |  4 +-
 arch/m68k/include/asm/mac_oss.h           |  4 +-
 arch/m68k/include/asm/mac_psc.h           |  4 +-
 arch/m68k/include/asm/mac_via.h           |  4 +-
 arch/m68k/include/asm/math-emu.h          |  6 +--
 arch/m68k/include/asm/mcf_pgtable.h       |  4 +-
 arch/m68k/include/asm/mcfmmu.h            |  2 +-
 arch/m68k/include/asm/motorola_pgtable.h  |  4 +-
 arch/m68k/include/asm/nettel.h            |  4 +-
 arch/m68k/include/asm/openprom.h          |  4 +-
 arch/m68k/include/asm/page.h              |  4 +-
 arch/m68k/include/asm/page_mm.h           |  4 +-
 arch/m68k/include/asm/page_no.h           |  4 +-
 arch/m68k/include/asm/pgtable.h           |  2 +-
 arch/m68k/include/asm/pgtable_mm.h        |  8 +--
 arch/m68k/include/asm/ptrace.h            |  4 +-
 arch/m68k/include/asm/setup.h             | 10 ++--
 arch/m68k/include/asm/sun3_pgtable.h      |  8 +--
 arch/m68k/include/asm/sun3mmu.h           |  4 +-
 arch/m68k/include/asm/thread_info.h       |  6 +--
 arch/m68k/include/asm/traps.h             |  6 +--
 arch/m68k/include/uapi/asm/bootinfo-vme.h |  4 +-
 arch/m68k/include/uapi/asm/bootinfo.h     |  8 +--
 arch/m68k/include/uapi/asm/ptrace.h       |  4 +-
 arch/m68k/kernel/early_printk.c           | 42 ++++++----------
 arch/m68k/kernel/head.S                   | 81 ++++++++++++++++---------------
 arch/m68k/mac/via.c                       | 16 ++++++
 arch/m68k/math-emu/fp_emu.h               |  8 +--
 arch/m68k/mm/motorola.c                   | 56 ++++++++++-----------
 48 files changed, 270 insertions(+), 180 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
