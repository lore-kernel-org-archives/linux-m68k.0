Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F16C00528
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 06:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjGYG6J (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jul 2023 02:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbjGYG6C (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jul 2023 02:58:02 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46B11735
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 23:57:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2d50:2ea4:d4e1:2af3])
        by baptiste.telenet-ops.be with bizsmtp
        id RJxw2A00D2TBYXr01Jxw2G; Tue, 25 Jul 2023 08:57:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOBzL-002Rg8-AN;
        Tue, 25 Jul 2023 08:57:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOBzY-007GXP-6g;
        Tue, 25 Jul 2023 08:57:56 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k fixes for v6.5
Date:   Tue, 25 Jul 2023 08:57:52 +0200
Message-Id: <20230725065752.1731858-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

	Hi Linus,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.5-tag2

for you to fetch changes up to 922a9bd138101e3e5718f0f4d40dba68ef89bb43:

  m68k: Fix invalid .section syntax (2023-07-24 14:50:02 +0200)

----------------------------------------------------------------
m68k fixes for v6.5

  - Fix the build when using the toolchain in Debian unstable.

Thanks for pulling!

----------------------------------------------------------------
Ben Hutchings (1):
      m68k: Fix invalid .section syntax

 arch/m68k/fpsp040/skeleton.S       | 4 ++--
 arch/m68k/ifpsp060/os.S            | 4 ++--
 arch/m68k/kernel/relocate_kernel.S | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
