Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB5CECAAA3
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Aug 2022 04:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237153AbiHZEED (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Aug 2022 00:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbiHZEEC (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 26 Aug 2022 00:04:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9CCA1A78
        for <linux-m68k@vger.kernel.org>; Thu, 25 Aug 2022 21:04:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3979B61E89
        for <linux-m68k@vger.kernel.org>; Fri, 26 Aug 2022 04:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE787C433D7;
        Fri, 26 Aug 2022 04:03:59 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 3/3] m68k: allow kexec on all MMU enabled CPUs
Date:   Fri, 26 Aug 2022 14:03:02 +1000
Message-Id: <20220826040302.3455339-3-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826040302.3455339-1-gerg@linux-m68k.org>
References: <20220826040302.3455339-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The configuration setting for 68k kexec support limits it to only
the classic 68k CPU types (so no ColdFire). However the underlying
support can handle any 68k CPU that is MMU enabled - and that includes
ColdFire. (Of course that support is only as good as mentioned in
the current configuration help).

None of the no-MMU CPU types (classic or ColdFire) have support for
kexec yet, so the configuration as it stands is not quite right, and
it will fail to compile on them.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index b06faf6c0b27..fa6e69ec0b38 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -87,7 +87,7 @@ config MMU_SUN3
 
 config KEXEC
 	bool "kexec system call"
-	depends on M68KCLASSIC
+	depends on MMU
 	select KEXEC_CORE
 	help
 	  kexec is a system call that implements the ability to shutdown your
-- 
2.25.1

