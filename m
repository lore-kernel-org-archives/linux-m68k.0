Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A40C433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 13 Jan 2022 11:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234138AbiAMLUX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 13 Jan 2022 06:20:23 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:57733 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiAMLUW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 13 Jan 2022 06:20:22 -0500
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mgebs-1mgcY43FUq-00h3JJ for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Jan
 2022 12:20:20 +0100
Received: by mail-wm1-f45.google.com with SMTP id q9-20020a7bce89000000b00349e697f2fbso4590689wmj.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Jan 2022 03:20:20 -0800 (PST)
X-Gm-Message-State: AOAM5305LrIfNPpyDmXnZGxmnKkDDekhXFo6Y8tSP05tpbdkMTBhq+ks
        9Ie7jR51OiPwDLCE1I3aApdBbtrDCSjtaH3fOUk=
X-Google-Smtp-Source: ABdhPJzc+YWQKWgHQz627kY0icPW47/qifAMQSYtSw7uxTMVG6lGTcteHKgUAX26mjUInXkbLOo/ZppB1T0DT3bTVSA=
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr3348456wmj.35.1642072820372;
 Thu, 13 Jan 2022 03:20:20 -0800 (PST)
MIME-Version: 1.0
References: <20220113103559.2577216-1-laurent@vivier.eu> <20220113103559.2577216-4-laurent@vivier.eu>
In-Reply-To: <20220113103559.2577216-4-laurent@vivier.eu>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 13 Jan 2022 12:20:04 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2_cJi9+SNi9gK6+5kpBo4wmVw4hz42Bq_jm1+s6AvENQ@mail.gmail.com>
Message-ID: <CAK8P3a2_cJi9+SNi9gK6+5kpBo4wmVw4hz42Bq_jm1+s6AvENQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] m68k: virt: Remove LEGACY_TIMER_TICK
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:h9IckP9/vAC+OXkVos21F6fJyH143pN3UWOsJZ+ndRg1tIQumnP
 vGdKo4N6Q8VDfSU/FRzWovgCgFSJQ/wr6SAYdkfbt6F54Pn/f0R2OdKq5jdIEooO0ZZLZro
 yytWag6N/dUi8dOACGau3tDx21LNvbLgDeycUJucNlCPq6OYMAllgOr2Bf6aktjVLelE6wf
 ZEV2LvUsUslzvB9w4LH3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bDd+wIwC2LA=:zhXbI+iDGJ18vDZyprZdZS
 WJS7222z7n/8dhpTLMI7gms3sNeOf6rPjeTZNkG+MxJoqu/1CcjFZXO+MY76P+2aMFFLV/vMA
 pgtZ7PtGlN1v7Dj5Bk6kZ4U40QAGNxyJ77vRH3gz5I56vQvUnW3TTgyqSQpgbveN14F+CSWIt
 ICx2t57v4JGfHGmjX3Fn8+D03i3RLqb9I7wF/q6fDwj6KBSx7F4cQ9FPJHmGyXollInB+AJjG
 id7IgcPCW33oFr8DCTSeI1DYz42kT4c9AekxjpTiLLWds74vrV4tEB8uB3cRrlB4gnsKsB4fm
 1SB6ZuAKgTcZ35Nwu3hpFog9NiHsaw/8pBA3+KIHpAKeDzpvACbEzv0BY1HCMBJmKNxBxHmr7
 9sZwZCx108tqbZNuf2eZipLXX5Kj0U4hVxr2jZXOZpsadAVYv1/BxyoKoPCI7ASGLARGESKn4
 BQEXQNoCiyUDg0MSG++K6Eu2WmaH1ivsbN0csJxrT6D8y5EE+Px2hJjbnF1evMcy2SzufWVYw
 TkYq/SYwlHwM5tkByKeyILZyagmKMUA2yTjiTRLUnFOLQr1PKAJ3C+ku5jnO2ns1UrJqzdhTp
 RR3Ku800q+PCBcWOCiaGXH8i3zrMLsMOQSMRXYZfPXmLv3D6NXFora00ow1kF9Noe2u225ZmD
 BSOXivJHLe9uwMwJFEwmWaDXH8q9fw8NMFCSmIwcImNMrhYxFNXvgIveGOlYSO5+/b67LSvwv
 m9ttuDMHls92sYV8p2XBjXiKdKWJXe+8vEJfi5wMX6s13FymhD2MPJC4PNYAmLfr/DdCjx7H4
 HiEdaPXWEL8JKUFHQMgp9D/nSvrgIjSN9T3aIo7W7Cjm/iBHf8=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 13, 2022 at 11:35 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Move virt machine to generic clockevents.
>
> cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

The change looks good, but it appears that you only just add the legacy code
in the same series, and it would be easier to just add the correct version
first.

> diff --git a/arch/m68k/virt/timer.c b/arch/m68k/virt/timer.c
> index 843bf6ed7e1a..767b01f75abb 100644
> --- a/arch/m68k/virt/timer.c
> +++ b/arch/m68k/virt/timer.c

How about moving the entire file to drivers/clocksource/timer-goldfish.c?
It shouldn't even be architecture specific any more at this point. It probably
still is in practice, but that could be addressed when another architecture
wants to share the implementation.

         Arnd
