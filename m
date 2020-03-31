Return-Path: <SRS0=lrj2=5Q=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A30C2D0F2
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Mar 2020 16:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88B7C20784
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Mar 2020 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585672220;
	bh=xHlxOVNqRjLM+m3oL3eU9x1hbH/cObk/9Ml0wjz+M/U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=C/h3Ymid5O7mV++V0/FW8Q8DYuPBne2WhsU4SG4LjAtp/izmeD8SPUPdkNTxRTV2l
	 Ambf0gbx17ko6a3j/kby+vMDMBWtNbZiijlExv8HtrhfIbbNY58KGnjZjPuzl7mf2L
	 e76xD7ReLCfFrfgWTFMhPAKWlas/alR2glCbAfng=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbgCaQaL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 31 Mar 2020 12:30:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:39742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726595AbgCaQaL (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 31 Mar 2020 12:30:11 -0400
Subject: Re: [GIT PULL] m68k updates for 5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585672211;
        bh=xHlxOVNqRjLM+m3oL3eU9x1hbH/cObk/9Ml0wjz+M/U=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=09wvPVi+LQXZw/Bf8f+3Nar9TM1aJwWR8j/cDyVJKelrgdozQiPbTdUnnzehPv+eu
         PfWPBs40g40olOj1rAruwTjEYKmQa0qLTs/UoIwsbmxP+R/DAdwMjIpfSlqlqWmYL5
         ju6k/3eV3W1RVgaJ3kNloKZ2WmIZE9XNvMdIrwcc=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200330100535.4967-1-geert@linux-m68k.org>
References: <20200330100535.4967-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200330100535.4967-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
 m68k-for-v5.7-tag1
X-PR-Tracked-Commit-Id: 86cded5fc52567774b596827544874499532b8ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 58233ccf94607c1df2c545b689c52c0b002f054e
Message-Id: <158567221098.1514.9172777259183005240.pr-tracker-bot@kernel.org>
Date:   Tue, 31 Mar 2020 16:30:10 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 30 Mar 2020 12:05:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-for-v5.7-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/58233ccf94607c1df2c545b689c52c0b002f054e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
