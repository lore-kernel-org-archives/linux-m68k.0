Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28798C433E0
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Mar 2021 05:04:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB04E64FAB
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Mar 2021 05:04:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhCQFDt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Mar 2021 01:03:49 -0400
Received: from smtprelay0089.hostedemail.com ([216.40.44.89]:50060 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229498AbhCQFD1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 17 Mar 2021 01:03:27 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 6D1FC1835108A
        for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Mar 2021 04:57:52 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 66D271807624D;
        Wed, 17 Mar 2021 04:57:51 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: smoke89_02009a82773b
X-Filterd-Recvd-Size: 3821
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Wed, 17 Mar 2021 04:57:47 +0000 (UTC)
Message-ID: <eff989d0ceaede15216f1046c24829f1113c035f.camel@perches.com>
Subject: Re: [PATCH 13/13] MAINTAINERS: Add entry for the bitmap API
From:   Joe Perches <joe@perches.com>
To:     Yury Norov <yury.norov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
        Alexey Klimov <aklimov@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Tue, 16 Mar 2021 21:57:46 -0700
In-Reply-To: <20210317044759.GA2114775@yury-ThinkPad>
References: <20210316015424.1999082-1-yury.norov@gmail.com>
         <20210316015424.1999082-14-yury.norov@gmail.com>
         <YFCabyt9pfPtoQiZ@smile.fi.intel.com>
         <20210317044759.GA2114775@yury-ThinkPad>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 2021-03-16 at 21:47 -0700, Yury Norov wrote:
> [CC Andy Whitcroft, Joe Perches, Dwaipayan Ray, Lukas Bulwahn]
> 
> On Tue, Mar 16, 2021 at 01:45:51PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 15, 2021 at 06:54:24PM -0700, Yury Norov wrote:
> > > Add myself as maintainer for bitmap API and Andy and Rasmus as reviewers.
> > > 
> > > I'm an author of current implementation of lib/find_bit and an active
> > > contributor to lib/bitmap. It was spotted that there's no maintainer for
> > > bitmap API. I'm willing to maintain it.
> > > 
> > > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > > ---
> > >  MAINTAINERS | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 3dd20015696e..44f94cdd5a20 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -3151,6 +3151,22 @@ F:	Documentation/filesystems/bfs.rst
> > >  F:	fs/bfs/
> > >  F:	include/uapi/linux/bfs_fs.h
> > >  
> > > 
> > > +BITMAP API
> > > +M:	Yury Norov <yury.norov@gmail.com>
> > > +R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > +R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > > +S:	Maintained
> > > +F:	include/asm-generic/bitops/find.h
> > > +F:	include/linux/bitmap.h
> > > +F:	lib/bitmap.c
> > > +F:	lib/find_bit.c
> > 
> > > +F:	lib/find_find_bit_benchmark.c
> > 
> > Does this file exist?
> > I guess checkpatch.pl nowadays has a MAINTAINER data base validation.
> 
> No lib/find_find_bit_benchmark.c doesn't exist. It's a typo, it should
> be lib/find_bit_benchmark.c. Checkpatch doesn't warn:
> 
> yury:linux$ scripts/checkpatch.pl 0013-MAINTAINERS-Add-entry-for-the-bitmap-API.patch
> total: 0 errors, 0 warnings, 22 lines checked

checkpatch does not validate filenames for each patch.

checkpatch does have a --self-test=patterns capability that does
validate file accessibility.


