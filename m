Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A97C28CF5
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Jan 2022 12:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241238AbiAZM0E (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jan 2022 07:26:04 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:32791 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241220AbiAZM0E (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jan 2022 07:26:04 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MfpjF-1mb8Ud2xVx-00gIji for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan
 2022 13:26:02 +0100
Received: by mail-oi1-f177.google.com with SMTP id s127so37158346oig.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan 2022 04:26:02 -0800 (PST)
X-Gm-Message-State: AOAM5310LKdSUUSUvFYIutP7hU/JaYvpNwC1aiCk5+ufhq3q1tkS8TfS
        IgPlpvlJ1HVCFtriCgnzBKdx6vkql+M9GE0N7EA=
X-Google-Smtp-Source: ABdhPJzjEjqhZoVQ+aruRja21IFaCnlBOb64TzKBhR5d9+tIFUiNbT7Go647+tOZs0+HEX4+aquiUBzLNiHHkx3x2jU=
X-Received: by 2002:a05:6808:2312:: with SMTP id bn18mr3658260oib.102.1643199961403;
 Wed, 26 Jan 2022 04:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20220125073137.1.83124@7e6451f583e7> <CAMuHMdVYhwpP0vSK4LT+50ZqB9opD8gcm-2aor8wAc49=GR+-w@mail.gmail.com>
 <CAAH8bW93TUpyn8GaZfB83pu8Kvrsz9PHPCBHcG3+UStU7v=s=A@mail.gmail.com>
 <31219CC3-CEE4-4CFA-A416-B98F2115A527@chromium.org> <CAMuHMdUwd=2KGk9JkZPSZsvAWG4wddxZFxd5bFfbrtZi3JynQA@mail.gmail.com>
In-Reply-To: <CAMuHMdUwd=2KGk9JkZPSZsvAWG4wddxZFxd5bFfbrtZi3JynQA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 26 Jan 2022 13:25:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0bLTWc-UG4eX14CQ=hiXms+wHx2VvaovXA-ZUQYAA1fA@mail.gmail.com>
Message-ID: <CAK8P3a0bLTWc-UG4eX14CQ=hiXms+wHx2VvaovXA-ZUQYAA1fA@mail.gmail.com>
Subject: Re: kisskb: FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Tue Jan 25, 18:24
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Yury Norov <yury.norov@gmail.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:idjK/lYALoTcUQlalf6f0k1F7EfglYXTxVMo8KQP2d6HB6m0EsQ
 rJsPViXYM7fWcQzTETmZO4MCHm5MoBW+DqYzR694x0L3RlpWWhRYrwz2I6NOmxBm4RYaqfr
 7ULBjTICDHE9Zw5djt/1Yu1SGbEYfGrTIwZxS6PFxxKovxyASy0h3HnozNnj+aSlZDZPZwk
 LDgp6R5sQ4FWVPBuXkXrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6WVIsI0vDQw=:kIspp/z0E8ZWvCGXLuqj9t
 l+7k5ybp18Id5cI6OsoPEmX+8ViDxUqwO8W2jNHHMWL2QCKu7qiD3SACkYWdUsG9b2f6ZJhtO
 dTu0pK1RxQUoMJm4VYrKWh6cdavg/vmbW6yRiuGYmBNUtg+WlZFGMLmnYyIcYvp6BVi2c6Rpu
 RkVnpsx4j6QkvYhHa+YtiveQ1Wv+IW6O1i3g2B04GHBgTSz2aUZChtGdohTl96jiSyee3fo86
 GKx+xL4hkNN2hwpxobCVj2LbLinZCALhDYG1nbpkuZCBe0UISamx0gzs6V2bYUM9sAXTKanH9
 uLL+z9wlSFvR3lwyMZqOr1x2Y6Uw+RZsfaMQWyWyAJWgauYPSxwEdl4sQQmS4fNC86bkPl8TB
 0Ar8llcFCcw9n4rYNUFCSJUi/KgsVAFKMl4M3sjan6fHrSork3tSDW9eCfoan78XzdcLox224
 goQlgcfFxjTvTSMX6DNAnQDTpr2vTeLzTuZCEtO2pjniUwvNRZkDoZtAdZzwlsEuM3kT92idD
 JeHDLT2dkMIV5rgVpTd6DdqsEgKIgeG0YsEsRIR9Y8m96cwYN69yGRLXgSu65DkK30iCaSCCS
 c5Mr2IcLkDK2B39UQGkUlopUbgvt302KMsCAaQLvKwOckaD95awAyBHChDA9dapc5U966HGsr
 ta6P6Od2xUZOmng1WrW0qiL/qrd705cKMnP5KYlm11I8wr60++UkrX1j62BubJPkezbk=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jan 26, 2022 at 10:16 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Jan 26, 2022 at 9:54 AM Kees Cook <keescook@chromium.org> wrote:
> > >>
> > >> The code that causes this is drivers/net/ipa/ipa_mem.c:ipa_mem_valid():
> > >>
> > >>         DECLARE_BITMAP(regions, IPA_MEM_COUNT) = { };
> > >>         ...
> > >>         for_each_clear_bit(mem_id, regions, IPA_MEM_COUNT) {
> > >>                 if (ipa_mem_id_required(ipa, mem_id))
> > >>                         dev_err(dev, "required memory region %u missing\n",
> > >>                                 mem_id);
> > >>         }
> > >>
> > >> This only happens with gcc-8, not with gcc-9, so it might be a
> > >> compiler bug. I don't see anything wrong with c:ipa_mem_valid()
> > >> nor with m68k's find_first_zero_bit().
> > >
> > >I don't see any problems about how this code uses bitmap API.
> > >The m68k version of find_first_zero_bit() looks correct as well.
> >
> > The trouble is with "enum ipa_mem_id mem_id;" which is an int, and the bitmap API requires unsigned long. I tried to fix this[1] at the source, but the maintainers want each[2] call site to fix it instead. :(
>
> Sorry, I don't get it. "mem_id" is not used as the bitmap, "regions" is,
> and the latter has the correct type?

I think you are right here, and even if it was an array of 'unsigned
int' instead
of 'unsigned long', this should not change the size of the object on
a 32-bit architecture.

I ran the preprocessed code through cvise[1], bisecting for a reduced
test case that fails on gcc-8 but succeeds on gcc-9. The reduced
case is still fairly complex, and it appears to only happen in the
presence of an inline asm. Narrowing down the compiler versions shows
that anything after gcc-9.2 does not warn, but 9.1 and earlier versions do,
which is further indication that  it was probably a false-positive that got
fixed in gcc.

     Arnd

[1] https://github.com/marxin/cvise
[2] https://www.godbolt.org/z/xMr9v1nPT
