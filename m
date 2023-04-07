Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05943C6FD1D
	for <linux-m68k@archiver.kernel.org>; Fri,  7 Apr 2023 12:11:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240678AbjDGMLM convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 7 Apr 2023 08:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjDGMLL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 7 Apr 2023 08:11:11 -0400
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5518A6D
        for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Apr 2023 05:11:10 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id m16so28472831ybk.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Apr 2023 05:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680869470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfe+qkgS7FvneCwS+sNU3XB50bfgHZko1YA9pZWP1Oc=;
        b=SN9BnhVeOSHHPci6ZQpdoqyLuH51JPLIfQanJHYZctt0V5c/mHJNHQ2gZA8KeCx41Q
         AxbtMjKcUFYQqHaGOjjcWWpK0Pas7JA+M9AS4zCUdgzf/eXUh/9i6aeOS0f4qJ+RMSff
         TfIuIndc2pwS1KlVinH4Oi/L/wI0qQ/Yx1VEyB0wKkt+93o/jOM2fXsp+4HXUD/340Bl
         sFHPbg9OD+5gPZkQLGiRbzbQCX+rennrfdIqilBGVAaIhDC0iEIgasZ7NkOq53tuc0Gg
         /+jIwMYrqAArHkAqlQE6O/BnHLTh2BdUhknYYXeJewwKEQXyfPKLPHsCzSdrwbiX6BPB
         7Htw==
X-Gm-Message-State: AAQBX9cyDsuvcTmisAcmNKx/ons8ub5HRFp7VuAUcJ/HhsNTt2QJthZH
        2z+Y7XcmHFkxzEwjhIGdVaAW8Htsx/19FA==
X-Google-Smtp-Source: AKy350bQSNNmFikvDaVA3L7d0zXCy1HUo4FJYcs4mQfmoHvwwtPwWrvK01exedrKfjXt86pjW3kfhA==
X-Received: by 2002:a05:6902:18cf:b0:b8c:62e:84f7 with SMTP id ck15-20020a05690218cf00b00b8c062e84f7mr3385509ybb.24.1680869469526;
        Fri, 07 Apr 2023 05:11:09 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id k15-20020a81ed0f000000b00545a081847esm969403ywm.14.2023.04.07.05.11.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 05:11:09 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id cf7so48827450ybb.5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Apr 2023 05:11:09 -0700 (PDT)
X-Received: by 2002:a25:76c6:0:b0:b8b:ee74:c9d4 with SMTP id
 r189-20020a2576c6000000b00b8bee74c9d4mr1737642ybc.12.1680869468873; Fri, 07
 Apr 2023 05:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com>
 <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com>
 <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
 <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org>
In-Reply-To: <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Apr 2023 14:10:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhVdafr4QDkq0QF+ptMD-ruZsF8Ga2Cu240K5YX5jwPA@mail.gmail.com>
Message-ID: <CAMuHMdWhVdafr4QDkq0QF+ptMD-ruZsF8Ga2Cu240K5YX5jwPA@mail.gmail.com>
Subject: Re: dash behaviour, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Fri, Apr 7, 2023 at 6:08 AM Finn Thain <fthain@linux-m68k.org> wrote:
> When dash is feeling crashy, you can get results like this:
>
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~#
>
> But when it's not feeling crashy, you can't:
>
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> Warning: mountdevsubfs should be called with the 'start' argument.
>
> The only way I have found to alter dash's inclination to crash is to
> reboot. (I said previously I was unable to reproduce this in a single user
> mode shell but it turned out to be more subtle.)

That sounds like memory corruption somewhere else, e.g.
in the buffer cache...

Can you reproduce with CONFIG_DEBUG_SLAB=y?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
