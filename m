Return-Path: <SRS0=EXoE=AZ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30A4C433E2
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Jul 2020 15:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9210221EF
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Jul 2020 15:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="AAc78R9h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgGNPek (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Jul 2020 11:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgGNPek (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Jul 2020 11:34:40 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0ABC061755
        for <linux-m68k@vger.kernel.org>; Tue, 14 Jul 2020 08:34:40 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id q15so8715672vso.9
        for <linux-m68k@vger.kernel.org>; Tue, 14 Jul 2020 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N3MoehvD0AM2QGu09dH47URY28uh/4wrSAc6jG4dPqc=;
        b=AAc78R9hbO0jiY747Ytf1s9NqUcHESVJOpVlf56ur9SWnWo7OPmqIaIGSoskwGT4xk
         CGb0x4xDBJ/z8viHP8yh9NzMk6FhLVqf1v20ncwUlKB/JJyrEmrNMaOOBqFC6S2+PDWU
         w0AAbHl5YrYZMC+H0O5L1FFOOp01got3ATrFA97L/ldSIz2amNyqG7yiU26c0VgfqzVY
         qisBRJ/JfWq/AzhANeD88ir73U0+wlrQQ1LUeetNUkHeV7cDYFyORj/CgfEq904s5IzQ
         46APPEs3HNiP8EKz+82eUt2b3IrXau4zL8U0f6N4zH5h1q3LJMKkhUo2o9X7X9w6wHXT
         5+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N3MoehvD0AM2QGu09dH47URY28uh/4wrSAc6jG4dPqc=;
        b=bEuCSSupqDuYmka2fdjBvsgeLkb9CpMoOLa3El9/x6PiclJKE78/Gg1jPzIKQ6RJxE
         r40jg7Skf4dkLhLC8Urql0fTbo5alWKe4A4I4n1uwq0JvdVjjXgD9LWl5h6YBeQaZdcM
         jbutJci85KfVyUSvXj8BU5qK/X5E136mySKxAxOX+spYMVy/zKfwGa4oz09s2B27/gB+
         i0PFohTfdFaQorkEw+PVEkMTt1MQUdoG6TtC1RMp8o5g/+dgFUZ8S8P8+YAwWRagUNpQ
         Mnk5A49DRAbrn+aynpCMoTlmPBYMbVN9U6ufm2QrHlJVCbNBKHP9uxeJusAEmi+u1id/
         H/aA==
X-Gm-Message-State: AOAM533tlIFhE2xPQxT+BJBFYIASeDQdnB6jwrygEi77DBSWduxvyFUy
        hWK24SFCyiWETEZGQavKBlTC3S4x0aVC7Nv+qRqGh/fhn1Q=
X-Google-Smtp-Source: ABdhPJwi4077otf8PurruNneII6wFFQpIk/uHAvABkLTQPAhbeoaqQHbiXijQOUqXbL0VOvBgzp+9vdt/YGoGIWnHBk=
X-Received: by 2002:a67:6c47:: with SMTP id h68mr3632555vsc.126.1594740879212;
 Tue, 14 Jul 2020 08:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200624233443.3346919-1-angelo.dureghello@timesys.com>
 <CAMuHMdVF848G0S788ufYxz8OO8rLTo-G9PRDO0Did3s0PGTNKg@mail.gmail.com>
 <CALJHbkAn4hKQRT8cp2dQr3+ndKCjZ_E1e2L2nKBzzFKgvSHn6w@mail.gmail.com>
 <CALJHbkDhygS8P9fo6qe2N+ifaPawmuqeCY5pXKTpnLU_5xkbSw@mail.gmail.com> <89c31d0b-c17b-eb79-bad9-1bb1496ca662@linux-m68k.org>
In-Reply-To: <89c31d0b-c17b-eb79-bad9-1bb1496ca662@linux-m68k.org>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Tue, 14 Jul 2020 17:41:38 +0200
Message-ID: <CALJHbkB+PwPZeQRxSFusQ96NfEVBSVgG7hTfpWWdO+GgEE3+Dw@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: fix wrong m68k_fixup_info addresses
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg and all,

On Tue, Jul 14, 2020 at 3:01 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
>
> Hi Angelo,
>
> On 14/7/20 5:41 am, Angelo Dureghello wrote:
> > Hi Geert and all,
> >
> > tested now building by kernel.org toolchain 10.1.0,
> > i can boot with or without the above added volatile, jfyi.
>
> So is the net out that this was a compiler/toolchain problem?
>

yes seems so.

This is no more an issue for me, so up to you how to proceed,  anyway,
keeping volatile seems to help in case someone uses older compilers
(i was a 5.2.0 age btw, and toolchain was made by myself).

> Regards
> Greg
>

Regards,
angelo


-- 
Angelo Dureghello
Timesys
e. angelo.dureghello@timesys.com
