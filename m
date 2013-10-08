From: Mark Salter <msalter@redhat.com>
Subject: [PATCH v2 05/14] m68k: select ARCH_MAY_HAVE_PC_PARPORT
Date: Tue,  8 Oct 2013 01:10:21 -0400
Message-ID: <1381209030-351-6-git-send-email-msalter@redhat.com>
References: <1381209030-351-1-git-send-email-msalter@redhat.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:15352 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752509Ab3JHFMf (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 8 Oct 2013 01:12:35 -0400
In-Reply-To: <1381209030-351-1-git-send-email-msalter@redhat.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Mark Salter <msalter@redhat.com>, linux-m68k@vger.kernel.org

Architectures which support CONFIG_PARPORT_PC should select
ARCH_MAY_HAVE_PC_PARPORT.

Signed-off-by: Mark Salter <msalter@redhat.com>
Acked by: Geert Uytterhoeven <geert@linux-m68k.org>
CC: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 311a300..0d88a0b 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -1,6 +1,7 @@
 config M68K
 	bool
 	default y
+	select ARCH_MAY_HAVE_PC_PARPORT if ISA
 	select HAVE_IDE
 	select HAVE_AOUT if MMU
 	select HAVE_DEBUG_BUGVERBOSE
-- 
1.8.3.1
