Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77147C43461
	for <linux-m68k@archiver.kernel.org>; Tue,  4 May 2021 18:30:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D65761157
	for <linux-m68k@archiver.kernel.org>; Tue,  4 May 2021 18:30:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhEDSbF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 4 May 2021 14:31:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:34054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231921AbhEDSbC (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 4 May 2021 14:31:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 20D67613D8;
        Tue,  4 May 2021 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620153007;
        bh=XjyOLWDTdPUqM1r+CAAtypP5rqJRtoNYx5ueA+ZPB4w=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=e6EZp1Uuo++Cbi2ysOB5EisUDv3/sKmmYd0sfI/LH/D17lV/6Ygbyl578VDLcgqIj
         Ux+vUU34juIS5YTFEqvj0AeWC+nj+eIo4ESPH5SLDwUMA1q8m9xjm18q3CNKIWSI52
         i/Yhgl00hHaknN5x5SkURv3xY2ncTE3NCrLUdQm2ldl8CKeLz+6N8EUovoJYO21odo
         nYb1z9IL0Dk13BWH51ovoPi5XDtmpbKgYkKTxbw7A5CIzV9JsFKihDVlH7RZTlyYnh
         8miSl6Kg1J4t+4CG/jruTdjcKUO+q5K51e1abfMc5TyEIP7tAey8slBRFSVXQP3+lt
         cE5VnZFs94ZwQ==
Subject: Re: [git pull] m68knommu changes for v5.13
From:   pr-tracker-bot@kernel.org
In-Reply-To: <b2180862-6e08-d813-ac65-83052f87be1c@linux-m68k.org>
References: <b2180862-6e08-d813-ac65-83052f87be1c@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <b2180862-6e08-d813-ac65-83052f87be1c@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.13
X-PR-Tracked-Commit-Id: 6b3788e5fb8041211ac2fa7c818ca9010e976a74
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 51e6f07cb12e50bfc71181bd08bad5f0a9b5e9e2
Message-Id: <162015300708.4220.1619890891845350084.pr-tracker-bot@kernel.org>
Date:   Tue, 04 May 2021 18:30:07 +0000
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     torvalds@linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Tue, 4 May 2021 10:14:45 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/51e6f07cb12e50bfc71181bd08bad5f0a9b5e9e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
