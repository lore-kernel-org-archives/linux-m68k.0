From: <gerg@snapgear.com>
Subject: [PATCH 0/3] m68knommu/net: add support for NS8390 based eth controllers on some ColdFire boards
Date: Fri, 29 Jun 2012 10:09:21 +1000
Message-ID: <1340928564-12116-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:31875 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751825Ab2F2AJS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Jun 2012 20:09:18 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


This is an updated patch set of the NS8390 eth support for some of the
older ColdFire boards.

I have broken out the mcfne.h -> mcf8390.h file move to its own patch,
didn't want to make the actual driver patch any bigger or harder to follow.

I also improved the commit log messages a little. The driver itself has a
couple of minor checkpatch fixes, but is otherwise the same.

---
 b/arch/m68k/include/asm/mcf8390.h       |  121 --------
 b/arch/m68k/platform/coldfire/Makefile  |    1
 b/arch/m68k/platform/coldfire/mcf8390.c |   38 ++
 b/drivers/net/ethernet/8390/Kconfig     |   14
 b/drivers/net/ethernet/8390/Makefile    |    1
 b/drivers/net/ethernet/8390/mcf8390.c   |  478 ++++++++++++++++++++++++++++++++
 7 files changed, 545 insertions(+), 124 deletions(-)
