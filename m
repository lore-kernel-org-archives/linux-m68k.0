Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620D3C4338F
	for <linux-m68k@archiver.kernel.org>; Thu, 29 Jul 2021 02:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F3106056C
	for <linux-m68k@archiver.kernel.org>; Thu, 29 Jul 2021 02:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbhG2CJb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Jul 2021 22:09:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233162AbhG2CJa (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 28 Jul 2021 22:09:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D52560462;
        Thu, 29 Jul 2021 02:09:26 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v5.14-rc4
To:     torvalds@linux-foundation.org
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Message-ID: <5e52d59b-09df-be5a-8be9-459949eb16e2@linux-m68k.org>
Date:   Thu, 29 Jul 2021 12:09:25 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

Please pull the m68knommu git tree, for-linus branch.
A single compile time fix.

Regards
Greg



The following changes since commit ff1176468d368232b684f75e82563369208bc371:

   Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

for you to fetch changes up to 9f66861181e64dc192bea136da6c91528910002e:

   m68k/coldfire: change pll var. to clk_pll (2021-07-26 08:41:38 +1000)

----------------------------------------------------------------
Randy Dunlap (1):
       m68k/coldfire: change pll var. to clk_pll

  arch/m68k/coldfire/m525x.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
