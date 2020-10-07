Return-Path: <SRS0=Hd0i=DO=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AC9C41604
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 11:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71CE82075A
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 11:12:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgJGLM2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Oct 2020 07:12:28 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:41563 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728040AbgJGLM0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Oct 2020 07:12:26 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Oct 2020 07:12:25 EDT
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MG9wg-1k9c5G0gAe-00GYHS for <linux-m68k@lists.linux-m68k.org>; Wed, 07
 Oct 2020 13:07:22 +0200
Received: by mail-qk1-f172.google.com with SMTP id s7so2115413qkh.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Oct 2020 04:07:21 -0700 (PDT)
X-Gm-Message-State: AOAM530xFFW+YIVMZ0fLWTiDCx/8i+rpOT1QinPWqc0HhLCB8BSGagiF
        iFNdCG/Knp1P7K+fFixltyuLUm3lObfVaN860Bs=
X-Google-Smtp-Source: ABdhPJzv49GK72G1X8a28drCtbBnhsqm87k5a2dAC3nqOLHjuohsHhfE83fzukBmdWOct5Xcuk6frrtwL5rFwz31X4E=
X-Received: by 2002:a37:b686:: with SMTP id g128mr2180775qkf.286.1602068840973;
 Wed, 07 Oct 2020 04:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de>
 <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
 <20201007085911.GA17356@lst.de> <CAK8P3a2w1Q4coFLnW4sDQEC_01uwWWUkuGyqj=r=x3jtB8uhNA@mail.gmail.com>
 <20201007104046.GB24327@lst.de>
In-Reply-To: <20201007104046.GB24327@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Oct 2020 13:07:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1JdeCxr16+wAnYqLwJBuLqTgS7h-UCoiXD5OijQ-evyg@mail.gmail.com>
Message-ID: <CAK8P3a1JdeCxr16+wAnYqLwJBuLqTgS7h-UCoiXD5OijQ-evyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] fbdev/sbuslib: remove FBIOSCURSOR/FBIOGCURSOR leftovers
To:     Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jgWE280tBUBrAyX3o5y9m5A2z7h127ealGem6vbB2zbBUozz1/e
 CtmLMPeWivrlDEsz9MI2QGx4kyIal1MGijg7laHpJG2EqurMh5X7LmMuq1dFQApzgjt3sCb
 iaujvvjTW+xNDDmDm84ZehdozCXRX+97V/aWdELB2Llr0UV3NY46HswR+SZtyukFtEpO6Rd
 hgza8R4CVFzG9vrGWirlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3irTvEEvjuY=:a1brq22X+V94lVb5HmdHK+
 BmuoTeUBfU6CQ35C4pQh2W9/wSotZUzT5HBug212vxu2pkVSSr6lYKKMBBEO1uqh2A+Y+XK+m
 MhL5/aU67cXR8f4UW8bcXITm3uOV9pj4S2oGPFdUSplWmh3oDZCGegZSv8cKLasfMDuN/Lkju
 177/K172SggQJN7i3NV0VI3tachFCEdPMnJ7RXXVXijvffLVwJ6pKZxy834JY93h/GzWfUg1I
 mi7jkK+NqsBz3xD5/nR7UJ3o/B4Ev9UMY+GroqepY+96wIO1mkw2BPWFqIjKLzPw9k+Ocd1d0
 y5/upj30+y75tZ1tDpWC9jo1InZziQyLZp1t8r7DMSKBEg0FsYqgj9fkMwRn5l7ThxhxXciLL
 l0D1tzadDWy5+eYNZquXmK7dlJ48zvmn6WynoVWZ8F0syE8C6j1RgPrwP3NfVaE89W4YwG+gT
 +kddwXcVlCwHwDejx3NZR+nMcLT1PJfFb6XU9BpplaLxZkwoKdKMSaUc7PCo9wuJNQ+cLTKxH
 0LTCw6IMDM9R4wGG4ifNBiUdk2lFEvoad5rs7hIENYIh3iRfkv8S38nNzKvv2r0ICnePaF4Ax
 jolmvunaQjMS9+pVa4bHxNYTxo6sJR4MMueHZwhvqoDzfVOwfl+Lsw8/UWe5n1rqqbwfY5VyK
 7HcUiTpeN56yfvSnZqt0+MuGDQNrCtiph+HhR4EryXQuyP6hSyYqL6yaM6bT/3w8oZfoom3qH
 KHeGwkmMQoMe2aqdSIvVn5lCpZJ5uOYBAZOMaggXxc9sWV5kxq8DUmzHD6WKDtxIT8BmT6GLl
 W2gB2+BA+t1777rhBmCjUfwd3T0rEzQYvjoGIo0F7bCGuO3A55czkwjFTROnrG9r/zonUYJl3
 EEAuSGxj6kdFyuAG8wE/SnFLP8ZMy8nnWoOPKutD7qIz1fNQ4Ef+hYXfRGhCNy7K4M+GUJHY2
 d9dey8z39CdQJEnG7kaFloABEcE8AIUDcgczYqffy0Yto/XCKnWqU
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 7, 2020 at 12:40 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Oct 07, 2020 at 11:28:58AM +0200, Arnd Bergmann wrote:
> > The only one I have actually given up on is the atomisp staging driver,
> > which uses an awful hack, copying the x86 implementation of
> > copy_in_user()/compat_alloc_user_space() into the driver.
>
> That is gross.  Just mark the driver as broken for now.

Ah, it seems that Hans has already done that in commit 57e6b6f2303e
("media: atomisp_fops.c: disable atomisp_compat_ioctl32"), which
removes the only reference to this code. In this case, I think a one-line
change to stop building that file would be best, then if anyone ever
wants to fix the bug that Hans and Sakari found, they get to do also
deal with replacing compat_alloc_user_space().

I'll send a patch for that right away, the patch I have in my tree was
so evil that I hadn't dared submit that, but it was useful for
compile-testing the compat_alloc_user_space() removal patch.

   Arnd
