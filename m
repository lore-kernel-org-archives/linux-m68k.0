From: <gerg@snapgear.com>
Subject: [PATCH 0/5] m68knommu: fix define formating in some ColdFire headers
Date: Sat, 22 Sep 2012 21:08:22 +1000
Message-ID: <1348312107-29294-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:64889 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752725Ab2IVLIG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Sep 2012 07:08:06 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


Reformat broken tab alignment on some defines. This makes the format
mostly consistent in these files.

---
 arch/m68k/include/asm/m523xsim.h |   18 +++++++++---------
 arch/m68k/include/asm/m5272sim.h |    7 ++++---
 arch/m68k/include/asm/m527xsim.h |   34 +++++++++++++++++-----------------
 arch/m68k/include/asm/m5307sim.h |   12 ++++++------
 arch/m68k/include/asm/m5407sim.h |   12 ++++++------
 5 files changed, 42 insertions(+), 41 deletions(-)
