Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A4BC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1790E61107
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241501AbhIWOu0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Sep 2021 10:50:26 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:42581 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241661AbhIWOuZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Sep 2021 10:50:25 -0400
Received: by mail-ua1-f48.google.com with SMTP id c33so4409788uae.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Sep 2021 07:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j98vUeTcIYCND21ck4r0l/SXh6s2pf4muu78Mp5nQVg=;
        b=Hqe7E+XHV0i5QFMRDsyUNdzuEIzOQip43QUDSgjliXBQhCC+9ntanZYjvYQttVKO10
         OoTDPg9V18Q9x9lbqqQ3p0vDiWEUMBneL50CKmF4NRucJVsLS82PbwuxGIpvAjCiCHwq
         rrDWAKuKHNo/eidKEOZuzKE4sPb+3bj5WXF5knyK6Usg095p3+VmgqbNORTudiXX3dNu
         3q9t1rah6HaZPjlCx8mwRPtcfPLu4niJLfkENnejGs4t4p3LWVHuyn/iISxzNJeg8U0H
         sasOrvHFbcAli/TuSe34CWOAcjpJCKn96ooloIQUqqgnURWVYpZDEclSbiG2YE8KtvZa
         4dEw==
X-Gm-Message-State: AOAM533VkghgWtwZK1N5/t7hFE8wQzgEXijs82WxUSwl7QY2f2hiEPrN
        d/WYexRqVSto2Kz+VpD58M4kh00XlBUDsC9GgWY=
X-Google-Smtp-Source: ABdhPJycCz2De6Vf2NykYjUvQ9gd3g6zgAnpwKg9bdwgajKCHWoGemJpEizOAoNDbS3Ib5awPgzSb6zTYGM1o2Q8uFA=
X-Received: by 2002:a9f:30d8:: with SMTP id k24mr4437625uab.89.1632408532436;
 Thu, 23 Sep 2021 07:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210916070405.52750-1-hch@lst.de> <20210916070405.52750-7-hch@lst.de>
In-Reply-To: <20210916070405.52750-7-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 16:48:41 +0200
Message-ID: <CAMuHMdW0RUSt6FeFfy_g2jwLDDbm2a2TYD04Lt+mL2=Y04u4Bw@mail.gmail.com>
Subject: Re: [PATCH 6/6] m68k: remove set_fs()
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Sep 16, 2021 at 9:08 AM Christoph Hellwig <hch@lst.de> wrote:
> Add a m68k-only set_fc helper to set the SFC and DFC registers for the
> few places that need to override it for special MM operations, but
> disconnect that from the deprecated kernel-wide set_fs() API.
>
> Note that the SFC/DFC registers are context switched, so there is no need
> to disable preemption.
>
> Partially based on an earlier patch from
> Linus Torvalds <torvalds@linux-foundation.org>.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
