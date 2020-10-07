Return-Path: <SRS0=Hd0i=DO=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD43C4363C
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 09:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B653F20870
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 09:14:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgJGJOq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Oct 2020 05:14:46 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:35805 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgJGJOp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Oct 2020 05:14:45 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MwQKp-1kgEs52Gu5-00sNCK for <linux-m68k@lists.linux-m68k.org>; Wed, 07
 Oct 2020 11:14:44 +0200
Received: by mail-lf1-f41.google.com with SMTP id d24so1437778lfa.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Oct 2020 02:14:44 -0700 (PDT)
X-Gm-Message-State: AOAM5337sDyPuILfuUu1bVpfJAPI69lOFSni0GI05BfzkgrIcqOHqBtY
        Y9b3F8xbCfjPQAwQ1l9LlqKgXraY8XOhnnvNEXM=
X-Google-Smtp-Source: ABdhPJw2gnzs2qy9RvszF/Ejh/VyDEIZYOzzBnaZ8DUrYzebu70+BDP/QGgBJfoHplJXH7w9rmZ4qqJginNm0O/UfFY=
X-Received: by 2002:a05:6512:2fb:: with SMTP id m27mr615293lfq.0.1602062083930;
 Wed, 07 Oct 2020 02:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-4-hch@lst.de>
In-Reply-To: <20201007074447.797968-4-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Oct 2020 11:14:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0kojDb55g8qG9BUrS+Oh9H5dNqs=JXZ7vsoDb+0-Qr+Q@mail.gmail.com>
Message-ID: <CAK8P3a0kojDb55g8qG9BUrS+Oh9H5dNqs=JXZ7vsoDb+0-Qr+Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] fbdev/sbuslib: avoid compat_alloc_user_space in fbiogetputcmap
To:     Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PokHQxGk+co4wKZH2G7Hend3e6OOOa0oTW9b17qDcLzF7GuBLZt
 uKBNTJZcIBooUkS6WielsQxYMa0G90Dke+u49yO7ZEl4TXTbewdH2znCr24va/LSSsma1fV
 91q6pOfDoVm9Rwm1Zc1nS9O6+aRa16YBVcsKM+4E68ZV0B/fAmCUkZH4QJ8dqpGMwXJ21oO
 nL2JmyExFmNxRf9awuQ7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Ue2H/Zb5gw=:0KxvGzEOcYdh7lpvEIuz6Z
 pO2eipoorcaddQ7MckrFwSVfw0gBs8uQtOCTFxRNnbOHUs6+0L5/5Hu+ztSjKMiY21KNND1wi
 k9j3LEsbYoQCVC9YMihCgrVkoeZSnAFfM7bVL5yVWX041dWuszgLEqPWw/dBZydL9Ya3i9Gm3
 ixAZw67Q2IBB1earDs7Oos97feMH/C+cJ4WkmoWtJlIb8m3FxsWuhBh3ZvhFLVtj96TjyW747
 luKNFmM75ozmJOhRW9VoFAe8yKon/gyoqNh/o6kD2MDBoFOVZzYD52+szt+0b4YV0k1A5au53
 Jl4NPEkDWeQTjIGmk3YLd6HpYe2osKYXt5LPqSH6EasOZiUfOSMukM7sdjfo49O+igZ721w5V
 +fS6D3SbjmK0drGxHAsyb7e+//vsBDVfgtwSjtbhGvUepxtEQ//UdOSTxa/btqkxRKgsqpVel
 QPhMYlGsletsvK7VsEvLdbdk5fqnBMbTtSIIfxbyeuElqms1ihuBSr/UHg+fjRFHX9kbB7oxZ
 CHK0oRjQfaXi9Mu/j4jwICVOEf/vnozS0pMMIHxkp/Jv8jDLoqLfyVoXoAbSmCYQmJCrKqcQb
 HROxpg81aa7gltzpA3F/ZGIg3ojybaCRYQ8UWoz9PuX8jmWpfQ+XJeLJlw+8TJVbzYCME83gi
 rIgnEM3CX8cVlSn433c9yBpTu6LCfD3DT0CWSeMGrUAZQGoV+yy6GZUqimF/df+EAyqWxEgZG
 AZlls8gCXD/AhZpXPPsksG71u1MVODT7M5P4vrAQcQKrskt3Clrhva/UDBcBg21TFAqE/0ZyK
 J35TcvXLZa1YlfBzL4ZmKj4vqHQGyoJ7fbPcNQcuHmvCCmx9DZl1qrvavklFYlFB+3oevQdhk
 YnjRKRr19EWebYPtUloY26uv6L+X9fRR60OX+YEsTQaK2uyxGT3bMg0TMVHQlm+8ZH4tCKqLM
 3IF6gjJxfS2GkAFJ15AqCONiGcUnxcWLausXK5L1JAh4ASuLmOqGZ
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 7, 2020 at 9:44 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Rewrite fbiogetputcmap to call the low-level sbusfb_ioctl_{put,get}cmap
> helpers directly and thus avoid usage of the deprecated
> compat_alloc_user_space API.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This is another one that I had already addressed in a somewhat inferior way.
I attempted the same kind of cleanup that you did in patch 2/3 but failed to
convince myself that I had managed to avoid regressions, so my patch just
copy-pasted the native implementation into the compat handler with minor
changes.

Provided that your preparation patch is correct, this version is clearly better
than mine, but again I don't know the state of that patch after Sam had
said he applied it already.

     Arnd
