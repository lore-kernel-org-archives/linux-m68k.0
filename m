Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D98CC001B0
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Aug 2023 21:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbjHIVLE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Aug 2023 17:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjHIVLE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 9 Aug 2023 17:11:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020CD10CA
        for <linux-m68k@lists.linux-m68k.org>; Wed,  9 Aug 2023 14:11:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5B5F663182;
        Wed,  9 Aug 2023 21:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA46DC433C9;
        Wed,  9 Aug 2023 21:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691615462;
        bh=BzKO4U1A9Pg48evAvr4KXsSow72w1vhtSaYZE8tLaDE=;
        h=From:To:Cc:Subject:Date:From;
        b=JdUnJ78Kq9r+M/3baHIQcsnjr+sQWETJMmrjepw2tReZhw8wppIYENuXflmJJhwu0
         QrV2XcW6GcNTkM/uWOUjXrFSwX4ro+pbKiEgrkH+LcZG6djX9d+HJX+Dbq4dFSszTe
         RbsCs4UNI4DgZTAk7ViZprEeOj9q1NnfyPgqAPoAVQ8deIfQnoAo5+KGdf/D5IXLzo
         l3IbaW2ZeMT0aKgVZnrcT0awqinPCtr++mfZnCdyPy/jUJ73PrfDO0SgUX2xaP4N5C
         UR80Ns0A2toOUhDh8GtUdFYoTHdGAl3llEGo5gYxtvCmhxlUZO4n0qjo3sOAMQDOZz
         QGTfem6LgJ5uQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] m68k: define __div64_32() to avoid a warning
Date:   Wed,  9 Aug 2023 23:10:49 +0200
Message-Id: <20230809211057.60514-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The generic __div64_32() definition is built on all architectures that don't
provide this as a macro. m68k however neither defines nor requires __div64_32,
so it should define an empty one to avoid the warning:

lib/math/div64.c:31:32: error: no previous prototype for '__div64_32' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/include/asm/div64.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/include/asm/div64.h b/arch/m68k/include/asm/div64.h
index 365f39f5e256f..df1f6b450cc51 100644
--- a/arch/m68k/include/asm/div64.h
+++ b/arch/m68k/include/asm/div64.h
@@ -31,6 +31,9 @@
 	__rem;							\
 })
 
+/* defining this stops the unused helper function from being built */
+#define __div64_32 __div64_32
+
 #endif /* CONFIG_CPU_HAS_NO_MULDIV64 */
 
 #endif /* _M68K_DIV64_H */
-- 
2.39.2

