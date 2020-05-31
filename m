Return-Path: <SRS0=3RHc=7N=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD2DC433DF
	for <linux-m68k@archiver.kernel.org>; Sun, 31 May 2020 20:27:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82834204EA
	for <linux-m68k@archiver.kernel.org>; Sun, 31 May 2020 20:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgEaU13 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 31 May 2020 16:27:29 -0400
Received: from cynthia.allandria.com ([50.242.82.17]:54953 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgEaU13 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 31 May 2020 16:27:29 -0400
X-Greylist: delayed 1542 seconds by postgrey-1.27 at vger.kernel.org; Sun, 31 May 2020 16:27:28 EDT
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1jfU9M-0007Mf-46; Sun, 31 May 2020 13:01:40 -0700
Date:   Sun, 31 May 2020 13:01:40 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 8/8] macintosh/adb-iop: Implement SRQ autopolling
Message-ID: <20200531200140.GA27809@allandria.com>
References: <cover.1590880623.git.fthain@telegraphics.com.au>
 <0fb7fdcd99d7820bb27faf1f27f7f6f1923914ef.1590880623.git.fthain@telegraphics.com.au>
 <CAMuHMdUjrFDob01EWC4e04tAkj5JTm_2Ei5WsPqN1eGDz=x3+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjrFDob01EWC4e04tAkj5JTm_2Ei5WsPqN1eGDz=x3+Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, May 31, 2020 at 10:38:04AM +0200, Geert Uytterhoeven wrote:
> >  arch/m68k/include/asm/adb_iop.h |  1 +
> 
> As this header file is used by a single source file only, perhaps it should
> just be absorbed by the latter?
> Then you no longer need my Acked-by for future changes ;-)

While I don't really feel involved in this specific change (although I
was one of the testers when the driver was first written), I am a little
curious about the current coding standards. This header is pretty much
just a declaration of the hardware interface, of which there are many
in this directory. Is it better to just define all the offsets and bits
for hardware registers inside the driver? We used to always put them in
headers like this, but is that not the current standard? Would it be
cleaner to put such headers in the directory with the driver effectively
making them private? I seem to see quite a bit of that as well.

Thank you for your advice.

	Brad Boyer
	flar@allandria.com

