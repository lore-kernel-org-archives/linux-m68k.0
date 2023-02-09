Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E43C05027
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Feb 2023 01:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbjBIBIa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Feb 2023 20:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbjBIBIa (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Feb 2023 20:08:30 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC07D35B4;
        Wed,  8 Feb 2023 17:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=5K1CVLOH6vblYnAX1/k8Qvq/szlxJFbUumk2+BfdvHs=; b=dfD3o+D1JCPzQt0XL96idc7cXk
        2fS2uWx4eav8Drq5bwvnilPuN3/E4+bW/c2/gdCgoQm541ldHyVFjJRC+j83QlT/MifRG4P0t3tFa
        doArJxcOAN2Y4eYz5DFNIZBlGxnRLgrfUxrKMJgYM5GsYmzyMoBzHtXYCRaPFXlQhMXxC2AlYqn/H
        axF7BvVPQ9ZSY5F+x8KeGHUm8Yu3Un+DutTFxl+th0MDybKwHqN6xX2hWCWC9CQhKaIPTP4DmzmFr
        TaFAVyA3Nf92HHlH/XnXaw6QJPgS2zWnnkm3cyjPYqRNeTOoU88imZ4OjFxcvWx4Tpt03uNU0ZFUx
        k4rfVnHQ==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pPvQI-00HMlO-Ib; Thu, 09 Feb 2023 01:08:26 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org
Subject: [PATCH] m68k: /proc/hardware depends on PROC_FS
Date:   Wed,  8 Feb 2023 17:08:25 -0800
Message-Id: <20230209010825.24136-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When CONFIG_PROC_FS is not set, there is a build error for an unused
function. Make PROC_HARDWARE depend on PROC_FS to prevent this error.

In file included from ../arch/m68k/kernel/setup.c:3:
../arch/m68k/kernel/setup_mm.c:477:12: error: 'hardware_proc_show' defined but not used [-Werror=unused-function]
  477 | static int hardware_proc_show(struct seq_file *m, void *v)
      |            ^~~~~~~~~~~~~~~~~~

Fixes: 66d857b08b8c ("m68k: merge m68k and m68knommu arch directories") # v3.0
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: uclinux-dev@uclinux.org
---
 arch/m68k/Kconfig.devices |    1 +
 1 file changed, 1 insertion(+)

diff -- a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
--- a/arch/m68k/Kconfig.devices
+++ b/arch/m68k/Kconfig.devices
@@ -18,6 +18,7 @@ config HEARTBEAT
 
 # We have a dedicated heartbeat LED. :-)
 config PROC_HARDWARE
+	depends on PROC_FS
 	bool "/proc/hardware support"
 	help
 	  Say Y here to support the /proc/hardware file, which gives you
