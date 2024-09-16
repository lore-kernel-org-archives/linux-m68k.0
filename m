Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BCF146588
	for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Sep 2024 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726497681; cv=none; b=g57e2znqEbVuo0AnHSoJ31iu6ZNDWp1IKKpNdLBnBgdkNxayFUcXsSFSxDiA08fnEx7esEavc/qYd4p5ZjfO4Z+VP2+4VMiGIArti++W2/fMYVaHtvizNciUc4nnaNNhhFbABwMd5kV2OE32MBX9kndEAcQ1g7tDZ/HSVCFN8sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726497681; c=relaxed/simple;
	bh=WecJ+gPUvfHGO3Qy4Ku+UYIn7R2CZrths0VNdnV0hcs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u5zGs13MbcONOgRt9G+tTqRxmerw4Xvb8PNaMgbBVwMLRSyT8O67qPIX88Q5BbTkR2pYUPc80kH8xzj5thCH4/rF4CxqfemI+1Jlg0c0xNSyr+pDtkNgvHLGRV9HKl98waNge2lnJNMtNudC3IXKoz97FA5B4X2fyfoQ44qfcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4X6nS51xbNz4x9M8
	for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Sep 2024 16:32:21 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:681c:31c3:1eaf:1b7])
	by laurent.telenet-ops.be with cmsmtp
	id D2YD2D00Q0hmunZ012YDCH; Mon, 16 Sep 2024 16:32:14 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sqClr-006Tv0-Gi;
	Mon, 16 Sep 2024 16:32:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sqClx-004Avv-CA;
	Mon, 16 Sep 2024 16:32:13 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v6.12
Date: Mon, 16 Sep 2024 16:32:07 +0200
Message-Id: <20240916143207.995330-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.12-tag1

for you to fetch changes up to b90fae5df91744e45e683c17bb1a38e466770df3:

  m68k: defconfig: Update defconfigs for v6.11-rc1 (2024-08-26 10:25:02 +0200)

----------------------------------------------------------------
m68k updates for v6.12

  - Use swap() helper for __arch_xchg(),
  - Fix kernel_clone_args.flags in m68k_clone(),
  - Defconfig updates.

Thanks for pulling!

----------------------------------------------------------------
Finn Thain (1):
      m68k: Fix kernel_clone_args.flags in m68k_clone()

Geert Uytterhoeven (1):
      m68k: defconfig: Update defconfigs for v6.11-rc1

Thorsten Blum (1):
      m68k: cmpxchg: Use swap() to improve code

 arch/m68k/configs/amiga_defconfig    |  2 --
 arch/m68k/configs/apollo_defconfig   |  2 --
 arch/m68k/configs/atari_defconfig    |  2 --
 arch/m68k/configs/bvme6000_defconfig |  2 --
 arch/m68k/configs/hp300_defconfig    |  2 --
 arch/m68k/configs/mac_defconfig      |  2 --
 arch/m68k/configs/multi_defconfig    |  2 --
 arch/m68k/configs/mvme147_defconfig  |  2 --
 arch/m68k/configs/mvme16x_defconfig  |  2 --
 arch/m68k/configs/q40_defconfig      |  2 --
 arch/m68k/configs/sun3_defconfig     |  2 --
 arch/m68k/configs/sun3x_defconfig    |  2 --
 arch/m68k/include/asm/cmpxchg.h      | 15 +++++----------
 arch/m68k/kernel/process.c           |  2 +-
 14 files changed, 6 insertions(+), 35 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
