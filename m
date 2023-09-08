Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A62FEE57D9
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Sep 2023 07:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242573AbjIHHPh convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 8 Sep 2023 03:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239778AbjIHHPf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 8 Sep 2023 03:15:35 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31231BEA
        for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Sep 2023 00:15:21 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5925e580e87so17067557b3.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 Sep 2023 00:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694157321; x=1694762121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3D3jclUxV5EXK8oDDsSaJIa0qUPkeLw+a0rRVcoFOI=;
        b=SNr6XmX8pKYGqKIJ0HLQ9ZvhMozFQ2LtKB8oTWoF4+YQO91oipzIxLY/qoGqwujtl1
         CA6LQ+qZO/i/TSGnZlw6zaZywpquhEASicmYM5k9TM/MCJie5G81XXUoE7RRBba2f+QA
         v7TLACItrm4PeonwDAnL8p1erj6urlZYEH1rwdmVeUxpPd47Q0+wqVUukC1ZdMS4MFRO
         x9ongrbRrKQDcxM94t0W+svhOorLJZhu9UhEqMzZwWhu8WdMmbegZp1sEo8ghgP5RqM6
         +vAWoXYtFESjBvTbWhuK71PZkpwgKiTKMLxBZRfPiDvCO6vTYI5UoGhnNgfuP4zXOxmg
         TB8w==
X-Gm-Message-State: AOJu0YzfPJN33JZKC5S97oBwOYcYDcazks1QvogiUJu4/uueY//MWVnC
        b9T6ljmVw1HDzfzcXdhmUlf1KKj5fjravfgk
X-Google-Smtp-Source: AGHT+IHvZN1eTQ+iaHH3gnOugAdwNvCdN1hJDK64V8mdqybXFJmkwrm1xEPbuuzpDd33ZUAyK1Wcuw==
X-Received: by 2002:a0d:fb42:0:b0:595:be7:a38 with SMTP id l63-20020a0dfb42000000b005950be70a38mr1798415ywf.49.1694157320790;
        Fri, 08 Sep 2023 00:15:20 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id i13-20020a816d0d000000b0059511008958sm299162ywc.76.2023.09.08.00.15.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 00:15:19 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d7820f9449bso1665097276.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 Sep 2023 00:15:19 -0700 (PDT)
X-Received: by 2002:a25:2f85:0:b0:d80:1a0a:e7a7 with SMTP id
 v127-20020a252f85000000b00d801a0ae7a7mr1485372ybv.53.1694157319131; Fri, 08
 Sep 2023 00:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694093327.git.geert@linux-m68k.org> <e9f3da9b152b7d19b64d775d04e9e11b63dc35b6.1694093327.git.geert@linux-m68k.org>
 <1c7894fe-4cf4-1ad9-5ed2-aaab4351ff4c@linux-m68k.org>
In-Reply-To: <1c7894fe-4cf4-1ad9-5ed2-aaab4351ff4c@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Sep 2023 09:15:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1Xejj2hmS6fO=gviRCuqL82S+9nFLtSkJjH-aALWThQ@mail.gmail.com>
Message-ID: <CAMuHMdV1Xejj2hmS6fO=gviRCuqL82S+9nFLtSkJjH-aALWThQ@mail.gmail.com>
Subject: Re: [PATCH 32/52] m68k: mac: Add and use "mac.h"
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Philip Blundell <philb@gnu.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Fri, Sep 8, 2023 at 1:44 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Thu, 7 Sep 2023, Geert Uytterhoeven wrote:
> > --- /dev/null
> > +++ b/arch/m68k/mac/mac.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +struct rtc_time;
> > +
>
> I don't think we need a new header file. Related function prototypes
> already have homes in existing header files --
>
> > +/* baboon.c */
> > +void baboon_init(void);
> > +
>
> this could go into mac_baboon.h
>
> > +/* iop.c */
> > +void iop_init(void);
> > +
>
> mac_iop.h
>
> > +/* misc.c */
> > +int mac_hwclk(int op, struct rtc_time *t);
> > +
>
> macintosh.h
>
> > +/* macboing.c */
> > +void mac_mksound(unsigned int freq, unsigned int length);
> > +
>
> mac_asc.h
>
> > +/* oss.c */
> > +void oss_init(void);
> > +
>
> mac_oss.h
>
> > +/* psc.c */
> > +void psc_init(void);
> > +
>
> mac_psc.h
>
> > +/* via.c */
> > +void via_init(void);
> > +void via_init_clock(void);
>
> mac_via.h

All mac*.h you suggest live under arch/m68k/include/asm/, and are thus
shared with the whole tree, while only the core code under arch/m68k/
needs these definitions.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
