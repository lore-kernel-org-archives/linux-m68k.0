Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F49C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Jun 2022 02:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345707AbiFOCrr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Jun 2022 22:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239054AbiFOCrp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Jun 2022 22:47:45 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363CD245B4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Jun 2022 19:47:44 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id p63so7813099qkd.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Jun 2022 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NX493qPAQUrj6ioWF1jnmkJZEbKs1Z+Hiz8Q7SOMdJc=;
        b=CQVSPpZxgQLRrldrZt26nPVIEXM4/7qMFk8dKvjGgw1iaCmkhmgf1FIsFOFPyzgx3h
         l2NsM46f9Tx+tDhapROO0VMF+f+h40YS5jDFP9l34So1j75zs3sLOKDE9NgOvg22zaHn
         peDbKBfc+40NOpLm/mO2mNmi35eK3vL6W2o6IelRysxNBAIQcBAD5CrwS04wLzffuxAh
         iAHKel08mQgQSIKMxN23DwfIU13+AODm07ZdW3ZRh5dnOR/yImnaPEOqnLbm5KL7idlW
         ujWAV+QC7WAS7fvST9mMbnasGN30MJj5SoLVyExKJOUuJQPRd4dr7KJ/ycf9G2jhyTny
         5Dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NX493qPAQUrj6ioWF1jnmkJZEbKs1Z+Hiz8Q7SOMdJc=;
        b=mkrUD9Pt1pFItcJLQqQVq3cdpuHQdIWrmzkDd6p0Zx1SQEBjLlzA8fPQbVTzztkAly
         yQ7b56GXYBbTcl0aaU/4w6PzUo8DqV/58G0bZuLRudlP11xuMMMRtRiAG4iaFldrLwnf
         7tw812WI8CsUfgtgfXjApS5DWj3Hu2f7whmKWzj+/0gYpksM6qTTQJBQdkAjuYf/1Cxg
         TMYW3PZ6R9KWFx6bVokBaO7G1CcQA0RJugv4XUusYuIkfnju3tq3hO4EIJCfbx4gk4kJ
         Lwv35u3BjYct0GfP3hawQwKhdbl3MYP60UZ88b8M0MIfRYfsttzsbp71JgM8lbRpo82T
         YLJA==
X-Gm-Message-State: AOAM533a+V8LEjuDHXrTKRkFFyKcB6DrRX86NwvssQTTN4yKlLKs5lTW
        9NRxNkl3F8uWmW6LmElwRig=
X-Google-Smtp-Source: ABdhPJyZHYuaU/D+eineQMFdV6J7BCxsJGvrMAhYxZZd+ZYmh9NyAi2OUYuTzAq1GpTH9fKhDPKa4A==
X-Received: by 2002:a05:620a:4613:b0:6a7:1d69:2a6f with SMTP id br19-20020a05620a461300b006a71d692a6fmr6439311qkb.276.1655261263927;
        Tue, 14 Jun 2022 19:47:43 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:1230:6d39:b768:5789:ec2a])
        by smtp.gmail.com with ESMTPSA id gd8-20020a05622a5c0800b002f93554c009sm8261258qtb.59.2022.06.14.19.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 19:47:43 -0700 (PDT)
Date:   Tue, 14 Jun 2022 19:47:42 -0700
From:   Yury Norov <yury.norov@gmail.com>
To:     Marco Elver <elver@google.com>
Cc:     Alexander Lobakin <alexandr.lobakin@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Borislav Petkov <bp@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] bitops: always define asm-generic non-atomic
 bitops
Message-ID: <YqlITqttNYqT/xpN@yury-laptop>
References: <20220610113427.908751-1-alexandr.lobakin@intel.com>
 <20220610113427.908751-3-alexandr.lobakin@intel.com>
 <YqNMO0ioGzJ1IkoA@smile.fi.intel.com>
 <22042c14bc6a437d9c6b235fbfa32c8a@intel.com>
 <CANpmjNNZAeMQjzNyXLeKY4cp_m-xJBU1vs7PgT+7_sJwxtEEAg@mail.gmail.com>
 <20220613141947.1176100-1-alexandr.lobakin@intel.com>
 <CANpmjNM0noP8ieQztyEvijz+MG-cDxxmfwaX_QTpnyT5G33EGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNM0noP8ieQztyEvijz+MG-cDxxmfwaX_QTpnyT5G33EGA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 13, 2022 at 04:33:17PM +0200, Marco Elver wrote:
> On Mon, 13 Jun 2022 at 16:21, Alexander Lobakin
> <alexandr.lobakin@intel.com> wrote:
> >
> > From: Marco Elver <elver@google.com>
> > Date: Fri, 10 Jun 2022 18:32:36 +0200
> >
> > > On Fri, 10 Jun 2022 at 18:02, Luck, Tony <tony.luck@intel.com> wrote:
> > > >
> > > > > > +/**
> > > > > > + * generic_test_bit - Determine whether a bit is set
> > > > > > + * @nr: bit number to test
> > > > > > + * @addr: Address to start counting from
> > > > > > + */
> > > > >
> > > > > Shouldn't we add in this or in separate patch a big NOTE to explain that this
> > > > > is actually atomic and must be kept as a such?
> > > >
> > > > "atomic" isn't really the right word. The volatile access makes sure that the
> > > > compiler does the test at the point that the source code asked, and doesn't
> > > > move it before/after other operations.
> > >
> > > It's listed in Documentation/atomic_bitops.txt.
> >
> > Oh, so my memory was actually correct that I saw it in the docs
> > somewhere.
> > WDYT, should I mention this here in the code (block comment) as well
> > that it's atomic and must not lose `volatile` as Andy suggested or
> > it's sufficient to have it in the docs (+ it's not underscored)?
> 
> Perhaps a quick comment in the code (not kerneldoc above) will be
> sufficient, with reference to Documentation/atomic_bitops.txt.

If it may help, we can do:

/*
 * Bit testing is a naturally atomic operation because bit is 
 * a minimal quantum of information.
 */
#define __test_bit test_bit

