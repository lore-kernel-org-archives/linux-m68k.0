Return-Path: <SRS0=aBsQ=7P=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E644EC433E0
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Jun 2020 12:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC4F620772
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Jun 2020 12:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgFBMDa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 Jun 2020 08:03:30 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36523 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgFBMDa (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 Jun 2020 08:03:30 -0400
Received: by mail-oi1-f196.google.com with SMTP id a137so11784591oii.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jun 2020 05:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncUahkMlR8RcEuHvwU1aMqYYdzOJso8KWIzaPU8BmKE=;
        b=Z5o1zqLb3glWcNl05GShf5yKEvZZk2vozJ6CwBJ7PxAwGidVjGGwJVVotJMvEP25Yn
         HEjUcx+CwYgKiDHIpvAlmN5m++/DPa5oAjW/xPPJNE0AkOtVWQTur5B3kE7hv6FOKNvL
         b7ZeHyTOv5OdbkUDixd+9VmrpInmY0Iw8ISQv+qNBcr/Ei6b0cYQLMDyoZxD/ASJLM9e
         HL8xBxjfWgKBRRlrADCjGFzhxDQH15Sn2RbZcslVHJh5xo3ljFi/2LbZyj+0QPIYgSJH
         SgtTzvNdElfY6guldgxjCoqQZ0liYgCkFri0IzP5s6Iyq/nvy5to38hTzWlmYY9L7nIi
         TzYw==
X-Gm-Message-State: AOAM533quRZiv1SlkSRrThKmQ2HcINSMyOx4/bU9PuzF7ejvYE/a+UMV
        OIakFauJcmWQmffEu4YB1HYGk8D4c8Syac5yeQA=
X-Google-Smtp-Source: ABdhPJzEcQPMgPom1yIf3zWleRm3zOSF/oQgx5/HyuKONRP9TVyRubZN2n1LbmblaEecYiJrxwiFTA/boKIBcGBzwjs=
X-Received: by 2002:aca:644:: with SMTP id 65mr2609554oig.148.1591099404240;
 Tue, 02 Jun 2020 05:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com> <767d36ff-22ec-8136-7ebc-1d9d0d3ac98d@samsung.com>
In-Reply-To: <767d36ff-22ec-8136-7ebc-1d9d0d3ac98d@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Jun 2020 14:03:12 +0200
Message-ID: <CAMuHMdWac+YE3qr0CTepn5K24tGZq0VHuQDGg-yUOHW1rJDbbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] video: fbdev: amifb: add FIXME about dead APUS support
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

On Tue, Jun 2, 2020 at 1:50 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> On 5/14/20 10:21 PM, Geert Uytterhoeven wrote:
> > These #ifdefs are relics from APUS (Amiga Power-Up System), which
> > added a PPC board.  APUS support was killed off a long time ago,
> > when arch/ppc/ was still king, but these #ifdefs were missed, because
> > they didn't test for CONFIG_APUS.
>
> Add FIXME about using the C code variants (APUS ones) in the future.
>
> Reported-by: Al Viro <viro@zeniv.linux.org.uk>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
