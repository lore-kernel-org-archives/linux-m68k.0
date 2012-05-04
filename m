From: <gerg@snapgear.com>
Subject: [PATCH 00/02] m68k: clean up and merge arch dma code
Date: Fri, 4 May 2012 16:50:45 +1000
Message-ID: <1336114247-22764-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:15755 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752867Ab2EDGxf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 May 2012 02:53:35 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


m68k: clean up and merge arch dma code

Much of the common m68k architecture dma code is the same for the MMU and
non-MMU cases. With a little cleanup of the m68knommu dma code first we
can then merge the two to end up with a single arch dma.c.

I have only tested a small number of ColdFire platforms so far, and they
all seem to check out as before. There should be no functional change for
MMU m68k systems.

---
 arch/m68k/kernel/dma_mm.c               |  131 -------------------------
 arch/m68k/kernel/dma_no.c               |   75 --------------
 b/arch/m68k/include/asm/cacheflush_no.h |   32 +++++-
 b/arch/m68k/kernel/dma.c                |  165 +++++++++++++++++++++++++++++++-
 4 files changed, 190 insertions(+), 213 deletions(-)
