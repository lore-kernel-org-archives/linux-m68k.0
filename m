Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28A9C433ED
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Apr 2021 14:16:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A653B61289
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Apr 2021 14:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236226AbhD0ORh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Apr 2021 10:17:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:32998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236173AbhD0ORg (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 27 Apr 2021 10:17:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 920B0613CA
        for <linux-m68k@vger.kernel.org>; Tue, 27 Apr 2021 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619533013;
        bh=x+S+URIcwtshzW1A4yylv3+i4kHfb0izsDwB02TszHw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VkvkX9p0bwCmg3PwDePF8XFTYX9ikjGMPHX2Eddnuo0ektC3GCUcKCNmJJhBeV0Og
         wV6NyFQaYYkll53RqGQA2OEwmeBzTyMrhQjJ0SZFfEvbc2I/hdTf9RIKcs0mVrtr+w
         yXxPlEMzvQp/SSp1DQVSuDCTQIFMgRhU0bdDk70tfVfUEtxcTPuKF+utk2GO1JLkTK
         k5rdggQ8lCibrw/wqRuMj8Rm1h4z/XN38cbgxu/qspSEkI4cYUxI8Wj4NpCKBRE0hB
         kT1ZzGpAPEqO9fTqyMB4h22k4jUjMYCQHsXtuCrzvlcaiMm15jmAaW7KRTxaqvlCwP
         E/AFgLzJ7NJQA==
Received: by mail-wr1-f54.google.com with SMTP id e5so30995248wrg.7
        for <linux-m68k@vger.kernel.org>; Tue, 27 Apr 2021 07:16:53 -0700 (PDT)
X-Gm-Message-State: AOAM532VTwb1JFwpYLbyW5xrgnkN2etyc/Z5ZqAHPr5DdB39pN7kItBH
        1AiN9akkBvN5kOcSvwFLG0cESgMWOJKj2drerq4=
X-Google-Smtp-Source: ABdhPJyFMlCnk6k2VZ+mh3BI94qHWUhkSq7FSu0nAXLax0vdDssba6sFdfToAGHq+JfzRE/rV663GDTETRIFXrZsnJA=
X-Received: by 2002:a5d:4452:: with SMTP id x18mr10791360wrr.286.1619533012043;
 Tue, 27 Apr 2021 07:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210427134931.1309102-1-gerg@linux-m68k.org>
In-Reply-To: <20210427134931.1309102-1-gerg@linux-m68k.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 27 Apr 2021 16:16:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a18FUkgu0uLv_4i1HLJmWdQuGH4Lc1b+F3Zi_sE7ase6A@mail.gmail.com>
Message-ID: <CAK8P3a18FUkgu0uLv_4i1HLJmWdQuGH4Lc1b+F3Zi_sE7ase6A@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: fix missing LCD splash screen data initializer
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Apr 27, 2021 at 3:49 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
>
> The kernel test robot reports that the "screen_bits" splash screen data
> is missing for the dragen platform:
>
>     arch/m68k/68000/dragen2.c:73:16: error: 'screen_bits' undeclared (first use in this function)
>       73 |  LSSA = (long) screen_bits;
>          |                ^~~~~~~~~~~
>     arch/m68k/68000/dragen2.c:73:16: note: each undeclared identifier is reported only once for each function it appears in
>
> Digging around a bit I found the screen_bits data structure was originally
> in a screen.h file that was generated from a screen.xbm file. That was
> removed in commit 0c0e6db80683 ("m68k: drop unused parts of 68VZ328
> Makefile").
>
> Other splash screen initializers for 68000 targets are kept here as the
> C data structures so lets do the same for this one. Add the missing
> screen.h file and include it in the dragen specific startup code.

Thanks, I certainly appreciate not getting the nag emails from the lkp bot
any more ;-)

Acked-by: Arnd Bergmann <arnd@arndb.de>

I also see that it started out like this even in linux-2.5.25 when Alan Cox
originally merged arch/m68knommu, so presumably the platform has
never been used (at least with a screen) after it got merged into mainline.

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>>

Note: extra '>' in your signed-off-by line

      Arnd
