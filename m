From: <gerg@snapgear.com>
Subject: [PATCH 00/03] m68k: clean up and merge MMU and non-MMU versions of entry.S
Date: Tue, 15 May 2012 16:55:46 +1000
Message-ID: <1337064949-966-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:46358 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752574Ab2EOG57 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 15 May 2012 02:57:59 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


m68k: clean up and merge the MMU and non-MMU versions of entry.S

With a little cleanup we can use much of the entry.S code on both the
MMU and non-MMU m68k targets.

---
 arch/m68k/kernel/entry.S    |  452 +++++++++++++++++++++++++++++++++++++++++++-
 arch/m68k/kernel/entry_mm.S |  422 -----------------------------------------
 arch/m68k/kernel/entry_no.S |  130 ------------
 3 files changed, 451 insertions(+), 553 deletions(-)
