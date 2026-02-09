Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D83532693D
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Feb 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627895; cv=none; b=Jiupv4mCJKvHYV/TQPkJrg7nd1BkwMU347JlguXgfgpm0S0DwVCzenO37X8HNl1AAmcsHjViBmwYYyCPjTu0JlofaF2JwrXh4UN2izICdPp1svg2zclEx06FcfDHRIu/sUa6MdAnNNLiA1VAwLu38jIXC8WOuBhV1HcaaaYS1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627895; c=relaxed/simple;
	bh=CqL8oEusOGtpmiyL3qGpTMfv0z8m3+fuCfSFlLlaReM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qicmiUacSVDDLaADUPqYmKWu5nrM134bCH12FvzQ0rRSNAOkW5KxM/XnChruujOPiOhkeAKgmwIzk9lK3XaoofOdCjW4ZgAmHOBixtrRTe7M5Ewuvzpbyoq3EFit4/Y3WEB0cmhfcQoygfdqJ37WfXFDd4JXy4svr97TJPd1n7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BA12600BB;
	Mon,  9 Feb 2026 09:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1ABC116C6;
	Mon,  9 Feb 2026 09:04:52 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v6.20
Date: Mon,  9 Feb 2026 10:04:49 +0100
Message-ID: <20260209090450.4079574-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.0-tag1

for you to fetch changes up to cb39cf99d88e8f2c68a41fb3bb01c4f40a8fcc30:

  m68k: sun3: Replace vsprintf() with bounded vsnprintf() (2026-01-26 12:26:01 +0100)

----------------------------------------------------------------
m68k updates for v7.0

  - Add missing put_device() in the NuBus driver,
  - Replace vsprintf() with vsnprintf() on Sun-3.

Thanks for pulling!

----------------------------------------------------------------
Finn Thain (1):
      nubus: Call put_device() in bus initialization error path

Thorsten Blum (1):
      m68k: sun3: Replace vsprintf() with bounded vsnprintf()

 arch/m68k/sun3/prom/printf.c |  4 ++--
 drivers/nubus/bus.c          | 13 ++-----------
 drivers/nubus/nubus.c        | 12 +++++++++---
 include/linux/nubus.h        |  3 +--
 4 files changed, 14 insertions(+), 18 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
