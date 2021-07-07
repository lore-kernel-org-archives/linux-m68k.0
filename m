Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1459C11F78
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Jul 2021 14:25:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83BC361CDB
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Jul 2021 14:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbhGGO2R (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Jul 2021 10:28:17 -0400
Received: from verein.lst.de ([213.95.11.211]:37134 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231965AbhGGO2O (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Jul 2021 10:28:14 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8F59868BEB; Wed,  7 Jul 2021 16:25:31 +0200 (CEST)
Date:   Wed, 7 Jul 2021 16:25:31 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>
Subject: Re: [PATCH] m68knommu: remove set_fs()
Message-ID: <20210707142531.GA26080@lst.de>
References: <20210705055719.949875-1-hch@lst.de> <20210705055719.949875-2-hch@lst.de> <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com> <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com> <20210706041353.GA10889@lst.de> <CAHk-=wjZRs8icwmK4g-XSmY7PB9WUhi3=KGs5NsV7QO=uW_taw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjZRs8icwmK4g-XSmY7PB9WUhi3=KGs5NsV7QO=uW_taw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jul 06, 2021 at 11:36:26AM -0700, Linus Torvalds wrote:
> On Mon, Jul 5, 2021 at 9:13 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > It still needs "real" kernel-style set_fs for the mm/maccess.c routines,
> > but adding __{get,put}_kernel_nofault should not be too hard.
> 
> Yeah, it's not that it wants set-fs(), it's that I missed that m68k
> doesn't have HAVE_GET_KERNEL_NOFAULT.
> 
> Implementing __get/put_kernel_nofault() should be fairly
> straightforward: they are basically the same thing as the
> __get/put_user() functions, except they should just use "move" instead
> of "moves".
> 
> The m68k uaccess.h file already kind of has support for that, but it's
> hardcoded to the CONFIG_CPU_HAS_ADDRESS_SPACES config, rather than
> being available as two different versions.

So I've come up with a whole (compile tested only) series.  We don't
really need the preempt_disable either given the m68k saves and restores
the SFC/DFC registers on context switch:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/m68k-set_fs
