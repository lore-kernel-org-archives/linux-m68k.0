Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F01C433FE
	for <linux-m68k@archiver.kernel.org>; Sat,  5 Dec 2020 03:50:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 349ED22D58
	for <linux-m68k@archiver.kernel.org>; Sat,  5 Dec 2020 03:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgLEDuO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 4 Dec 2020 22:50:14 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:40450 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgLEDuN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 4 Dec 2020 22:50:13 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
        id 1A4412B617; Fri,  4 Dec 2020 22:49:32 -0500 (EST)
To:     "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc:     "Michael Ellerman" <mpe@ellerman.id.au>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Joshua Thompson" <funaho@jurai.org>,
        linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Message-Id: <fbac2cd8632bb719f48cd1368910abd310548a0e.1607139987.git.fthain@telegraphics.com.au>
From:   Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] MAINTAINERS: Update 68k Mac entry
Date:   Sat, 05 Dec 2020 14:46:27 +1100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Two files under drivers/macintosh are actually m68k-only. I think that
patches for these files should be reviewed in the appropriate forum and
merged via the appropriate tree, rather than falling to the powerpc
maintainers to deal with. Update the "M68K ON APPLE MACINTOSH" section
accordingly.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Joshua Thompson <funaho@jurai.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-m68k@lists.linux-m68k.org
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 867157311dc8..e8fa0c9645d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10322,6 +10322,8 @@ L:	linux-m68k@lists.linux-m68k.org
 S:	Maintained
 W:	http://www.mac.linux-m68k.org/
 F:	arch/m68k/mac/
+F:	drivers/macintosh/adb-iop.c
+F:	drivers/macintosh/via-macii.c
 
 M68K ON HP9000/300
 M:	Philip Blundell <philb@gnu.org>
-- 
2.26.2

