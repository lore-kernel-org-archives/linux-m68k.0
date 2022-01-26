Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE8EC28CF5
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Jan 2022 15:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236236AbiAZP0C (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jan 2022 10:26:02 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:50189 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236079AbiAZP0C (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jan 2022 10:26:02 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M6DOg-1nAYKG3mpM-006hvR for <linux-m68k@lists.linux-m68k.org>; Wed, 26
 Jan 2022 16:26:00 +0100
Received: by mail-wr1-f43.google.com with SMTP id s18so26383952wrv.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan 2022 07:26:00 -0800 (PST)
X-Gm-Message-State: AOAM533H0QSO3rp+LB9Ww0zbGDudln0DvDkqCAiHX0dzXOERMbQa/E+k
        lu100mKh9j+f3gWnjXe5U2zjslDt1GwemUG2GTQ=
X-Google-Smtp-Source: ABdhPJxQ1+Uxsa4pQiGTAyglo4nzvh1RMAmtkfmM9sB7VDNZHiCEUOdvF/ucNQAz9aiP5ind2pRCKzRlvPRgzr7Xh78=
X-Received: by 2002:adf:fd05:: with SMTP id e5mr22814967wrr.192.1643210760533;
 Wed, 26 Jan 2022 07:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20220125073137.1.83124@7e6451f583e7> <CAMuHMdVYhwpP0vSK4LT+50ZqB9opD8gcm-2aor8wAc49=GR+-w@mail.gmail.com>
 <CAAH8bW93TUpyn8GaZfB83pu8Kvrsz9PHPCBHcG3+UStU7v=s=A@mail.gmail.com>
 <31219CC3-CEE4-4CFA-A416-B98F2115A527@chromium.org> <CAMuHMdUwd=2KGk9JkZPSZsvAWG4wddxZFxd5bFfbrtZi3JynQA@mail.gmail.com>
 <CAK8P3a0bLTWc-UG4eX14CQ=hiXms+wHx2VvaovXA-ZUQYAA1fA@mail.gmail.com> <CAMuHMdVA5M3J5dxWWVQV+GPLQU9xU=qFm6fO6NXXS+thYYqnKQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVA5M3J5dxWWVQV+GPLQU9xU=qFm6fO6NXXS+thYYqnKQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 26 Jan 2022 16:25:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2uM=vVx7WwZDi_H7dZPxBtr5-EeS5ETQVoah1Cek0W2A@mail.gmail.com>
Message-ID: <CAK8P3a2uM=vVx7WwZDi_H7dZPxBtr5-EeS5ETQVoah1Cek0W2A@mail.gmail.com>
Subject: Re: kisskb: FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Tue Jan 25, 18:24
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
        Yury Norov <yury.norov@gmail.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:BzKIqzRFPRq5WQ33U+02aTjMQJO7MuxNR1re2bi4VXaz3U9ehSx
 YwHMdJFkOUhC9Xs1ZkmStHykRWIdgyc4Z7LeKdicMA1p7G4q/x6O6VVaZ3e7MQcgi95MrAl
 P4R/OBUsKehVCpTnYlqGzFSDDiPTA5Bqok0gMSjNt+fLKDgXjJ/KPQI+YmblcYXFXoMwXlN
 dtHpkF0evWnjos2rtDjnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h6FrOO43+NE=:s81GHZl3rMTTEIy+aaWJQg
 Fchk5FIVHC3yU7o9RdAblRnAXhXWgnKn50EWBvCxYRFjSGHtjsFQgLneHWisr1n0FoS3/KT7t
 yWclXKoYbbF5fSx91Qfvq+9z9U/qdGi6DboxAGp+GWf5RCZV/Z+ewjDhv3bjk0ilq5+R8RFOl
 SBF6GKglKM+WJLint/4M4nb24qNebC080DFcwYSI6P6F15KxTVSwwuTyhSuEfm/wvlJ1lmix4
 aZVFhbAl3SwURFiwOk4RYL0FytdWrkEbjT2pQA4H5vUmUmsmyYZtePaR1nmPYYODt9+W4IYc7
 A5juE/iC2bvCs1zbTcgboDiE66msiVESAo/burmMvPuswqXp+zGnHUq8aVsklGVBlFofaAX3h
 wUQYZymPqn+jgYy4gmMIawZMySzuy7AhvL1p8BntumTajeagVOm4IC7MoasQBn2Ki78AAdQzy
 ezqFZkUXg2nvI5Add0KirCDyk7GGx1kCLHIoo0U9TkMhkxGlM2Mg8lo4QyaDw+rS61IP0xtWq
 emH7xpEVBm25e079zEhUD17gpTjycd0xBSO2h1DwUovKfXoFEohbBQyjhtoqc7J6H5/GAdXFU
 WFjBKYktihgpPewsch/GdrfQK07hdyP6W7LIvC9F6G9MR09heuAt/Uk3hkK+1PSwORXaARtoj
 q/jTQ4EXKTpo6zpgPbn9Zu3BqFQOyFQ9Xf0/m6T7Jy/KjGQ5+v/828DocpwBdGlbtApU=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jan 26, 2022 at 1:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jan 26, 2022 at 1:26 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > I ran the preprocessed code through cvise[1], bisecting for a reduced
> > test case that fails on gcc-8 but succeeds on gcc-9. The reduced
> > case is still fairly complex, and it appears to only happen in the
> > presence of an inline asm. Narrowing down the compiler versions shows
> > that anything after gcc-9.2 does not warn, but 9.1 and earlier versions do,
> > which is further indication that  it was probably a false-positive that got
> > fixed in gcc.
>
> Thanks for investigating! So let's ignore this.
>
> FTR, my gcc-9 is 9.4.0, i.e. >= 9.2.

Ok, if it comes up again, I suppose we can make the warning conditional on
the compiler warning.

         Arnd
