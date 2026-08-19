Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13240367B8B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Aug 2026 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131287; cv=none; b=T3IXE0JiVvOl50d6WcnVmcO4yHNzah1HB0Nne3JMhJNGgZdVf53ZLDxAA/NiXoxlJrpAKGrvyhcFyCyN/xF5RAoJiMiZ8Afn3zrUJKVYcxk5AiOMJb4l3dGSH4s36F8QRLTT8lDqmQE+yYBuxLft5BOcz/3wvu5xWB8ODr6Y8UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131287; c=relaxed/simple;
	bh=wVpfH1JZYr4EDSk1uZuByWVB28y3/IFtDj70CFhoOWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dbAbFUT7jgxKGrH2aCFKTgIV405V7TjHj6CJ8z7BReyYY4vPjWYHoJJEs5E5IdSqOVyJuJQA39bPnRtmcKGCXOfUfQIrw75v+4lWxQvNttRYTolkWznAaUq9dghBxtTHKko+eKZ0FqHaKtdIcK0uUU7ktaHk5D8upkROBio9UvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6B7360A59;
	Wed, 19 Aug 2026 09:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B1E1F000E9;
	Wed, 19 Aug 2026 09:21:10 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v7.3
Date: Wed, 19 Aug 2026 11:21:05 +0200
Message-ID: <20260819092105.1232550-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.3-tag1

for you to fetch changes up to 2f8e3cad53b5c36ab0ed5d3195bfc55c59ea61a5:

  m68k: nfcon: Do not call console_is_registered() in nfcon_device() (2026-08-17 11:33:19 +0200)

----------------------------------------------------------------
m68k updates for v7.3

  - Fix backtraces for non-running tasks,
  - Fix deadlock in show_cons_active(),
  - Defconfig updates,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Andreas Schwab (1):
      m68k: nfcon: Do not call console_is_registered() in nfcon_device()

Geert Uytterhoeven (1):
      m68k: defconfig: Update defconfigs for v7.2-rc1

Karl Mehltretter (1):
      m68k: Fix backtraces for non-running tasks

Thorsten Blum (1):
      m68k: amiga: Remove redundant amiga_reset() prototype

 arch/m68k/amiga/config.c             | 4 +---
 arch/m68k/configs/amiga_defconfig    | 5 -----
 arch/m68k/configs/apollo_defconfig   | 5 -----
 arch/m68k/configs/atari_defconfig    | 5 -----
 arch/m68k/configs/bvme6000_defconfig | 5 -----
 arch/m68k/configs/hp300_defconfig    | 5 -----
 arch/m68k/configs/mac_defconfig      | 5 -----
 arch/m68k/configs/multi_defconfig    | 5 -----
 arch/m68k/configs/mvme147_defconfig  | 5 -----
 arch/m68k/configs/mvme16x_defconfig  | 5 -----
 arch/m68k/configs/q40_defconfig      | 5 -----
 arch/m68k/configs/sun3_defconfig     | 5 -----
 arch/m68k/configs/sun3x_defconfig    | 5 -----
 arch/m68k/emu/nfcon.c                | 2 +-
 arch/m68k/kernel/traps.c             | 4 ++--
 15 files changed, 4 insertions(+), 66 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
