Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417ACC07E99
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 19:24:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B4FB61985
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 19:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhGET0q (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jul 2021 15:26:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:40824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229982AbhGET0q (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 5 Jul 2021 15:26:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D368061973;
        Mon,  5 Jul 2021 19:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625513048;
        bh=nnEtudmIgnqnaKAZ+cqahPRnZyq1wGPbsLkorTy13q8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=BBgio68cw86oKobs7+5U1K60E/LNDwGiUYWekcRUS3ALIrg8k2SMKLqkJwVZwh0zw
         lR88+5j8vJPlCibn1za5V70dAEe9uBIBjE3LsjGtNTKk7jlB18AKKbtttk8m89ClsB
         g+WLWC+X6rQsxI8kR3XEItt/fNPjUwU1mOYon1eWkkL8X7OA5BwXuBKxFogek3GJ5C
         HoTpJA58/BJOvwW3pkO/SlQHGH8Hdf1dMFjh3cxPOq0VSkAFwx0IOM9VzaVHBWavhn
         lUpJTyKxSkEXmpGGmYUDjicgGxHE3g/gaeewNfV3so8VRCGwHahTAlugh245emRkrR
         JZSQzlO8qqnNA==
Subject: Re: [git pull] m68knommu changes for v5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <f1a49aed-3498-ee1c-a29c-77f900970308@linux-m68k.org>
References: <f1a49aed-3498-ee1c-a29c-77f900970308@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <f1a49aed-3498-ee1c-a29c-77f900970308@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.14
X-PR-Tracked-Commit-Id: 3f605ee17f8e785ba6ff69bee8e584e377a3cf28
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8fc4fb1728855a22f9149079ba51877f5ee61fc9
Message-Id: <162551304882.9654.3371212168119343265.pr-tracker-bot@kernel.org>
Date:   Mon, 05 Jul 2021 19:24:08 +0000
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     torvalds@linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 5 Jul 2021 11:15:32 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8fc4fb1728855a22f9149079ba51877f5ee61fc9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
