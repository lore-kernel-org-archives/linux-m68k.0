Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDC02FF17A;
	Tue, 16 Jun 2026 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616858; cv=none; b=H90L5ZNiPuMpIgzDXP4R2bXrc6RCL8nqjdm86bZrd+b2fBBo87uMjCskO8X+LtkubdLfJx4VZPlcv7yqdCVIa5bSAEFhDnrzRl4K9ljOI6W99nBpW0CkKX68eHOh9owl1PjJ78WsKKd4YJ1Wb8FpkWSbAZzGscpX7NQSjt8Ooyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616858; c=relaxed/simple;
	bh=XM61DAQ8dyaBWxRJg3akS/UdGFt/sALV4MXoGTHOvsE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=gvDF4/u3PhxSxar95gGKu9aevcmfTDSJKmRikkkc+pM64nfnDaCZHsLsk8KZhtS47e/02SwqhhVdosMF8JzzBfNsTgIeSBBtIAwMpKp7pliZfffyfMsHAkcbRQ3pjh+nijSHZDhQ93eCXqMFeJwrHfnEJ1qwfZpQcsbfaT11UUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3041F000E9;
	Tue, 16 Jun 2026 13:34:15 +0000 (UTC)
Message-ID: <cfb153b4-b076-43fb-8458-f56aa12d18c6@linux-m68k.org>
Date: Tue, 16 Jun 2026 23:34:10 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v7.2
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the m68knommu git tree changes for v7.2.

A few changes in this one. Firstly an update and config refresh for
the stmark board. Some fixes and preparatory work for supporting
the DAC hardware block of the m5441x ColdFire SoC. Forced configuration
fix for legacy gpiolib when enabling the mcfqspi driver. Some new
defconfigs for the M5329EVB, M54418EVB and NETtel boards to give
better build test coverage For ColdFire parts. And lastly a cleanup
to register access code in the core init and setup code for ColdFire SoC
be consistent, instead of ia varied use of __raw_readX/__raw_write and
straight readX/writeX. This is working towards fixing the non-standard
endianess of the non-MMU m68k readX/writeX functions.

Regards
Greg




