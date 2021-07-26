Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5100C432BE
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Jul 2021 07:40:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94E7C60F4B
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Jul 2021 07:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhGZG7o (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Jul 2021 02:59:44 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:50297 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232752AbhGZG7n (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Jul 2021 02:59:43 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M6EOc-1m1Lda1U2i-006fjZ for <linux-m68k@lists.linux-m68k.org>; Mon, 26
 Jul 2021 09:40:10 +0200
Received: by mail-wm1-f52.google.com with SMTP id 9-20020a05600c26c9b02901e44e9caa2aso5605902wmv.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jul 2021 00:40:10 -0700 (PDT)
X-Gm-Message-State: AOAM531dE3ZrxB4rnX23w5NFMlYDdbQNhHf8V1/1IybCfy777OYjLEgP
        9y0h0NvogKp+MjdVG4WZGE29HcvciKJXbswX3U8=
X-Google-Smtp-Source: ABdhPJyUu+zpKQgLCzD92xlTKJ+CdL+Qe3BKBoET07REAC9wsTFKxyxXX9p30cgRZ0s2LdofhlqDl1W4NQEu0QxiHko=
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr6487271wmc.75.1627285210031;
 Mon, 26 Jul 2021 00:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210725104618.365790-1-geert@linux-m68k.org> <db2de193-a10-598-a21e-3a305b91d191@linux-m68k.org>
 <CAMuHMdWrg7zUC+iMjXS=RS=Fa7ZVS-0iycjQ2UP6W0pHzdGxKQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWrg7zUC+iMjXS=RS=Fa7ZVS-0iycjQ2UP6W0pHzdGxKQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 26 Jul 2021 09:39:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3N61zpEphfPoPWgAK3iGx2Cqo3HL1jrce=Kz9iuML1Og@mail.gmail.com>
Message-ID: <CAK8P3a3N61zpEphfPoPWgAK3iGx2Cqo3HL1jrce=Kz9iuML1Og@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix asm register constraints for atomic ops
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Greg Ungerer <gerg@uclinux.org>, Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Brendan Jackman <jackmanb@google.com>,
        kernel test robot <lkp@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/1GmSkq1OvnEf845NWQIzq3SJwPqGQpw5mRUxQ4suqK4b7D29yZ
 baQSJ0mQMFBx5sSJh4DhRWf4UHLPqyxHTDVCfGl5zDhoMJhDxG4UtG3KYd2wyWuVXlDl4T8
 aqUKu6/0npkcgiGKm95J1qrgLlCCXuVqNGFFLkGrwb9xFxfL+tWmqZ1IV/wrZ2HTP659g6a
 qAESPeyvqs99QGkIc6XIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H+7OapuVzhI=:iWtQtHVm3qReTe3KuN0zM/
 c3nBX2Ef7f/iYLx4QtVfpk8xHzWYRRZGIW4I7z+fh0/kUwTctRjFngnSn2DKh5yifXunqTWUw
 d3vOgYwQ5mOxrGUPtyg3orHFTR9bY11VUTzt4U7xTknv+2mjGN45ZL9JOn7H8UQyjz1vg0T4x
 WD1KhCoXfH/xxGuWDBrzFM8e5qZAsUR3ztriu3N6NN2nSsnuMY/PcP9dGBacrzCvF4sgh3YkL
 3hUwiEKbCiOmIB7Dc2cWJP1xD0Dler+PewBl85v1tJT1bAKb+GEsPTSyNNjQl+mEd8y7Qh0mw
 jnswHUR+Jr/Al4tQGqDiEJM8Ov992+Hip8gyEcrG5YMcrSyObykfiZUFGNtvPFk+aqryAB5NM
 HrvEGHKZ5wMWMsDT/iHUYzAYPaEl+Yf5MBLPKORa6I9J/NA5OMA1DTFNZlLuILD7foJUTzYuF
 BqP9NyELIKSMAMPck6fbI5g+AiC+Mti5sJFNY079e/bd1rSpBV3rOfElBgUj8SA9PYkGQJbue
 hDJIZW4FIQqtImLTerybkQar02Rv1mF6g7KQkl0srveyUw6TuX6T95pDybp2mp6ScsPV+/Ogj
 6xGn8Kv4ts9EDKcrhwUVKhemVKYTv/MyHg9IqlFbR6rww832nsuTqMpBygHgPHvCE7a8uIakn
 /zD0z0OIBRLypcYEaNdN5UNRMvHkfEkDy83CDnOUpadG1cG2h5xgCutPQg/dTu8EVE/8dHmBb
 S+z5ZUb+ebCLMw+TONnoToVd+75tiEXgLSfKwIDGVjhRPybDrrFyMMokUTHj6qOKlNDEFhxxm
 eAlnEDeLPe7gL7+BLMQCXndmLtquuIVgGZhlUjtbHtesnrdlB0NDtOK5CVjfusW/a3Cr4zm/d
 hrpC3quOCMNL63tHMfoFM6T0rwJ401gKhcxBTXf2okpDqSJ/jQKG6ISrXX85h6p/H6Mcu1PQj
 Axz2hIprke24K6avDVLyyYny3zk6YzcGlnFyG0PM8uumk2f0rahfm
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 26, 2021 at 9:34 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Finn,
>
> On Mon, Jul 26, 2021 at 1:45 AM Finn Thain <fthain@linux-m68k.org> wrote:
> > On Sun, 25 Jul 2021, Geert Uytterhoeven wrote:
> > > Fixes: d839bae4269aea46 ("locking,arch,m68k: Fold atomic_ops")
> > > ...
> > > Technically, the issue was present before, but I doubt adding pre-v3.18
> > > Fixes tags would make any difference for stable...
> >
> > There is a better way to constrain backporting, that is Cc:
> > stable@vger.kernel.org # 3.12+
>
> I don't want to constrain backporting.

I would recommend adding the plain

Cc: stable@vger.kernel.org

line to the footer to make it unambiguous that you want it backported then,
plus moving the explanation above the --- line. You can never be too explicit
with those.

      Arnd
