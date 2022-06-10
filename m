Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF9CC433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Jun 2022 16:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242991AbiFJQCK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Jun 2022 12:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243783AbiFJQCI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Jun 2022 12:02:08 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F6116B2F7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654876926; x=1686412926;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kNcm+gjJO6fKHMBCmtNxq9Lkb0xQ0Nu8YYmwRSNqM/Q=;
  b=JUlh5t2Eh6hkjCAMKkExU9H9eh2ABT1iqRTRWfPrAuVG3SKNzPcimc3x
   FAOBUS37llgE+62WgYz7+NZQacJT3oFtLxxFQ/myO8HIz0vhnYgKGAcGR
   mz87A24QeBVSCJ+GZYkIqNg4+udYzRYWCCjNr9JKwnFAVg9N7mDedJ3eC
   ePlyiePbUh5WULkAnTEOndM00wXZuL53kqD+/I8Obn04CEpErSPihgfuq
   B5MzH0FzkrVI771hGTOPCSIW1Y7a17HRWWMcYTP8rRV4X0Mjv52CUFSWy
   l9FrEap7GMMGKLTGlxuS/qsH/sMMEUQrXZXSBzXoP90LNUAuG0mhgxzD3
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="258103360"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="258103360"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 09:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="760569390"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 10 Jun 2022 09:02:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 10 Jun 2022 09:02:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 10 Jun 2022 09:02:03 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Fri, 10 Jun 2022 09:02:03 -0700
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Lobakin, Alexandr" <alexandr.lobakin@intel.com>
CC:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/6] bitops: always define asm-generic non-atomic
 bitops
Thread-Topic: [PATCH v2 2/6] bitops: always define asm-generic non-atomic
 bitops
Thread-Index: AQHYfL4xWJEoq3eTcEeKREBjFjjrHK1JHg2A//+t5kA=
Date:   Fri, 10 Jun 2022 16:02:03 +0000
Message-ID: <22042c14bc6a437d9c6b235fbfa32c8a@intel.com>
References: <20220610113427.908751-1-alexandr.lobakin@intel.com>
 <20220610113427.908751-3-alexandr.lobakin@intel.com>
 <YqNMO0ioGzJ1IkoA@smile.fi.intel.com>
In-Reply-To: <YqNMO0ioGzJ1IkoA@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

> > +/**
> > + * generic_test_bit - Determine whether a bit is set
> > + * @nr: bit number to test
> > + * @addr: Address to start counting from
> > + */
>
> Shouldn't we add in this or in separate patch a big NOTE to explain that =
this
> is actually atomic and must be kept as a such?

"atomic" isn't really the right word. The volatile access makes sure that t=
he
compiler does the test at the point that the source code asked, and doesn't
move it before/after other operations.

But there is no such thing as an atomic test_bit() operation:

	if (test_bit(5, addr)) {
		/* some other CPU nukes bit 5 */

		/* I know it was set when I looked, but now, could be anything */

		...
	}

-Tony
