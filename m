Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D4FC433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 06:53:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A7FB6113E
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 06:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234694AbhIPGy1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 02:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234648AbhIPGy1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Sep 2021 02:54:27 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A92CC061574
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Sep 2021 23:53:06 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:39fa:3565:945d:98f4])
        by baptiste.telenet-ops.be with bizsmtp
        id uWt32500M3mHZPk01Wt3YJ; Thu, 16 Sep 2021 08:53:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQlGZ-0052Oc-C1; Thu, 16 Sep 2021 08:53:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQlGY-003Fii-PN; Thu, 16 Sep 2021 08:53:02 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v5.15 (take two)
Date:   Thu, 16 Sep 2021 08:52:57 +0200
Message-Id: <20210916065257.775368-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

	Hi Linus,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.15-tag2

for you to fetch changes up to a7b68ed15d1fd72c1e451d5eb6edebee2a624b90:

  m68k: mvme: Remove overdue #warnings in RTC handling (2021-09-13 11:19:05 +0200)

----------------------------------------------------------------
m68k updates for v5.15 (take two)

  - Warning fixes to mitigate CONFIG_WERROR=y.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      m68k: mvme: Remove overdue #warnings in RTC handling

Guenter Roeck (1):
      m68k: Double cast io functions to unsigned long

 arch/m68k/include/asm/raw_io.h | 20 ++++++++++----------
 arch/m68k/mvme147/config.c     |  4 +++-
 arch/m68k/mvme16x/config.c     |  4 +++-
 3 files changed, 16 insertions(+), 12 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
