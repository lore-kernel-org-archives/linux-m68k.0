Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63A4C004D4
	for <linux-m68k@archiver.kernel.org>; Sat, 21 Jan 2023 18:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjAUSog (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 21 Jan 2023 13:44:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjAUSof (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 21 Jan 2023 13:44:35 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D743523308
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Jan 2023 10:44:33 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id d13so4490279qkk.12
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Jan 2023 10:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m2wcO40dt5UA1tFewa3Q2ZSLW1Z/rSy57yeTASOekkQ=;
        b=d96awGPIEsQ4vCxl7kSzELdAc0cAZjE2/igmOJCkDQ0mmoMJYoQVhxo/uaVH9V7RWj
         tsahR78QpvH498Pxi5NV5zJ42G7r4XxXopfG7uANAoMJnKhLBMbB/WPdBWJ5InQfXZZ8
         1+uJ9DIJRrsCfxTWsOkqhvTGyJiyyM9OSLmE9SXYc2cuXovViL9wXYTuz3iVGYc5q/0F
         qV9TZHKogt64uDgDEVBU2u3Dh62lLxE5Z6jLI0XPcjf6/mAOw9Xdo6jxuyHj04rvze/e
         GKI4942t+y8yJbRIhmEoOZRzbsPV+I1CfX0LGxyjS59rYYlXNlV3F2rXPL7NNHOtIlDG
         Tcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2wcO40dt5UA1tFewa3Q2ZSLW1Z/rSy57yeTASOekkQ=;
        b=ykyICLGVV7ml/ek/iSHo4ZV5r7/a6sBziteSN/vLokEOkhsFddyEHhHM70xlNZGZLi
         MMF8xUlmq4j3XiUwaBuXfR8GtHf2iWZoMUtR7uRuEh7xhVOGWrAGkmmov44yAVJE09EB
         RXUmydsJn4Qo3Ati8YG6Y45TuCNSsMPJkLOavdjm0dcbSNb2Vjj7rNO6ZEmLLaI+ElNK
         ycqth847NJpixZ1nRFShF0TxfoKtYD69eU6s3YzzNu3a/MO37EbvTkeHUrCxJkoXrlzl
         4uhSkWU3i6HVlzFOkEB+H5u4kk51XKmb+sSAt8te4SUohHfZKiTAEgHeSg8+LBBgCotK
         X29Q==
X-Gm-Message-State: AFqh2kolMSYTjGc98V+WKtCXM/4hUP11u18gkaR+H/U+WPe1slEdYRtd
        MPXy+0QVlwLwA9kXs2URhElaeNemtiB6mQLxoA==
X-Google-Smtp-Source: AMrXdXuSYyPWSUvybwqQV66tvA/KU2aZBoV88YVpzMcxgH3Pl46r4pcD1DqZ9Glbpin9BwbWVukVpZezCiQD0r0XeI8=
X-Received: by 2002:a37:ac13:0:b0:706:690f:46c9 with SMTP id
 e19-20020a37ac13000000b00706690f46c9mr993185qkm.437.1674326672925; Sat, 21
 Jan 2023 10:44:32 -0800 (PST)
MIME-Version: 1.0
References: <40e8c60c-396d-0cde-d702-ab44f53bd26f@physik.fu-berlin.de>
 <CAH8yC8=gjpi6+weBkmfGaJtPXBRcLUh78mDcnYMiVaF9ULGHcw@mail.gmail.com> <b2b012c6-ec85-072d-6397-57c895defcdf@alexperez.com>
In-Reply-To: <b2b012c6-ec85-072d-6397-57c895defcdf@alexperez.com>
From:   Antonio Vargas Gonzalez <windenntw@gmail.com>
Date:   Sat, 21 Jan 2023 19:43:56 +0100
Message-ID: <CA+OL9jiLCk3oepe2F8AMU_GE83-wikpHaG0G0VKFz_8ZG6N8xA@mail.gmail.com>
Subject: Re: LLVM buildbot for m68k backend has been moved to production
To:     Alex Perez <aperez@alexperez.com>
Cc:     noloader@gmail.com,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Min-Yih Hsu <minyihh@uci.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

YAY \o/ !


On Fri, Jan 20, 2023 at 5:36 PM Alex Perez <aperez@alexperez.com> wrote:
>
> Fantastic, great job, Adrian!
>
> Jeffrey Walton wrote on 1/20/23 6:17 AM:
> > On Fri, Jan 20, 2023 at 5:51 AM John Paul Adrian Glaubitz
> > <glaubitz@physik.fu-berlin.de> wrote:
> >> For a number of weeks, the LLVM buildbot which cross-compiles the M68K backend
> >> has been "green", i.e. builds and testsuite have passed without problems [1].
> >>
> >> As a consequence, I have asked the admin of the LLVM buildbot master server to
> >> move our buildbot from staging to production. After receiving approval yesterday,
> >> I moved the buildbot to production now [2].
> >>
> >> Another step forward in maturing the M68K backend in LLVM. More news on the backend
> >> coming soon, I'm preparing a longer report.
> > Good job, Adrian.
> >
> > Jeff
> >
>


-- 
Antonio Vargas Gonzalez | winden ^ capsule ^ rgba ^ network ^
batman.group | +windenntw | windenntw@gmail.com
