Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B887030217B
	for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Dec 2025 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582680; cv=none; b=sqUbpjR1a/ScUUXYNOEP9y8kSk6EGYPfYuZikJKrt3NudimMPS4IbIiJpYYN/rslpiSe/sUSXL9hfZjafq2ineQ/bhsg14P74hzcXcx40/C9ShHEsFvGuU0poa5LpU60QArait/0XUIlIRQ8HJEdtF61PxcVfy1M++AOaoBD3eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582680; c=relaxed/simple;
	bh=Uy/K7kKi/+uzfJZ0QSE3QVyViUZBLVUCDO/oGQd53aY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4iFzYABQmwsffBjG7Vvi/lCO3nbqz6Tgkx32jmzw//eQW9UUCRTzdvXTXMhvwgxLgXpcbmU5xdhHbswuxDjTeyM9x27h5IEtb3fkm7Fpm+e7vBAB1C4Yr42HqUUlCC2eCXGlJy7pKWlJ+LRkBmuciOFGTertRIOalcR2ylKiQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 173786014C;
	Mon,  1 Dec 2025 09:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D964C116D0;
	Mon,  1 Dec 2025 09:51:13 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v6.19
Date: Mon,  1 Dec 2025 10:51:08 +0100
Message-ID: <20251201095108.3450261-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.19-tag1

for you to fetch changes up to aaf4e92341b081bac1230f22619b0a298e285dab:

  m68k: defconfig: Update defconfigs for v6.18-rc1 (2025-11-24 11:03:50 +0100)

----------------------------------------------------------------
m68k updates for v6.19

  - Defconfig updates.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      m68k: defconfig: Update defconfigs for v6.18-rc1

 arch/m68k/configs/amiga_defconfig    | 3 +--
 arch/m68k/configs/apollo_defconfig   | 3 +--
 arch/m68k/configs/atari_defconfig    | 3 +--
 arch/m68k/configs/bvme6000_defconfig | 3 +--
 arch/m68k/configs/hp300_defconfig    | 3 +--
 arch/m68k/configs/mac_defconfig      | 3 +--
 arch/m68k/configs/multi_defconfig    | 3 +--
 arch/m68k/configs/mvme147_defconfig  | 3 +--
 arch/m68k/configs/mvme16x_defconfig  | 3 +--
 arch/m68k/configs/q40_defconfig      | 3 +--
 arch/m68k/configs/sun3_defconfig     | 3 +--
 arch/m68k/configs/sun3x_defconfig    | 3 +--
 12 files changed, 12 insertions(+), 24 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
