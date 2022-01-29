Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58707C433EF
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Jan 2022 19:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343543AbiA2TGJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Jan 2022 14:06:09 -0500
Received: from mail-vs1-f48.google.com ([209.85.217.48]:44972 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245519AbiA2TGI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Jan 2022 14:06:08 -0500
Received: by mail-vs1-f48.google.com with SMTP id v6so7021580vsp.11
        for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Jan 2022 11:06:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CnXV1lP4jRXDruwr+VLx538/6skJLP0U1y/ooujqmiU=;
        b=UGzsR+xVr+4djK/ZwMMwyFnh9HRufY2mWu6iKRsywi3+4Xbrj4C+MWL0ZEzGIo5I+P
         oYnWRRN1sE0FdZxMJslXCkSK0Fo7rr4GDKClhMRZjIiXnnLUyUZHEBoFfPdwwLmOuTpe
         nxW7wEbKEl9HID1FffftcFW5u+ndSvFtBt8r9SaQ4oNHQVdOSgI7hC3RTnERzORmktuy
         QJeqiYSwczRL/vY39JL15vDFDWYQ/Jqp+czZWFsjKSD0OavdZttXFWCMTsJI2ar2bLDD
         n59iBUscLxCJ+D65Y6RB3RJmMztaArB+m031pUiFBgFZlivZgKvmuFSoTaKaR2AORHYd
         Y20g==
X-Gm-Message-State: AOAM532kSAbYTmWhQMJUZqh1GDZyWcijEHPl5NyPU+1OU0QfE72ImsWL
        zORcjXv8YBRR/cTsLx/5UyXRoE5d3TkPgw==
X-Google-Smtp-Source: ABdhPJwZGujSaM2HvtCf1KAXkaUIXXUoemRU7ZFRDFuBPi2asjH9GDlxv+vYBewTIsk/4b210bz2KA==
X-Received: by 2002:a67:66c2:: with SMTP id a185mr6139442vsc.18.1643483167193;
        Sat, 29 Jan 2022 11:06:07 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id m185sm2073090vke.30.2022.01.29.11.06.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jan 2022 11:06:06 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id p7so9520335uao.6
        for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Jan 2022 11:06:05 -0800 (PST)
X-Received: by 2002:ab0:6f0d:: with SMTP id r13mr2305849uah.114.1643483165476;
 Sat, 29 Jan 2022 11:06:05 -0800 (PST)
MIME-Version: 1.0
References: <20220129184225.407100-1-laurent@vivier.eu> <20220129184225.407100-2-laurent@vivier.eu>
In-Reply-To: <20220129184225.407100-2-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 29 Jan 2022 20:05:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVmCV4v=LhGRB3d3hbyL4Etv_Wbb2VPhK5G9a2xB1Pm2A@mail.gmail.com>
Message-ID: <CAMuHMdVmCV4v=LhGRB3d3hbyL4Etv_Wbb2VPhK5G9a2xB1Pm2A@mail.gmail.com>
Subject: Re: [PATCH v13 1/5] m68k: add asm/config.h
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Laurent,

On Sat, Jan 29, 2022 at 7:42 PM Laurent Vivier <laurent@vivier.eu> wrote:
> To avoid 'warning: no previous prototype for' error, declare all
> the parse_bootinfo and config functions prototypes into asm/config.h
> and include it in arch/m68k/kernel/setup_mm.c and arch/m68k/*/config.c
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

I have already queued v12.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
