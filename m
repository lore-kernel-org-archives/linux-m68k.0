Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8219C433FE
	for <linux-m68k@archiver.kernel.org>; Fri, 11 Feb 2022 21:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiBKV3o (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 11 Feb 2022 16:29:44 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352860AbiBKV3n (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 11 Feb 2022 16:29:43 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E85BC62
        for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Feb 2022 13:29:41 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id cf2so18277940edb.9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Feb 2022 13:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XFzCG6U+gQcN35bNR5ygZp7My/pmsXpJOFlN4wA8faE=;
        b=Op5mHfi4lkpgsAXFUIEvOb892Ki9UfRvx6Wny8c8GnjgwctkidFgQ18OXWJf376jCc
         BL/WKzyG/HlMvQ5Fg9rMrnYrcCvA8WOcTMUhjWAiGuoPntTEWvfcefuEHsgqJwwQX7cW
         NOiWSj++f2uRrGtaz3ZiLzt4iZqukzsD9VZjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XFzCG6U+gQcN35bNR5ygZp7My/pmsXpJOFlN4wA8faE=;
        b=F/vDytcScGbqgrPBBMjuQ8zP4DT47ccdhp8pVqIBBJ59alRlULUlFeB3bh5CLTdAwJ
         406EINEAExDr3a5vVoWAGExh7VrPGom5tz5tmwdaFYTeSBYTYk4wcxhLMEcARznerCCg
         tVd5WTri0uDv6CxDkC13ad7cXNPqBgAYRu/RvC/zML+aNapW0PgF9SuGQEvPrIUEN2JS
         m4w0lRpLwG+i/Y8dmj9cloWN1ITfX9Tu2PoZpZKVLp2CUhk39Jwy/cIJfxHwGAxcHRVK
         vsF5W3a4m/R7j2pptb7sgOA1DyUuogXB3bYoiKppTC3q0yBGjwvvKoR8Ty+wbKPVfFRj
         JIDw==
X-Gm-Message-State: AOAM532hF93pxTUuXYGI70Qqyg1rpXYAqsPNl//sj+ZpAxKFdOkH/8s4
        IPvmKw1LfoTSFrK0skCj7AWIFpD5WdIuHbv7ojM=
X-Google-Smtp-Source: ABdhPJxuRAL2nlrDuVi1uGO/SdRl+sZyLn+elGlq3uRHUiQaIojbSVEWMrwuYqF7eYbd9hTRMh1pnw==
X-Received: by 2002:a05:6402:7c9:: with SMTP id u9mr3968751edy.53.1644614979445;
        Fri, 11 Feb 2022 13:29:39 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id b7sm8967791edr.12.2022.02.11.13.29.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 13:29:38 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id o24so14623794wro.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Feb 2022 13:29:37 -0800 (PST)
X-Received: by 2002:a05:6000:1885:: with SMTP id a5mr2667962wri.193.1644614977325;
 Fri, 11 Feb 2022 13:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20220211210757.612595-1-Jason@zx2c4.com>
In-Reply-To: <20220211210757.612595-1-Jason@zx2c4.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 11 Feb 2022 13:29:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh+2jokbr4tpHA=ExebWKr=qp9RJ_uFrG2gYG4ChAjitg@mail.gmail.com>
Message-ID: <CAHk-=wh+2jokbr4tpHA=ExebWKr=qp9RJ_uFrG2gYG4ChAjitg@mail.gmail.com>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Eric Biggers <ebiggers@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Lennart Poettering <mzxreary@0pointer.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Feb 11, 2022 at 1:08 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Maybe. And this is why this is a request for grumbles patch: the Linus
> Jitter Dance relies on random_get_entropy() returning a cycle counter
> value.

Yeah.

I think this patch is fine for architectures that do have that cycle
counter value.

Considering that the jitter thing has been there for 2.5 years by now,
and nobody has really complained about it (*), I think we can call
that thing a success. And on those architectures where
try_to_generate_entropy() works, removing the code that then does that
GRND_INSECURE makes sense. We just don't have any such case any more.

BUT.

When try_to_generate_entropy() doesn't work, I think you now removed
the possible fallback for user space to say "yeah, just give me best
effort". And you might re-introduce a deadlock as a result.

Those systems are arguably broken from a randomness standpoint - what
the h*ll are you supposed to do if there's nothing generating entropy
- but broken or not, I suspect they still exists. Those horrendous
MIPS things were quite common in embedded networking (routers, access
points - places that *should* care)

Do I have a constructive suggestion for those broken platforms? No, I
don't. That arguably is the reason for GRND_INSECURE existing, and the
reason to keep it around.

Long story short: I like your patch, but I worry that it would cause
problems on broken platforms.

And almost nobody tests those broken platforms: even people who build
new kernels for those embedded networking things probably end up using
said kernels with an existing user space setup - where people have
some existing saved source of pseudo-entropy. So they might not ever
even trigger the "first boot problem" that tends to be the worst case.

I'd be willing to apply such a thing anyway - at some point "worry
about broken platforms" ends up being too weak an excuse not to just
apply it - but I'd like to hear more of a reason for this
simplification. If it's just "slight cleanup", maybe we should just
keep the stupid stuff around as a "doesn't hurt good platforms, might
help broken ones".

               Linus

(*) Honestly, I think all the complaints would have been from the
theoretical posers that don't have any practical suggestions anyway
