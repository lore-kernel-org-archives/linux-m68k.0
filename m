Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670E4C61DA3
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Feb 2023 23:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbjBUXk0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Feb 2023 18:40:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbjBUXkY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Feb 2023 18:40:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F6E34002
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 15:40:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6C2BA6122E;
        Tue, 21 Feb 2023 23:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB746C433EF;
        Tue, 21 Feb 2023 23:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677022813;
        bh=hqcjuI1AxhWG1/Uph2wPNMdTZwrzLUIudY0Ef5hEF5U=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Xi9lbvzAfMF/lqKY1Kb2wOGLSuHbx566Nyk3WEyRHxMXVE9+Zncbt7VG3of3+/N/C
         F3u9uGcIQOrx6dww3+PsfXz/Z7dLtf6f+rf1fmzkpmkhdDh8FIVy0K5Qh5hF0OwntF
         F3qx3yn7uHO+qe06fQ8HFDE5qN87nQpzVT+dTbHvUHi3evZLT4Z6EgGZPC3PN00DWh
         kO9JjakQ4KlJjtBIp5khoc9Kz8zGo2Ie2yaCkB6qX5+/KuHSImXNQhyO0WB+pHwUHk
         P6P5vBCZxp0ehAuGixFiLKnyhLi8O8siruX5BeHsvgB/AmVlgzVD1lzCzWB1wM2Xb8
         yKutTnzhn0d2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9EBFC43151;
        Tue, 21 Feb 2023 23:40:13 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230220124109.679256-1-geert@linux-m68k.org>
References: <20230220124109.679256-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230220124109.679256-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.3-tag1
X-PR-Tracked-Commit-Id: 1e5b5df65af99013b4d31607ddb3ca5731dbe44d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eb6d5bbea2fbfaade9e29bf5ce4abe3a8384678f
Message-Id: <167702281382.12607.17583376545220589403.pr-tracker-bot@kernel.org>
Date:   Tue, 21 Feb 2023 23:40:13 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 20 Feb 2023 13:41:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.3-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eb6d5bbea2fbfaade9e29bf5ce4abe3a8384678f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
