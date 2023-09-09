Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63879EEB58B
	for <linux-m68k@archiver.kernel.org>; Sat,  9 Sep 2023 12:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345538AbjIIMLO convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 9 Sep 2023 08:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbjIIMLN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 9 Sep 2023 08:11:13 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7BDCCA
        for <linux-m68k@lists.linux-m68k.org>; Sat,  9 Sep 2023 05:11:07 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bee392fe9dso1995283a34.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 09 Sep 2023 05:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694261466; x=1694866266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yabyQiAl8j5eXWo65T3fAwQZtqAN0vBKM+cJ98wtujM=;
        b=va6+GyS/qWw8am130KrNk3o1AsfGOKnhhHTFVdPiFdZlTAjwD1xVe6qZrETCP/804J
         TNTuS78wJsmPZYJ5gNhxSMN8yO8IdTSpRI2k39skzWaAN+bmRxgZzkkWJ0ityRHhZmJo
         +JvQxudTt4UscYMClVXiJLUZkPE9G5tLowrWLuEFOthp9+Yl0JnIXhBh3o2aEkds1cDb
         2pTVn4LWr4docB/7sl6wo6KuQ1WUa2BKKQBkxDfgfRk65LDd7Ald15nUkNJGmwwyVNh6
         lIylqsjfla0TgYU7VcJIlPb2WYrZFfdJsSTzup3ELuB5ioaNkbJohZISuYgjMenZlFx6
         mNXQ==
X-Gm-Message-State: AOJu0YyPn6yOgnEj0OIdNY5pCohMF9zObP8ywjakZpgeMRU7X7pcC+z1
        MBaoU379i7e002DkUmAVkLnVVMW6BjiaBw==
X-Google-Smtp-Source: AGHT+IEvtxmwx1hEpOw29IrTQlaJ6s85o5IYfunIij934lQdFK1oUsYYwGxK0kCR0pVbMdmICpbDZQ==
X-Received: by 2002:a05:6830:149:b0:6b9:a6ef:2709 with SMTP id j9-20020a056830014900b006b9a6ef2709mr5783658otp.8.1694261466287;
        Sat, 09 Sep 2023 05:11:06 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id c82-20020a25c055000000b00d607f70d762sm793098ybf.32.2023.09.09.05.11.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Sep 2023 05:11:05 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5925e580f12so28612737b3.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 09 Sep 2023 05:11:05 -0700 (PDT)
X-Received: by 2002:a25:aa73:0:b0:d47:8db3:8bc8 with SMTP id
 s106-20020a25aa73000000b00d478db38bc8mr5284381ybi.21.1694261465123; Sat, 09
 Sep 2023 05:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694093327.git.geert@linux-m68k.org> <e9f3da9b152b7d19b64d775d04e9e11b63dc35b6.1694093327.git.geert@linux-m68k.org>
 <1c7894fe-4cf4-1ad9-5ed2-aaab4351ff4c@linux-m68k.org> <CAMuHMdV1Xejj2hmS6fO=gviRCuqL82S+9nFLtSkJjH-aALWThQ@mail.gmail.com>
 <4a126e21-6c36-024b-9ab1-b4798ef274d4@linux-m68k.org>
In-Reply-To: <4a126e21-6c36-024b-9ab1-b4798ef274d4@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 9 Sep 2023 14:10:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9ujRZNxmrQh3+QZ2YNbvXwuXnfi-6OBuZxoa2aVsiXA@mail.gmail.com>
Message-ID: <CAMuHMdU9ujRZNxmrQh3+QZ2YNbvXwuXnfi-6OBuZxoa2aVsiXA@mail.gmail.com>
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

On Sat, Sep 9, 2023 at 12:59 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Fri, 8 Sep 2023, Geert Uytterhoeven wrote:
> > On Fri, Sep 8, 2023 at 1:44 AM Finn Thain <fthain@linux-m68k.org> wrote:
> > > On Thu, 7 Sep 2023, Geert Uytterhoeven wrote:
> > > > --- /dev/null
> > > > +++ b/arch/m68k/mac/mac.h
> > > > @@ -0,0 +1,25 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +
> > > > +struct rtc_time;
> > > > +
> > >
> > > I don't think we need a new header file. Related function prototypes
> > > already have homes in existing header files --
> > >
> > > > +/* baboon.c */
> > > > +void baboon_init(void);
> > > > +
> > >
> > > this could go into mac_baboon.h
> > >
> > > > +/* iop.c */
> > > > +void iop_init(void);
> > > > +
> > >
> > > mac_iop.h
> > >
> > > > +/* misc.c */
> > > > +int mac_hwclk(int op, struct rtc_time *t);
> > > > +
> > >
> > > macintosh.h
> > >
> > > > +/* macboing.c */
> > > > +void mac_mksound(unsigned int freq, unsigned int length);
> > > > +
> > >
> > > mac_asc.h
> > >
> > > > +/* oss.c */
> > > > +void oss_init(void);
> > > > +
> > >
> > > mac_oss.h
> > >
> > > > +/* psc.c */
> > > > +void psc_init(void);
> > > > +
> > >
> > > mac_psc.h
> > >
> > > > +/* via.c */
> > > > +void via_init(void);
> > > > +void via_init_clock(void);
> > >
> > > mac_via.h
> >
> > All mac*.h you suggest live under arch/m68k/include/asm/, and are thus
> > shared with the whole tree, while only the core code under arch/m68k/
> > needs these definitions.
> >
>
> I guess #include "../mac/mac.h" is expected but
> #include "../../m68k/mac/mac.h" is not intended (?)

Yes indeed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
