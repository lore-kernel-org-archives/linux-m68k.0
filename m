From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 00/10] m68knommu: fix allnoconfig
Date: Tue,  7 Jul 2015 16:55:14 +1000
Message-ID: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas01p.mx.bigpond.com ([61.9.168.137]:36142 "EHLO
	nskntmtas01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755493AbbGGGyN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Jul 2015 02:54:13 -0400
Received: from nskntcmgw06p ([61.9.169.166]) by nskntmtas01p.mx.bigpond.com
          with ESMTP
          id <20150707065410.JXQC15661.nskntmtas01p.mx.bigpond.com@nskntcmgw06p>
          for <linux-m68k@vger.kernel.org>; Tue, 7 Jul 2015 06:54:10 +0000
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


The following set of patches are designed to fix the issues causing a
"make allnoconfig" to fail for m68k. There is really only a couple of
problems, and those are easily fixed.

 arch/m68k/Kconfig.cpu                |   49 +++++++++++++------------
 arch/m68k/configs/m5208evb_defconfig |   22 +----------
 arch/m68k/configs/m5249evb_defconfig |   17 +-------
 arch/m68k/configs/m5272c3_defconfig  |   14 +------
 arch/m68k/configs/m5275evb_defconfig |   19 +--------
 arch/m68k/configs/m5307c3_defconfig  |   21 +---------
 arch/m68k/configs/m5407c3_defconfig  |   17 +-------
 arch/m68k/configs/m5475evb_defconfig |    8 ----
 arch/m68k/include/asm/coldfire.h     |    2 -
 9 files changed, 42 insertions(+), 127 deletions(-)
