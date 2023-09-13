Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD84BEDEC5B
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 13:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241019AbjIMNou (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 09:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241006AbjIMNou (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 09:44:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AD219B1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:44:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B5C80B8240C;
        Wed, 13 Sep 2023 13:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01BAC433D9;
        Wed, 13 Sep 2023 13:44:43 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org
Subject: [PATCH 0/7] m68knommu: W=1 fixes
Date:   Wed, 13 Sep 2023 23:44:18 +1000
Message-Id: <20230913134425.2610927-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

As a follow up to Geet's "[PATCH 0/52] m68k: W=1 fixes" series,
https://lore.kernel.org/lkml/cover.1694093327.git.geert@linux-m68k.org/T/ ,
this series adds fixes specific to nommu and ColdFire configurations.

Mostly similar fixes to what Geert had to do, and not too many all up.

Regards
Greg


 arch/m68k/68000/ints.c          |    5 ++++-
 arch/m68k/68000/ints.h          |    7 +++++++
 arch/m68k/68000/timers.c        |    2 ++
 arch/m68k/coldfire/intc.c       |    4 ++--
 arch/m68k/coldfire/vectors.c    |    2 ++
 arch/m68k/coldfire/vectors.h    |    3 +++
 arch/m68k/include/asm/mcfgpio.h |    8 ++++----
 arch/m68k/kernel/uboot.c        |   13 ++++++++-----
 arch/m68k/mm/mcfmmu.c           |    3 +--
 9 files changed, 33 insertions(+), 14 deletions(-)



