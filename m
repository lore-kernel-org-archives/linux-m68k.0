Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40D3C4338F
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Jul 2021 14:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8EB460EBD
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Jul 2021 14:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235127AbhGWNYS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Jul 2021 09:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbhGWNYS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Jul 2021 09:24:18 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE7CC061575
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Jul 2021 07:04:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c09c:f31e:25f6:b717])
        by laurent.telenet-ops.be with bizsmtp
        id Ye4n25004167rCQ01e4nQb; Fri, 23 Jul 2021 16:04:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m6vnC-001ojW-Qp; Fri, 23 Jul 2021 16:04:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m6vnC-00BrLx-7n; Fri, 23 Jul 2021 16:04:46 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for 5.14 (take two)
Date:   Fri, 23 Jul 2021 16:04:43 +0200
Message-Id: <20210723140443.2826648-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

	Hi Linus,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.14-tag2

for you to fetch changes up to 21ed49265986931b8921a2404394426870245bd2:

  m68k: MAC should select HAVE_PATA_PLATFORM (2021-07-19 12:18:42 +0200)

----------------------------------------------------------------
m68k updates for v5.14 (take two)

  - Fix a Mac defconfig regression due to the IDE -> ATA switch.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      m68k: MAC should select HAVE_PATA_PLATFORM

 arch/m68k/Kconfig.machine | 1 +
 1 file changed, 1 insertion(+)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
