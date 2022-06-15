Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C33FC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Jun 2022 14:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242173AbiFOOTm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 15 Jun 2022 10:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238810AbiFOOTf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 15 Jun 2022 10:19:35 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCE835A97
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Jun 2022 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655302775; x=1686838775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y34PZ1MCfO2hOMDdvHaZPFb/IY8bQc2YzesGXP5aW7I=;
  b=OAn2dwP8a7+bCpk0+3NnSf81Vo/ltWLJLNxV11o//GySBXp1xqmXyZyk
   sXgfqme8cVHxxyaFS7o5t+DiWofzNYf45ug66vQUkvL/U3NfURBDBAWfH
   r2blBhRbGa8dfUL4SYJUSMs4svG9OGp1g8Z6D7GNRRSNCtVPMtjniZcHJ
   PFxrWvIyl4uN98TcsxQHXbVrEYhRQqkrNtmAmCQK6D+3fLiLYJ5tINXoc
   7E4S98VLODAbDzGEs3D0ti3EhRQ12p4WdoFGFs4D3pGVheVSrqJ9vkygi
   XIyOUd+OsNtz95mc5KHTlHw+Ow9rhoEpqWedzd1mlnmy3DTSAx2n13nF8
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="258828662"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="258828662"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 07:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="831065704"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2022 07:19:29 -0700
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
        by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 25FEJRYo024307;
        Wed, 15 Jun 2022 15:19:27 +0100
From:   Alexander Lobakin <alexandr.lobakin@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Alexander Lobakin <alexandr.lobakin@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Yury Norov <yury.norov@gmail.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] bitops: let optimize out non-atomic bitops on compile-time constants
Date:   Wed, 15 Jun 2022 16:17:32 +0200
Message-Id: <20220615141732.1265627-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <CAMuHMdVayS6hV3CWW6FS-1cQKoGTCDxgVhZVPSyBMvJHBxVwJA@mail.gmail.com>
References: <20220610113427.908751-1-alexandr.lobakin@intel.com> <CAMuHMdUZCaPN2B6bvmja9rDm3qCc4mYYAOSEB2W0R0pws8peqw@mail.gmail.com> <20220613142645.1176423-1-alexandr.lobakin@intel.com> <CAMuHMdVayS6hV3CWW6FS-1cQKoGTCDxgVhZVPSyBMvJHBxVwJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jun 2022 17:22:30 +0200

> Hi Olek,

Hi!

> 
> On Mon, Jun 13, 2022 at 4:28 PM Alexander Lobakin
> <alexandr.lobakin@intel.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Fri, Jun 10, 2022 at 1:35 PM Alexander Lobakin
> > > <alexandr.lobakin@intel.com> wrote:
> > > On m68k, using gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04), this
> > > blows up immediately with:
> >
> > Yeah I saw the kernel bot report already, sorry for that >_< Fixed
> > in v3 already, will send in 1-2 days.
> 
> Is it simple to fix?
> I might be able to give the fixed v2 a try before that.
> Thanks!

Oh, sorry for the late reply, was busy with stuff.
It's linear, there are (after applying the series) some static
inlines in arch/m68k/include/asm/bitops.h (those which were
converted from macros in patch 3/6), 7 ops in total, you just need
to create definitions with 'arch_' prefix for each of them, e.g.

#define arch_test_bit	test_bit
#define arch___set_bit	__set_bit // will be ___set_bit after 5/6

etc.
Hope I explained it clear-ish :)

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Thanks,
Olek
