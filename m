Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C75C77B73
	for <linux-m68k@archiver.kernel.org>; Wed, 31 May 2023 12:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236080AbjEaM4d (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 31 May 2023 08:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236070AbjEaM4a (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 31 May 2023 08:56:30 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67BFE4F
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 May 2023 05:56:00 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QWTdV59njz4x2c;
        Wed, 31 May 2023 22:50:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1685537439;
        bh=j993mWpcfEw/pN/dpCaki/QxS9X2laWYNvX3gAG5ZXg=;
        h=From:To:Cc:Subject:Date:From;
        b=px5prZxpmwU7UYPlYYLFYX9F76c2aM3QB+KxSg+t1HCWiYC9uFDA8rbvKY2EfM7gX
         7XKKZy7zstG0BPpu/aKAN1Mn/GxYHEb+jaO370oKN75C01T49CmEEGNQYqTxigpLz4
         NKR449A+SZixJcN/gKihAW+oHCnPqxG0TCWL18ZI0+sDtPX7jgGnS7ZRaTPWnPAYHQ
         QPrF1Qydntlub/+o3Fcli85CPF6PFMmTyYEVpIG/ahPCLszswqM++XnHnQpR9n9CbE
         ST3VE4kLiJhSARwuplQwn2pRRZikabmOFCDEpv6LAl3JU4N1KVkgEzq5xtU4WerJgh
         NqY3H52akGKZg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     <linuxppc-dev@lists.ozlabs.org>
Cc:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Exclude m68k-only drivers from powerpc entry
Date:   Wed, 31 May 2023 22:50:23 +1000
Message-Id: <20230531125023.1121060-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The powerpc section has a "F:" entry for drivers/macintosh, matching all
files in or below drivers/macintosh. That is correct for the most part,
but there are a couple of m68k-only drivers in the directory, so exclude
those.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 250518fc70ff..9bbb613d386a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11916,6 +11916,8 @@ L:	linuxppc-dev@lists.ozlabs.org
 S:	Odd Fixes
 F:	arch/powerpc/platforms/powermac/
 F:	drivers/macintosh/
+X:	drivers/macintosh/adb-iop.c
+X:	drivers/macintosh/via-macii.c
 
 LINUX FOR POWERPC (32-BIT AND 64-BIT)
 M:	Michael Ellerman <mpe@ellerman.id.au>
-- 
2.40.1

