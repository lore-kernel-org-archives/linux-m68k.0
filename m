Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84826C43334
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Jun 2022 14:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358342AbiFVOhw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 22 Jun 2022 10:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358249AbiFVOhv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 22 Jun 2022 10:37:51 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41E93CA53
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jun 2022 07:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655908670; x=1687444670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xA+AX77vbPPnWCLAuym9yD93ebv8XWnin6EN1d9z6Y0=;
  b=Ebul5HJ6tzZzJqE+O+8CvVfxZ6NSsLcMocEAIJU1YAbom+hzmhuxSD91
   QqAU2WUMzEM71hIe+h4pUWlN1heGvz6mHuAKPgnkIvhFuaPs9hhL2pxoZ
   jpyTViF1esxDoFiAR1PBJYG2zK0Ytq0Ulj2e0E1sRgJfTH63lrMjm4BJ7
   nx2ixlUwDNs/q6zbxAsjLmNQppUXwO7O25UWoAnPR9hQT7sv0lAOKW0z4
   BXG6BpHIwR9XTbAP+oq4EUooWYjxt9VBZDNRvWa6S9LGVVElpC0gQGJjF
   pIiKfQL077l3f5nvhLhEuDGnhwwS3s9rTO+ZIlulA1Y0KfPqoiwtW+bQa
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="366755287"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="366755287"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 07:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="715428449"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2022 07:37:43 -0700
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
        by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 25MEbfrW014711;
        Wed, 22 Jun 2022 15:37:41 +0100
From:   Alexander Lobakin <alexandr.lobakin@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Alexander Lobakin <alexandr.lobakin@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Yury Norov <yury.norov@gmail.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Yoshinori Sato" <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        "Maciej Fijalkowski" <maciej.fijalkowski@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH v4 0/8] bitops: let optimize out non-atomic bitops on compile-time constants
Date:   Wed, 22 Jun 2022 16:37:39 +0200
Message-Id: <20220622143739.291698-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <YrMlrjbue7twWLk1@smile.fi.intel.com>
References: <20220621191553.69455-1-alexandr.lobakin@intel.com> <20220622122440.87087-1-alexandr.lobakin@intel.com> <YrMlrjbue7twWLk1@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 22 Jun 2022 17:22:38 +0300

> On Wed, Jun 22, 2022 at 02:24:40PM +0200, Alexander Lobakin wrote:
> > From: Alexander Lobakin <alexandr.lobakin@intel.com>
> > Date: Tue, 21 Jun 2022 21:15:45 +0200
> > 
> > > While I was working on converting some structure fields from a fixed
> > > type to a bitmap, I started observing code size increase not only in
> > > places where the code works with the converted structure fields, but
> > > also where the converted vars were on the stack. That said, the
> > > following code:
> > 
> > [...]
> > 
> > Oh gosh, now s390 failed and 7/8 revealed one existing code flaw in
> > the ice driver.
> > I'll fix those, then will try to test more platforms (to not spam
> > series again) and send v5 soon (mentioning this as bots CCs only
> > myself).
> 
> One mail per person? Because I also got a report.

From the headers:

From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: <llvm@lists.linux.dev>,
 <kbuild-all@lists.01.org>,
 <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I guess it's due to your Reviewed-by in the commit message, no one
else from the original CCs list is present.

> 
> -- 
> With Best Regards,
> Andy Shevchenko

Thanks,
Olek
