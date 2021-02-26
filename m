Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB441C433DB
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Feb 2021 18:32:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A340F64F5B
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Feb 2021 18:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhBZScn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Feb 2021 13:32:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:59804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230225AbhBZScl (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 26 Feb 2021 13:32:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9248C64F27;
        Fri, 26 Feb 2021 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614364320;
        bh=sGKTuAeNNz6qJt//A1+GLUuvjwO0NRVXq5SskE7ziwI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=cQPEZhQaLmkXUd2grD6+FgJps/tsL56TXOJigmjNF2/oWu8NU0RLydW+5ragnfRIZ
         AMMNT+lUnjvwIDZgzIKWhCvMwP5kzav3+yQZ/KCawWkt3B+kgm2gUHlzqZSkm/qsF5
         p67Dbx9DX3/tcn+eX9tOxiN1MnJ4J75PKIjOzpSU/4Q34jtMuyYBLGqrkuYTcRJGcH
         IeZWa3Z1OuLr5Xg7Uvo5VuBvY8hLM/J5eREm9isI2M40mLefvSOWTYLNlhKEPM1Vcx
         FZq+3jlHsCt7+6MzHpBDRdDOFYUVzYEWmreqsWYEAYP0RqSX+TzcI1hJneKWEeFPr+
         sfsrwharDkAoA==
Subject: Re: [git pull] m68knommu changes for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <66454ec0-9ca9-b4f5-1cd4-81204b2d120b@linux-m68k.org>
References: <66454ec0-9ca9-b4f5-1cd4-81204b2d120b@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <66454ec0-9ca9-b4f5-1cd4-81204b2d120b@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.12
X-PR-Tracked-Commit-Id: c1fb1bf64bb63a1d6ae3311a9a3581a527c1f185
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a422ce5bb31dc82a52c72f96838e4e5f1dbf7228
Message-Id: <161436432057.9780.15175711490290678426.pr-tracker-bot@kernel.org>
Date:   Fri, 26 Feb 2021 18:32:00 +0000
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     torvalds@linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Fri, 26 Feb 2021 13:23:48 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a422ce5bb31dc82a52c72f96838e4e5f1dbf7228

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
