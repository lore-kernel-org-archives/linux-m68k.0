Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD937C0015E
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 18:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbjGYSSh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jul 2023 14:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjGYSSe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jul 2023 14:18:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EC41FC1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jul 2023 11:18:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5F04861857;
        Tue, 25 Jul 2023 18:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE395C433CD;
        Tue, 25 Jul 2023 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690309112;
        bh=zYtH6CG2IdEtHPe8c+pbj+oqan9qklrrACjkggQYQyY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=J313+UjxAn02Sga9EFp9856uR7KwuYfmdc5iJYzhq8dP/rdMFzerX1gJt2HIZvJ/H
         FOGMzhNWe/aO1TT+r7r1eu5uvzZaI1WviWPhLOq9dUmcATRIKUNdLVaM+pO1UZss4R
         Fg0PWFinRPzVEp1vIJnBv2c5HV4jMg2A+9H7JLsTQxVRG5cjMlcYtFxENm146iDsIL
         cCwk4bl+680RuoEjtrioIVXw55EmbO41r7p54MsgbfD5rxX9SfXZbkkqbiPzfsOgYw
         v3lSuPm37iPbuW3Seu9AcghxkZXuKvLMq+gCBPWKriwlxwZgH+YjsikwplBniXaye4
         7/1i3pYeO1kUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AA2CFC59A4C;
        Tue, 25 Jul 2023 18:18:32 +0000 (UTC)
Subject: Re: [GIT PULL] m68k fixes for v6.5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230725065752.1731858-1-geert@linux-m68k.org>
References: <20230725065752.1731858-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230725065752.1731858-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.5-tag2
X-PR-Tracked-Commit-Id: 922a9bd138101e3e5718f0f4d40dba68ef89bb43
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: af2e19389c2c1d8a299e04c5105b180ef0c5b5b5
Message-Id: <169030911268.3173.11090633824641337351.pr-tracker-bot@kernel.org>
Date:   Tue, 25 Jul 2023 18:18:32 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Tue, 25 Jul 2023 08:57:52 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.5-tag2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/af2e19389c2c1d8a299e04c5105b180ef0c5b5b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
