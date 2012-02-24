From: <gerg@snapgear.com>
Subject: [PATCH 0/7] m68knommu: clean up and merge common ColdFire QSPI code
Date: Fri, 24 Feb 2012 15:06:48 +1000
Message-ID: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28472 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912Ab2BXFGB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 Feb 2012 00:06:01 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The code to init and platform setup the ColdFire QSPI devices is duplicated
throughout the CPU specific config.c files. It is all common, this is the
same QSPI hardware block, just with different base addresses and IRQ numbers
used.

Cleanup and merge the common QSPI platform code.


 arch/m68k/include/asm/mcfqspi.h        |   15 -
 arch/m68k/platform/520x/config.c       |  146 ---------------
 arch/m68k/platform/523x/config.c       |  317 ++++++++-------------------------
 arch/m68k/platform/5249/config.c       |  162 ----------------
 arch/m68k/platform/527x/config.c       |  165 -----------------
 arch/m68k/platform/528x/config.c       |  130 -------------
 arch/m68k/platform/532x/config.c       |  117 ------------
 b/arch/m68k/include/asm/m520xsim.h     |   12 +
 b/arch/m68k/include/asm/m523xsim.h     |   13 +
 b/arch/m68k/include/asm/m5249sim.h     |   11 +
 b/arch/m68k/include/asm/m527xsim.h     |   24 ++
 b/arch/m68k/include/asm/m528xsim.h     |   13 +
 b/arch/m68k/include/asm/m532xsim.h     |   12 +
 b/arch/m68k/include/asm/mcfqspi.h      |    2 
 b/arch/m68k/platform/520x/config.c     |   12 -
 b/arch/m68k/platform/523x/config.c     |   13 -
 b/arch/m68k/platform/5249/config.c     |    9 
 b/arch/m68k/platform/527x/config.c     |   20 --
 b/arch/m68k/platform/528x/config.c     |   13 -
 b/arch/m68k/platform/532x/config.c     |   12 -
 b/arch/m68k/platform/coldfire/device.c |  162 ++++++++++++++++
 21 files changed, 375 insertions(+), 1005 deletions(-)
