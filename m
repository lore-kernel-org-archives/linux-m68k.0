Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F71C4332F
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Nov 2023 20:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344777AbjKAUuR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Nov 2023 16:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344483AbjKAUuP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Nov 2023 16:50:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6DD119
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Nov 2023 13:50:11 -0700 (PDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
        by dfw.source.kernel.org (Postfix) with ESMTP id 7BE9361227;
        Wed,  1 Nov 2023 20:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B661AC433D9;
        Wed,  1 Nov 2023 20:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698871809;
        bh=wWTHb4PFfM3WJqosoBrMzdLLvzOm8eLGbZxT7VfvWtI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=q7Cy8GdDGZebqAbr0kmADA1iZLnAqWlFCreIng/ohFaG40ztuEqAoFtw14aeXcQm5
         mA4FE32A7JmRmVV/wcG5yTmp9jRGXb3bCgIVMCrCW1Q9BV+JeAIPPZyXeAOwCYq8GH
         YitSU3RIXCdy+6Pr3jAZuRKV2/4b1nniqa/qn/dF+20JaSLEUzKmlMkoLMsI0TydgW
         x4T0dchl9zprgRwUCxuFlkbLztke1gqpE0atTJGHJSiRclNgOiJxdf1a2eNrq6Supi
         xDpahPbhnsfJKuYTT1yNwhdffDYuxk/MZKlBZcCePU1aq6lP3FbNaR4EU4kzwIpRVL
         odd9OkSuI9jBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A54C9C4316B;
        Wed,  1 Nov 2023 20:50:09 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20231030101249.1621533-1-geert@linux-m68k.org>
References: <20231030101249.1621533-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231030101249.1621533-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.7-tag1
X-PR-Tracked-Commit-Id: 03191fb3db3d2585725bcffe0356d12fcfd27c4c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 979ff1e5af8a46f75a69ffa86209f8650547f42f
Message-Id: <169887180967.2957.3961967714729802091.pr-tracker-bot@kernel.org>
Date:   Wed, 01 Nov 2023 20:50:09 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 30 Oct 2023 11:12:49 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.7-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/979ff1e5af8a46f75a69ffa86209f8650547f42f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
