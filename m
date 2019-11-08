Return-Path: <SRS0=gNPH=ZA=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54968C5DF60
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Nov 2019 08:32:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F00E2178F
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Nov 2019 08:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfKHIck (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 8 Nov 2019 03:32:40 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36950 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfKHIcj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 8 Nov 2019 03:32:39 -0500
Received: by mail-ot1-f67.google.com with SMTP id d5so4533925otp.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 Nov 2019 00:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mb8MvPT80CBr0Al9ctm+EN0Y96m3kmKlyXiJXBeWesc=;
        b=aE4hGTGb/kQ1gERE6NuIBLpXmnxcmcY2iMB4IB5KbGUFuQ3J4vE61gW1cCkNam5nx2
         5YqOOGxyd77Ihn+VoOfWygaBAh+7idQ20PZqkuqzTRaEPBMgPOd0LyFZGSWrPutsMz9E
         NT8amNqXV5oKsR1dMQ5gxKMYDuVrXLZF9Azr4c6AUxcTgctAVIWv8D6u7QPhetuAb29S
         cb3bNSWnzngTbFdDT53yYdT9TsnlaQXRwxPUhh2tMXZDx3zNlTqWNSXviZes6HMkAjR/
         +kaEGsjmAeMzV9TrwFy3E5er8HO1yLUgaOiGtGzw+3B2CfTDuXAnLUeE9+ufh1CAIJsV
         nOgw==
X-Gm-Message-State: APjAAAUY6bKui+SrujSJ5OI+3ArMYFdfofznvducfP3q42AuwGjD+m2y
        61aAZaAmBaLb3LqYxZBffAWsoD5lIoaul4J+wv4=
X-Google-Smtp-Source: APXvYqw+43SGPSED0AJZnzsx4nEcpKNktTl/12Rw+DSczrLXTnm64tHUPqVN8uYM7eIOKZWrtAAa7/8vyyyqFua3Kw4=
X-Received: by 2002:a05:6830:2363:: with SMTP id r3mr7709762oth.39.1573201958505;
 Fri, 08 Nov 2019 00:32:38 -0800 (PST)
MIME-Version: 1.0
References: <1572850587-20314-1-git-send-email-rppt@kernel.org>
 <1572850587-20314-6-git-send-email-rppt@kernel.org> <CAMuHMdUG3V7uxzhbetw75vVeobeP0-bQySb3r=0V5XujUF123g@mail.gmail.com>
 <20191104094748.GB23288@rapoport-lnx> <CAMuHMdVHsNyLxhaxZcVdLvQ1PUnb=2_+ECPWVD0234V+qu+kOw@mail.gmail.com>
 <3d908bbf-0469-c53b-dd86-87df98f40ee7@gmail.com>
In-Reply-To: <3d908bbf-0469-c53b-dd86-87df98f40ee7@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Nov 2019 09:32:27 +0100
Message-ID: <CAMuHMdVe-7=587nMWK_FcHzsm1TLckwTY9JxKHM_Gg8+ogZsgA@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] m68k: mm: use pgtable-nopXd instead of 4level-fixup
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Mike Rapoport <rppt@kernel.org>, Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Greentime Hu <green.hu@gmail.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Jeff Dike <jdike@addtoit.com>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Salter <msalter@redhat.com>,
        Matt Turner <mattst88@gmail.com>,
        Michal Simek <monstr@monstr.eu>, Peter Rosin <peda@axentia.se>,
        Richard Weinberger <richard@nod.at>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Russell King <linux@armlinux.org.uk>,
        Sam Creasey <sammy@sammy.net>,
        Vincent Chen <deanbo422@gmail.com>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-c6x-dev@linux-c6x.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-um@lists.infradead.org,
        sparclinux <sparclinux@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Fri, Nov 8, 2019 at 5:30 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 04.11.2019 um 22:53 schrieb Geert Uytterhoeven:
> >>> This indeed boots fine on ARAnyM, which emulates on 68040.
> >>> It would be good to have some boot testing on '020/030, too.
> >>
> >> To be honest, I have no idea how to to that :)
> >
> > Sure. This was more a request for the fellow m68k users.
> > But don't worry too much about it.  If it breaks '020/'030, we can fix
> > that later.
>
> Boots fine on 030, too.

Thanks a lot for testing!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