The following changes since commit 4549871118cf616eecdd2d939f78e3b9e1dddc48:

   Linux 7.1-rc7 (2026-06-07 15:37:58 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.2

for you to fetch changes up to 4b51af3ef96a6b6d9c231537fc57856a1062cd8e:

   m68k: stmark2: enable DACs outputs (2026-06-11 18:02:39 +1000)

----------------------------------------------------------------
m68knommu: updates and fixes for v7.2

. update stmark board support
. clock fixes for m5441x ColdFire
. base hardware support for DAC block of m5441x ColdFire
. select legacy gpiolib interface for mcfqspi
. new defconfigs for more ColdFire based boards
. unify ColdFire SoC register access

----------------------------------------------------------------
Angelo Dureghello (10):
       config: stmark2: defconfig updates
       m68k: update boards company name
       m68k: mcf5441x: fix clocks numbering
       m68k: mcf5441x: add clock for DAC channel 1
       m68k: add DAC modules base addresses
       m68k: mcf5441x: add CCM registers
       m68k: mcf5441x: add CCR MISCCR2 bitfields
       m68k: stmark2: use ioport.h macros for resources
       m68k: stmark2: add mcf5441x DAC platform devices
       m68k: stmark2: enable DACs outputs

Arnd Bergmann (1):
       m68k: coldfire: select legacy gpiolib interface for mcfqspi

Greg Ungerer (11):
       m68k: defconfig: add config for M5329EVB board
       m68k: defconfig: add config for M54418EVB board
       m68k: defconfig: add config for SnapGear/NETtel board
       m68k: defconfig: update all ColdFire defconfigs
       m68k: coldfire: create IO access functions for internal registers
       m68k: coldfire: use ColdFire specific IO access in headers
       m68k: coldfire: use ColdFire specifc IO access in interrupt code
       m68k: coldfire: use ColdFire specifc IO access in timer code
       m68k: coldfire: rename timer register access defines
       m68k: coldfire: use ColdFire specifc IO access in system code
       m68k: coldfire: use ColdFire specifc IO access in SoC code

  arch/m68k/Kconfig.cpu                 |   1 +
  arch/m68k/Kconfig.machine             |   8 +--
  arch/m68k/coldfire/amcore.c           |   4 +-
  arch/m68k/coldfire/clk.c              |   8 +--
  arch/m68k/coldfire/device.c           |   8 +--
  arch/m68k/coldfire/dma_timer.c        |  12 ++--
  arch/m68k/coldfire/intc-2.c           |  30 ++++-----
  arch/m68k/coldfire/intc-5249.c        |  10 +--
  arch/m68k/coldfire/intc-525x.c        |  12 ++--
  arch/m68k/coldfire/intc-5272.c        |  20 +++---
  arch/m68k/coldfire/intc-simr.c        |  38 +++++------
  arch/m68k/coldfire/intc.c             |  28 ++++----
  arch/m68k/coldfire/m5206.c            |   2 +-
  arch/m68k/coldfire/m520x.c            |  26 ++++----
  arch/m68k/coldfire/m523x.c            |  12 ++--
  arch/m68k/coldfire/m5249.c            |  16 ++---
  arch/m68k/coldfire/m525x.c            |  12 ++--
  arch/m68k/coldfire/m5272.c            |  16 ++---
  arch/m68k/coldfire/m527x.c            |  40 +++++------
  arch/m68k/coldfire/m528x.c            |  28 ++++----
  arch/m68k/coldfire/m5307.c            |   2 +-
  arch/m68k/coldfire/m53xx.c            | 122 +++++++++++++++++-----------------
  arch/m68k/coldfire/m5407.c            |   2 +-
  arch/m68k/coldfire/m5441x.c           |  33 ++++-----
  arch/m68k/coldfire/m54xx.c            |  18 ++---
  arch/m68k/coldfire/nettel.c           |  16 ++---
  arch/m68k/coldfire/pci.c              |  56 ++++++++--------
  arch/m68k/coldfire/pit.c              |  20 +++---
  arch/m68k/coldfire/reset.c            |   4 +-
  arch/m68k/coldfire/sltimers.c         |  18 ++---
  arch/m68k/coldfire/stmark2.c          |  63 +++++++++++-------
  arch/m68k/coldfire/timers.c           |  30 ++++-----
  arch/m68k/configs/m5208evb_defconfig  |   9 +--
  arch/m68k/configs/m5249evb_defconfig  |   9 +--
  arch/m68k/configs/m5272c3_defconfig   |   9 +--
  arch/m68k/configs/m5275evb_defconfig  |   9 +--
  arch/m68k/configs/m5307c3_defconfig   |  10 +--
  arch/m68k/configs/m5329evb_defconfig  |  61 +++++++++++++++++
  arch/m68k/configs/m5407c3_defconfig   |   9 ++-
  arch/m68k/configs/m54418evb_defconfig |  70 +++++++++++++++++++
  arch/m68k/configs/m5475evb_defconfig  |  12 ++--
  arch/m68k/configs/nettel_defconfig    |  56 ++++++++++++++++
  arch/m68k/configs/stmark2_defconfig   |  33 +++++----
  arch/m68k/include/asm/io_no.h         |  16 +++++
  arch/m68k/include/asm/m5441xsim.h     |  42 ++++++++++++
  arch/m68k/include/asm/mcfgpio.h       |  12 ++--
  arch/m68k/include/asm/nettel.h        |   4 +-
  47 files changed, 676 insertions(+), 400 deletions(-)
  create mode 100644 arch/m68k/configs/m5329evb_defconfig
  create mode 100644 arch/m68k/configs/m54418evb_defconfig
  create mode 100644 arch/m68k/configs/nettel_defconfig
