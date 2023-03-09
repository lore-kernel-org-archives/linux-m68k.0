Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B77FC61DA4
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Mar 2023 19:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjCITHN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Mar 2023 14:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjCITHK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 9 Mar 2023 14:07:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273FAFC7FB
        for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Mar 2023 11:07:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E8C861C00;
        Thu,  9 Mar 2023 19:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 119F5C4339B;
        Thu,  9 Mar 2023 19:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678388829;
        bh=VjbEarfjglabi7ZBKKjIpPY0DM8fgaY5K9vrIJgwHuU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=A2IE/DAg3yG3C+ewkEkP7ECYa4AWlf8+KwYWm3fZm817tGX3PSH5ufOzs8Our+6jO
         QhFh39exVo4jB7b4ZZH82Ie1gsFAIF2WtVAun35Ks3r6MJkHNtXNF5ikdXFez27/6m
         j24yqFWwR7eULNX3qB9K1tV1CuYdiQB7mF0bBjlH3Mqp0N9GdwAC3VbDkvZP5po2EQ
         A4HPM3D8U15qO9X/CsVcwkrbeCkuFTH1/p32pz67DEZf+ZjSR8CbgprmatWUG2ZdiS
         JHRwpdesttdWgWawcPRWu7cIKsPRDPTBLGfQ8wAq4eFIfm2WZqm3xkpdzntzxD42RH
         UNbiyIUgyutwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 00087E61B60;
        Thu,  9 Mar 2023 19:07:08 +0000 (UTC)
Subject: Re: [GIT PULL] m68k fixes for v6.3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230309094455.3826581-1-geert@linux-m68k.org>
References: <20230309094455.3826581-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230309094455.3826581-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.3-tag2
X-PR-Tracked-Commit-Id: e36a82bebbf7da814530d5a179bef9df5934b717
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c70e9b8ea3936a60e2a696dd0ed9bb57885f6bec
Message-Id: <167838882899.4761.4160304678233805155.pr-tracker-bot@kernel.org>
Date:   Thu, 09 Mar 2023 19:07:08 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Thu,  9 Mar 2023 10:44:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.3-tag2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c70e9b8ea3936a60e2a696dd0ed9bb57885f6bec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
