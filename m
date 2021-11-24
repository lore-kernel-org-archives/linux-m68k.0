Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C511C433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 24 Nov 2021 14:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354436AbhKXOc4 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 24 Nov 2021 09:32:56 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:51323 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354079AbhKXOcu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 24 Nov 2021 09:32:50 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Ml3ym-1mMLtf2jbI-00lXkT for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Nov
 2021 15:29:39 +0100
Received: by mail-wm1-f43.google.com with SMTP id y196so2560900wmc.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Nov 2021 06:29:39 -0800 (PST)
X-Gm-Message-State: AOAM532MomPwv1M8k89Cvu0N39443qKWdlfw/P2WwqI3GEkYDsDZraDE
        cY9P8+cU56Yg96jV0g2OdxTDjnwjZOpkaXsr8NI=
X-Google-Smtp-Source: ABdhPJw9AuDVJPcPk5QwMaNIqLG+Gyph350xYhCGSeBIHw0tMZdjTjgs4734tAKvoxeRwyygv81r33HtARNOkWqIoYo=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr15657228wmb.1.1637764179209;
 Wed, 24 Nov 2021 06:29:39 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 24 Nov 2021 15:29:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
Message-ID: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
To:     =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        David Miller <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>, linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Waiman Long <longman@redhat.com>,
        Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Landley <rob@landley.net>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:WdSc5WFT7eg/PNpSAskJD0oX/a+A9BsRnrux4FDaT26ABGhgQcT
 ddn5b2N/n4Di/WWckcLF8kTYMgxdbVXTMihu0IZJ/cjJKrJb5UWCfFG5RrP+Y2D0RUUhxgk
 EHHfXDgHlrXp31uvEdxGjlvcY0fvWvg8uxCIt8Xox8FTXOXVW+tX6DdNket7ntNiQe+MQKk
 ufPbqta8Pn0fwIiauB95A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yt15+HI6xjc=:MRbHi/6+24RhAp1gFhFKpo
 yxawo2hqYQ01O8efNNs+rWCxYrrXNZoZ7L3UUpHF6xNeHzFTw2iWMo+y0XkBF3hASA1O4HL8P
 SBFBdBn0Tl+INo7C9GEoFkTjc0dhGjyOotXs4Pdjvjqj5R4bmCzhR+GRHVmaEe2F6OSdYvj00
 OHFceaIQRmtVF/edJ+eB53ktqHXqoKhbCQPW7m3GwoP6E+v24FsiT8ZSbH6VHZmixtNV/0tOM
 5KmNciOzY4MKMpIRCVE/mXYuzFPPX3RAzkTp9trzFtVsxDOIgBLo96FjEaGnu/VyIULz1Use7
 o2VsYciOCNqOXsdvsRVue0oNlRRv5OMXpLy6owvhZUFGlqielziyLUP60fx+NS74qF3cFaPe7
 fZLPXTL3gWGT6qapzvvHD7PZW04yuMCkysiOEsrE6FHVjez+LB1hpO3ww2ey3/8lZFOqrQkWn
 QxJAg9JkYl2QRaqgKDb8wM8ZP/bp5xD2WIRz0R7/oD+P7NmUiscegX0XsjNqUhzA58B+PKfoS
 uiim+IeUjS52GNMBlRqTarFC32fuwm4WCaa0JPbNK5AEQmXwW+OsnPR0yZ0IxZajwzU+M5/lf
 FbOSAkKroD6zqpHR5OWaGQJiJyN+OjV4CuVx/ziRq5x8zyv8qBgvlCsUX0IryPx8FPQLjHkco
 tkiTRlxrUkK4HNNOuP/+MieTYYuQCQuSfdm+UMEnkHiXZtg7wAZvJSGVIOENMxSh6siQcWqmo
 uZVvTvD/le/4NUT1eam0tcfbYf8wSNyGkhlY8h63a2WWjRm/8yxAViGOAAhNglfpNff77FzsS
 f1E7m7DP2Gxdovx1MEGZcq2ZhYuS5AqfdbWgn+MEwjJrSXDyMg=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Nov 24, 2021 at 2:21 PM André Almeida <andrealmeid@collabora.com> wrote:
>
> Wireup futex_waitv syscall for all remaining archs.
>
> Signed-off-by: André Almeida <andrealmeid@collabora.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I double-checked that futex_waitv() doesn't need any architecture specific
hacks, and that the list above is complete.

Should I take this through the asm-generic tree, or would you send it
through the
tip tree?

        Arnd
