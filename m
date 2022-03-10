Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B816AC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Mar 2022 23:42:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbiCJXn1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Mar 2022 18:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344551AbiCJXnY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Mar 2022 18:43:24 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED7919E00F
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 15:42:21 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id s25so9973853lji.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 15:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A5yzBGS/mlNNmuxREYecJ0lSlh7XloqoILtFR+wlGQg=;
        b=KFJStgni5znYnmP9HGJmG/egl0sxkTG7yQ8Q6VJ5bQo/ILCsjyRG3IEvkqaLDYdPjs
         kjPCBTRuDS2/ELQtP5IwaXG9DlLenBzx0gE4joiKfaN1L5mqc2jxcogSAtaLxYSC68IQ
         5i2SNDUIFct5kx/AgMbFT8v1hLo9Yw3vnGrRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A5yzBGS/mlNNmuxREYecJ0lSlh7XloqoILtFR+wlGQg=;
        b=QEpZoW9dlVTqrTbVIB2eS6C+LBxgmH9QIPzeDWzrBeiaWIieTOQSVEo32btf63DihZ
         bRwmiufqOdNmzoiPOhnFZr+hbzd380g1+kuNx1uUkJ9lwi1IBaBx8qp6kGBQJ5MyHdzf
         jKykfQuWrf3MuOmWGRXZIlz9tXu9DcrWClk1GQXzq7RaFbMjzP6t/J/Iat1LWUPnzI25
         kPBQd6ZR0XiPexLCLHibIwZQ/O4qmfAXvrpxbh49o5S/IMMwGeuSzQWBUpV+T+w5M2p+
         7Ok95RbiCaGa9rKjgLP65ZlnlDpxkIbXpLwHD1AWYcdq/uS+c7Vz41h7gE27HAJDeBqw
         /Pkg==
X-Gm-Message-State: AOAM5325KOWmwO+09sl7y6OBrcMQr4k55tBaWSQYNhenrvNsKBZjB/TZ
        9tVqyzN1tN+ExBoGwDULgijrPnWj8lFRkKjc
X-Google-Smtp-Source: ABdhPJx5TRy+HCInB9AJsTyHp2vBUKR63G+5p8pVQ8C/4WGt4k/RSSjAswf28lNJviX46uPk7fSD4w==
X-Received: by 2002:a2e:9887:0:b0:247:e4e0:5b70 with SMTP id b7-20020a2e9887000000b00247e4e05b70mr4707990ljj.150.1646955740027;
        Thu, 10 Mar 2022 15:42:20 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id f10-20020a056512092a00b004482fed26a0sm1235707lft.234.2022.03.10.15.42.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 15:42:19 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id bu29so12315590lfb.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 15:42:19 -0800 (PST)
X-Received: by 2002:a05:6512:2294:b0:448:6c86:3c78 with SMTP id
 f20-20020a056512229400b004486c863c78mr952676lfu.531.1646955338409; Thu, 10
 Mar 2022 15:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20220113160115.5375-1-bp@alien8.de> <YeBzxuO0wLn/B2Ew@mit.edu>
 <YeCuNapJLK4M5sat@zn.tnic> <CAMuHMdUbTNNr16YY1TFe=-uRLjg6yGzgw_RqtAFpyhnOMM5Pvw@mail.gmail.com>
 <YeHLIDsjGB944GSP@zn.tnic> <CAMuHMdUBr+gpF6Z5nPadjHFYJwgGd+LGoNTV=Sxty+yaY5EWxg@mail.gmail.com>
 <YeHQmbMYyy92AbBp@zn.tnic> <YeKyBP5rac8sVvWw@zn.tnic> <b40d1377-51d5-4ba3-ab3f-b40626c229ad@physik.fu-berlin.de>
 <87ilsmdhb5.fsf_-_@email.froward.int.ebiederm.org> <164686349541.391760.11942525130947458475.b4-ty@chromium.org>
 <87czit4cae.fsf_-_@email.froward.int.ebiederm.org>
In-Reply-To: <87czit4cae.fsf_-_@email.froward.int.ebiederm.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 10 Mar 2022 15:35:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgpToUf0XORoH_t7Wrqv3=VcqCCDV2qnCbqjtCsrd3Cyg@mail.gmail.com>
Message-ID: <CAHk-=wgpToUf0XORoH_t7Wrqv3=VcqCCDV2qnCbqjtCsrd3Cyg@mail.gmail.com>
Subject: Re: [PATCH] x86: Remove a.out support
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>,
        "Theodore Ts'o" <tytso@mit.edu>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Cree <mcree@orcon.net.nz>,
        linux-arch <linux-arch@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        X86 ML <x86@kernel.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Mar 10, 2022 at 3:29 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Kees can you pick this one up in for-next/execve as well?
>
> It still applies cleanly and the actual patch seems to have gotten lost
> in the conversation about what more we could do.

Side note: there are similar other turds if a.out goes away, ie on
alpha it's OSF4_COMPAT, and it enables support for a couple of legacy
OSF/1 system calls.

I think that was also discussed in the (old) a.out deprecation thread
back in 2019..

               Linus
