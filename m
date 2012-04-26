From: <gerg@snapgear.com>
Subject: [PATCH 00/22] m68knommu: simplify ColdFire GPIO init code
Date: Thu, 26 Apr 2012 10:25:40 +1000
Message-ID: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:28214 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932593Ab2DZA0w (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:26:52 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, sfking@fdwdc.com

The GPIO init code for the ColdFire cores is a set of very large tables,
one for each ColdFire SoC type. Each SoC type has very different GPIO pin
arrangements, so one for each is unavoidable. But there is fundamentaly
two types of setup/access that we are trying to support.

With some pre-processor macro magic we can reduce the tables significantly,
making them easier to read, easier to get correct, and easier to maintain.

The following patches implement a set of simplifying changes. What do
others think?  Overall we remove close to 2000 lines of code, and the end
tables are much easier to read and get correct.

Looking for feedback...

Regards
Greg


 a/arch/m68k/platform/5206/gpio.c     |   27 -
 a/arch/m68k/platform/520x/gpio.c     |   34 -
 a/arch/m68k/platform/523x/gpio.c     |   40 --
 a/arch/m68k/platform/5249/gpio.c     |   28 -
 a/arch/m68k/platform/5272/gpio.c     |   29 -
 a/arch/m68k/platform/527x/gpio.c     |   61 ---
 a/arch/m68k/platform/528x/gpio.c     |   49 --
 a/arch/m68k/platform/5307/gpio.c     |   27 -
 a/arch/m68k/platform/532x/gpio.c     |   43 --
 a/arch/m68k/platform/5407/gpio.c     |   27 -
 arch/m68k/include/asm/mcfgpio.h      |    3 
 arch/m68k/platform/5206/gpio.c       |   12 
 arch/m68k/platform/520x/gpio.c       |   12 
 arch/m68k/platform/523x/gpio.c       |   12 
 arch/m68k/platform/5249/gpio.c       |   12 
 arch/m68k/platform/5272/gpio.c       |   12 
 arch/m68k/platform/527x/gpio.c       |   12 
 arch/m68k/platform/528x/gpio.c       |   12 
 arch/m68k/platform/5307/gpio.c       |   12 
 arch/m68k/platform/532x/gpio.c       |   12 
 arch/m68k/platform/5407/gpio.c       |   12 
 b/arch/m68k/include/asm/m528xsim.h   |  179 ++++------
 b/arch/m68k/include/asm/mcfgpio.h    |   41 ++
 b/arch/m68k/platform/5206/Makefile   |    2 
 b/arch/m68k/platform/5206/config.c   |    9 
 b/arch/m68k/platform/5206/gpio.c     |   16 
 b/arch/m68k/platform/520x/Makefile   |    2 
 b/arch/m68k/platform/520x/config.c   |   16 
 b/arch/m68k/platform/520x/gpio.c     |  149 --------
 b/arch/m68k/platform/523x/Makefile   |    2 
 b/arch/m68k/platform/523x/config.c   |   22 +
 b/arch/m68k/platform/523x/gpio.c     |  264 ---------------
 b/arch/m68k/platform/5249/Makefile   |    2 
 b/arch/m68k/platform/5249/config.c   |   10 
 b/arch/m68k/platform/5249/gpio.c     |   33 -
 b/arch/m68k/platform/5272/Makefile   |    2 
 b/arch/m68k/platform/5272/config.c   |   11 
 b/arch/m68k/platform/5272/gpio.c     |   50 --
 b/arch/m68k/platform/527x/Makefile   |    2 
 b/arch/m68k/platform/527x/config.c   |   43 ++
 b/arch/m68k/platform/527x/gpio.c     |  604 +----------------------------------
 b/arch/m68k/platform/528x/Makefile   |    2 
 b/arch/m68k/platform/528x/config.c   |   31 +
 b/arch/m68k/platform/528x/gpio.c     |  427 +-----------------------
 b/arch/m68k/platform/5307/Makefile   |    2 
 b/arch/m68k/platform/5307/config.c   |    9 
 b/arch/m68k/platform/5307/gpio.c     |   16 
 b/arch/m68k/platform/532x/Makefile   |    2 
 b/arch/m68k/platform/532x/config.c   |   25 +
 b/arch/m68k/platform/532x/gpio.c     |  320 ------------------
 b/arch/m68k/platform/5407/Makefile   |    2 
 b/arch/m68k/platform/5407/config.c   |    9 
 b/arch/m68k/platform/5407/gpio.c     |   16 
 b/arch/m68k/platform/coldfire/gpio.c |    4 
 54 files changed, 445 insertions(+), 2367 deletions(-)
