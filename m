Return-Path: <SRS0=SmLQ=ZT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A59C432C0
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Nov 2019 07:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD5DD20656
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Nov 2019 07:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfK0HNG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Nov 2019 02:13:06 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:43672 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbfK0HNG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Nov 2019 02:13:06 -0500
Received: by mail-oi1-f181.google.com with SMTP id l20so19161172oie.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Nov 2019 23:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k+iy+I2ql514V3Li/xFx77FCnKZwhQ5z9HPShasnZfo=;
        b=AyZbiwjwrhLzXEcPqNtiZ9f7hr20GWjC9fRelV2Zta9Ej0wqnECn8O4wHKmU3lY8tT
         4Xme18/cpEpFNPtU3qVgk4z0ofXMILopnsXP6I4srphh7WOqcNijOar3N+T4yrEUKbah
         3WCcYZdy88fVxOaKgyPdnsXk2mUXJUBLo5GlWB3Q8vtHic0SPZFxv0oe4kSWxKjjRAzy
         x1bbq9FmwaVa56QiECBYxhxBVfiPs8Tnm6XeGiyTx9rDodEn2dbjUaYisLfk7/ZP6bwl
         XWFA3bmghGzlnoop5xmaKPO/UZF33lyOIUl/sjnwUisVzL12bpW785DauYy+u0e9zmrc
         n9qQ==
X-Gm-Message-State: APjAAAU6OOAf1XXAxmXnulSg9WQ1o72zFqv70DrLreYFwCHH4EBc6Ie0
        AEE0AdcoKxy+yOoOjKZa6eKaDE5vhjNfypiaCvM=
X-Google-Smtp-Source: APXvYqyZ2w8lOKLiT2FaBfylkCaKfdFRizjqdBv4MizQEgr6Ph9CvBqOrFucHbN3CAOeySC9FQyUe7DaaT4gxgMOhJY=
X-Received: by 2002:aca:fdd0:: with SMTP id b199mr2649178oii.153.1574838785251;
 Tue, 26 Nov 2019 23:13:05 -0800 (PST)
MIME-Version: 1.0
References: <021330b6-67a2-0b74-c129-5c725dd23810@infradead.org>
In-Reply-To: <021330b6-67a2-0b74-c129-5c725dd23810@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Nov 2019 08:12:54 +0100
Message-ID: <CAMuHMdVLusDDB5G1R7=-53sK1bd2+3=s42hr9xkgPtWyjOrozg@mail.gmail.com>
Subject: Re: m68k Kconfig warning
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Randy,

On Wed, Nov 27, 2019 at 2:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> Just noticed this.  I don't know what the right fix is.
> Would you take care of it, please?
>
> on Linux 5.4, m68k allmodconfig:
>
> WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
>   Depends on [n]: DISCONTIGMEM [=n] || NUMA
>   Selected by [y]:
>   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]

This has been basically there forever, but working.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
