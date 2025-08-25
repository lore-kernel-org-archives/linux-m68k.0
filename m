Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F103F277C95
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Aug 2025 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756139758; cv=none; b=Opq/mjec8Si+7RXDg8xkuop6kTBiuciXDbhssBQT7c5INXB7JN59xBTy6OapdtPFY8kxnnmY5p5MmDub6UfUq3vB0iHqLujtgFSYDRYqk5SzYHwx8Vd3/l4y0Fl3/v9DaflDpH6Vkrx1MzhWBBPZGHVngENP3vo3rH7SQ1s8qW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756139758; c=relaxed/simple;
	bh=L2un3Tp24kq84D49bPeqtKFgx0ttvdt2Oi+LfIRW2Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DiaZizboQdZc6QlOh3Mi5hcVugZreldGFZN9+rthq+X9Fmk1e5OhrX1fGDCrBnzRIvQrjMwaElTg6DzUyC1DC9ojMnVV2fFe9Skij+3KcSShkV6t98DTmmZNzNfP7K7Nu07DhN+guL2hRgX2WXibjmJZe4hH/eNGeSw9JaBsdVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1jBJs97; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1jBJs97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139757; x=1787675757;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L2un3Tp24kq84D49bPeqtKFgx0ttvdt2Oi+LfIRW2Jk=;
  b=b1jBJs977XWwEidIdBcGxRAgk56wpCWxMdqWBf0XyKnzTkwgDLklcF0n
   abgUWucmdc/ghVoA7ZB79gBOreevLiMCY4ulzNGaCuFTGWXLVw+N6W6ub
   AZ40EyjidEsfaTbxRCjf05HdAv6f+n8UZLSEKsO1ngCsQIpIwsTAMLq5Q
   0HpuwA+2UClm/r9Z65I9sdgGu1VMKOCoUnNKSuITm41LUB0eQlfLqpYTV
   yeeD9Bf8jMvAqa7RmxnReturTZDcnbxpQojBEmjxPlSFKd1WdUIgLdbf0
   4JxLR8jQknajEYv2xfPG6ik0nccfhSqaEBsG/IcqkHg/NzWsCs+Rb38JS
   A==;
X-CSE-ConnectionGUID: DQEWdbO7QG2zHxI309yGtQ==
X-CSE-MsgGUID: GAdgGYn7QH6Y5DL4EaTkig==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69459518"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69459518"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:55 -0700
X-CSE-ConnectionGUID: orFQ8jjkTR+a1kLWJels8Q==
X-CSE-MsgGUID: l5OrMqmGT8icT6nXAJqR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169241087"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D581B94; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/3] floppy: A couple of cleanups
Date: Mon, 25 Aug 2025 18:32:54 +0200
Message-ID: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a few places in architecture code for the floppy driver
that may be cleaned up. Do it so.

Assumed to route via Andrew Morton's tree as floppy is basically orphaned.

Changelog v2:
- combined separate patches sent earlier into a series
- added tags (Helge, Geert)
- fixed typo in the commit message (Geert)

Andy Shevchenko (3):
  floppy: Remove unused CROSS_64KB() macro from arch/ code
  floppy: Replace custom SZ_64K constant
  floppy: Sort headers alphabetically

 arch/alpha/include/asm/floppy.h    | 19 ----------
 arch/arm/include/asm/floppy.h      |  2 --
 arch/m68k/include/asm/floppy.h     |  4 ---
 arch/mips/include/asm/floppy.h     | 15 --------
 arch/parisc/include/asm/floppy.h   | 11 +++---
 arch/powerpc/include/asm/floppy.h  |  5 ---
 arch/sparc/include/asm/floppy_32.h |  3 --
 arch/sparc/include/asm/floppy_64.h |  3 --
 arch/x86/include/asm/floppy.h      |  8 ++---
 drivers/block/floppy.c             | 56 ++++++++++++++----------------
 10 files changed, 34 insertions(+), 92 deletions(-)

-- 
2.50.1

