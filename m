From: <gerg@snapgear.com>
Subject: [PATCH 00/11] m68knommu: remove ColdFire sub-architecture directories
Date: Wed, 2 May 2012 11:08:55 +1000
Message-ID: <1335920946-11297-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:48859 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753290Ab2EBBKR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 May 2012 21:10:17 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


Currently the different ColdFire sub-archiectures are split up with a
directory for each family type. Most though only contain a small amount
of code, it just doesn't seem to make any sense to keep them separate.

Move all the ColdFire sub-architecture code into the platform/coldfire
directory, and remove the sub-architecture directories. We already build
the common ColdFire components based on sub-architecture type anyway,
so there is very little Makefile change required.

Overall we remove about 200 lines of duplicated Makefile code, and end
up with all the ColdFire specific code in a single directory.

---

 arch/m68k/Makefile                     |   10 ----------
 arch/m68k/platform/5206/Makefile       |   18 ------------------
 arch/m68k/platform/520x/Makefile       |   17 -----------------
 arch/m68k/platform/523x/Makefile       |   17 -----------------
 arch/m68k/platform/5249/Makefile       |   18 ------------------
 arch/m68k/platform/5272/Makefile       |   18 ------------------
 arch/m68k/platform/527x/Makefile       |   18 ------------------
 arch/m68k/platform/528x/Makefile       |   18 ------------------
 arch/m68k/platform/5307/Makefile       |   20 --------------------
 arch/m68k/platform/532x/Makefile       |   18 ------------------
 arch/m68k/platform/5407/Makefile       |   18 ------------------
 arch/m68k/platform/54xx/Makefile       |   19 -------------------
 arch/m68k/platform/coldfire/Makefile   |   24 ++++++++++++++----------
 b/arch/m68k/Makefile                   |    2 --
 b/arch/m68k/platform/coldfire/Makefile |    4 ++--
 b/arch/m68k/platform/coldfire/m5206.c  |    1 -
 b/arch/m68k/platform/coldfire/m520x.c  |    1 -
 b/arch/m68k/platform/coldfire/m523x.c  |    1 -
 b/arch/m68k/platform/coldfire/m5249.c  |    1 -
 b/arch/m68k/platform/coldfire/m5272.c  |    1 -
 b/arch/m68k/platform/coldfire/m527x.c  |    1 -
 b/arch/m68k/platform/coldfire/m528x.c  |    1 -
 b/arch/m68k/platform/coldfire/m532x.c  |    1 -
 b/arch/m68k/platform/coldfire/m5407.c  |    1 -
 b/arch/m68k/platform/coldfire/m54xx.c  |    1 -
 b/arch/m68k/platform/coldfire/nettel.c |    1 -
 26 files changed, 16 insertions(+), 234 deletions(-)
