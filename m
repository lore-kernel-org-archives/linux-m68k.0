Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0818AC10F1E
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Dec 2022 21:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbiLLVMp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Dec 2022 16:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233977AbiLLVMV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Dec 2022 16:12:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DB21A07F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Dec 2022 13:11:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 22989B80E64;
        Mon, 12 Dec 2022 21:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE52EC433EF;
        Mon, 12 Dec 2022 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670879503;
        bh=3JX56UwMITPZdgY8LLwjaZY3wG+Wi8aS/uXD95Ilmf4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=duFHK7pGXZ02CRuVt6wS9qFB3UdqeS9XrMMi753VeAZLEo8611ht0iZcTYXBw6xiJ
         GOw00B+4Ve1Zhkf+pmQhrkf+ImOBq/z61ifSVkRws89pxbquG3XsvxS5lgZC193rQo
         UQHU1ew31G6SCr+wmVn25vJjrJnzRDHSzWSEpn8q6ECy0H5vCi62q3E0m2RZ1MyBLd
         CXjXM0Zu8iG5rOzDClT532o2e+v7Ckr2Ed3VOHTOz5D/QSCIRQflBEv+imkP9TUy1K
         wmaRQ8SX+S2l6k6LqP1sMj3f8lRbKwcbAU7PSvGat1vbeVq1ZSM0Fsnfij1lCAmXzP
         GeffVkqAdE7AQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CE073C00445;
        Mon, 12 Dec 2022 21:11:43 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20221212141851.3602384-1-geert@linux-m68k.org>
References: <20221212141851.3602384-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221212141851.3602384-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.2-tag1
X-PR-Tracked-Commit-Id: 553b20b211c4153f8af6096fd52069bbdf955e23
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 49d07f010c7c6b09ea2c2ebca67b83b38afa5faf
Message-Id: <167087950384.1809.14819625222924484550.pr-tracker-bot@kernel.org>
Date:   Mon, 12 Dec 2022 21:11:43 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 12 Dec 2022 15:18:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.2-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/49d07f010c7c6b09ea2c2ebca67b83b38afa5faf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
