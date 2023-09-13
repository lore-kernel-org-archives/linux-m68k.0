Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E55EDEC4D
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 12:52:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240674AbjIMMwR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 08:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236061AbjIMMwQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 08:52:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DEFB19B6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 05:52:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8A8696192D;
        Wed, 13 Sep 2023 12:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37075C433C7;
        Wed, 13 Sep 2023 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694609531;
        bh=PGBCwhG6o5W8kMWGlUW8meZy3NP5/0KVuOuJOSWPWlg=;
        h=From:To:Cc:Subject:Date:From;
        b=exPc2SPKeHJCN4iRQhaliRAY04qHLANku44dMNt2WAqF/AsBIIWnPSZA7PH2AkrFw
         r0yM+RH+hofe0Z2tPW1FSnhcklUrs1RHoi8YeKDhXzMzpJBS4n7IpYNLwnflVI0Rdo
         oiVaTtdWME/wkLusQuyZD7jtSbv7aaA73vssnNMlyb5JRckyEDaPQk7QCR7uQTJV9n
         xzohSww0UYvZFwkhp2Ux5+lE/iuiisBMyNNIx6oy6jUJxfTZyo4td6882RDmRCJfkJ
         eh2QbdytsgSIZkuXOwEmDrDG/pjkRIDfjkes85HXHWnYEUR8DqlAczSdVFsei3I+O/
         rNY9GS+pUA96A==
From:   Greg Ungerer <gerg@kernel.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] m68knommu: improve config ROM setting defaults
Date:   Wed, 13 Sep 2023 22:51:59 +1000
Message-Id: <20230913125159.2128567-1-gerg@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@linux-m68k.org>

The ROM region configuration settings used on some nommu m68k systems
(historically mostly 68328 (Dragonball) CPUs) default to an address
of 0. That can easily clash with default RAM address settings which
also default to 0. Of course that is invalid and those ranges overlap,
but if you make no value selection that is what you end up with. Those
default values produce a valid configuration but will fail compilation
like this:

    m68k-linux-ld: section .rodata VMA [0000000000001000,0000000000262227] overlaps section .text VMA [0000000000000400,0000000000455e7f]

Looking at the platforms that use the ROM region configuration settings
it is clear that we can choose much better defaults than 0. By far the
most comman ROM region settings are these:

    CONFIG_ROMVEC=0x10c10000
    CONFIG_ROMSTART=0x10c10400

So lets make these the default values.

It is still possible to configure overlapping ROM and RAM regions, but
at least the defult selections are now valid.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305301407.z33zOjcG-lkp@intel.com/
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig.machine | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 1f3574aef638..d06b1c5d9b0c 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -441,7 +441,7 @@ config ROM
 
 config ROMVEC
 	hex "Address of the base of the ROM vectors"
-	default "0"
+	default "0x10c10000"
 	depends on ROM
 	help
 	  This is almost always the same as the base of the ROM. Since on all
@@ -450,7 +450,7 @@ config ROMVEC
 
 config ROMSTART
 	hex "Address of the base of system image in ROM"
-	default "0x400"
+	default "0x10c10400"
 	depends on ROM
 	help
 	  Define the start address of the system image in ROM. Commonly this
-- 
2.25.1

