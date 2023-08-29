Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63F6C83F11
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Aug 2023 00:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234960AbjH2Aqo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 20:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234833AbjH2AqO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Aug 2023 20:46:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6D1120
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Aug 2023 17:46:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DCCF660F9B;
        Tue, 29 Aug 2023 00:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50DF3C433C7;
        Tue, 29 Aug 2023 00:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693269970;
        bh=Z+m6iBZzHB+PcFVi3TbKYH9oMCd+PPNfDAiKc9IZXxw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=HMp1mEVUz5hk1p/6UZA+M57oRK5E/xg8/F1r735tjhRWgUjQDMUShqCKqbWZEe9DK
         VneVmQBUdma1wyq0i9+q6bBFwmB+Lz2RwmtREsWICeKireTZkroanPKYedJKEFoNLX
         KdovbVfDthHPiHtT6u7jUjgWmBwMwSpaa31F3yCk8BDSEbZ1D5EvafZKy6qcL4HNLM
         begDBbjiznZIPo8sLT7lvdFaoGAR34gHRFoQSvI3+pmv5zCLa6LHBKstCoOWfu78EK
         bDu6l67+2Aw9dSNDL5wnX/r0KOaxDiEpQ53vbbOp1p2jP5DEjbQYlToT+yMF2W6IGR
         EsWSq/rWy4JsQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3DD4FC3959E;
        Tue, 29 Aug 2023 00:46:10 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230828095045.3008527-1-geert@linux-m68k.org>
References: <20230828095045.3008527-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230828095045.3008527-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.6-tag1
X-PR-Tracked-Commit-Id: eb1e6ccdcf785e633863c5c7cec32d6c1e7b09dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb2d9e5448ab9e86ecc79d8984dc6d3a8a9fba1e
Message-Id: <169326997024.22794.2267295916831961119.pr-tracker-bot@kernel.org>
Date:   Tue, 29 Aug 2023 00:46:10 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The pull request you sent on Mon, 28 Aug 2023 11:50:45 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.6-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb2d9e5448ab9e86ecc79d8984dc6d3a8a9fba1e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
