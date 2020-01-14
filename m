Return-Path: <SRS0=eHIt=3D=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111D7C47409
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Jan 2020 09:50:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC5B924673
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Jan 2020 09:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgANJur (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Jan 2020 04:50:47 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37225 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgANJur (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Jan 2020 04:50:47 -0500
Received: by mail-ot1-f68.google.com with SMTP id k14so12037222otn.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Jan 2020 01:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+6LmuYuMGTmOXwHbUpttOywfmJXsazPd2oXoQf5XGBk=;
        b=FM1qioSoRmJqrTRZoqmZi7UHl7+oVsqa5p3ABchRFutpalBmaIVWcw3XOXQIusrYrX
         +1fCJk201aHDfZv+X/8iQndIMZhJlvFGpJ7xbFf/Zd+wAS885i4me5sOWYy8rC/mJW5E
         iic61TmIIlIgf7Ru/a1INpBic4DFJ6H8hn6XtLfOsb0h/oRx+0g6yMREIQNVHKXInDTr
         LHt+6j+7lMxhugXFTB10AnNHMKDfhAe1YLqcQ1+D8DZkEWyv9AJhdwAKJ6fsmSqnYCiR
         gitsIeTVjHbjl6QGt74/LtNLxMto5zcvJ2xQiEy+hnBrqljJJsQiitsVEh86fBWTIGHB
         TAnQ==
X-Gm-Message-State: APjAAAWFzXKe/xKsLBLoeYczto3FrcbCuY4jlgonU1w3hIc1iwNDi/+W
        IlR9zvzKRgslM0SveUJITnc81TED2KDwMFrQpII=
X-Google-Smtp-Source: APXvYqxnrI58HGC3YYQXRgw1TBmOivT+m91WMqatQDgHBMmGpJ0SrmHcIqLmIgDHc8Clm56u3EkDP0o5hNDc+VXS4Zs=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr16859866otm.297.1578995446820;
 Tue, 14 Jan 2020 01:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20200113103040.23661-1-geert@linux-m68k.org>
In-Reply-To: <20200113103040.23661-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jan 2020 10:50:34 +0100
Message-ID: <CAMuHMdXx8Y2qvqg8tMqrzQJuU9DMgSNryGch3XgrTPyqwrkN=A@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement copy_thread_tls()
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Amanieu d'Antras" <amanieu@gmail.com>,
        Christian Brauner <christian@brauner.io>,
        Kars de Jong <jongk@linux-m68k.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jan 13, 2020 at 11:30 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> This is required for clone3(), which passes the TLS value through a
> struct rather than a register.
>
> As do_fork() is only available if CONFIG_HAVE_COPY_THREAD_TLS is set,
> m68k_clone() must be changed to call _do_fork() directly.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> This is a dependency for the combination of commits
> e8bb2a2a1d51511e ("m68k: Wire up clone3() syscall") in m68k/for-next,
> dd499f7a7e342702 ("clone3: ensure copy_thread_tls is implemented") in
> v5.5-rc6.

Applied and queued for v5.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
