Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5382743F0B4
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Aug 2026 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608103; cv=none; b=jCAHQtTOMhm8SgjwlCDwOAZQNi0LtgCwbnSBqJ4ssJTpK8e1rJySmHomanQBhVehUfU/r9tcIUqvrIp/SlZy88FMeyumGVMCiDQ0muh2eQe6xhJs3RfH+KOnufqUb85k2qbbUFMfjR8XP/2/CNJeyMS0tk8Ce1N/U12AYE1NvwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608103; c=relaxed/simple;
	bh=DC5OrUC3XsPqdB6ilom6REqZwCJYmTw8kOCKzXywxIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jtNa9OPCNnkAkU7Jrdlauyg5K7Cd1SytkAp987TcKh02awT5l/2m8KkyIOh6OAW/GwPL683+DdAS7HbuwCoQLbEfLhzWyVnDZK/8o/CL/rtne+S6++jpkmQ+R8AJPPHkGLHaoj2xVtoHUGtWa8YqC4bo6lfcMJ2wdQHM+o7Z1SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A92D041773;
	Thu, 13 Aug 2026 08:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F42291F00A3A;
	Thu, 13 Aug 2026 08:01:39 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Gao Xiang <xiang@kernel.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k fixes for v7.2
Date: Thu, 13 Aug 2026 10:01:34 +0200
Message-ID: <20260813080134.1041412-1-geert@linux-m68k.org>
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

The following changes since commit 075b74841bd0065a3bda3440873c747938e69b68:

  Linux 7.2-rc6 (2026-08-02 16:24:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.2-tag2

for you to fetch changes up to 1fd495ef09eef96169a379a749c24b5e69974bb8:

  m68k: Define NR_CPUS to 1 (2026-08-12 13:53:44 +0200)

----------------------------------------------------------------
m68k fixes for v7.2

  - m68k: Define NR_CPUS to 1.

This fixes a long-standing but never critical before oddity on m68k,
that turned into a serious configuration issue after a recent erofs
change.

Note that this only fixes m68k; failures on architectures where NR_CPUS
depends on SMP will be fixed by a separate patch[1].

Thanks for pulling!

[1] "[PATCH] erofs: fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS on some UP
     platforms"
    https://lore.kernel.org/20260812131144.30802-1-xiang@kernel.org

----------------------------------------------------------------
Uwe Kleine-König (1):
      m68k: Define NR_CPUS to 1

 arch/m68k/Kconfig.cpu | 4 ++++
 1 file changed, 4 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
