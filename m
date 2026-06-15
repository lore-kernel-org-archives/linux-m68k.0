Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7BB3DB30F
	for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Jun 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516747; cv=none; b=ObmfQ8cXoAM7N1eEsD504tbw+KKiRjdS2uIaAG2levOSfjnsUvUMsB+hUpRgklDkZtJa/SqrGEusJC7z0wuFRHcU4yKmXS8VUonjZHrHmXUDtZpKnogHb3mZfPBOi6yQyFW79zzNcX19AAbAJfd6HVdK9X6T7UyrnbU4tiqJ+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516747; c=relaxed/simple;
	bh=qAz3G3Jc0XEUzotELMO+7imJh/OfGAZ9nGr75Bbz5vM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmlnwciXs7fBbRfspzAgGFW/QSg7zHvA2tno+khTBscpAoVaMOFTD3J0MLA2CIsrvbfO+LK+33Jv8W5dfcRTGcdFHihzRVO5kFYLxFfX50/3d9jBdRKnRajvs8wEEyhKopkj7a67/aQkrMuCak2Yrxd5cgLQchfXhhLq8S64cp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 448B9600AB;
	Mon, 15 Jun 2026 09:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49E71F000E9;
	Mon, 15 Jun 2026 09:45:43 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v7.2
Date: Mon, 15 Jun 2026 11:45:40 +0200
Message-ID: <20260615094540.1977648-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.2-tag1

for you to fetch changes up to dc5200f6b1ada318463dd141b041ec9f044b2bf5:

  m68k: Correct CONFIG_MVME16x macro name in #endif comment (2026-06-10 09:10:49 +0200)

----------------------------------------------------------------
m68k updates for v7.2

  - Replace more deprecated functions by safer counterparts,
  - Switch Mac NuBus to a dynamic root device,
  - Defconfig updates,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Ethan Nelson-Moore (1):
      m68k: Correct CONFIG_MVME16x macro name in #endif comment

Geert Uytterhoeven (3):
      dio: Update DIO_SCMAX comment
      m68k: defconfig: Update defconfigs for v7.1-rc1
      m68k: hash: Use lower_16_bits() helper

Johan Hovold (1):
      nubus: Switch to dynamic root device

Stefan Pedratscher (1):
      zorro: sysfs: Replace sprintf() by sysfs_emit()

Thorsten Blum (2):
      dio: Replace deprecated strcpy with strscpy in dio_init
      dio: Use tabs and avoid continuation logging in dio_init

 arch/m68k/configs/amiga_defconfig    | 13 ++++++++-----
 arch/m68k/configs/apollo_defconfig   | 13 ++++++++-----
 arch/m68k/configs/atari_defconfig    | 12 ++++++++----
 arch/m68k/configs/bvme6000_defconfig | 13 ++++++++-----
 arch/m68k/configs/hp300_defconfig    | 13 ++++++++-----
 arch/m68k/configs/mac_defconfig      | 13 ++++++++-----
 arch/m68k/configs/multi_defconfig    | 13 ++++++++-----
 arch/m68k/configs/mvme147_defconfig  | 13 ++++++++-----
 arch/m68k/configs/mvme16x_defconfig  | 13 ++++++++-----
 arch/m68k/configs/q40_defconfig      | 13 ++++++++-----
 arch/m68k/configs/sun3_defconfig     | 13 ++++++++-----
 arch/m68k/configs/sun3x_defconfig    | 13 ++++++++-----
 arch/m68k/include/asm/hash.h         |  4 +++-
 arch/m68k/kernel/head.S              |  2 +-
 drivers/dio/dio.c                    | 15 ++++++++-------
 drivers/nubus/nubus.c                | 19 ++++++++-----------
 drivers/zorro/zorro-sysfs.c          | 15 ++++++++-------
 include/linux/dio.h                  |  4 +---
 18 files changed, 125 insertions(+), 89 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
