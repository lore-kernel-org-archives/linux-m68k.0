Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8786C433F5
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Mar 2022 20:38:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbiCIUjU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Mar 2022 15:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235266AbiCIUjS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 9 Mar 2022 15:39:18 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2EB5373B
        for <linux-m68k@lists.linux-m68k.org>; Wed,  9 Mar 2022 12:38:19 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 25so4904301ljv.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Mar 2022 12:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/yeinogDeuOBTA+RgXs0VaNGe2cwXag06ouy/qbMCCs=;
        b=eAKctOojBAW5vDxW9VxH+BGy31s6He186/PWHaAwIkHLzVegn5dhGdivM4jeg72UAe
         GkML1gmaFxGvszjifGcmZzmlorfKxzX8XLPWQ94CkkGCi+OMrgGduicTJGG3qmRhfXQA
         JD8i+KL7gGnY5EOdq35cteeedEM2EWl62TU3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/yeinogDeuOBTA+RgXs0VaNGe2cwXag06ouy/qbMCCs=;
        b=g42wCJ4sdx/hqd6RxYIHmGdggL9A7ufWMkj+vPpZOlTikyNxViBEBo4LvpcsPfdWoa
         tn8obqGDoLXA69WubhgNqgX/EFkWlLq/Ul/UVF3OxiYOtmHWvFRTjY3AFQdRDlZGHLPw
         7t/cuPxPbBikNZL6m6miyIoegPhJZ/yXDOdD8wv8YrY1Geol8pO1FmP0NtMOjDrWbNp1
         w8X0SCceEw7Bq4OznrlnxxMSMCYOZn0PWJhw2byPMZHwv644erz5rQTOqUKe97BPbAEd
         aqAGBp9A/nnNhCpUE4mZ8qcvicrpcW4ea0siSe1Ka2P0if4L/Rg8R9fQs1h6fZdyjl2O
         55ZA==
X-Gm-Message-State: AOAM533b2m+N9jgMWfhdK1GWJdaLpfWJlvrhQy8fmM4qmmyqKQ4wGrxA
        WIc8QGMVxApL2pY6zpzHPfrUEBhmcYV2CADht9o=
X-Google-Smtp-Source: ABdhPJzWTyUxzYrZ/TyYBSZUMYBmhVEu0OsFfZQPwp+sIAFaMhgt9hdKNflBGpWHPiUC2aAzsD5aQQ==
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id u16-20020a2e9b10000000b00247f28cffd3mr887222lji.152.1646858297635;
        Wed, 09 Mar 2022 12:38:17 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id f24-20020ac251b8000000b004483f49d4bdsm571289lfk.99.2022.03.09.12.38.11
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 12:38:11 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id u7so4876548ljk.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Mar 2022 12:38:11 -0800 (PST)
X-Received: by 2002:a2e:9904:0:b0:247:ec95:fdee with SMTP id
 v4-20020a2e9904000000b00247ec95fdeemr823721lji.291.1646858290905; Wed, 09 Mar
 2022 12:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20220113160115.5375-1-bp@alien8.de> <YeBzxuO0wLn/B2Ew@mit.edu>
 <YeCuNapJLK4M5sat@zn.tnic> <CAMuHMdUbTNNr16YY1TFe=-uRLjg6yGzgw_RqtAFpyhnOMM5Pvw@mail.gmail.com>
 <YeHLIDsjGB944GSP@zn.tnic> <CAMuHMdUBr+gpF6Z5nPadjHFYJwgGd+LGoNTV=Sxty+yaY5EWxg@mail.gmail.com>
 <YeHQmbMYyy92AbBp@zn.tnic> <YeKyBP5rac8sVvWw@zn.tnic> <b40d1377-51d5-4ba3-ab3f-b40626c229ad@physik.fu-berlin.de>
 <87ilsmdhb5.fsf_-_@email.froward.int.ebiederm.org>
In-Reply-To: <87ilsmdhb5.fsf_-_@email.froward.int.ebiederm.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 9 Mar 2022 12:37:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg+TYsns5JvNds6BVG7ezdg8uM_z9m8uJBcRDANdd7csw@mail.gmail.com>
Message-ID: <CAHk-=wg+TYsns5JvNds6BVG7ezdg8uM_z9m8uJBcRDANdd7csw@mail.gmail.com>
Subject: Re: [PATCH] a.out: Stop building a.out/osf1 support on alpha and m68k
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Kees Cook <keescook@chromium.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Borislav Petkov <bp@alien8.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Theodore Ts'o" <tytso@mit.edu>, X86 ML <x86@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Matt Turner <mattst88@gmail.com>,
        =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>,
        Michael Cree <mcree@orcon.net.nz>,
        linux-arch <linux-arch@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Mar 9, 2022 at 12:04 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Let's see if anyone cares about a.out support on the last two
> architectures that build it, by disabling the build of the support in
> Kconfig.

Oh, I'm pretty sure we can't do this.

a.out on alpha is afaik still very much alive - well, as alive as
anything alpha is - although it's called "ECOFF".

It's the native Tru64 (aka "DEC OSF/1", aka "Digital UNIX") format, so
it's more than some old legacy Linux thing.

We still call it "a.out", but the history is that a.out with some
extensions became COFF, which then became ECOFF, so our a.out code
really covers the whole gamut.

Yeah, we don't actually parse any of the extensions that make COFF
what it is, or ECOFF what _it_ is, but the a.out loader ends up
working "well enough" for simple binaries by using ugly code like

  #define N_TXTOFF(x) \
    ((long) N_MAGIC(x) == ZMAGIC ? 0 : \
     (sizeof(struct exec) + (x).fh.f_nscns*SCNHSZ + SCNROUND - 1) &
~(SCNROUND - 1))

which jumps over all the section headers.

But sure, it would be interesting to know if any alpha people care - I
just have this suspicion that we can't drop it that easily because of
the non-Linux legacy.

                   Linus
