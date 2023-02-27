Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A46BC64ED6
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 07:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjB0HFg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 02:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjB0HFg (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Feb 2023 02:05:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0CE1B2D5;
        Sun, 26 Feb 2023 23:05:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E7EF260CEB;
        Mon, 27 Feb 2023 07:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E56C4339B;
        Mon, 27 Feb 2023 07:05:32 +0000 (UTC)
Message-ID: <9cbb5e07-9390-9758-b3ba-bfbf0d594c66@linux-m68k.org>
Date:   Mon, 27 Feb 2023 17:05:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v6.3
To:     torvalds@linux-foundation.org
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

Please pull the m68knommu git tree changes for v6.3.

Two changes with spelling fixes only.

Regards
Greg



The following changes since commit ceaa837f96adb69c0df0397937cd74991d5d821a:

   Linux 6.2-rc8 (2023-02-12 14:10:17 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v6.3

for you to fetch changes up to 5aa52ccf692bfef7ddc23c2be1d48524a4427527:

   m68k: nommu: Fix misspellings of "DragonEngine" (2023-02-13 08:56:39 +1000)

----------------------------------------------------------------
m68knommu: updates and fixes for v6.3

Fixes include:
. misspelling corrections

----------------------------------------------------------------
Geert Uytterhoeven (2):
       m68k: nommu: Fix misspellings of "uCdimm"
       m68k: nommu: Fix misspellings of "DragonEngine"

  arch/m68k/68000/dragen2.c | 2 +-
  arch/m68k/Kconfig.machine | 8 ++++----
  2 files changed, 5 insertions(+), 5 deletions(-)
