Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453C1C07E96
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 04:17:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2571D61CDE
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 04:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhGHEUV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 00:20:21 -0400
Received: from verein.lst.de ([213.95.11.211]:39117 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhGHEUV (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 00:20:21 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 27C7068BFE; Thu,  8 Jul 2021 06:17:38 +0200 (CEST)
Date:   Thu, 8 Jul 2021 06:17:37 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>
Subject: Re: [PATCH] m68knommu: remove set_fs()
Message-ID: <20210708041737.GB17410@lst.de>
References: <20210705055719.949875-1-hch@lst.de> <20210705055719.949875-2-hch@lst.de> <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com> <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com> <3c736dc7-dd0c-0691-ece4-e7dc9aaa3a54@gmail.com> <CAHk-=wjPcjY0TUNeh1pwC2s4xk=MPJGu_66+ywJ3SbmrEW5Yxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjPcjY0TUNeh1pwC2s4xk=MPJGu_66+ywJ3SbmrEW5Yxg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 07, 2021 at 09:14:29PM -0700, Linus Torvalds wrote:
> Except now that I think about it, I worry about getting scheduled away
> *between* the instruction that sets SFC and the one that sets DFC. And
> then switch_to() will save just SFC to the thread-struct. And then
> restore the (new thread) SFC value to _both_ SFC and DFC.

arch/m68k/Kconfig:      select ARCH_NO_PREEMPT if !COLDFIRE

So only coldfire can support kernel preemption, and coldfire never uses
SFC/DFC.
