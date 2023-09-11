Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5701CA0EC6
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Sep 2023 22:26:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244401AbjIKWZB convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238135AbjIKNmE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Sep 2023 09:42:04 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA7CCD7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Sep 2023 06:41:58 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d7ecdb99b7aso3987168276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Sep 2023 06:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694439717; x=1695044517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Fjv8PmDJnyBJVhOZHOd88BdYtAyAHCd5lHO8BTBdh4=;
        b=jMwpBDmVVFBmpHu1qt+xVYU6Xhyjf5imrWjHB8gf2iwxw5jhXXCAc7rgiaPRONL2Q+
         YfSyBYINhYBQUNUTOXZ6oJiDcUczHxCXCUMbxzWfmM86ZPJztLsam7Hxai6fzQb1CS8r
         MTgLSxqHj9mwSAu5pPNucZUnj1DKvV9OfDqXAhZSnILt42gLkW8qrmrbvWjtBiBHmZIC
         gK3EuIrm4upSZPLDhEfEq8+GA2rv6K6oPL2q/ijCCzGxEwqQlaVT7V3BbzeLFRLdG3CW
         lSK1zNhz8h55YvqwQZYefW4MGNlkcExjx3N48+HdKTWge+LVDEwIGiYuWhhnvCLNwDM7
         PrsA==
X-Gm-Message-State: AOJu0YxWTi5KvisfM/hHj77MTtKkDxlc7dCEJ5Dm1Hkk8elwVEh1ae9o
        GFHjWd32YJGIDIbBHY4RbLpS4NJB2jy+Ig==
X-Google-Smtp-Source: AGHT+IEl8r4Q0I2C/vMi9U+cMeKieSV43qTwJtvfEq85oVK67Hq82iTjr/2JZabPMmu3MF9g78aQEg==
X-Received: by 2002:a25:bfc7:0:b0:d7a:ba02:eaa1 with SMTP id q7-20020a25bfc7000000b00d7aba02eaa1mr7910030ybm.64.1694439717141;
        Mon, 11 Sep 2023 06:41:57 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id i64-20020a256d43000000b00d728a2738f1sm1687704ybc.61.2023.09.11.06.41.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 06:41:56 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d7260fae148so4005300276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Sep 2023 06:41:56 -0700 (PDT)
X-Received: by 2002:a25:ef4d:0:b0:d7a:c4dc:e7b3 with SMTP id
 w13-20020a25ef4d000000b00d7ac4dce7b3mr8154432ybm.61.1694439716223; Mon, 11
 Sep 2023 06:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694093327.git.geert@linux-m68k.org> <64ea8cf65a4318fbf8c91cb3062d90a2555007c4.1694093327.git.geert@linux-m68k.org>
 <2545f40a-0c59-491d-895f-4a7975faaedc@app.fastmail.com> <CAMuHMdWs0QbRQZCXZ2Gycqb7jjsjUZMp7_h2mVWxR1zrjCL1Og@mail.gmail.com>
 <76998b95-827a-4e71-8782-0990b204fcfa@app.fastmail.com>
In-Reply-To: <76998b95-827a-4e71-8782-0990b204fcfa@app.fastmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Sep 2023 15:41:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmjFm89kW_=AiatXZ_M2gSJ7+csvv3N77OM_cbsF_tSA@mail.gmail.com>
Message-ID: <CAMuHMdVmjFm89kW_=AiatXZ_M2gSJ7+csvv3N77OM_cbsF_tSA@mail.gmail.com>
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

On Sat, Sep 9, 2023 at 4:07 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Sat, Sep 9, 2023, at 14:12, Geert Uytterhoeven wrote:
> > On Sat, Sep 9, 2023 at 10:28 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Thu, Sep 7, 2023, at 15:41, Geert Uytterhoeven wrote:
> >> > When building with W=1:
> >> >
> >> >     m68k/arch/m68k/emu/nfeth.c:42:19: warning: ‘version’ defined but
> >> > not used [-Wunused-const-variable=]
> >> >        42 | static const char version[] =
> >> >         |                   ^~~~~~~
> >> >
> >> > Fix this while obeying the wishes of the original copyright holders by
> >> > marking version[] with __maybe_unused.
> >> >
> >> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>
> >> That will just drop it from the object file, maybe it should
> >> instead be marked "__used" ?
> >
> > Given it's been like this since the beginning, I guess it never showed
> > up in the object file anyway...
>
> Older compilers used to keep unused variables, and all versions
> still do when building with -O0 instead of the usual -O2.
>
> I can see on godbolt.org that gcc-1.27 did not have that optimization
> yet, while gcc-4.1 had it, but I haven't found any versions between
> those. I vaguely remember us throwing out the version strings from
> most kernel files a long time ago, possibly that was triggered by
> gcc no longer putting them into the object any more, but I can't
> find a reference for that.
>
> What I can see is that a lot of old network drivers have version
> strings like this one, but they are actually printed from the
> probe function, and lost their __devinitdata annotation in the past.

The version string in arch/m68k/emu/nfeth.c used to be __devinitdata,
too, but it was never printed.  So I'm just gonna silence the warning,
as this patch does.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
