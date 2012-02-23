From: <gerg@snapgear.com>
Subject: [PATCH 00/23] m68knommu: clean up and merge common ColdFire UART code
Date: Thu, 23 Feb 2012 14:34:32 +1000
Message-ID: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:53721 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940Ab2BWEfv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:35:51 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The code to init and platform setup the ColdFire UART devices is duplicated
throughout the CPU specific config.c files. It is all common, these are the
same UARTs, just with different base addresses and IRQ numbers used.

Cleanup and merge the common UART code. Ends up saving quite a few hundred
lines of code.


 arch/m68k/platform/5206/config.c       |   78 +++------------------------------
 arch/m68k/platform/520x/config.c       |   65 +++++----------------------
 arch/m68k/platform/523x/config.c       |   23 ---------
 arch/m68k/platform/5249/config.c       |   63 +++-----------------------
 arch/m68k/platform/5272/config.c       |   46 +++----------------
 arch/m68k/platform/527x/config.c       |   44 ------------------
 arch/m68k/platform/528x/config.c       |   45 +------------------
 arch/m68k/platform/5307/config.c       |   78 +++------------------------------
 arch/m68k/platform/532x/config.c       |   42 +----------------
 arch/m68k/platform/5407/config.c       |   78 +++------------------------------
 arch/m68k/platform/54xx/config.c       |   76 +++-----------------------------
 arch/m68k/platform/coldfire/device.c   |   20 ++++++++
 b/arch/m68k/include/asm/m5206sim.h     |   10 ++--
 b/arch/m68k/include/asm/m520xsim.h     |   10 ++--
 b/arch/m68k/include/asm/m523xsim.h     |   12 +++--
 b/arch/m68k/include/asm/m5249sim.h     |    7 ++
 b/arch/m68k/include/asm/m5272sim.h     |    8 +--
 b/arch/m68k/include/asm/m527xsim.h     |   10 ++--
 b/arch/m68k/include/asm/m528xsim.h     |   12 +++--
 b/arch/m68k/include/asm/m5307sim.h     |   10 ++--
 b/arch/m68k/include/asm/m532xsim.h     |   10 ++--
 b/arch/m68k/include/asm/m5407sim.h     |    6 +-
 b/arch/m68k/include/asm/m54xxsim.h     |   16 ++++--
 b/arch/m68k/include/asm/mcfuart.h      |    5 +-
 b/arch/m68k/platform/5206/config.c     |   12 ++---
 b/arch/m68k/platform/520x/config.c     |   12 ++---
 b/arch/m68k/platform/523x/config.c     |   12 ++---
 b/arch/m68k/platform/5249/config.c     |   12 ++---
 b/arch/m68k/platform/5272/config.c     |    8 +--
 b/arch/m68k/platform/527x/config.c     |   12 ++---
 b/arch/m68k/platform/528x/config.c     |   12 ++---
 b/arch/m68k/platform/5307/config.c     |   12 ++---
 b/arch/m68k/platform/532x/config.c     |   12 ++---
 b/arch/m68k/platform/5407/config.c     |   12 ++---
 b/arch/m68k/platform/54xx/config.c     |   16 +++---
 b/arch/m68k/platform/coldfire/Makefile |    2 
 b/arch/m68k/platform/coldfire/device.c |   60 +++++++++++++++++++++++++
 37 files changed, 299 insertions(+), 669 deletions(-)
