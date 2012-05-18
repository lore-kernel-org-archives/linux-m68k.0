From: <gerg@snapgear.com>
Subject: [PATCH v2 00/03]: clean up and merge the MMU and non-MMU versions of entry.S
Date: Fri, 18 May 2012 14:22:48 +1000
Message-ID: <1337314971-11087-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:45254 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753349Ab2EREWz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 May 2012 00:22:55 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


With a little cleanup we can use much of the entry.S code on both the
MMU and non-MMU m68k targets.

This is the second iteration of this patch set. I have limited the
changes converting to use the ret_from_exception function entry point
over the label. I have only changed those shared by both the MMU and
non-MMU code. Andreas, does this look more acceptable?

---
 arch/m68k/kernel/entry.S    |  453 +++++++++++++++++++++++++++++++++++++++++++-
 arch/m68k/kernel/entry_mm.S |  423 -----------------------------------------
 arch/m68k/kernel/entry_no.S |  130 ------------
 3 files changed, 452 insertions(+), 554 deletions(-)
