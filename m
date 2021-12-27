Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB488C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Dec 2021 11:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbhL0LxL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Dec 2021 06:53:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236540AbhL0LxK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Dec 2021 06:53:10 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83409C061401
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Dec 2021 03:53:10 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id w184so24291917ybg.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Dec 2021 03:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2wtn22ZQj6nuMCA7EcfwmmH3vdiJIuziM7/bdnMli9k=;
        b=Ri5e+o+okzSSjDYY+xR11iW1su1dChz4alrWdMbn9swQnKc827HKuuXkhUEj1nN/BF
         GZNQTe0NPa5UGp7Jj2LN9Febrtv3hpCrl5Ih/Q/XSN42+tOO51JZTi347flO+1x3HXTu
         DuTGGSaUCZEcwT7POo2SrPcTKjZxgmL/BI9Z32IUuAyoK4Io6U5n+TMbBCENDd2iNKcp
         J2SsdwFR54mea0VFVAlH2fiw9XYJCnFk6bTyOO2zLfginxOLEF0cpssyk/D3wBq45S9N
         qo1S8Kxiyqk0mPSEi78deeNZ0+m5PRffoF1DRp/2HjOwiWBUgmIZu3AMpQ+MEUAo5SDT
         tkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2wtn22ZQj6nuMCA7EcfwmmH3vdiJIuziM7/bdnMli9k=;
        b=o5dtiGu2aqmAvTZHJqsydyuXYfcS2imKZVvN4ruDZlthZumt7Ev2QDgIBDwIFkdI/D
         pUPi4dL2TZz4fGvIv6xSeJOAchp8RKcGPHD/oCksAyhC62MeR8p3n3Zor2D/fgd+r8Oi
         DjlHWYzelvDdrutIiocOp57wjzTz+3nxO1FdM3aW5hbU4oUlOJscAtOzxyZ/HCRxS4yo
         ssN/kGQSxGART8zJjPBCC6/zQciGOZkfI9ewU5D725jyXg4F2ns4Gt6+kqWIDx9IUedi
         ZTiJRdSLm/ffX5ED7PYXNBtm+XIPnJOE/QmElqg3KI6rVEwy4DsDSehYm1ssEaV9DvsP
         ReVg==
X-Gm-Message-State: AOAM5303/4iMm1KDrWdXGBveKL3TmeQ1WQMaiABrgfCOGT4XpV7yudpp
        lUyv/tccG+Iv8j6VJVOyJzqwCsrWrG+lvQDS2E0=
X-Google-Smtp-Source: ABdhPJzbp6+zVfGc/ClBvGcpyCmS4UFR+CzLYqoiZd0+pr+fXJCpvkYhLIZJkUSja9kFFwbC0U80j7ZIjQ5VM/uklXI=
X-Received: by 2002:a25:7742:: with SMTP id s63mr2983187ybc.242.1640605989141;
 Mon, 27 Dec 2021 03:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20211227090917.35838-1-hbh25y@gmail.com> <87h7aus8v0.fsf@igel.home>
In-Reply-To: <87h7aus8v0.fsf@igel.home>
From:   Hangyu Hua <hbh25y@gmail.com>
Date:   Mon, 27 Dec 2021 19:52:58 +0800
Message-ID: <CAOo-nLJG71QqqD0-cJDyH0rY2VTx1eO9nHVQ5MCe8J0iiME_vw@mail.gmail.com>
Subject: Re: [PATCH] m68k/kernel: array out of bound access in process_uboot_commandline
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

But commandp[len -1] is used to add a zero-terminated. If we don't use
commandp[0]=3D0 in len =3D=3D 0,
than commandp will not have a zero-terminated. I think strings may
make some errors beacause of this.

Thanks.


Andreas Schwab <schwab@linux-m68k.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=B8=80 17:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On Dez 27 2021, Hangyu Hua wrote:
>
> > diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
> > index 928dbd33fc4a..05eca6f653b5 100644
> > --- a/arch/m68k/kernel/uboot.c
> > +++ b/arch/m68k/kernel/uboot.c
> > @@ -101,5 +101,8 @@ __init void process_uboot_commandline(char *command=
p, int size)
> >       }
> >
> >       parse_uboot_commandline(commandp, len);
> > -     commandp[len - 1] =3D 0;
> > +     if (len > 0)
> > +             commandp[len - 1] =3D 0;
> > +     else
> > +             commandp[0] =3D 0;
>
> If len =3D=3D 0 then even commandp[0] is OOB.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC=
1
> "And now for something completely different."
