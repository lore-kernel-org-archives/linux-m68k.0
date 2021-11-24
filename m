Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0638FC433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 24 Nov 2021 14:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356578AbhKXOEc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 24 Nov 2021 09:04:32 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:35542 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348372AbhKXOBR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 24 Nov 2021 09:01:17 -0500
Received: by mail-ua1-f53.google.com with SMTP id l24so5324601uak.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Nov 2021 05:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hf4rPGIgUhHt4w8e7uNMvl+iKhb8nrL9YmbQ22fq8VI=;
        b=XUXOCB00t9erUiGIfasyqBBY8eSq++pGJNFYD53kOZMOFfkxjPfPfWwSTTp4ftw7lD
         IkzLoooT/diMl0qtKurtmqzqoHOVmfK34/GekFeBxphXY96ERG8jOF3F0jVX1j2T79we
         5nmkRgGTzuqxRSHek/i7hOKrV3ajvmoJe0n72gMWRWCTRLf7sKy2Vl8VNP3NYL9nVttR
         9oi+D9ESuk/KRzPYw5SOX/G45cPNkZF49MGmn7VaEqsdp8fwiiryYT4wZDKp6ddko/Pv
         LdDG3QNoA+6E9Icn9RUI7kjXVNBNM0TbEVXtIqBe9VmH27KIpwx8vFinE/vf/5o15teK
         l7+w==
X-Gm-Message-State: AOAM530b6Dz1D1KluH78DGxmUC0OeucBIMcd64azksBoKj/Z3cd1cUfm
        mdEM3xhf2QlDhagHKDAgFzrDKJ2z360ebA==
X-Google-Smtp-Source: ABdhPJzzDRJ7B+ZAaebtop5y5hcEqPo5bpQCtPiKiLex2pJJWFp9lvWt8a5eQc+OHoj5DMAjyDfTmw==
X-Received: by 2002:ab0:6905:: with SMTP id b5mr10782906uas.43.1637762286586;
        Wed, 24 Nov 2021 05:58:06 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id i27sm8416437uab.8.2021.11.24.05.58.06
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 05:58:06 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id az37so5220320uab.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Nov 2021 05:58:06 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr24413982vsj.50.1637761804180;
 Wed, 24 Nov 2021 05:50:04 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 14:49:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViovyQ2xBeKaMRbAmYF5eMWKdYhQEPmnTyLJoF7a+xsg@mail.gmail.com>
Message-ID: <CAMuHMdViovyQ2xBeKaMRbAmYF5eMWKdYhQEPmnTyLJoF7a+xsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
To:     =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Michal Simek <monstr@monstr.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Linux-Next <linux-next@vger.kernel.org>,
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
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Nov 24, 2021 at 2:21 PM André Almeida <andrealmeid@collabora.com> wrote:
> Wireup futex_waitv syscall for all remaining archs.
>
> Signed-off-by: André Almeida <andrealmeid@collabora.com>

>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
