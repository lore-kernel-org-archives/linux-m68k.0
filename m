Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72892C83F14
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Aug 2023 06:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjH2GxW convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Aug 2023 02:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbjH2Gww (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Aug 2023 02:52:52 -0400
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9962BBF
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 23:52:49 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d77b9d574f8so3584147276.2
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 23:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693291968; x=1693896768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KSheVIi+rzb80/aBiTW7CrCHwX1ubH+MreYmuHCNJY=;
        b=mA3aabUcuc5ztBveP5C8DwRidfeofjennd33s7Bf2asXlQcqB+F0rphLhBP2J8CQtI
         STTFuvSRpB/q0ZoYu1dt9/HMqxtH+d96kqalLBx4BLPdjzLOQZT63d7XoBOh7CGSgLdt
         UMTsyxp0VrD3rLxMeev/d1y8UsvbRMbpDZDOSc/OhM2QaUdK3XguTuSMxc1XqEhWuP8H
         sWG3OBb4rQ8hWMGFimd5FdX88Dyc3mMkFfXuKcgoKTiMTQhsCE9a3mb7h7p3rwX8zr9L
         wohWhCGxz/LYgEItrQNL7Jmlf4qhmi01MuCg1/49ksTcoHBPifCGbWvc6Xt9m/pTLc5S
         G1cw==
X-Gm-Message-State: AOJu0Yx4YZX8bHMpKdBEUTQWhU5cTk5XwT570Fff3HdqyBoq/fF8Ehhv
        e3sJLWAhkLgLmType+BLa60jY82qiP+wNA==
X-Google-Smtp-Source: AGHT+IF8CECMXvKzTXHR05siJ1fcZz+BaY6rMsHKE7PVaEaz4BLvu/9p550Ww/o8IHo6ObS1l5rxCQ==
X-Received: by 2002:a25:2f85:0:b0:d0a:353b:b939 with SMTP id v127-20020a252f85000000b00d0a353bb939mr25024600ybv.52.1693291968296;
        Mon, 28 Aug 2023 23:52:48 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id p5-20020a257405000000b00d74b5e166acsm2101735ybc.10.2023.08.28.23.52.47
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 23:52:47 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d35a9d7a5bdso3606975276.0
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 23:52:47 -0700 (PDT)
X-Received: by 2002:a25:32c5:0:b0:d5c:4d20:6245 with SMTP id
 y188-20020a2532c5000000b00d5c4d206245mr28028584yby.21.1693291967022; Mon, 28
 Aug 2023 23:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
 <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org> <751c83150533b701d66ac24c8fe81863cf5eab98.camel@aura-online.co.uk>
 <CAMuHMdUV0oM=zp6dG0KNbPJz2m7KBhynHa=ENUJmfh=u3gisbg@mail.gmail.com>
 <BEE12C98-6C32-4ECE-888F-EC01D4E5BCFD@arcor.de> <67BE11AC-6C14-441B-BA9C-B405C3783886@arcor.de>
In-Reply-To: <67BE11AC-6C14-441B-BA9C-B405C3783886@arcor.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Aug 2023 08:52:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCdHM26E0SVq1V8u2e6vxHhPV4BFOO3o1DoHQimef9EQ@mail.gmail.com>
Message-ID: <CAMuHMdUCdHM26E0SVq1V8u2e6vxHhPV4BFOO3o1DoHQimef9EQ@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To:     Richard <richiezid@arcor.de>
Cc:     debian-68k@lists.debian.org,
        James Le Cuirot <chewi@aura-online.co.uk>,
        Finn Thain <fthain@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        libc-help@sourceware.org, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Richard,

On Mon, Aug 28, 2023 at 10:17 PM Richard <richiezid@arcor.de> wrote:
> On August 28, 2023 11:26:58 AM UTC, Richard <richiezid@arcor.de> wrote:
> >On August 28, 2023 7:00:07 AM UTC, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>On Sun, Aug 27, 2023 at 11:36 AM James Le Cuirot
> >><chewi@aura-online.co.uk> wrote:
> >>> On Sun, 2023-08-27 at 10:46 +1000, Finn Thain wrote:
> >>Perhaps we need a new compiler warning: "hole in structure due to
> >>non-natural alignment, please consider adding explicit padding"?
> >
> >Sounds reasonable but I am afraid in 99% of cases this would be completely irrelevant and not break anything so the acceptance would be pretty low.
>
> On a second thought, that warning might get some acceptance if it is formulated slightly differently.. making it more clear that the way the struct is arranged will waste memory in addition to creating potential portability problems?

It will not always waste memory, only if some members can be moved
into holes.

Anyway, not wasting memory is merely an optimization.
Creating portability problems is a bug,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
