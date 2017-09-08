From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 0/3] m68k: coldfire MMU fixes
Date: Fri,  8 Sep 2017 17:00:58 +1000
Message-ID: <1504854061-12830-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:28517
        "EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754450AbdIHHKf (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Sep 2017 03:10:35 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org


The following patch series fixes some issues with the initialization phase
of the ColdFire MMU system startup. With these fixes applied we can also
enable and run the ColdFire 5441x family of parts with their MMU enabled.

 arch/m68k/Kconfig.cpu               |    2 +-
 arch/m68k/coldfire/m54xx.c          |    4 ----
 arch/m68k/include/asm/mcfmmu.h      |    1 +
 arch/m68k/include/asm/mmu_context.h |    1 -
 arch/m68k/kernel/setup_mm.c         |    2 ++
 arch/m68k/mm/mcfmmu.c               |    4 ++--
 6 files changed, 6 insertions(+), 8 deletions(-)
