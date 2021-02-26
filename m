Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48800C433DB
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Feb 2021 03:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF0C764EE3
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Feb 2021 03:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhBZDYd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 25 Feb 2021 22:24:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:34982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229460AbhBZDYc (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 25 Feb 2021 22:24:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2404364E7A;
        Fri, 26 Feb 2021 03:23:50 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v5.12
To:     torvalds@linux-foundation.org
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <66454ec0-9ca9-b4f5-1cd4-81204b2d120b@linux-m68k.org>
Date:   Fri, 26 Feb 2021 13:23:48 +1000
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

Please pull the m68knommu changes for v5.12.

Only a single change. NULL parameter check in the local ColdFire
clocking code.

Regards
Greg



The following changes since commit 92bf22614b21a2706f4993b278017e437f7785b3:

   Linux 5.11-rc7 (2021-02-07 13:57:38 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.12

for you to fetch changes up to c1fb1bf64bb63a1d6ae3311a9a3581a527c1f185:

   m68k: let clk_enable() return immediately if clk is NULL (2021-02-08 08:15:17 +1000)

----------------------------------------------------------------
m68knommu: updates for v5.12

- NULL clk parameter check in clk_enable()

----------------------------------------------------------------
Defang Bo (1):
       m68k: let clk_enable() return immediately if clk is NULL

  arch/m68k/coldfire/clk.c | 4 ++++
  1 file changed, 4 insertions(+)
