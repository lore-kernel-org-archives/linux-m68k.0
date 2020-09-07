Return-Path: <SRS0=kwK6=CQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706A8C43461
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 08:50:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32F9E20757
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 08:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgIGIuw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Sep 2020 04:50:52 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35753 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbgIGIuv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Sep 2020 04:50:51 -0400
Received: by mail-oi1-f195.google.com with SMTP id w16so12983325oia.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2020 01:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VmnovsxiIuyCoqFMb8GIYc41hE57G64mj7pOl0e0CE=;
        b=IztNrK/4MVDNCCD7t1Jg4Fp+WI3ZleeH50DoGNnvuVhiVpdbQypZ8g7HFjenMpB3po
         quXgJCjkLUlbaWLp9vr54lWjraHS1F5vIkvFn4A4RD2KwSTnii5nabvyiWG5Su402uYT
         NwlMYE8fbZy7AahKfdQXH1NANnQOWPgd51sdPAu3zfSA/1LvVDDy1Nwgku6BM/AnaMVt
         8PgchP3u5gcEGEJ/VeYVnkTUl+i01MEmz5Y3oOHWjaEyCcVYRIp0IiZu+PwiKOpxqiZu
         Pmtd52UEydnMmFy0bB+ROAPfnTXaT4HP+0aYulauo3FH2IEcog4J/ji6Qi9wXxadPhQi
         xcpg==
X-Gm-Message-State: AOAM533oxoonfc0WmiPQ4HYfCb6JUlPWl/LeBPjf0G9UGXNzEwhLsTgo
        e+JK51sXXXz9YnaRrHW8bamYCvH9Hr2BT75KWY0=
X-Google-Smtp-Source: ABdhPJzyGjKZuSYHphbCWZaMWs2PBiQ3GMIYOUwiI+oCv1l7DXbkW4yl9Y1HbG1Zx203mUmhqcXYAsEXM1Tl8L58gKg=
X-Received: by 2002:aca:4441:: with SMTP id r62mr802248oia.153.1599468650679;
 Mon, 07 Sep 2020 01:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200826122923.22821-1-geert@linux-m68k.org>
In-Reply-To: <20200826122923.22821-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 10:50:39 +0200
Message-ID: <CAMuHMdX1sf2FJqKyPE7SMrrHvWJ5y7qj3z_QcgZU0VFEBNBnLg@mail.gmail.com>
Subject: Re: [PATCH] m68k: Revive _TIF_* masks
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 26, 2020 at 2:29 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> While the core m68k code does not use the _TIF_* masks anymore, there
> exists generic code that relies on their presence.  Fortunately none of
> that code is used on m68k, currently.
>
> Re-add the various _TIF_* masks, which were removed in commit
> cddafa3500fde4a0 ("m68k/m68knommu: merge MMU and non-MMU
> thread_info.h"), to avoid future nasty surprises.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks, queueing in the m68k for-v5.10 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
