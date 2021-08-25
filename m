Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830A5C432BE
	for <linux-m68k@archiver.kernel.org>; Wed, 25 Aug 2021 23:31:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52A216108E
	for <linux-m68k@archiver.kernel.org>; Wed, 25 Aug 2021 23:31:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbhHYXbt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 25 Aug 2021 19:31:49 -0400
Received: from cynthia.allandria.com ([50.242.82.17]:55012 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhHYXbs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 25 Aug 2021 19:31:48 -0400
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1mJ2MA-0008L0-Ur; Wed, 25 Aug 2021 16:30:55 -0700
Date:   Wed, 25 Aug 2021 16:30:54 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <20210825233054.GA31679@allandria.com>
References: <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com>
 <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
 <b211dea5-ec59-21db-4235-387d7983905c@gmail.com>
 <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
 <57501cee-de70-99e5-3a92-e5d2a515bb51@gmail.com>
 <87bl5n9q1e.fsf@igel.home>
 <208ad46d-e4ef-68e3-97d0-aa7756852a92@gmail.com>
 <878s0px6al.fsf@igel.home>
 <CAOmrzkLSSUDXrN+NF+bbKNbj_u79ffkCERZ8cZ70=POfLQkM4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOmrzkLSSUDXrN+NF+bbKNbj_u79ffkCERZ8cZ70=POfLQkM4Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Aug 26, 2021 at 10:59:30AM +1200, Michael Schmitz wrote:
> On Wed, Aug 25, 2021 at 8:44 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> >
> > On Aug 25 2021, Michael Schmitz wrote:
> >
> > > the manuals on the NXP web site don't have the exception frame format
> > > tables,
> >
> > See 8.4 EXCEPTION STACK FRAME FORMATS.
> 
> Not in my copy of part 2 of the 030 manual. The section is there, the
> pages that are marked 'Exception Stack Frame format' (pp 8-32, 8-33)
> are there, but the pages are blank (except for header and footer).
> 
> Tried with acroread, xpdf and evince.
> 
> The original Programmer's Reference Manual has the frame formats in
> section B.2 (without any explanation of the fields' meanings,
> however).

It shows up fine for me in the embedded PDF reader in Chrome. There's
what is clearly a picture of the formats, as the image quality is
really bad. I can read it, but the lines are kind of jagged and the
text is pretty messy. Specifically, I'm looking at page 300 (8-33) in
the PDF found at this URL:

https://www.nxp.com/docs/en/reference-manual/MC68030UM.pdf

Perhaps those other programs aren't handling however that raw image
is encoded inside the file.

	Brad Boyer
	flar@allandria.com

