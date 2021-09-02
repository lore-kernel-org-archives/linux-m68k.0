Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002F1C432BE
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Sep 2021 02:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D78BE610CD
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Sep 2021 02:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhIBCPJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Sep 2021 22:15:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:37072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233041AbhIBCPJ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 1 Sep 2021 22:15:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A0E55610CA;
        Thu,  2 Sep 2021 02:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630548851;
        bh=kKqf5AOp6ZK+VPZzX5LEbzAxpYG9hJXwZgERkx5stgM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=S5MwE4Gp4/WE6EAaXxE+zhTTcyQgJwG4vq6PtNmPVQ+Liv5PiCKpvqWYtNBHB+OD9
         PRyvhPR/0X1igO3oUq+YU9lxJYNS6y+XeAW7Mfp9eTT2g+HbotBDyTVaDdJE7ZEXiG
         34N+4hiVwOhLr3VZlLNZu8nPTK4Xu8bJzQrPCyuyq34/DItz4a/HggHNlxFtEqZ2wI
         BBOlBEayY5x17Z62pi6xcoA0gXBAoBwDWJjwd3oq7ck0A4jjZghlxQNOJnYQMW5907
         4lYYnkEPXUUqPoJxmyhL1opVjBXlr3IFLJBjdQqTnaPeolah2onkHvBTJudVjAxySw
         irCjqK9Ofz4Sw==
Subject: Re: [git pull] m68knommu changes for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <40f5e521-673a-dbfb-efff-62bdd8c01f49@linux-m68k.org>
References: <40f5e521-673a-dbfb-efff-62bdd8c01f49@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <40f5e521-673a-dbfb-efff-62bdd8c01f49@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.15
X-PR-Tracked-Commit-Id: db87db65c1059f3be04506d122f8ec9b2fa3b05e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6104dde096eba9f443845686a2c4b3fa31129eb4
Message-Id: <163054885162.9778.12867962222805284981.pr-tracker-bot@kernel.org>
Date:   Thu, 02 Sep 2021 02:14:11 +0000
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     torvalds@linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Thu, 2 Sep 2021 10:09:20 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6104dde096eba9f443845686a2c4b3fa31129eb4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
