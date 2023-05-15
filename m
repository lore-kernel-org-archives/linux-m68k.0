Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E80DC77B7D
	for <linux-m68k@archiver.kernel.org>; Mon, 15 May 2023 10:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238637AbjEOKLv convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 May 2023 06:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237581AbjEOKLu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 15 May 2023 06:11:50 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3BCE4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 May 2023 03:11:49 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-559debdedb5so186799527b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 May 2023 03:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684145508; x=1686737508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RSc3ehTcfUtTwTGi8/DXlWstgHILWkp+xdTMczEuPw=;
        b=ike7iA9X0Ygo33Mic8ZQNo9Xkrh2xMSmIR3Eb+fdfYBqOd3H8d7Iimp+06IPkhOk/+
         VjztrrIaJFVHeJsDPQ9ZgRXglfYH+/aIm2nTSvHEL6XM+iZAZ9EJXfyI6C2R74WXj+dI
         AsBOibQI8F88DlHuvus+HQ4V53hwY8KQg0BgHdIJkn+OAkyqR2mGn2E/V9C306gYO2P/
         yLzoLjKpK08nB1i3FoDK4JUCYxumzH9RhsV31Y32z97FwT963Q4vbqKly/8ZDokGr+4Y
         sQdUnvDgGLWGuTkgkSVhXpZrWvhFbRxLquKTCWtGDmgorgIS0jN5OCNI+3DhTZaHtM98
         M5nw==
X-Gm-Message-State: AC+VfDwQN/VVqnWD+qSmyn7ikJ174Vn5PMUMonLf0nrIhJewsJCl/W3K
        X9wEDBBBtfq/su5XO6rvMzCMEV3+KDI81Q==
X-Google-Smtp-Source: ACHHUZ5HljgsMLJmm1hVzCz02ctSQfVY4fPGcMhhv3uFMrWGtsnHuHoTgGnanqj28n2poESujB1/Sw==
X-Received: by 2002:a0d:e285:0:b0:55a:393:c9da with SMTP id l127-20020a0de285000000b0055a0393c9damr34246285ywe.10.1684145508395;
        Mon, 15 May 2023 03:11:48 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id b5-20020a0dd905000000b0055a931afe48sm2480946ywe.8.2023.05.15.03.11.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 03:11:48 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-559debdedb5so186799417b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 May 2023 03:11:47 -0700 (PDT)
X-Received: by 2002:a81:6689:0:b0:55a:8c02:bfea with SMTP id
 a131-20020a816689000000b0055a8c02bfeamr32799250ywc.19.1684145507540; Mon, 15
 May 2023 03:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <1296c4d691bba057291246f067c191ef8a88531c.1680667933.git.fthain@linux-m68k.org>
 <CAMuHMdXLsnfQ4XhJiuE54BjGaCMAxvzOR+GGB9iFD8pYXprfxQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXLsnfQ4XhJiuE54BjGaCMAxvzOR+GGB9iFD8pYXprfxQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 May 2023 12:11:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSYDUOy0CSrRcv5-R8rg6EdXMaG5SHiTcYuaNa7K5e1Q@mail.gmail.com>
Message-ID: <CAMuHMdWSYDUOy0CSrRcv5-R8rg6EdXMaG5SHiTcYuaNa7K5e1Q@mail.gmail.com>
Subject: Re: [PATCH v4] nubus: Don't list slot resources by default
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Brad Boyer <flar@allandria.com>, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Mon, May 15, 2023 at 11:44 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Apr 5, 2023 at 6:19 AM Finn Thain <fthain@linux-m68k.org> wrote:
> > Some Nubus card ROMs contain many slot resources. A single Radius video
> > card produced well over a thousand entries under /proc/bus/nubus/.
> > Populating /proc/bus/nubus/ on a slow machine with several such cards
> > installed takes long enough that the user may think that the system is
> > wedged. All those procfs entries also consume significant RAM though
> > they are not normally needed (except by developers).
> > Omit these resources from /proc/bus/nubus/ by default and add a kernel
> > parameter to enable them when needed.
> > On the test machine, this saved 300 kB and 10 seconds.
> >
> > Cc: Brad Boyer <flar@allandria.com>
> > Tested-by: Stan Johnson <userm57@yahoo.com>
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> > Changed since v3:
> >  - Better commentary.
> > Changed since v2:
> >  - Added commentary.
> >  - Moved declaration to nubus.h.
> > Changed since v1:
> >  - Expanded to cover all slot resources in procfs.
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> i.e. will queue in the m68k for-v6.5 branch.

Upon second look, "populate_procfs" is too generic for a global
variable.  Please add a "nubus_"-prefix, and use module_param_named()
instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
