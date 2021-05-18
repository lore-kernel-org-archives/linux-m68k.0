Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67724C43461
	for <linux-m68k@archiver.kernel.org>; Tue, 18 May 2021 13:57:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EF2C61185
	for <linux-m68k@archiver.kernel.org>; Tue, 18 May 2021 13:57:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349687AbhERN7N (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 18 May 2021 09:59:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:48580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349712AbhERN7F (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 18 May 2021 09:59:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5C25611AD;
        Tue, 18 May 2021 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621346267;
        bh=h3KMg6+z++srAMu39xKGp1LPAvtHZS6UzYi5l8h6GTg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=A9ZYYU3cu5Tcr93+TjELcepOnaP+ptbQh0xhlypxZ9C6/Vze7OgIxsbk8UIccufTF
         9chqX3tLC44ZWu0tQD1RHmIZa64cQVQqgaPnOuaSgCjqTWOcDWYspWKCD3qmaBrdjM
         lXW9x4XV4y9EkcUeCkpvQOdIRTB7Nm/Cdf0YqcIgiiEuB4x1I/4lEXRuMfs3nwHNfG
         V4v6HCfYZlHclsN/7I50lhTzUIEbu8UxDTLrAejf3EXgueVP/oSY0qDKTzln2DPAr8
         Dlp2SdSXzTf26daB7n93r/8NXnz5n3f4NJWbrYIsWt6oPb8c+dFv3ZE9Z1cWG8XJOn
         ZiV0A2KEDM92g==
Received: by mail-wm1-f43.google.com with SMTP id 62so4461212wmb.3;
        Tue, 18 May 2021 06:57:47 -0700 (PDT)
X-Gm-Message-State: AOAM533YCR9cWScc4kVksVHjMgPTo6pxotZvfd1GAj+BImlGzyzUBEaD
        jhb13YdowHxcl2mL93mN+G0//OTjNH7imo87bnw=
X-Google-Smtp-Source: ABdhPJyHJGQybLRPgdqtJ3bpl5dBQ1UzTNSqZUC8Txzk4CmVSXarakoln4h/2x9eLgo9gScXwTU/7Znb4zedc/hbl18=
X-Received: by 2002:a7b:c446:: with SMTP id l6mr5062434wmi.75.1621346266300;
 Tue, 18 May 2021 06:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdVfjE=+YiqCrPfGObeYYkQwKGiQEWyprQr-n9z7J9-X-A@mail.gmail.com>
 <1528604559-972-3-git-send-email-schmitzmic@gmail.com> <CAK8P3a0pH0V_y-Ayt0rTNgZGR+Rm6tVRSzjCbo_vuA97c4shkA@mail.gmail.com>
 <83400daa-d5a4-b39d-bd05-544a29065717@gmail.com>
In-Reply-To: <83400daa-d5a4-b39d-bd05-544a29065717@gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 18 May 2021 15:56:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3_2yN374Z6Nbybvs9noxoK9y_c=_6NHxWJU4RK4+Yyhw@mail.gmail.com>
Message-ID: <CAK8P3a3_2yN374Z6Nbybvs9noxoK9y_c=_6NHxWJU4RK4+Yyhw@mail.gmail.com>
Subject: Re: [PATCH 2/2] net-next: xsurf100: drop include of lib8390.c
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Networking <netdev@vger.kernel.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        kernel@mkarcher.dialup.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 18, 2021 at 10:42 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Which reminds me to check how far we ever got with testing the XSurf500
> driver that's still stuck in my tree.
>
> > Alternatively, I can include them in my series if you like.
>
> Please do that - I haven't followed net-next for over a year and don't
> have a current enough tree to rebase this on.

Ok, done. I'll send the series once net-next opens for 5.14.

       Arnd
