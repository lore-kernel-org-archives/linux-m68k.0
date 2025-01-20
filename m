Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3783E1E1A2D
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jan 2025 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737383159; cv=none; b=g+gNKkU7Y3cCo85gWKIoZO/p9Zxsbo28UJvKZkoIurdorrDdF1mAP9aWYa6v6uB0hu5BK9PXuWYMWnty8OQL4pTWKKyZPjwto9xU8IAtlKul9rNk4SyzCC5cXl823pdsxQWuxLKKAG2Quk2N9IFmesi1ChAXIiW8xrGyz11kThw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737383159; c=relaxed/simple;
	bh=EznrBTT9cUEdPs2tDi1bJu8dsD8NWARvmqKKzOvNDSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UDYvfGSUFkKzKBOvNNpSF1kRPkYWdtz/03zWTwYsoZfne496djQoYc/7v4famP5qkRg0N1I9uhSTlE4T9/2/IW1IvsqjPgvSsU/wU7eGQByPI+7BHi21xAPeZ61mjCx93z4iiWEg9YgRTvPQltexiuLMYrEH4GjHIKpY4jM/F8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4YcCD02mKxz4x04p
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jan 2025 15:20:16 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:30c9:4dcf:fe21:4b10])
	by andre.telenet-ops.be with cmsmtp
	id 3SL82E00V0raqVW01SL8j2; Mon, 20 Jan 2025 15:20:08 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tZsdF-0000000DhS7-3f8A;
	Mon, 20 Jan 2025 15:20:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tZsdM-0000000DTGB-1UA8;
	Mon, 20 Jan 2025 15:20:08 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v6.14
Date: Mon, 20 Jan 2025 15:20:07 +0100
Message-ID: <20250120142007.3210730-1-geert@linux-m68k.org>
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.14-tag1

for you to fetch changes up to bb2e0fb1e6aa9f737d6e0cbcf6494c51180e6d6d:

  m68k: libgcc: Fix lvalue abuse in umul_ppmm() (2025-01-10 10:26:52 +0100)

----------------------------------------------------------------
m68k updates for v6.14

  - Use the generic muldi3 libgcc function,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      m68k: libgcc: Fix lvalue abuse in umul_ppmm()

Greg Ungerer (1):
      m68k: Use kernel's generic muldi3 libgcc function

Thomas Weißschuh (1):
      zorro: Constify 'struct bin_attribute'

Thomas Zimmermann (1):
      m68k: vga: Fix I/O defines

Thorsten Blum (1):
      m68k: atari: Use str_on_off() helper in atari_nvram_proc_read()

 arch/Kconfig                   |  8 ++++
 arch/m68k/Kconfig              |  2 +
 arch/m68k/atari/nvram.c        |  6 ++-
 arch/m68k/include/asm/libgcc.h | 27 ++++++++++++
 arch/m68k/include/asm/vga.h    |  8 ++--
 arch/m68k/lib/Makefile         |  2 +-
 arch/m68k/lib/muldi3.c         | 97 ------------------------------------------
 drivers/zorro/zorro-sysfs.c    | 10 ++---
 include/linux/libgcc.h         |  4 ++
 9 files changed, 55 insertions(+), 109 deletions(-)
 create mode 100644 arch/m68k/include/asm/libgcc.h
 delete mode 100644 arch/m68k/lib/muldi3.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
