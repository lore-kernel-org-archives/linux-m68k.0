Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3966EC4338F
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Jul 2021 19:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D87060F45
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Jul 2021 19:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhGWSaH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Jul 2021 14:30:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230164AbhGWSaG (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Jul 2021 14:30:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 08C4260F02;
        Fri, 23 Jul 2021 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627067439;
        bh=49ooZBeHeqBoyhiWeQBkGQ72kupOShavXchEdZECwFA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=gjWmcpNvjwzjSOpFbmBvAzatGs4ouP83vU67U/fR174Altfm0KBbUYPzwF0YJ4Gka
         C5qayuPOixYjq9SE0N2FrLXfVBbZyBKTp9Vd07/SYP8F9+3LySzibkpyJTmv1m4lIG
         WWiyeywUmOixPKrGQc7WamxbDVtPl5Y3P7M5sSZdERLjPsZfMXIFSTeYvNbf5Hpm9O
         AIWPg2aQraUvTu4n2MWEuUQELOS36NoOuOaRY3EXcWEtqw9RVDo9raIKm5wdSOeRm4
         jxmCUasP9ic5r+NUd+jPw6DQ9XiaXtvg03ZK1Zh84g8SuFOpTRBZLD/qQ7Ix2jOyml
         ltZYxkkv50lbw==
Subject: Re: [GIT PULL] m68k updates for 5.14 (take two)
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210723140443.2826648-1-geert@linux-m68k.org>
References: <20210723140443.2826648-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210723140443.2826648-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.14-tag2
X-PR-Tracked-Commit-Id: 21ed49265986931b8921a2404394426870245bd2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1af09ed5ae4d2d3bb3cc2e233f39f52be4147200
Message-Id: <162706743900.23984.7958494892975321596.pr-tracker-bot@kernel.org>
Date:   Fri, 23 Jul 2021 19:10:39 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Fri, 23 Jul 2021 16:04:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.14-tag2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1af09ed5ae4d2d3bb3cc2e233f39f52be4147200

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
