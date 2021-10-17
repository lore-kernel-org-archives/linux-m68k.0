Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4166BC433EF
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Oct 2021 19:24:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 149DC60F9E
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Oct 2021 19:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344503AbhJQT0l (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 17 Oct 2021 15:26:41 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:41377 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344500AbhJQT0k (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 17 Oct 2021 15:26:40 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N5G1V-1mkCeu32nN-0119dw for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Oct
 2021 21:24:29 +0200
Received: by mail-wr1-f44.google.com with SMTP id u18so37310241wrg.5
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Oct 2021 12:24:29 -0700 (PDT)
X-Gm-Message-State: AOAM533Yqef4TNKs0CzVlUsBZ9xlIZCwYugYCNXDMYXElz1pbnZXAbvi
        F1ruhq0mzsUtarUweldpMBKwWQu8aAqSsw3Xrnk=
X-Google-Smtp-Source: ABdhPJz06nWeDGDSfJUWmNphkeTeXDInpz4LYmoGZirzU57U59ghhTBygkSOEku0/gJMZVtNDsuBy6/HCoHLpUDvyQU=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr30191680wrc.71.1634498669396;
 Sun, 17 Oct 2021 12:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211017174905.18943-1-rdunlap@infradead.org> <CAK8P3a3XDY5gMUA3h3tVmQuxSHn_J3qOw_rDurzBx-KFdGhCKA@mail.gmail.com>
 <8aad5fd2-6850-800a-3c56-199bb5d4f4ae@infradead.org>
In-Reply-To: <8aad5fd2-6850-800a-3c56-199bb5d4f4ae@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 17 Oct 2021 21:24:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a21-mu=eN7qu+1C11Rwp_S3T0iJ+ronmMGyeYcw=Ym61A@mail.gmail.com>
Message-ID: <CAK8P3a21-mu=eN7qu+1C11Rwp_S3T0iJ+ronmMGyeYcw=Ym61A@mail.gmail.com>
Subject: Re: [PATCH] asm-generic: bug.h: add unreachable() in BUG() for
 CONFIG_BUG not set
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lUKiDmnRIaFkUlTM+a87ebyBNQcFdmIxmlDcGFWHsdjfZ0glEZV
 pyyc/2S/A9+cctkrRFqEy6hmrpRuoyOVmqJr2oFZ3Al22AUxH2YFymgfQ9Ji/5D2dnpGS5z
 8tONJad8KFA7nmqWW/XFsAB7n/2aQEDzj0/UNzioIni6AEXx16ILb7X+Xh4FkuWrJe0d8oK
 hY+xDJW2+IinKO4RslKDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AwFGaSUrwbE=:9d22+lmIrV5wHxkLJof3yI
 898T2iETma0ZUFkgGOHce3x4/Ta5AoOZJ6TT2HFEbWxBXnGcwQj4VRMoRnezAEfTAaK6HgFKI
 W9XcT3o4R8HhuHItmWuuk6RYKxSl0Agfre7T0kU4eUXSTCNE72PXO2gKaA+8YRp2eRNVwo62i
 yYbXqpMw4mJINPXp4IzrVYJwYUxF5oAk898x5mPIWcGSATDzTi+8mN1cpnUO3QPbTivQ9F2ZZ
 Oj9OowJ2Bn1W/F4Lj+qj3R/vlVVdtUumFLHTgQ9cvrDnPnQ9GbPWIszNhOs8ui+8ugZOgSpaN
 7XkdvizVpDLl9/x140MQhX2ScIaOu2iilP9lPRhJBpFLHBdnHM8JjZi5faLPryErk6MbbiXGW
 hTTX4sxJxKOorype9jt61WZ4rm4gzbDLRSq1RsxrRUM1u5TwNNnRmlYSo1qUPNHA+vnZPtk96
 dWsQxtJlQ2S6EJHmxXYgRiekqX3x+HfrixCOmuqfOmcWRcZO2JOR2aK30DkFVOF3NKte8XuH+
 9TidXaGz49CBbk47nHyloLN/JKWIxddUuRcDokEvggLv8hUCONgLLh6wU20WXQqFLecCP2mR/
 ykxEC4l0wqqiCbbe0TcFMbxJMVPLuSXuco5O18XGTjsIjXqyxARPnrGOAxJdk4Utga2/VtXHt
 BkS3WmLFJ1Cax3EtTI3lmUN1Ci1YwWNeJh9j2Uj7+q0CcW/moCIOocgoo0NVns7w/27xS0joj
 3FK6PoTFr0TUq20eDbwzPIiLZJwLjJkCCp4/OJlapRsOM29Gt2ZW/iHb+NxtI/+KaGpVVcFjW
 8sVDqttAeM3jaoEo924Xi6w/AsVehseeYYwjhASKhJwL3JFZ4TAlE3Umi6uKgXpjHPNSvzRps
 y/hgzD5b9Af5GdLNJTiQ==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Oct 17, 2021 at 9:17 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 10/17/21 12:09 PM, Arnd Bergmann wrote:
> > On Sun, Oct 17, 2021 at 7:49 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> > Did you see any other issues like this one on m68k, or the
> > same one on another architecture?
>
> No and no.

Ok, maybe before we waste too much time on it, just add an extra
return statement to afs_dir_set_page_dirty()?

       Arnd
