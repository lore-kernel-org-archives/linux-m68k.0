Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412F3C4332F
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Mar 2022 19:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352725AbiCUTUM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Mar 2022 15:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352684AbiCUTUD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Mar 2022 15:20:03 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C7C340CE
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Mar 2022 12:18:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7D407CE1B5D;
        Mon, 21 Mar 2022 19:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0877C36AEA;
        Mon, 21 Mar 2022 19:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647890313;
        bh=sdquPTFPTkWf8jvZG9WnFTSfuJF6ECNv47jEUFOqaa0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=sNebh0BkxsWd+24CwiSFs89FPufMTHoVON/6pOBAjsFeV4ZI1cC2u9b4Ht1wrPClh
         vzYRloW1L6lv9KLLkPq5fvCuIffxOZ4BDdPyDW2zce0b5JCK7F9rqzUS8qeibLB5Ki
         soBioqJ7UHtcopIicslRHDizyokGWHlmqt4LIxwFaLYbAAMkJ8xKIKgeMRVjD1EXLn
         pwK9Umh9BmNek1DaGty4px3epFW3ueZksTM0AoVPzu9UKOwLVf5lBB6WXLWoDCw9D9
         M6ClHWlzZv2cgEGdp/IrGRdWdksmSUWacZlacgtth5xLAWk5OcRnLLLIxyBEfiAXXz
         gswB7tFkAHjQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9F0B1E6D44B;
        Mon, 21 Mar 2022 19:18:33 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v5.18
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220321091443.3563010-1-geert@linux-m68k.org>
References: <20220321091443.3563010-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220321091443.3563010-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.18-tag1
X-PR-Tracked-Commit-Id: 0d52a01a266ba21840c7cb02e1de39c503759dda
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b74b4600d0318fd81aceb5a7b7d10432bc2306b
Message-Id: <164789031364.24158.14506912834558426905.pr-tracker-bot@kernel.org>
Date:   Mon, 21 Mar 2022 19:18:33 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 21 Mar 2022 10:14:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v5.18-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b74b4600d0318fd81aceb5a7b7d10432bc2306b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
