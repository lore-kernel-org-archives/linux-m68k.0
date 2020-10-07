Return-Path: <SRS0=Hd0i=DO=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09D8C4363C
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 09:29:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54FCA20870
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 09:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgJGJ3S (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Oct 2020 05:29:18 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:32861 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgJGJ3S (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Oct 2020 05:29:18 -0400
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M1pk0-1kNspf3mxM-002Gos for <linux-m68k@lists.linux-m68k.org>; Wed, 07
 Oct 2020 11:29:16 +0200
Received: by mail-qv1-f51.google.com with SMTP id cv1so765876qvb.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Oct 2020 02:29:15 -0700 (PDT)
X-Gm-Message-State: AOAM530M/9J257AEpT8rdefpWJRsCRUqH213fFQQZHuX3LW5MVL8/H8O
        6MulqmVkkDSM6A3TfarJOEfir8UJP9r+E25jKTk=
X-Google-Smtp-Source: ABdhPJzsxFndaaRwZ3U5rVgOmiJcVtZPOoHewULoEnsw7Jee9ymhitQEl66Qm1onFjPl2v+KzYJZL0R3o7dDqsqgqKE=
X-Received: by 2002:a05:6214:1873:: with SMTP id eh19mr2334325qvb.16.1602062954728;
 Wed, 07 Oct 2020 02:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de>
 <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com> <20201007085911.GA17356@lst.de>
In-Reply-To: <20201007085911.GA17356@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Oct 2020 11:28:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2w1Q4coFLnW4sDQEC_01uwWWUkuGyqj=r=x3jtB8uhNA@mail.gmail.com>
Message-ID: <CAK8P3a2w1Q4coFLnW4sDQEC_01uwWWUkuGyqj=r=x3jtB8uhNA@mail.gmail.com>
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
X-Provags-ID: V03:K1:j/7fBy8nx1aHhWr2XykCWFlG7flhxTuUihQ0FCuz1xHSrZcMmwd
 Zr36PyqukPQcHo+uQJpXe0lRMjRD8UdPe06LXtxQ/9QK8OibNPVbIeVBipNGCvR3+MNZY78
 nwtBxjV335eubto6WQ0BtgZkcK2OM3bbn2JzmMVAvybEpFhMJnLwiGDUQiCVMfFpxOCmkP7
 HtU58yNQwUf60EB/ZyHGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V4ZE5bu4YgI=:QJNVtdyMimQke2yW7AOekX
 K0ucMnztWg+2CQ7iL6TC4iesGguoHBXVArIg99QRPbl1EIq1YJYxxZvwhOIs7JF8vIHRAuzu7
 GT1Lns6yuOHiJgeB3yi9WZZr5wMW/EL8kE9HFDAcxVjBeKujubDVjmMRV661Xho3aodU68S2l
 V/EqjIAQPMRxNwAkLKFUQzAmpQrZ05k8oHKLt7JzDcdUi/LRQy25CHVwUE1jpiGDdH9veR5eB
 SlMul4OQErmeynIR38rwr7bKuQbvvW9ODWomDD1JSU9CtH/REbfx5kx4+p/wwUet+b2lLyIfR
 IsuAQgG6tNXGfPSX2iftD5sru4KsMZXln+1eTMNMl5ruys9mS/VzKhZaO0STvT4AVkamgEWlL
 AEufLqbry3tUfO5tHtlSDo5smEovkMMdabb5Ms9rD+RVrknVwCyJER9jPGTi662kv8lchXePH
 Y3fCw7PVUXpS8C08rJvUH1qxxXkdn2426R0C6kxRGkbpEtCkHDyj1s6TXyR9WvGAjaqt0e8j5
 JK5xa+DZlN4rD1HumArqFptvgK1RJUz0tF/cLHC7a7PePRCJxItLirwnToeGwpmGfOZgNLGUM
 Gcl/J7Q/hztBVJDYOtD/zmJgeseFWCfo4xaf+TQADjW3jE4TaqAK1XECNrFjXYeL+cfPD3GtT
 WV7RjKnOjKyXtmg9ObU6/9RMdLyvWftP1wkPUBTEQI66nEzYepp/IypbXN0t6MEytdKLoAhBK
 1s10ntpGmaMSinXh80nurMi6XCNFWwHI6qDevxdl1cI7NmtlgL/GgrdCMmHknwwnTZH5ZNzO9
 hEI9MQB9poPzTjPjWW48YEGnWCM22iL7FKlqEjY4KUixiJ70Tymj3TAvT8ZTTrrWXWbVjSwvZ
 txq3rnnohcsp1fxl8iwanzJr2VSLlvlHrMrTxv1e23n0wnfSIE7VjRngzKFTYMz37tvYtjQiP
 JcbtrYNA2n+EzYLTeUZSAhyCFJOb5uPkrE8/V1S4SSYk+sC4epOqp
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 7, 2020 at 10:59 AM Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Oct 07, 2020 at 10:54:19AM +0200, Arnd Bergmann wrote:
> > On Wed, Oct 7, 2020 at 9:44 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > There are no actual implementations of FBIOSCURSOR/FBIOGCURSOR left, so
> > > don't bother with a compat handler for it, and remove the remaining
> > > definitions as well.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > I had submitted a similar patch earlier, and Sam Ravnborg applied it to the
> > drm-misc tree, but it doesn't seem to be in linux-next, so I don't know
> > what the state is.
> >
> > My version only removed the compat handling, not the data structures,
> > so I'm happy to see your version used instead if mine got lost.
>
> Oh, sorry.  I thought in your summary you decided to give up on
> the sbuslib ones.

Here is what I have pending at the moment for set_fs() and
compat_alloc_user_space():

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=compat-alloc-user-space-2

The only one I have actually given up on is the atomisp staging driver,
which uses an awful hack, copying the x86 implementation of
copy_in_user()/compat_alloc_user_space() into the driver.

This is based on last week's linux-next, as I plan to resubmit after the
merge window.

     Arnd
