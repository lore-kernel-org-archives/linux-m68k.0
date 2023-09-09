Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09281EEB58C
	for <linux-m68k@archiver.kernel.org>; Sat,  9 Sep 2023 12:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbjIIMMk convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 9 Sep 2023 08:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345567AbjIIMMj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 9 Sep 2023 08:12:39 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28952CE6
        for <linux-m68k@lists.linux-m68k.org>; Sat,  9 Sep 2023 05:12:35 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1cca0a1b3c7so2034105fac.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 09 Sep 2023 05:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694261554; x=1694866354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElnjYqTEVh98M3QsOcoe1d7VW/OGyAcrh4Gl8OyK3Xs=;
        b=AhQRXVa6kafLOPLZ/AH5tPA8DIUEts9U9JWzhfJDvLG6HbOBilaB3Q4oy3srTBREXR
         D9XUJ6xVDtCm4GXIV7yDQ632OTmwbv6jpDjGSxwHY/EetivZcOpJSM78q0MfAiaKo/PU
         9Xkwl+nN4hb4qXZYIEuk2OIj5kaYHqipfI9WVZnJ9YJvKQMEo6+0JIMTZgu75ghNPgvu
         bKc4fNhPLopRUHELO6QxkK5jHw/U420lqNuVmUkqsBdj0l7DsRFoD8ifFvWcdqV972Go
         CLi0PpFER3yxiyQ+zk1Jqc9A9LutpWvQ3Oi0iEXUUfCCTjIEPbe/Vp5CsSdNuq+ZAvW9
         54Cw==
X-Gm-Message-State: AOJu0Yyx1V+enamOWk0UiawTxt2q1CzMmW/1SpiUgtud4Qvg8Un+yOhs
        HSHpGs2Ronm27JT4slUZ5u6mFrGQVRbrPw==
X-Google-Smtp-Source: AGHT+IFSExgdtN0sKCm22IBSJhljFYD0fanSbSbsk7+QKPZDsbZ+gbFkluC+ZyhDPPM8zx81yJWe7Q==
X-Received: by 2002:a05:6870:d252:b0:1be:f720:bb7b with SMTP id h18-20020a056870d25200b001bef720bb7bmr6172464oac.16.1694261554043;
        Sat, 09 Sep 2023 05:12:34 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id ky6-20020a056871c4c600b001cca1dc6d79sm2013742oac.34.2023.09.09.05.12.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Sep 2023 05:12:33 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6bcb5df95c5so2182973a34.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 09 Sep 2023 05:12:33 -0700 (PDT)
X-Received: by 2002:aca:2302:0:b0:3a8:4dfd:4f14 with SMTP id
 e2-20020aca2302000000b003a84dfd4f14mr5186395oie.27.1694261553297; Sat, 09 Sep
 2023 05:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694093327.git.geert@linux-m68k.org> <64ea8cf65a4318fbf8c91cb3062d90a2555007c4.1694093327.git.geert@linux-m68k.org>
 <2545f40a-0c59-491d-895f-4a7975faaedc@app.fastmail.com>
In-Reply-To: <2545f40a-0c59-491d-895f-4a7975faaedc@app.fastmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 9 Sep 2023 14:12:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWs0QbRQZCXZ2Gycqb7jjsjUZMp7_h2mVWxR1zrjCL1Og@mail.gmail.com>
Message-ID: <CAMuHMdWs0QbRQZCXZ2Gycqb7jjsjUZMp7_h2mVWxR1zrjCL1Og@mail.gmail.com>
Subject: Re: [PATCH 15/52] m68k: emu: Mark version[] __maybe_unused
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     linux-m68k@lists.linux-m68k.org,
        Finn Thain <fthain@linux-m68k.org>,
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

Hi Arnd,

On Sat, Sep 9, 2023 at 10:28 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Sep 7, 2023, at 15:41, Geert Uytterhoeven wrote:
> > When building with W=1:
> >
> >     m68k/arch/m68k/emu/nfeth.c:42:19: warning: ‘version’ defined but
> > not used [-Wunused-const-variable=]
> >        42 | static const char version[] =
> >         |                   ^~~~~~~
> >
> > Fix this while obeying the wishes of the original copyright holders by
> > marking version[] with __maybe_unused.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> That will just drop it from the object file, maybe it should
> instead be marked "__used" ?

Given it's been like this since the beginning, I guess it never showed
up in the object file anyway...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
