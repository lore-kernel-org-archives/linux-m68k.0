From: <gerg@snapgear.com>
Subject: [PATCH 0/7] m68knommu: clean up and merge common ColdFire FEC code
Date: Fri, 24 Feb 2012 14:24:04 +1000
Message-ID: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:44615 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754754Ab2BXEXS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Feb 2012 23:23:18 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The code to init and platform setup the ColdFire FEC devices is duplicated
throughout the CPU specific config.c files. It is all common, this is the
same FEC hardware block, just with different base addresses and IRQ numbers
used.

Cleanup and merge the common FEC platform code.


 arch/m68k/platform/520x/config.c       |   31 -------------
 arch/m68k/platform/523x/config.c       |   31 -------------
 arch/m68k/platform/5272/config.c       |   37 ---------------
 arch/m68k/platform/527x/config.c       |   65 ---------------------------
 arch/m68k/platform/528x/config.c       |   31 -------------
 arch/m68k/platform/532x/config.c       |   31 -------------
 b/arch/m68k/include/asm/m520xsim.h     |   11 +++-
 b/arch/m68k/include/asm/m523xsim.h     |   13 ++++-
 b/arch/m68k/include/asm/m5272sim.h     |    9 ++-
 b/arch/m68k/include/asm/m527xsim.h     |   15 ++++++
 b/arch/m68k/include/asm/m528xsim.h     |   11 +++-
 b/arch/m68k/include/asm/m532xsim.h     |   13 +++++
 b/arch/m68k/platform/520x/config.c     |   16 +++---
 b/arch/m68k/platform/523x/config.c     |   16 +++---
 b/arch/m68k/platform/5272/config.c     |   16 +++---
 b/arch/m68k/platform/527x/config.c     |   24 +++++-----
 b/arch/m68k/platform/528x/config.c     |   16 +++---
 b/arch/m68k/platform/532x/config.c     |   16 +++---
 b/arch/m68k/platform/coldfire/device.c |   78 +++++++++++++++++++++++++++++++++
 19 files changed, 192 insertions(+), 288 deletions(-)
