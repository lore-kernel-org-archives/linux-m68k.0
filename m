Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981DAC07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 04:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72CDA61448
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 04:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhGIEZE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 00:25:04 -0400
Received: from verein.lst.de ([213.95.11.211]:42170 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229441AbhGIEZE (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 00:25:04 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 97CD668C4E; Fri,  9 Jul 2021 06:22:19 +0200 (CEST)
Date:   Fri, 9 Jul 2021 06:22:19 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
Message-ID: <20210709042219.GA13558@lst.de>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com> <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com> <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com> <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com> <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com> <20210708125751.GA11898@lst.de> <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com> <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 09, 2021 at 12:31:45PM +1200, Michael Schmitz wrote:
> That patch works fine on a casual test. What you did to 
> __constant_copy_to_user() does not appear to matter - but I haven't put the 
> system under any kind of stress yet. I'm a little reluctant to do that 
> (recovering from a trashed boot disk is a little dicey), I'll probably only 
> try that with your changes to __constant_copy_to_user() from commit 
> d36105c942e0 backed out.

As Linus pointed out, small copy_to_user basically doesn't happen as
we have switched all the suspect call sites to just use put_user.

Geert: do you care about __constant_copy_to_user at all, or can we just
kill it (as well as the copy_from_user side)?
