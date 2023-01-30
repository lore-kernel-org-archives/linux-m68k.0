Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F0CC54EED
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 10:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbjA3KM1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 05:12:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233298AbjA3KM0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 05:12:26 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB571716F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 02:12:25 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id z9so9506824qtv.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 02:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msgyLoFKs7pTSgzoTAvpyi4Z6i9IcBr25WOUg5fxIaI=;
        b=LUt9WwRHFLVw2G2oy1An762iAy0aPdVuyxkWGI7QAV5G5igjZQ2djbQ86ucI8wr6uV
         QZqmHNQtgOVjsKyP5gxExuiYifwK4q0C4GMHvp9OfFS4tazCQWytKjju14sFeagHQGII
         17Eg3jAAEc6JxCerEAI7M3tctNKs1hqD5bghytJgAnTqbTU9TaurHLSz0oVLsab55xK3
         AIWFNEWMFDvqH7FGvo0kyjEfDMjKJr9bRSOy7WqiWi1hf8iec6vau/s8O/nPaXsLM+r8
         3vBi9sVSNz+cQzG1bSmwdB0dRv2BxvvZQvbRQdJqxCjSH7ojeENxzuV7xqU/mimXfm4T
         eviQ==
X-Gm-Message-State: AFqh2kpRIgs8LTgKFTx9UzVaOxMs0UHMVFcPxGxO5ZH4KJhsT1kGpTSI
        XYyIX9LHZv9HA4dMJOK5ZbNj0BrCTBeeOg==
X-Google-Smtp-Source: AMrXdXuwFD/jjupQhvBqGTZt/WhAWh1qLGV9lU7LQI/U6hYRyQT0ppYNOneJy8OHEbWd5ku7jEFBuQ==
X-Received: by 2002:ac8:7107:0:b0:3b6:2f22:75bd with SMTP id z7-20020ac87107000000b003b62f2275bdmr63798607qto.28.1675073543996;
        Mon, 30 Jan 2023 02:12:23 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id bz17-20020a05622a1e9100b003b86b962030sm1418828qtb.72.2023.01.30.02.12.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 02:12:23 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 123so13326233ybv.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 02:12:23 -0800 (PST)
X-Received: by 2002:a25:9801:0:b0:7d5:b884:3617 with SMTP id
 a1-20020a259801000000b007d5b8843617mr4331804ybo.380.1675073543385; Mon, 30
 Jan 2023 02:12:23 -0800 (PST)
MIME-Version: 1.0
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com>
In-Reply-To: <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Jan 2023 11:12:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3yD22_ApemzW_6me3adq6A458u1_F0v-1EYwK_62jPA@mail.gmail.com>
Message-ID: <CAMuHMdW3yD22_ApemzW_6me3adq6A458u1_F0v-1EYwK_62jPA@mail.gmail.com>
Subject: Re: stack smashing detected
To:     Stan Johnson <userm57@yahoo.com>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC linux-m68k

On Mon, Jan 30, 2023 at 5:01 AM Stan Johnson <userm57@yahoo.com> wrote:
>
> Hello,
>
> I am seeing anywhere from zero to four of the following errors while
> booting Linux on 68030 systems and using sysvinit startup scripts:
>
> *** stack smashing detected ***: terminated
> Aborted
>
> I usually (but not always) see three of the errors while init is running
> the rcS.d scripts, and one while running the rc2.d scripts. The stack
> smashing messages appear only on the system console (nothing is logged
> in an error log or dmesg). Despite the errors, the system continues
> booting to multiuser mode without any obvious additional problems. I
> haven't tested systemd, which is too slow to be useful on my m68k
> systems (though I have a Debian SID with systemd that I can restore for
> testing if necessary).
>
> I'm using the current Debian SID and Debian kernel, and I've confirmed
> the errors on a Mac IIci and SE/30. I haven't seen the errors on any
> 68040 system (I only tested on a Centris 650 and PowerBook 550c). I also
> notice the errors on 68030 systems using custom kernels that I have
> cross-compiled using GCC 12 or GCC 10 on a x86_64 system running Debian
> SID; however, I do not see the errors as often if I cross-compile using
> GCC 8.3.0 on a 686 system (running Debian 10.7 Buster) -- I saw the
> errors a few weeks ago with an earlier kernel, but none today using
> Linux 6.1.8 cross-compiled with GCC 8.3.0.
>
> I'll be happy to help debug or troubleshoot, though at this point, since
> the "stack smashing detected" errors aren't reporting which processes
> are being terminated/aborted, I'm not sure where to start.
>
> thanks for any suggestions
>
> -Stan Johnson   userm57@yahoo.com
