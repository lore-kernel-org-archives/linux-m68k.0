Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FB7C433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 18:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0AA62072C
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 18:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602526868;
	bh=sTIvbG+GQSByXrHkd112d+HmskalpXJt/t7TgzG1e0A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=MUg0F8M/nrFOXa6nP/0MwIW6/IqSY5/sQFsRxvddF1BENVASWq5K3pybQoLOLXGep
	 5jqdOXPjJxn2HtgmYjdWuJCqxHibOqaYsJC9sFGEYYkJjwl32+oJOyk/DZvUKYIdm1
	 n2gB5VZ22a3HyT/Qnv8FRjEBoe9PEXYdJWkNesV4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390910AbgJLSVH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 14:21:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:39454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390903AbgJLSVG (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 14:21:06 -0400
Subject: Re: [GIT PULL] m68k updates for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602526866;
        bh=sTIvbG+GQSByXrHkd112d+HmskalpXJt/t7TgzG1e0A=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=PTEbp9sB1WjIJMeB0HzI/taW+aF8ihSzV/xQTgDj9IWuA1GOToMH1926Lbt3+y0OM
         gPyVW7+jKSLpDTl2J0OXyJZUV3b4tru6acU+ABcEdAy668iTg0QL7GuiYIsRqeJTWv
         Va8cTyncypbiIo9NOyhyKLN0Wz+gozkxD+qKF6OY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201012120904.12998-1-geert@linux-m68k.org>
References: <20201012120904.12998-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201012120904.12998-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.10-tag1
X-PR-Tracked-Commit-Id: 50c5feeea0af99a4401fd54fd72bec1333a496ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: af9db1d6632b726a2351426ab8f34374f6f38690
Message-Id: <160252686628.3643.10858367655936662834.pr-tracker-bot@kernel.org>
Date:   Mon, 12 Oct 2020 18:21:06 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 12 Oct 2020 14:09:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.10-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/af9db1d6632b726a2351426ab8f34374f6f38690

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
