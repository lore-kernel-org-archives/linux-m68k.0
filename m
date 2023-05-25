Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BC5C77B7A
	for <linux-m68k@archiver.kernel.org>; Thu, 25 May 2023 17:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240888AbjEYRdt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 25 May 2023 13:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjEYRds (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 25 May 2023 13:33:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806FEE43
        for <linux-m68k@lists.linux-m68k.org>; Thu, 25 May 2023 10:33:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E6F7E6481E;
        Thu, 25 May 2023 17:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57191C433D2;
        Thu, 25 May 2023 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685036017;
        bh=wEEgGo/3a4FO+gQ7yDuNpSKY17IRjGLZOy18Dr8aYsc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=KjQW+AC25/0+yMDqMzBUN2csPhcMaJxxbDHUQcGp9mWU3psfmJVVOued2c1gT0mSr
         JRTlz+wSRaoVFoFlzejBsjgWZUc4TYzrxPr+chOBFg32lBeRQsvdLsH9NPkKrIyaOF
         3sSKQijZTwz0XVWOw89AUKsGgdDJfdRbYewfCcV0Zbj2uCdL3EaXmDRANATqMKhtqG
         IhZs/t/5sqqboM6Z1nT/dsGw4CKthm0Flm1+5MX2RgbV20nh5RtvR/tiw/UIHEleii
         HL5xdgwO/iKJRGKSDTCZs5WQqN1TU/4R/J5nNSyAjSxbW32xI3tye0N9lTZKeGy2gG
         FYEdRhYvtGAjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 45B8BC395DF;
        Thu, 25 May 2023 17:33:37 +0000 (UTC)
Subject: Re: [GIT PULL] m68k fixes for v6.4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230525073545.3225081-1-geert@linux-m68k.org>
References: <20230525073545.3225081-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230525073545.3225081-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.4-tag2
X-PR-Tracked-Commit-Id: b845b574f86dcb6a70dfa698aa87a237b0878d2a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5566051fa67352af069e0eb4b047f2b832b9a1cc
Message-Id: <168503601727.13926.4521381185593167712.pr-tracker-bot@kernel.org>
Date:   Thu, 25 May 2023 17:33:37 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Thu, 25 May 2023 09:35:45 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.4-tag2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5566051fa67352af069e0eb4b047f2b832b9a1cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
