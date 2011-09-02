From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: remove unused fasthandler declaration
Date: Fri, 2 Sep 2011 15:17:10 +1000
Message-ID: <1314940630-31757-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:41538 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904Ab1IBFUp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Sep 2011 01:20:45 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The fasthandler code was removed long ago. Remove the now unused
declaration of it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/entry.S |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/platform/coldfire/entry.S b/arch/m68k/platform/coldfire/entry.S
index 3157461..f567a16 100644
--- a/arch/m68k/platform/coldfire/entry.S
+++ b/arch/m68k/platform/coldfire/entry.S
@@ -54,7 +54,6 @@ sw_usp:
 .globl ret_from_signal
 .globl sys_call_table
 .globl inthandler
-.globl fasthandler
 
 enosys:
 	mov.l	#sys_ni_syscall,%d3
-- 
1.7.0.4
