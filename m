From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 0/3] m68k: flat file load fix and cleanup
Date: Fri, 22 Jul 2016 10:40:06 +1000
Message-ID: <1469148009-25426-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:64836
	"EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752818AbcGVAsg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Jul 2016 20:48:36 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>


The following 3 patches fix m68k loading of flat binaries on MMU-enabled
systems, and then based on that we can cleanup and combine some common
code.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 b/arch/m68k/include/asm/flat.h      |    8 +++++++-
 b/arch/m68k/include/asm/processor.h |   15 +--------------
 2 files changed, 8 insertions(+), 15 deletions(-)
