Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB638F62F
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Mar 2026 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447128; cv=none; b=ON+38TdPEY4lwCFeWYe4MNiHFSq0TmbrV4eKuupa7Zg+DKVhigh/jYGCq6vKbEMViDqlJ0MS5veDxS5Yq15WSGWqnD1jwVyd6ID8dOi4dbPwl+yfKXlpALknFoZoCkTc1oKiERLsBAVGbdnPonKp/+KkGAhiPiu9+/NPdv+YxZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447128; c=relaxed/simple;
	bh=wf8H0tEOxyxj9/9oFM8DHALX6KYAT9fJ+PFtYMC8n5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ARoJiZf75B4PIMLE/CGgxqIDAUNTCr5AgpEBXlq7tgJp1TFXk6Ar8wihAGmjnKIJZ9qQrWFxkP/x6HWVszBlyp5T189g59VyqyQgw0++RHp7uG08BDPFdyaXpzDq2I/iw/QlSmcCuc5fVUYceHAWPKvZ0hoxMTyxgdNQQsIUDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4484F40D6E;
	Mon,  2 Mar 2026 10:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF82C19423;
	Mon,  2 Mar 2026 10:25:25 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Philip Blundell <philb@gnu.org>,
	Kars de Jong <jongk@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/2] m68k: defconfig: Logo and regular updates
Date: Mon,  2 Mar 2026 11:25:18 +0100
Message-ID: <cover.1772446429.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

The recent logo configuration updates forced me to look into the logo
needs of the various platforms.

I plan to queue these for v7.1.

Thanks for your comments!

Geert Uytterhoeven (2):
  m68k: defconfig: hp300: Enable monochrome and 16-color linux logos
  m68k: defconfig: Update defconfigs for v7.0-rc1

 arch/m68k/configs/amiga_defconfig  | 2 ++
 arch/m68k/configs/apollo_defconfig | 2 +-
 arch/m68k/configs/atari_defconfig  | 2 ++
 arch/m68k/configs/hp300_defconfig  | 4 ++--
 arch/m68k/configs/mac_defconfig    | 2 ++
 arch/m68k/configs/multi_defconfig  | 2 ++
 arch/m68k/configs/q40_defconfig    | 2 ++
 7 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
