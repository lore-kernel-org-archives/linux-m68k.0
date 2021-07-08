Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A151C07E96
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 12:57:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2309261584
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 12:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhGHNAg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 09:00:36 -0400
Received: from verein.lst.de ([213.95.11.211]:40317 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231716AbhGHNAg (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 09:00:36 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1FD9C68C4E; Thu,  8 Jul 2021 14:57:52 +0200 (CEST)
Date:   Thu, 8 Jul 2021 14:57:51 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
Message-ID: <20210708125751.GA11898@lst.de>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com> <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com> <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com> <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com> <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jul 08, 2021 at 05:48:46PM +1200, Michael Schmitz wrote:
> Hi Christoph,
>
> Am 08.07.2021 um 16:58 schrieb Christoph Hellwig:
>> On Thu, Jul 08, 2021 at 04:33:08PM +1200, Michael Schmitz wrote:
>>>> Yes, that problem exists, but just removing the # causes "inst" to go
>>>> into the cpp output.  Let me brush up my cpp-foo.
>>>
>>> Putting quotes around 'inst' makes it compile for me.
>>
>> Do you just want to take the series over from here?  I think you are
>> about 15 times more qualified than me anyway :)
>
> Not in a million years :-) A brief look at my patch review history on 
> linux-m68k will disabuse you of that notion. I routinely hit v6 and higher 
> ... I'm a simple hobbyist, and a little out of my depth here.

I've force pushed a new version to the branch, can you give it a spin?
