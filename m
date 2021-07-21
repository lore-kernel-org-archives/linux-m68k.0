Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DD6C12002
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Jul 2021 17:05:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD04C60FF3
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Jul 2021 17:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhGUQYz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 21 Jul 2021 12:24:55 -0400
Received: from verein.lst.de ([213.95.11.211]:59509 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229600AbhGUQYz (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 21 Jul 2021 12:24:55 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5E32467373; Wed, 21 Jul 2021 19:05:29 +0200 (CEST)
Date:   Wed, 21 Jul 2021 19:05:29 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <20210721170529.GA14550@lst.de>
References: <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> <87fswjomtm.fsf@igel.home> <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com> <20210713054134.GA5880@lst.de> <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com> <20210713085419.GA22839@lst.de> <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com> <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com> <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com> <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

FYI, I've pushed out a new version - this contains the fix from Andreas
and drops all these uninlining tweaks as they very obviously cause more
harm than good for now.

And sorry for the delay, life has been a little busy lately.
