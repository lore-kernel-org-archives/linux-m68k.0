Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222CBC433DB
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Jan 2021 12:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6D28233F9
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Jan 2021 12:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbhAMMDH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Jan 2021 07:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbhAMMDG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Jan 2021 07:03:06 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1214C061794
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Jan 2021 04:02:26 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id y12so1010687pji.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Jan 2021 04:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LT7iT6jRWpTrYUmpGpoJWP0DtBFu24AkFbCwh22awYM=;
        b=lZalldHbaoEDoVTFL+tWnnqLSXtPak3C3Ux0Xb9U+SqGghzRf+RRUvNUto7qU5+mtO
         QrUsbpOgTZAWuLTRauetVldYVd9HQn/J8kX6zRMqKNkqxzDed3WvBRnsf+EiGKhSfqUU
         tfBCc51O8WiC5BaFhss9U0VRADwecQ4CWR6dugu3kFba8LKE0m99HBTfT2ykjgis7Fvq
         6kHebDPE6+OBNC+WCZPRczR0fXAPQcA+5AH3RZVyisvgjEB0NV4Qc9H0pl0vEQZfDNvf
         qcPioozxRzgHu1mNQ+VoNJuqwFH8ylnUBFyCMpWI77wIhpr5La7oWiWUx1o2jUlu4lmV
         OX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LT7iT6jRWpTrYUmpGpoJWP0DtBFu24AkFbCwh22awYM=;
        b=uLc3Zn4ZVeugbfeSeAU7BzGFL8XukhH/bMFMIdzAvdeOmk8MmNzt0FawhCPq/uk7l+
         OzhDbR+V/CXKjpj2KciCBAM/BUQX+Fv5iRa2+qD98MmQT6SYk/8BbAqm6My+tcuThG0o
         jr1RdtAK6ll7HCqlvIDeZGoI9WZIUyhZ6wIpJiFRpnSHgc8s+M1eeN6IgpeOHuCVusKb
         ewX8C4xTMTcGCAOuKfrNUttz7qLl5/0cbqUpbx9gCcU4IE/1cOQ4lVNhQJAuFCkd4kV0
         jjNpONoo1RAbcNgEqGR6P2TI/BCZ80zys5JDNA8HtwIPdu1mqcCVs0y/uDp3eC2nyfgl
         oKpQ==
X-Gm-Message-State: AOAM5339f+dPzEvH4YdLOKRwC52+WOYiT8FzeW+5jTIMarXPBwuEvCe+
        z8B8UHCsrSsjmjvQbUidqJ5+OKnY6G/EgqHvNSE=
X-Google-Smtp-Source: ABdhPJw5N4qe3EBN8WiSaMxwCKhSa7X/lCRFzzXC7lDRQ1wUH1+bVcCKJTTP+nzLGQWz3EP8EM93oyqPDOZ0akJAIEA=
X-Received: by 2002:a17:90a:1050:: with SMTP id y16mr2065862pjd.181.1610539346108;
 Wed, 13 Jan 2021 04:02:26 -0800 (PST)
MIME-Version: 1.0
References: <ef1dc21f-694b-2433-e1c6-aa121320173e@physik.fu-berlin.de>
 <f48bcf43-9dcc-e48b-d29d-f75f3814398b@gmx.net> <cb5a2e11-d423-96ec-3d43-3568a109e37f@physik.fu-berlin.de>
 <CACRpkda4E2NwNw29J7x5gehtqn_m3M_Z2dHpc7xRgvb0b-p22A@mail.gmail.com> <b8eb1c83-d2f8-1c72-ca67-4160b90b3845@landley.net>
In-Reply-To: <b8eb1c83-d2f8-1c72-ca67-4160b90b3845@landley.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 13 Jan 2021 14:02:09 +0200
Message-ID: <CAHp75VfzUt_kgzNuXt7pYG4UWcZMF9MtnT1n1j8thOys=OJ+ZA@mail.gmail.com>
Subject: Re: Old platforms: bring out your dead
To:     Rob Landley <rob@landley.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Gerhard Pircher <gerhard_pircher@gmx.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jan 13, 2021 at 9:58 AM Rob Landley <rob@landley.net> wrote:
> On 1/12/21 4:46 PM, Linus Walleij wrote:

...

> Testing that a basic superh system still builds and boots under qemu and j-core
> I can commit to doing regularly. Testing specific hardware devices on boards I
> don't regularly use is a lot harder.

In our lab we have different hardware connected (including non-x86,
mostly due to maintenance and testing drivers) and it allows us to run
more or less fresh kernels on it. Setup is pretty simple: server with
connected USB 2 serial, network, etc, power cutters, relays to emulate
power button presses for the hardware that can't be turned off and on
by cutting the main power (usual case for tablets / phones) and so on.
From a software point of view we use a netboot image [1][2] which
allows us to kexec kernel downloaded via net.

Now to the point, perhaps organizations like LF can set up something
like this with one technician to support this and pay electricity /
internet bills?

[1]: https://github.com/andy-shev/linux/tree/netboot (just a set of
kernel configuration options on top of defaults)
[2]: https://github.com/andy-shev/buildroot/tree/intel/board/intel/common
(see README in the folder)

-- 
With Best Regards,
Andy Shevchenko
