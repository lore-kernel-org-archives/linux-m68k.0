Return-Path: <SRS0=xXxx=BW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2C2C433E0
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Aug 2020 09:54:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E911206DA
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Aug 2020 09:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgHLJy6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Aug 2020 05:54:58 -0400
Received: from scenergy.dfmk.hu ([193.224.143.38]:51405 "EHLO scenergy.dfmk.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726712AbgHLJy6 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Aug 2020 05:54:58 -0400
Received: by scenergy.dfmk.hu (Postfix, from userid 1000)
        id E0963800F2A; Wed, 12 Aug 2020 11:54:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by scenergy.dfmk.hu (Postfix) with ESMTP id C714E8000E3;
        Wed, 12 Aug 2020 11:54:56 +0200 (CEST)
Date:   Wed, 12 Aug 2020 11:54:56 +0200 (CEST)
From:   "Karoly Balogh (Charlie/SGR)" <charlie@scenergy.dfmk.hu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Carsten Strotmann <cas@strotmann.de>,
        Debian m68k <debian-68k@lists.debian.org>,
        emutos-devel@lists.sourceforge.net, amigaml@freelists.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: m68k chat 21st Aug 2020 - "the Amitari - EmuTOS and Atari Software
 on the Amiga"
In-Reply-To: <CAMuHMdU=nV_f80aiZQ_EeDOtBE8mWmsQWCS9hau6BhUf5Gv2tw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.2008121149040.3100@scenergy.dfmk.hu>
References: <86v9hoffcd.fsf@emacs.strotmann.de> <CAMuHMdWThu9QW-HAQ84TBi4ZGUmzpDw4t=WN37uwAoec7ynsvA@mail.gmail.com> <CAMuHMdU=nV_f80aiZQ_EeDOtBE8mWmsQWCS9hau6BhUf5Gv2tw@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On Wed, 12 Aug 2020, Geert Uytterhoeven wrote:

> > There did exist a small AmigaOS emulator for Amiga UNIX, basically
> > implementing a hunk loader and a few exec.library and dos.library calls.
> > This was rumored to be sufficient to run e.g. the SAS C compiler.
> > I tried it once on Linux/m68k, and it could run a simple Hello World.
> >
> > The only entrypoint you need to provide to run AmigaOS binaries is a
> > pointer to ExecBase at address 4.  If TOS doesn't use that location for
> > something else, you can implement AmigaOS support.
> >
> > Good luck! ;-)
>
> FTR:
>
> https://web.archive.org/web/20000304080628/http://www.cs.kuleuven.ac.be/~geert/bin/ados_linux.tar.gz

There's also vamos, which even sports a 68k emulator (it has Musashi
built in), so you can run SAS/C and similar command line Amiga software on
non-68k hardware.

It's in this repo, mixed up with a bunch of other interesting tools, like
an RDB disk image creator, etc:

https://github.com/cnvogelg/amitools

If I get it right it's somehow written in Python, which sounds scary, but
I've seen it in action and it looked like it's working. Never tried it
myself tho', but I tried other software from the same repo, and they
worked nicely.

Charlie
