Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4A0C761A6
	for <linux-m68k@archiver.kernel.org>; Sun,  9 Apr 2023 08:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjDIIaT convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 9 Apr 2023 04:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjDIIaS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 9 Apr 2023 04:30:18 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D24059C7
        for <linux-m68k@lists.linux-m68k.org>; Sun,  9 Apr 2023 01:30:17 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54bfa5e698eso205540987b3.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 09 Apr 2023 01:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681029016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZmOs0vrQbgTNwJzYYgAQz+vjhEq3dlwQMRBbc4UpCA=;
        b=sXrMa04LeHoqdjLLmL3nGXaENz0VoGaR5CywS2k44Lp0PbnnNMOcnvVwxMBstSZsto
         YbsmEu5FqGWwiJNgEWmYTA8QaZbqIbAX303PCJOngEIEx8n+R1HbC1TEGoRoFA33RDkA
         +G12sJxKb3nQnDYB9viO0DQemYGoFTFOX3K2Ub2ahFhz+zhwCFoxW25atmek8Z5Y+Z5v
         4T4Xl3ZiVXZ06Woz9LkNTB4Z7wtiSFM6Zg5vUUsRStD9cpn2DYtFVHpnqj34aUgHRTCt
         DUEbiNSL0zctHhVVjuaE9Pp7e5H1+czDg0dVCtSQWEWVbj2LSiMJL7aE3ZLdTBb1KKiE
         6MUg==
X-Gm-Message-State: AAQBX9fTxMCxbt46jywT2MzmL4MWLiNcaAKyt7pgF92H6P6GDCu7+meB
        WWoPskN261etecTc0R2HLdgu4npoI5InJQ==
X-Google-Smtp-Source: AKy350YUxGHyCbNOcUVb8lrXU2PUIjoDmMek07hQyPOTHANQd7JnzARBKBAKSSeD6ynRvIwX280GmQ==
X-Received: by 2002:a81:4812:0:b0:54e:fa66:7d7b with SMTP id v18-20020a814812000000b0054efa667d7bmr1873246ywa.33.1681029016267;
        Sun, 09 Apr 2023 01:30:16 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id g66-20020a81a945000000b00545a4ec318dsm2162175ywh.13.2023.04.09.01.30.15
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 01:30:15 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-54ee9ad5eb3so47261487b3.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 09 Apr 2023 01:30:15 -0700 (PDT)
X-Received: by 2002:a0d:ec51:0:b0:54f:17b6:f30a with SMTP id
 r17-20020a0dec51000000b0054f17b6f30amr246074ywn.4.1681029015749; Sun, 09 Apr
 2023 01:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
 <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com> <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org>
 <CAMuHMdWhVdafr4QDkq0QF+ptMD-ruZsF8Ga2Cu240K5YX5jwPA@mail.gmail.com> <d742219c-aa26-e1e0-0c36-e391935e30ef@linux-m68k.org>
In-Reply-To: <d742219c-aa26-e1e0-0c36-e391935e30ef@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 9 Apr 2023 10:30:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVc9_=ENhixP+E9tUjRd2+WVEeJF0Bww477YjQTKWEKqA@mail.gmail.com>
Message-ID: <CAMuHMdVc9_=ENhixP+E9tUjRd2+WVEeJF0Bww477YjQTKWEKqA@mail.gmail.com>
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

On Sat, Apr 8, 2023 at 7:26 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Fri, 7 Apr 2023, Geert Uytterhoeven wrote:
> > > The only way I have found to alter dash's inclination to crash is to
> > > reboot. (I said previously I was unable to reproduce this in a single
> > > user mode shell but it turned out to be more subtle.)
> >
> > That sounds like memory corruption somewhere else, e.g. in the buffer
> > cache...
> >
>
> If so, once the corruption showed up, you would expect the same crash next
> time...
>
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> root@debian:~# echo 3 > /proc/sys/vm/drop_caches
> [  937.250000] bash (717): drop_caches: 3
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
>
> I'd say it's probably not buffer cache corruption causing this because we
> can see two subshells fail, then just one.

OK.

> For that build I enabled SLUB_DEBUG but forgot to enable SLUB_DEBUG_ON --

FWIW, unfortunately not all SL*B_DEBUG are equal. I've seen
memory corruptions that were identified by SLAB_DEBUG, but not by
the other allocators.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
