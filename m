Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B78C43332
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Dec 2020 18:47:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD3DA23C16
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Dec 2020 18:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgLUSre (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Dec 2020 13:47:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:51374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726632AbgLUSrd (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 21 Dec 2020 13:47:33 -0500
Subject: Re: [git pull] m68knommu changes for v5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608576412;
        bh=nK4Z/Iwk76U3rQdVl40afO+p4QfvFpjmfrzQIVOYink=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=EcL5+Gm8D0ZVi7D0vhnUwRG45WwQQhlOYastgoUsGAqQ+X8sxRS2tXxNqRtaYPxM3
         /xh6FYFXpqbUCTB/Rux5AxLLZOisVc9+7IdjD4p2rO5SBppT/AIL/TS00Vv+WxWD9k
         TRSHUx0WPYpFsAQOeKjDGoPM3Ig4nsOYVMJ0T/wQGpVvsf7u124fbGbXVlmBL7uZ6+
         KGjj9rW8Qnqqs5M0zbAJ9LLq8pm47Jgqv+IYTz0JbMF0ItkeS16H8hk9kfKwQxJPEI
         ki9toNIMKT2tTUt/N2uLurVmF64UVNIJvpXlx7Tu8MN3tEmBXAw6UHHr/YUh2ULyuK
         N490PXD3kgnhQ==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <b38f2450-9e60-8312-5eb9-220f8956218d@linux-m68k.org>
References: <b38f2450-9e60-8312-5eb9-220f8956218d@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <b38f2450-9e60-8312-5eb9-220f8956218d@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.11
X-PR-Tracked-Commit-Id: 8b22820efb35f93d98638563b0a8f4094e8ee399
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8552d28e140110fc935b39a6bfaf33c8ce3a1ad5
Message-Id: <160857641278.14812.10496775240326818768.pr-tracker-bot@kernel.org>
Date:   Mon, 21 Dec 2020 18:46:52 +0000
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     torvalds@linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 21 Dec 2020 09:34:22 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8552d28e140110fc935b39a6bfaf33c8ce3a1ad5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
