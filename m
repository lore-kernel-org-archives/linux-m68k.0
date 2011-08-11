From: <gerg@snapgear.com>
Subject: [PATCH 0/2] m68k: merge mmu and non-mmu traps.c files
Date: Thu, 11 Aug 2011 15:49:49 +1000
Message-ID: <1313041791-26628-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:44186 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036Ab1HKFq1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 11 Aug 2011 01:46:27 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


Merge the mmu arch/m68k/kernel/traps_mm.c and non-mmu traps_no.c.
By moving out the vector setting code the rest of the traps code
is the same for all m68k CPU types.

 a/arch/m68k/kernel/traps_mm.c       | 1092 -----------------------------------
 arch/m68k/kernel/traps_no.c         |  361 -----------
 b/arch/m68k/include/asm/processor.h |    6 
 b/arch/m68k/kernel/Makefile         |    2 
 b/arch/m68k/kernel/traps.c          | 1108 +++++++++++++++++++++++++++++++++++-
 b/arch/m68k/kernel/traps_mm.c       |  115 ---
 b/arch/m68k/kernel/vectors.c        |  145 ++++
 7 files changed, 1257 insertions(+), 1572 deletions(-)
