Return-Path: <SRS0=aBsQ=7P=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B08C433DF
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Jun 2020 12:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE0D420772
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Jun 2020 12:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgFBMD7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 Jun 2020 08:03:59 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39995 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgFBMD7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 Jun 2020 08:03:59 -0400
Received: by mail-oi1-f193.google.com with SMTP id t25so3878172oij.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jun 2020 05:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IgExh/ny3ZdfEOHfQwIXJ7oTzjh0IcO4NnZTa4lzZZg=;
        b=dEnA4qli0eSQnGASItK4rszBiJmybNWaMi/F/S2u76jX36h19kbFkkxEh7U6C9TeSQ
         jLI9UWujirZKjQoXONWo4I0ptgCXO6fb0WxCVNkWIYQ9MPeFWgl7xVN+hb/sMnxaP5+L
         tznO4RVMBkXlPYbxGR63yVTg3buy5gezNycsDSkf+VQOys/LqfIO9NG4FJ2iUgd0iSGh
         Wp6fthYa9LWRmFcpJDgvnUhCWDWlSN0cMNv6+zjoPnvdDb8efgzCXJRcEBmE0FG0z46j
         V3ylqLsDXWIc4/OEwDVwD7UM6lQSpsiAuFzJz+m99arpMCTkFuK50SbfuNkWIUi42Aan
         o+zQ==
X-Gm-Message-State: AOAM532wP08/poVswn8ydhmlp4o9e5TcDAWSkWTjSTKhau9hIu/ECU+D
        q5jp4XJMODnAWc+xjLJYdc5SSLcj4A1e3gm0kMA=
X-Google-Smtp-Source: ABdhPJz2czAuYGYJfe62NGAvi2DIXZQZsfLZD8OxGXlID6t22QF7K8A5fIlnr/Ug64ryYGdMa83JGneje4dJWf0Q67U=
X-Received: by 2002:aca:1a19:: with SMTP id a25mr1947756oia.54.1591099433899;
 Tue, 02 Jun 2020 05:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com> <380c0494-ed02-b2be-65b0-d385627fb894@samsung.com>
In-Reply-To: <380c0494-ed02-b2be-65b0-d385627fb894@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Jun 2020 14:03:38 +0200
Message-ID: <CAMuHMdVYuk9+=3OTufOo98Dd3ijXS6JBH9RqK2v+9mwogxbnXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] video: fbdev: amifb: add FIXMEs about
 {put,get}_user() failures
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jun 2, 2020 at 1:52 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> Since we lack the hardware (or proper emulator setup) for
> testing needed changes add FIXMEs to document the issues
> (so at least they are not forgotten).
>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
