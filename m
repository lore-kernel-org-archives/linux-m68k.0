Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF218C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Nov 2021 00:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95DDD6052B
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Nov 2021 00:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbhKBAxe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Nov 2021 20:53:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:48694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231857AbhKBAxd (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Nov 2021 20:53:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2E5E36102A;
        Tue,  2 Nov 2021 00:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635814259;
        bh=2Uyiz+ssHx98WJVcNZIIxYI7NFpZFrvhG/sFuELHJcM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=OS5xELJoxS61xkwhdV714bq27EBD4dJnbPz2VwFdaczqMSKbvE9rT37shzplRnmPP
         voadeursRA1lzD/zhGlYC/l7RZ0vkNJ7yKr5E5PyNNN1gP3Sd/xIJsHAcJ8/WtUaJS
         w2YaL3dKVaaVF04Qw/suBegyjw/EXTHsTc4NXz2Xte7uQftHYuDVOnERXKxuHcB/J3
         fB8gAvCrSVya5k6PHSRyDRsrFlm/Fk7VqzL/7GjdWTZpAolrG7P1behzU6i1vQx+oN
         fEOWiuiJEchUvzcbI4p6LWSIQZxhKguFb8yZk5htxU1bmyNjGWzUCpzbmq6tIotWr+
         nMb+GszxM3sbQ==
Subject: Re: [GIT PULL] m68k updates for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211101130003.3202665-1-geert@linux-m68k.org>
References: <20211101130003.3202665-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211101130003.3202665-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.16-tag1
X-PR-Tracked-Commit-Id: 8a3c0a74ae87473589cb881a3854948d40000b7a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 03feb7c55c470158ece9afb317c395cd65bd14ac
Message-Id: <163581425915.14115.14848676693548755523.pr-tracker-bot@kernel.org>
Date:   Tue, 02 Nov 2021 00:50:59 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon,  1 Nov 2021 14:00:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.16-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/03feb7c55c470158ece9afb317c395cd65bd14ac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
