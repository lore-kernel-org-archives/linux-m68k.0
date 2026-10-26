Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020976;
	b=x/9SDvfpLKat/b9sUab2YZx/COulBS23pm6p4kjDeQuvMPp8qaKAIc3ZIlOJJInRI2sw
	 muSZXkTk4rz9Hnk2ROi7fdJXcjWc8k2SSvpJCRJq3cp82nM1BSXyQgcCoGWdopluGyEWT
	 6G01FWG7sfVU0vNMK9+XXRUSstCmbYsXlhlWTTJDn5ICYOmESFNuO5L1qBGZRtItgkwVv
	 PRkpIRLia3k9+KZcVNPJxhdAAU57U18Y0WCOQ1jVHD1Yt9LLZN3m+VMXrTB0pNNN9hswt
	 MXPbDE9YEMV/kBLZRKDyUVHxm8QVC7nMNc8WHJsVJQfgIzmn3OWvBTMWYr8CDNIk58w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020976;
	h=Received:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=A+qMSmiSScrn8K+iUdXsWxmMuEkGMH678UZfJDGojOk=;
	b=pK2NBXZTs0iBrwzMkd7jqVad7bKiAEifAcoLq0JNmdQ+xuIvdxTmVwCloUIq3smc2cGM
	 KQJN/PHCVmFKFlKRCCHx8a7gXuzWKVJsJVSU/fFNCBfzobRcRl0vRLGlWeh9l7tkWSr6H
	 7vfXO6KBB0dK8iRBoV7nnuEC++YltfPJEXd4PNXKeLgh//5W9SU/fTbxT8XelpSAZfIaI
	 cMvclNADsj3f+bACUlejCqtgMCP4h+EbeAEkl+hW4d1YDIEFX2w2XD9LCALiESz/T8BN7
	 9dR+1DYl27Hzwjy84cHL2aJJ02pCdFTO+H3B7gS6E8KWhMmTPrzYv36EmYpSniwvEtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF0606A31A;
	Mon, 26 Oct 2026 13:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDBE1F01825;
	Mon, 26 Oct 2026 13:22:54 +0000 (UTC)
Message-ID: <0a0661a9-2fc5-45d6-9b89-8f77019789a3@linux-m68k.org>
Date: Mon, 26 Oct 2026 23:22:52 +1000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v7.4
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the m68knommu git tree changes for v7.4.

A mix of platform driver setup, fixes, cleanup and config update.

Platform code added for the ColdFire 54418 RNG hardware block. Also
PWM address definitions for the 54418. A fix for seccomp filter
processing during system call entry and a fix for compiling the
Cleopatra board target. A config update for the stmark board,
and lastly a couple of typo fixes.

Regards
Greg




The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907:

  Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.4

for you to fetch changes up to cffad6e71539bc00d5a76c0c1057dc067d42715c:

  m68k: coldfire: Add RNG support for MCF54418 (2026-10-12 13:47:41 +1000)

----------------------------------------------------------------
m68knommu: updates and fixes for v7.4

. plaform RNG driver for ColdFire 54418
. PWM address defines for ColdFire 54418
. fix secomp filtering
. fix compile breakage for Cleopatra board
. update stmark defconfig
. remove unused header
. fix typos

----------------------------------------------------------------
Angelo Dureghello (2):
      m68k: defconfig: update stmark2 defconfig
      m68k: mcf5441x: add PWM defines

Christopher Lusk (1):
      m68k: Fix seccomp filtering on ColdFire and 68000

Ethan Nelson-Moore (1):
      m68k: remove unused <asm/quicc_simple.h> header

Greg Ungerer (1):
      m68knommu: fix compile breakage for 5407 cleopatra board

Hemanth Selam (2):
      m68k: coldfire: fix typos in reset.c comment
      m68k: fix typo "eanble" in comment

Jean-Michel Hautbois (1):
      m68k: coldfire: Add RNG support for MCF54418

 arch/m68k/68000/entry.S              |  3 +-
 arch/m68k/coldfire/device.c          | 28 +++++++++++++++++++
 arch/m68k/coldfire/entry.S           |  3 +-
 arch/m68k/coldfire/m5407.c           |  5 ++++
 arch/m68k/coldfire/m5441x.c          |  2 +-
 arch/m68k/coldfire/reset.c           |  2 +-
 arch/m68k/configs/stmark2_defconfig  |  2 ++
 arch/m68k/include/asm/m53xxacr.h     |  2 +-
 arch/m68k/include/asm/m5441xsim.h    | 16 +++++++++++
 arch/m68k/include/asm/quicc_simple.h | 53 ------------------------------------
 drivers/char/hw_random/Kconfig       |  3 +-
 drivers/char/hw_random/imx-rngc.c    |  7 +++++
 12 files changed, 67 insertions(+), 59 deletions(-)
 delete mode 100644 arch/m68k/include/asm/quicc_simple.h

