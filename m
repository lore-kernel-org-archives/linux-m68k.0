Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAF1C43461
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Apr 2021 01:14:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0733F6120A
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Apr 2021 01:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236104AbhDLBOT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 11 Apr 2021 21:14:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236199AbhDLBOS (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 11 Apr 2021 21:14:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C88761206;
        Mon, 12 Apr 2021 01:13:59 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu fix for v5.12-rc7
To:     torvalds@linux-foundation.org
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Message-ID: <274538fc-42c0-e425-53a8-6a2f0234aae1@linux-m68k.org>
Date:   Mon, 12 Apr 2021 11:13:57 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

Please pull the m68knommu tree for-linus branch.

It contains a single regression fix.
Some m68k platforms with non-zero memory base fail to boot
with recent flatmem changes.

Sorry for getting this to you so late.
I have been out on vacation and this slipped through the cracks.

Regards
Greg




The following changes since commit d434405aaab7d0ebc516b68a8fc4100922d7f5ef:

   Linux 5.12-rc7 (2021-04-11 15:16:13 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.12-rc7

for you to fetch changes up to d2bd44c4c05d043fb65cfdf26c54e6d8b94a4b41:

   m68k: fix flatmem memory model setup (2021-04-12 09:34:26 +1000)

----------------------------------------------------------------
Single regression fix:
. fix pfn offset (stops booting on some platforms)

----------------------------------------------------------------
Angelo Dureghello (1):
       m68k: fix flatmem memory model setup

  arch/m68k/include/asm/page_mm.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
