Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AC5C00140
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Jul 2022 20:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239848AbiGZUUo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Jul 2022 16:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiGZUUn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Jul 2022 16:20:43 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B35227B16
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Jul 2022 13:20:42 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bp15so28132661ejb.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Jul 2022 13:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4CN7dQvXWwaJGy07n6QHMuaIcTWf0n/HGar+msGxrYk=;
        b=FGJZe+ZwP3lgA0wU4CgENEV4uAjTArTRwFrNXA7DgfkgNXGLMfVrAiFenpM+aZxYi3
         oCzqZUMRn0IH1rFc2iDgLG+UKKXNBuUxdaPOqpCCmVa594FKN8Q6xS3xQ5n1poatxD3g
         x1xRQ4sgvnKIpYMJNA1ZY6TFctKZX6hDMIklw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4CN7dQvXWwaJGy07n6QHMuaIcTWf0n/HGar+msGxrYk=;
        b=uZQClpPdtUEb0qjQLbcw+GnqBkS1Z+hv71N/iR2PAC03ChznBzPAXK1jJhX9A2fJXt
         /iHFk8KnXIRD0AKZ3hd+ZPVph3sDZEwf89J9c3gmRMTJLhY3xyUadHdrntTy5Q0ZIS7E
         E1ohevWnEl0N2pyi3z6Dgt/cG6/8A2YNg7KrpMgW9crTNLIZgOp4+Vi3lPbey7EygDYb
         crJMcgHWgJzdGpPnIIV/YyHhI/lHH0FUFQvWpDOnnMZ/4m3Tt0K/ueHiobLyKuBvlgc5
         LE5PceYfR70/3j0Cg07aQCUDb+h+PTLhrMUvvXcAVOq2MSOgQxhSTpK3i+yzJin8O644
         1a9A==
X-Gm-Message-State: AJIora999PVVbs3XnWR+RhorNFR2yNJTcL3CDU/PwdYaaH7xeeX1Q5EV
        RpgRp8ThxaLbVi32VctGeuArxKS5TGwPlQjL
X-Google-Smtp-Source: AGRyM1tvm7hfne6EDgh5VTS4EeHRpJ17zE7u8UpmTwwQwA4UBUOS5V2RlEKlinyfzJv0qdAa01ZQxQ==
X-Received: by 2002:a17:907:a218:b0:72b:8aae:3f84 with SMTP id qp24-20020a170907a21800b0072b8aae3f84mr15107023ejc.367.1658866840459;
        Tue, 26 Jul 2022 13:20:40 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id h14-20020aa7de0e000000b0043a7404314csm9014111edv.8.2022.07.26.13.20.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 13:20:39 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id k11so21167128wrx.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Jul 2022 13:20:39 -0700 (PDT)
X-Received: by 2002:a05:6000:1a88:b0:21d:aa97:cb16 with SMTP id
 f8-20020a0560001a8800b0021daa97cb16mr12127299wry.97.1658866839283; Tue, 26
 Jul 2022 13:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiWwDYxNhnStS0e+p-NTFAQSHvab=2-8LwxunCVuY5-2A@mail.gmail.com>
 <20220725161141.GA1306881@roeck-us.net> <CAHk-=whtGUwJwHUSNsXd4g7cok=n0Zwje7nACp8skh1fa2NtJA@mail.gmail.com>
 <YuAm5h1B6bsrR/9q@fedora> <CAHk-=wgYpJTMMxmfbpqc=JVtSK0Zj4b15G=AvEYk6vPNySDSsA@mail.gmail.com>
 <YuAv+lV324G7pmlk@yury-laptop> <CAHk-=wg2-j8zocUjurAeg_bimNz7C5h5HDEXKK6PxDmR+DaHRg@mail.gmail.com>
 <YuBEIiLL1xZVyEFl@shell.armlinux.org.uk>
In-Reply-To: <YuBEIiLL1xZVyEFl@shell.armlinux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 26 Jul 2022 13:20:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpYLLoi1m0VRfVoyzGgmMiNwBhQ0XXG0VWwjskcz5Cug@mail.gmail.com>
Message-ID: <CAHk-=wjpYLLoi1m0VRfVoyzGgmMiNwBhQ0XXG0VWwjskcz5Cug@mail.gmail.com>
Subject: Re: Linux 5.19-rc8
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Yury Norov <yury.norov@gmail.com>, Dennis Zhou <dennis@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jul 26, 2022 at 12:44 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Overall, I would say it's pretty similar (some generic perform
> marginally better, some native perform marginally better) with the
> exception of find_first_bit() being much better with the generic
> implementation, but find_next_zero_bit() being noticably worse.

The generic _find_first_bit() code is actually sane and simple. It
loops over words until it finds a non-zero one, and then does trivial
calculations on that last word.

That explains why the generic code does so much better than your byte-wise asm.

In contrast, the generic _find_next_bit() I find almost offensively
silly - which in turn explains why your byte-wide asm does better.

I think the generic _find_next_bit() should actually do what the m68k
find_next_bit code does: handle the first special word itself, and
then just call find_first_bit() on the rest of it.

And it should *not* try to handle the dynamic "bswap and/or bit sense
invert" thing at all. That should be just four different (trivial)
cases for the first word.

             Linus
