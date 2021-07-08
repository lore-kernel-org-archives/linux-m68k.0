Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CD9C07E96
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 04:31:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FA8C61CDD
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 04:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhGHEe3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 00:34:29 -0400
Received: from verein.lst.de ([213.95.11.211]:39142 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhGHEe2 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 00:34:28 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 48BF168C4E; Thu,  8 Jul 2021 06:31:45 +0200 (CEST)
Date:   Thu, 8 Jul 2021 06:31:45 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
Message-ID: <20210708043145.GB17672@lst.de>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com> <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com> <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 07, 2021 at 08:01:33PM -0700, Linus Torvalds wrote:
> The '#' turns the argument into a string, but it was already
> _supposed_ to be a string. But no, the problem is that it turns the
> macro name MOVES into the _string_ "MOVES".
> 
> Which happens to compile just fine, because "moves" is a real
> instruction. But it's actually _meant_ to be a macro that expands to
> either the string "moves" or "move".
> 
> So what happens is that at least in Christoph's version, I think the
> code _always_ uses "MOVES", even in configurations where the macro
> MOVES should have just become "move".
> 
> So it all builds fine, looks fine to the assembler, but it uses the
> wrong instruction.
> 
> Macro expansion with the '#' character and other macros used as
> arguments is something people need to be very careful with.  It's why
> we have a whole header file for just the "stringify" operation, see
> <linux/stringify.h>
> 
> But in this case, it shouldn't have used '#' at all, since the
> argument was already a string, and never needed to be turned into a
> string by the pre-processor.

Yes, that problem exists, but just removing the # causes "inst" to go
into the cpp output.  Let me brush up my cpp-foo.
