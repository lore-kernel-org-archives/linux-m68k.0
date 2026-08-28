Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12AA200110;
	Fri, 28 Aug 2026 00:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787876742; cv=none; b=tjtEYHEYBvB7P5GJpTUUacW5fw4ZLAAYqwNQ808WnnA3jwiFMzSOVFvBvmRZAsVXyrRO6QF1gSKdByN80Ka6Ua0WPrlNxtMYulMu7GI6b4yGv8I9apWZyhMOapkQvn/J3GMHa24IjymUunQlj+cbZHIKY7/4kvqOBXdcaEjOZfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787876742; c=relaxed/simple;
	bh=RelWNnclIFKIOiG6osYDZJrGr0EcRT2E3cVUKol4Ldk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=ALJ6NKpVIwjI+gS9ioT+yoPBy+xl3GwoWf1KW52sboQYy9C2xqoRn3LHVJwlme1jDV8pFqPrbHp4cmYBH2Jcm3kXwlo811dyUtIIBBIRC9sgPHGYg0Z2YC7QGvCA3D4FEGYpHS0BzbHjkc3J7NgjqX1FAPWiga2mXi+CSnbpId0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518E01F000E9;
	Fri, 28 Aug 2026 00:25:39 +0000 (UTC)
Message-ID: <951cbeb4-a058-41b9-a061-b0abaad3cb82@linux-m68k.org>
Date: Fri, 28 Aug 2026 10:25:35 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu more fixes for v7.3
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the m68knommu git tree changes for v7.3.

This one includes a couple more new defconfigs to improve test build
coverage, changes to use the more correct linux/gpio/legacy.h and
platform setup for the reset device of the ColdFire 5441x SoC hardware.

Regards
Greg




The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.3

for you to fetch changes up to de0dab22cbf6943d0f12f3b1e2eb1bbdd807f039:

  m68k: coldfire/5441x: register mcf-rcm-reset platform device (2026-08-11 16:17:10 +1000)

----------------------------------------------------------------
m68knommu: updates and fixes for v7.3

, new defconfigs for 2 more ColdFire boards
. change to use linux/gpio/legacy.h
. add platform setup for reset device of the 5441x SoC boards

----------------------------------------------------------------
Arnd Bergmann (1):
      m68k/coldfire: replace linux/gpio.h inclusions

Greg Ungerer (2):
      m68k: defconfig: add config for M52358EVB board
      m68k: defconfig: add config for M5282EVB board

Jean-Michel Hautbois (1):
      m68k: coldfire/5441x: register mcf-rcm-reset platform device

 arch/m68k/coldfire/device.c          |  2 +-
 arch/m68k/coldfire/m5441x.c          | 25 +++++++++++++++++
 arch/m68k/configs/m5235evb_defconfig | 52 ++++++++++++++++++++++++++++++++++++
 arch/m68k/configs/m5282evb_defconfig | 51 +++++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/mcfgpio.h      |  2 +-
 5 files changed, 130 insertions(+), 2 deletions(-)
 create mode 100644 arch/m68k/configs/m5235evb_defconfig
 create mode 100644 arch/m68k/configs/m5282evb_defconfig
