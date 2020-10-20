Return-Path: <SRS0=5FMh=D3=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EDFC433DF
	for <linux-m68k@archiver.kernel.org>; Tue, 20 Oct 2020 01:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACB1422253
	for <linux-m68k@archiver.kernel.org>; Tue, 20 Oct 2020 01:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603157044;
	bh=id1iqKwX3kGJKP5h5zs65Thlwq0Qg8yymAbtxxooZJw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=q8a4tpssW4lvLq9p/hHzU/OguIVtKWDRfcAMEq3VOxLD2m7fxmKRj33B7rlxVVeNh
	 SjRJe0LJHfCvxTDavOzTcv37rYP+N68AN8uJm9sW0qeSNGWqGUiqYwd7gBR79i9xvh
	 WmUFGUO6J7e07UZclNdJtqVy63ebzHVZYmEq3uOs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389944AbgJTBYE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 19 Oct 2020 21:24:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:46358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389942AbgJTBYD (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 19 Oct 2020 21:24:03 -0400
Subject: Re: [git pull] m68knommu changes for v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603157043;
        bh=id1iqKwX3kGJKP5h5zs65Thlwq0Qg8yymAbtxxooZJw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=dpy5Z5Qe2GuBdy+y+KA/3G+M0nsvGWvXB6mp1n94EbS/PFE8Ioc/GL5RJqH9fZcpy
         Ax+xjzhzk/8Yf2BtxsmE0TQwWtORNwFfzPWLCOa5kjGH9sFX4fRoEEZbkT87eQt0dB
         TO9LRpQd2aB4QA7Dy8vUSfFsIu693e1w+KAwZGUE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <dae7af98-a47c-4225-b444-21d47cc27307@linux-m68k.org>
References: <dae7af98-a47c-4225-b444-21d47cc27307@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <dae7af98-a47c-4225-b444-21d47cc27307@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.10
X-PR-Tracked-Commit-Id: 9f5fd809d7a02e32c2e044acb9f6aed1c79a699b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d3876ff74437c5f3a1a2f8d2a45b6fb91d51ea25
Message-Id: <160315704338.30490.9609808423890515719.pr-tracker-bot@kernel.org>
Date:   Tue, 20 Oct 2020 01:24:03 +0000
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     torvalds@linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 19 Oct 2020 11:22:40 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d3876ff74437c5f3a1a2f8d2a45b6fb91d51ea25

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
