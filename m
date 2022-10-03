Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9452C433FE
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Oct 2022 17:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiJCRdE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Oct 2022 13:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiJCRcP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Oct 2022 13:32:15 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791E73A150
        for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Oct 2022 10:32:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 4D031CE0B1D;
        Mon,  3 Oct 2022 17:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94055C43142;
        Mon,  3 Oct 2022 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664818324;
        bh=wF/ZXwn+w8nhlJRPzrVEBPrBPfzeeXzxJDvoeNX2CgI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=lFjFxjZC0hV2Ag5nsDbAkAC1RD/4F3Ja+mmU0yX6cjrjPjLCFluMLdWoSx1FoPAF6
         Pl72TLuR7hdQyqe1/CNgyoLLWyuEGsCsAZu6WH5N9KEzJCBGoW/fS66mnKz6mB9h2+
         Lu1r1ZNhC2BSa1G9y7LbcAVUHf4ly9muPOLsP/zspSfTmg60qRJLvE8cbPX8oNJlRK
         WLSKAZ7pfXDSVKDNq3U9uiV83qmFLvS/f67al+YzrWwWZgUqP9vJ8sRdB6DjFHmESd
         pkM4UoTwB99PX/04fojBEs9jxJ00kahrDd4FPElqvWM4Lzm+pqVx0Mw2pLLS7DYkLo
         haBb9+2cc+SwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81AE9E49FA3;
        Mon,  3 Oct 2022 17:32:04 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20221003104529.2437138-1-geert@linux-m68k.org>
References: <20221003104529.2437138-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221003104529.2437138-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.1-tag1
X-PR-Tracked-Commit-Id: dc63a086daee92c63e392e4e7cd7ed61f3693026
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 75003fa726e990883bba5b38c4c4d873dab45d62
Message-Id: <166481832452.20277.6973751682427455307.pr-tracker-bot@kernel.org>
Date:   Mon, 03 Oct 2022 17:32:04 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon,  3 Oct 2022 12:45:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.1-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/75003fa726e990883bba5b38c4c4d873dab45d62

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
