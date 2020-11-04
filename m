Return-Path: <SRS0=keNu=EK=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D5FC4741F
	for <linux-m68k@archiver.kernel.org>; Wed,  4 Nov 2020 15:31:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8C8A2071A
	for <linux-m68k@archiver.kernel.org>; Wed,  4 Nov 2020 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604503904;
	bh=HV8mSZuIjG9PrTkULS9Ziz+tCvkyXjt1XyeOgEqrwas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Kqf2DMtfTHvSkyrP/PEszW7khEe2IDyWMYjxb+gTJ1tnmo0vTogVKs1Q37LHbecj1
	 Ai8sHDkLBUGM4TksdHnktSzScHqSCHGlO3vzneTOOOs41H7yuNESZbcwlqH+OjfqMR
	 4kdqLUvRKOGfQraMk2Osb/mGV8sBdYARqvlwek+8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730442AbgKDPbn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 4 Nov 2020 10:31:43 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46260 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729748AbgKDPbn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 4 Nov 2020 10:31:43 -0500
Received: by mail-lf1-f66.google.com with SMTP id v6so27609561lfa.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 04 Nov 2020 07:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vZq7exyTzEqn1P9wDu9H4FDGp7zZ83u2lCN0IL6mt0U=;
        b=Vyq4Y4+TyWvQBIdCyvTTbkYr3eBSmNKsoQN2Z+i3q5X2fNOqa34rD8j/GdTXMaapae
         RfRhjFawL1Czvv1zFEJXEPdKpCaYIJmiebr0IW7yo55Hz75ZZt77Jntm2cOCQxSXx4Bo
         mdy96t/7kbaJZUzXI72kInxkP2RybI+VdtnrSlXOpzTdV/x5EDYI/aUkQuUISk9z9++r
         oLGNmrE1dm/vRZpDR9eVAEqfLbdZtYC2Ri4AZeyHzk11BOsC4zqgEgmRo2ErDgQeIXau
         JY8ihPWcxqpwLLKtl0C1dta+33snhvGHYzLVftn+qC8Ju0jnYMLKvaI6b8snvwkHXagN
         nNgg==
X-Gm-Message-State: AOAM533cFEmZRgaPvh7jUpSYzhUQ3H9WgzAITtBvOGtX1ouo17777dmN
        qWg+NKkHhzfVhw01dCFHzMg=
X-Google-Smtp-Source: ABdhPJwRSLiLaRZaSwpogHRkgT/GyKh9pmsBfphW2C12E8rkVbqI3k4ukijHNONY3iNlnHiLVXffAQ==
X-Received: by 2002:a19:bed7:: with SMTP id o206mr8911457lff.360.1604503900596;
        Wed, 04 Nov 2020 07:31:40 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id e10sm544677ljl.41.2020.11.04.07.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:31:39 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kaKlE-0004iF-4f; Wed, 04 Nov 2020 16:31:44 +0100
Date:   Wed, 4 Nov 2020 16:31:44 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Joe Perches <joe@perches.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Miller <davem@davemloft.net>,
        Jakub Jelinek <jakub@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Kurtz <djkurtz@chromium.org>,
        linux-arch@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Subject: Re: get_maintainer.pl bug? (was: Re: [PATCH 0/8] linker-section
 array fix and clean ups)
Message-ID: <20201104153144.GX4085@localhost>
References: <20201103175711.10731-1-johan@kernel.org>
 <20201104091625.GP4085@localhost>
 <92d39ff1408078a656c43bee24e7e9b3e3815e72.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92d39ff1408078a656c43bee24e7e9b3e3815e72.camel@perches.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Nov 04, 2020 at 04:04:00AM -0800, Joe Perches wrote:
> On Wed, 2020-11-04 at 10:16 +0100, Johan Hovold wrote:
> > Running scrips/get_maintainer.pl on this series [1] gave the wrong
> > address for Nick Desaulniers:
> > 
> > 	Nick Desaulniers <ndesaulniers@gooogle.com> (commit_signer:1/2=50%,commit_signer:1/8=12%)
> > 
> > It seems he recently misspelled his address in a reviewed-by tag to
> > commit 33def8498fdd ("treewide: Convert macro and uses of __section(foo)
> > to __section("foo")") and that is now being picked up by the script.
> > 
> > I guess that's to be considered a bug?
> 
> No, that's a feature.  If it's _really_ a problem, (and I don't
> think it really is), that's what .mailmap is for.

Ah, Nick doesn't actually have any commits touching these files; I was
confused by the "commit_signer" in the script output and didn't expect
Reviewed-by tags to be considered all (and at least not over SoB).

Hmm. Guess it's working as intended.

Johan
