From: Alexandre Courbot <gnurou@gmail.com>
Subject: [RFC 0/3] Removal of GENERIC_GPIO from architecture code
Date: Sun, 17 Mar 2013 22:42:00 +0900
Message-ID: <1363527723-32713-1-git-send-email-acourbot__2375.4664617174$1363527613$gmane$org@nvidia.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>

These three patches are from a larger set that aims at completely removing the 
GENERIC_GPIO option from platform code and config files as a first step towards 
his complete removal. After that, the use of the generic GPIO API would be 
provided through gpiolib. This series has already been discussed (see 
https://lkml.org/lkml/2013/3/12/167 for details and the rationale between these 
patches) and approved by most architectures, but before having it rolled on 
linux-next I'd like to hear from the 3 following architectures which have not 
replied to the previous patch set and are the most likely to be affected by 
this (other architectures almost all require gpiolib to start with).

mips: pnx833x: used to select GENERIC_GPIO but I'm not sure if it's needed at 
all. I could not find a GPIO driver implementation that did not depend on 
gpiolib. Platform code is sometimes subtle though, so it is possible that I 
just missed it.

m68k: coldfire: turns gpiolib from optional to mandatory. Might increase the 
kernels size by ~15KB for builds that did not make use of gpiolib (are there 
still such builds?)

blackfin: turns gpiolib from optional to mandatory, same side-effect.

Note that all architectures *can* operate with gpiolib, but only the three 
above leave the option to not do so. Since a new GPIO API is being prepared 
around gpiolib amongst other features, the option of only supporting 
GENERIC_GPIO leads to fragmentation and a lot of confusion for both drivers and 
platform code.

If you have any good reason to not see these changes applied, please let me 
know shortly - acks are welcome too.

Thanks,
Alex.

Alexandre Courbot (3):
  mips: pnx833x: remove requirement for GENERIC_GPIO
  m68k: coldfire: use gpiolib
  blackfin: force use of gpiolib

 arch/blackfin/Kconfig | 4 ++--
 arch/m68k/Kconfig.cpu | 3 +--
 arch/mips/Kconfig     | 1 -
 3 files changed, 3 insertions(+), 5 deletions(-)

-- 
1.8.2
