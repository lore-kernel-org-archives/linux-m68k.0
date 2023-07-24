Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4268FC0015E
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 08:50:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbjGXIuo convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 04:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbjGXIun (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 04:50:43 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4864895
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 01:50:41 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5768a7e3adbso76182417b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 01:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690188640; x=1690793440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eru5igGG5ZNMFyi9+7h599RckQE/U9fJOptjtiH/IWA=;
        b=YZIHLoQ1g4tAx74KkSi1qN7FVb+mSwfqEpU/GumlpKflaWwPGEvStx6BvKoJm7oN3g
         9vexGliMuFaRGIzbQsN3EzqYW6wnZaLAxH6RY5p0hr1IR2o9ilZp51dWHKYwQ2Gey45n
         Ej6BBuYklHz00tNvGJgGzPv+H9fjFHKH+0XPZ4RGAO4dIZTvqWkPpSnKrE8dGG8u8LVT
         vm2yV6NFpwBcvSl/eBbV0UnY4RXwv2xzN9LHen8YqT3d8F2RrcNg7MF7VYjZ8G4wQmk/
         rwmqTqK9UGrnI4d9b321mC5vswE7fNDCq0OIW+EWrsEUFNW0rGc44O6EBIniPXc5FH1y
         Fwvw==
X-Gm-Message-State: ABy/qLY5R9B2S7Brh0QUQLf8T1rHeFK13kWIllsDmyr6opQZngT6IAQL
        dEwdIkns68sI2ClRgaPiJhsfcP/3ETp+zA==
X-Google-Smtp-Source: APBJJlEaioAUAUWtSJBYpWr13/3R3TSpciHIs0YmwcdNhItBGcsRhWl+FXTnb/pebY+YX9HsF1mhIA==
X-Received: by 2002:a81:4e0a:0:b0:57a:3942:bb74 with SMTP id c10-20020a814e0a000000b0057a3942bb74mr4780971ywb.17.1690188640103;
        Mon, 24 Jul 2023 01:50:40 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id s124-20020a818282000000b005702bfb19bfsm2670769ywf.130.2023.07.24.01.50.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 01:50:39 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-cea0021d1f3so7621293276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 01:50:39 -0700 (PDT)
X-Received: by 2002:a25:f54:0:b0:cef:9a1b:8380 with SMTP id
 81-20020a250f54000000b00cef9a1b8380mr6389620ybp.24.1690188639473; Mon, 24 Jul
 2023 01:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230721075949.5632-1-xujianghui@cdjrlc.com> <fcc5460f8a84680d6e7379d320ad0575@208suo.com>
In-Reply-To: <fcc5460f8a84680d6e7379d320ad0575@208suo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jul 2023 10:50:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-wns-BuCGSvC+fLS_RogY=uo2Md_7cnxyHtd-+sHoww@mail.gmail.com>
Message-ID: <CAMuHMdX-wns-BuCGSvC+fLS_RogY=uo2Md_7cnxyHtd-+sHoww@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix two occurrences of the checkpatch.pl error:
To:     sunran001@208suo.com
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Ran,

On Fri, Jul 21, 2023 at 10:04 AM <sunran001@208suo.com> wrote:
> ERROR: that open brace { should be on the previous line
> ERROR: space required after that ',' (ctx:VxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>

Thanks for your patch!

But obviously you forgot to run scripts/checkpatch.pl on your own patch:

    WARNING: A patch subject line should describe the change not the
tool that found it
    #2:
    Subject: [PATCH] m68k: Fix two occurrences of the checkpatch.pl error:

    WARNING: From:/Signed-off-by: email name mismatch: 'From:
sunran001@208suo.com' != 'Signed-off-by: Ran Sun
<sunran001@208suo.com>'

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
