Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741C2C4320A
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Aug 2021 20:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 559B360F8F
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Aug 2021 20:17:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbhH3USM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Aug 2021 16:18:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:50396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234904AbhH3USM (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Aug 2021 16:18:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DD11060F5B;
        Mon, 30 Aug 2021 20:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630354637;
        bh=sCnD5h0Z5X24Jq/Dvo1OlS3UNyV1rb2f991ESZgw3KA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=q1BZDWwH/XbffBepHn196uJAPNP+ml92KMLIsZxxBP+tuZStUbb15KUvjRVqwESRS
         bewtKHcTeZZYX+qdak3fBCXUvOMP4QTcLfHL0PkdFQ43hwszhMW8lTJvTw+6g6qIsa
         CZSfAh1+TvnSil73mL7zFBvyffaoncVwgcKi8ugbokDOs3lgC0QdSerni5NJeaCCej
         VdYWhsYsLziVop0RMv+LME7kQYDqZF4p9BIp9r6n5Mbg0vlhMkjpi7UDBnnabDZ4qA
         ZqWP3D+txDV426YcaejUqe/xKqekzZPgodDWwFo18I5t6W3rBVfDos2hp2DERy5qmr
         jz37vjLx08wcw==
Subject: Re: [GIT PULL] m68k updates for 5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210830091705.1854757-1-geert@linux-m68k.org>
References: <20210830091705.1854757-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210830091705.1854757-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.15-tag1
X-PR-Tracked-Commit-Id: 87d93029fe83e326d5b906e12e95600b157d2c0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: adc5ea221089e8eff8207d6e9c98751e0347b0de
Message-Id: <163035463775.13905.86794653076739208.pr-tracker-bot@kernel.org>
Date:   Mon, 30 Aug 2021 20:17:17 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 30 Aug 2021 11:17:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.15-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/adc5ea221089e8eff8207d6e9c98751e0347b0de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
