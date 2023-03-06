Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C25C678D4
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Mar 2023 12:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjCFM5P convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Mar 2023 07:57:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbjCFM5O (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Mar 2023 07:57:14 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6FE2BEE7
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Mar 2023 04:57:12 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id z6so10355126qtv.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Mar 2023 04:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678107431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5NtHGfBrkQjU8TyvvaiWylqhUt2gDZuD3ZhgSX4hqE=;
        b=H+Dcbz+UHYJROP5waOWYNtbwH7p+U3jnH76PgBGXBrOX/pSGEw0JGYtK65C9SGmoqc
         MMXGs6HSSDQSTnjWmVpiT/Q8ZjTlWn71FR03lYXfEjkTNBlu3kJp2bZWbMgo8oKo6BHI
         B6dkE+cxUqJyWGc6E+qIDgRYrjtD3vKAVznZPL/ydZplU2jvfo/Ilo9IP3LaUN82U33H
         Ssh+VcWF/wuxMwsjDOdHih0ermRD/yABd3zmQsp3a5IHw64iqNNRFLUBmyEWNVps1fE2
         4zyZdXuUYREsVOseM7qJ1JSMk8bxVjsjhE4VsV0vFihx+EznEVNxL0ghBocMeaptKCab
         nwVA==
X-Gm-Message-State: AO0yUKW03p0I88ag+OCquiKvIZNTi9Pn/Mq8sx/N98xfj2yejjVkNj2N
        XjNm06p75k33hcHiBfPkCJcYFtq7us1PPQ==
X-Google-Smtp-Source: AK7set8V2Gch1/7dz+QexQabwoVBsoXzbi95vs1Rc7cG9wl2SIXBMRgYuPx9Ysi0iuqckK0f8G2/eQ==
X-Received: by 2002:ac8:5c02:0:b0:3b8:525e:15ec with SMTP id i2-20020ac85c02000000b003b8525e15ecmr19541927qti.27.1678107431341;
        Mon, 06 Mar 2023 04:57:11 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id f8-20020a05620a280800b0071d0f1d01easm7435118qkp.57.2023.03.06.04.57.10
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 04:57:11 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id c80so988822ybf.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Mar 2023 04:57:10 -0800 (PST)
X-Received: by 2002:a5b:d4e:0:b0:a27:3ecd:6 with SMTP id f14-20020a5b0d4e000000b00a273ecd0006mr6469670ybr.1.1678107430715;
 Mon, 06 Mar 2023 04:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20230223112349.26675-1-jongk@linux-m68k.org> <CACz-3rjsBjum7T+dt8MGuwThwV98NnKuB-DE-Z3=VYa=nSd6-A@mail.gmail.com>
In-Reply-To: <CACz-3rjsBjum7T+dt8MGuwThwV98NnKuB-DE-Z3=VYa=nSd6-A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Mar 2023 13:56:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+q28hy6qLZwaQLO4dSSZeRfDzDSXfHrJyaSVxq=p1Ew@mail.gmail.com>
Message-ID: <CAMuHMdV+q28hy6qLZwaQLO4dSSZeRfDzDSXfHrJyaSVxq=p1Ew@mail.gmail.com>
Subject: Re: [PATCH] m68k: fix for systems with memory at end of 32-bit
 address space
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Feb 23, 2023 at 3:29 PM Kars de Jong <jongk@linux-m68k.org> wrote:
> Op do 23 feb. 2023 om 12:26 schreef Kars de Jong <jongk@linux-m68k.org>:
> > The calculation of end addresses of memory chunks overflowed to 0 when
> > a memory chunk is located at the end of 32-bit address space.
> > This is the case for the HP300 architecture.
> >
> > Signed-off-by: Kars de Jong <jongk@linux-m68k.org>a
>
> Whoops, looks like I botched the "Signed-off-by" in the commit,
> thinking I was in vi when it was nano.
> Please remove the extra "a" at the end when you commit it :-)

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue as a fix in the m68k for-v6.3 branch,
with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
