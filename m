Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E000AC83F18
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Aug 2023 01:34:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241572AbjH3BeB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Aug 2023 21:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241569AbjH3Bdt (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Aug 2023 21:33:49 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6396CC2
        for <linux-m68k@vger.kernel.org>; Tue, 29 Aug 2023 18:33:45 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a88ff732aeso248326b6e.0
        for <linux-m68k@vger.kernel.org>; Tue, 29 Aug 2023 18:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693359225; x=1693964025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ay2pDInaZTw1A+2nAPU9fyjtJJRA+bbmpNlSg9BxZZA=;
        b=bgjgSB1kO7V5wG+ZyoueUHKPa3mgL/LYOwHNb0VGZngcZxUyD//y8qm5iccYijXLeQ
         NJTCgHaerjatnbCBe2LiV0/inILMVJGWMMRjecJzkGbP79BqitOpSQ7ui04EZlNZsnm0
         G+EyCN1YZLzm7qF+h1HXQS+uCMfkGZQ3sPckVgtouT5z1wz77U6bWX3Zsahn7TQgTts9
         HXe5fTJYpRKZThAxGFGCJ1PnOpdMo3KZLpCi0tKcqveYl6nh50ouLfvK2Q/MUX+mrgN4
         dsKlofxfWLwnd0lMB50fGiXEgE30pEk9v0vgKv1xPJziHFwl42QyiR4rR18HQgKRhM/7
         XX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693359225; x=1693964025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay2pDInaZTw1A+2nAPU9fyjtJJRA+bbmpNlSg9BxZZA=;
        b=GRmiij/brIVFq4tD6XarzZvkfVg6itM0QNCbjZgCur8/HISUqEhrRWKcIoedsro5lv
         fxqewj9ysBa3RhXfXPwh/Yfjy5iAAf4RPEh+GQXCOoQalAr8Xw1Iumha4LrLYQNZYGuN
         bmdh++faBinc2RcKIgX5c4HY3EdHi9fPMvNQEIStRtxzMbMNOIQjpmyd9Hg2G4hvNi79
         xr+bQ5sYu7zNSD10GkNgzE9vLoMzvLRh5a21znwvOLC9Mfnz7jrezkOcz+ek77sGAXdq
         Y+vatWt2CaX/rRP6JJyrBcOTnTHS+7xjm6WtU0wDduuksMujthgYgigkMaN/uunGljWf
         R5xQ==
X-Gm-Message-State: AOJu0YyFkxPVuE873GwAEhy4UwhfQjrudRa+6bsDMiSF1GHuFBxwSC+E
        Whg28NR56GoZidy62XAXbL3jAdZuiw4z+Sjn1sM=
X-Google-Smtp-Source: AGHT+IG5eqbepRGhWBg4KNcXO8k4+xlWbB2TmN5Y7LzhNMAEg9ascdaQEgzr7pbASJlw5As7LTocCDNveJMzqFBGK40=
X-Received: by 2002:a05:6808:1381:b0:3a3:9b4a:3959 with SMTP id
 c1-20020a056808138100b003a39b4a3959mr2816958oiw.17.1693359224965; Tue, 29 Aug
 2023 18:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
 <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org> <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
 <dba7fd40-00ee-0ac1-19fd-5ec146aca972@linaro.org> <87134fda9b761e3f81588d440242b9a4e986ddbf.camel@physik.fu-berlin.de>
 <95a4dd47f25addc0408a1016ecbe1ed18d9dab6d.camel@aura-online.co.uk>
 <95b19b7af3c64aa4048d47f2b2966e195e7b2235.camel@physik.fu-berlin.de> <alpine.DEB.2.02.2308292337250.4585@scenergy.dfmk.hu>
In-Reply-To: <alpine.DEB.2.02.2308292337250.4585@scenergy.dfmk.hu>
Reply-To: noloader@gmail.com
From:   Jeffrey Walton <noloader@gmail.com>
Date:   Tue, 29 Aug 2023 21:33:33 -0400
Message-ID: <CAH8yC8kS-NnMCG0m2UHCnyQx4esW49n5ZEJt9qUP-ZmEZKio2A@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To:     Karoly Balogh <charlie@scenergy.dfmk.hu>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@vger.kernel.org>,
        Finn Thain <fthain@linux-m68k.org>,
        debian-68k <debian-68k@lists.debian.org>,
        libc-help@sourceware.org, James Le Cuirot <chewi@aura-online.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Aug 29, 2023 at 5:53=E2=80=AFPM Karoly Balogh via Libc-help
<libc-help@sourceware.org> wrote:
>
> On Tue, 29 Aug 2023, John Paul Adrian Glaubitz wrote:
>
> > > I don't want to force anyone here, but I'd also be fine with that. Th=
e only
> > > downside, apart from compatibility, appears to be slightly increased =
memory
> > > usage, and you're not exactly going to run modern Linux with 8MB RAM =
anyway.
> >
> > Agreed. And I finally want to be able to use Rust and LLVM on m68k ;-).
>
> So, let me get this straight (or from anothe perspective if you will) -
> neither LLVM and Rust is ready for prime time, because it can't accomodat=
e
> a decade old established standard on our platform. But Linux maintainers
> rush forward, and break^Wchange the ABI, so we can accomodate some
> half-baked fancy new tools.

Regarding Rust, it is only guaranteed to work on x86_64 and Aarch64.
Other platforms are a roll of the dice. See
https://doc.rust-lang.org/nightly/rustc/platform-support.html.

In practice, we had to scrap a project that was based on Rust. It gave
us too many problems on armel, armhf, aarch64 and powerpc. Rust could
not even compile its own cargos. We rebooted and went back to C. (This
was several years ago, before Aarch64 became Tier I).

> Sometime later someone realizes: if you want to support any other system
> on m68k (Amiga, Atari, 68k Mac, *BSD, game consoles (embedded) you name
> it), you still need to add support for the original alignment
> restrictions, because on those systems you're not always going to be able
> recompile the $world. So that someone will have the skills to add the
> needed changes to these tools, so they can finally mature and accommodate
> more real world scenarios that are out there.
>
> At that point Linux m68k broke their own ABI for no reason, but because
> someone couldn't wait until the necessary work was done, instead of
> hacking problems around.

Jeff
