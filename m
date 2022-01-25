Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F061BC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jan 2022 12:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355903AbiAYMvu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jan 2022 07:51:50 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:46749 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457394AbiAYMti (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jan 2022 07:49:38 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N95qT-1mEy3J2ocB-016BU4 for <linux-m68k@lists.linux-m68k.org>; Tue, 25
 Jan 2022 13:49:30 +0100
Received: by mail-wr1-f42.google.com with SMTP id w11so7527486wra.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jan 2022 04:49:30 -0800 (PST)
X-Gm-Message-State: AOAM5315SDy2SHZcCONMFpf8EXm3NIZMBZc+RcSIaipxqWK5gH0e5TlY
        3L6unPZyIZphCMaHqL/SzbFvlcyXjz7SOntHY+4=
X-Google-Smtp-Source: ABdhPJwQyRjnqkte/w6LuEz/PgKqyset8mRi8LGcNH/Fw+cF+Zcm5LVpOY8735bx7VtBAM3uI0s1L5n7mEaAKrvHJTw=
X-Received: by 2002:adf:fd05:: with SMTP id e5mr18127892wrr.192.1643114970282;
 Tue, 25 Jan 2022 04:49:30 -0800 (PST)
MIME-Version: 1.0
References: <20220125073137.1.83124@7e6451f583e7> <CAMuHMdVYhwpP0vSK4LT+50ZqB9opD8gcm-2aor8wAc49=GR+-w@mail.gmail.com>
In-Reply-To: <CAMuHMdVYhwpP0vSK4LT+50ZqB9opD8gcm-2aor8wAc49=GR+-w@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 25 Jan 2022 13:49:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Qik6A9ts0J_oXP-LMbqA0-kvZ4E9=bgLx5spxvLuC8w@mail.gmail.com>
Message-ID: <CAK8P3a2Qik6A9ts0J_oXP-LMbqA0-kvZ4E9=bgLx5spxvLuC8w@mail.gmail.com>
Subject: Re: kisskb: FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Tue Jan 25, 18:24
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Yury Norov <yury.norov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8VHnNcRO+iDhOttMY3C9A+p5m8iXNmaSkrxlTysqiVXOu3IiXz1
 LxnFBC4ae/krcovHP5Nxqg0u1iG8L22yGgs5QqNguRRCpDtp++kdmtItzAePff6anysiIS3
 t7TjMbrbwoL7aEaoRf8ZKBKgiZhceqZlP+C4h0vBda9OdqOly4A2JOLyn9LPNnpYZ69zKuE
 IQgSJgN5fNptkcBzNhSLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7rfo3ZJlfRE=:sCZdFyvuXbpTSSHhRr5K8j
 jNOlpgfLJCp9aEv3w2XlGeG703lMjd2Smz+HzYkWn6GNDy1PXd55agrVvmbzFVSrXA4KhoL1I
 33GVp8Pj4S7MFl+ThJ2OqRxCyv07aVt9EvErVflQ5U32VlGM7piwj+ZDPfW1Io5GHRJ5EzbRZ
 LyiTDR8k7Hb2VJtVekiBR1BuNr7bNPIs1qF4tI1tjZRetHkrTi8tdFPPIts5Hv1pRvr5VTCoi
 l2omeBuACx/KYfHHv7YpyH6CX79GkCyTFKnY+nOYMFNrTBqmuUZz0dp4VvsUztJlxKcoovAIO
 E/Fft2/QOgsIgjaxwXho1cqppVZT06uf3rq9mcKfbPlXZ+k8jUsmt9BO2/4yKfGyEqioVabGN
 obuNWGJAoxEiXPaEpV4lUq6+qCiAh5XCF/0A/TFZzB2mZ972oMRoqzrdTMlZqPI87ks4Xz9LX
 9eKHqzvkcEsLE+q8P2ICaF2zsW9q/vApQZG3svk8ZtMr1TN0IJbj8mUTjxAFynnurw/JSfrg8
 tuSm/7PbxAAlB5W/K/ZI5oNofd3cjKTgMjSEyyGnFMF7HucfZtM0Hk2FBWukvgJP6eF9HybVj
 I/lD+sGwVCyboDE+KH51q6QilSvMYx3GiqTbUoNMX6q+iWe5Umuz9r2a5Q4qN9Rug6/gbKvFA
 xXheNRehMRl1NnpS/SUhNdEtBT1ZGDXIcRowyytkNXQ+OGn6pzvIfjlWL/5orHxdlbqs=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jan 25, 2022 at 9:47 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Tue, Jan 25, 2022 at 8:31 AM <noreply@ellerman.id.au> wrote:
> > FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Tue Jan 25, 18:24
> >
> > http://kisskb.ellerman.id.au/kisskb/buildresult/14688953/
> >
> > Commit:   Add linux-next specific files for 20220125
> >           d25ee88530253138d0b20d43511ca5acbda4e9f7
> > Compiler: m68k-linux-gcc (GCC) 8.1.0 / GNU ld (GNU Binutils) 2.30
> >
> > Possible errors
> > ---------------
> >
> > arch/m68k/include/asm/bitops.h:329:20: error: array subscript 2 is above array bounds of 'long unsigned int[1]' [-Werror=array-bounds]
> > cc1: all warnings being treated as errors
> > make[4]: *** [scripts/Makefile.build:289: drivers/net/ipa/ipa_mem.o] Error 1
> > make[3]: *** [scripts/Makefile.build:572: drivers/net/ipa] Error 2
> > make[2]: *** [scripts/Makefile.build:572: drivers/net] Error 2
> > make[1]: *** [Makefile:1965: drivers] Error 2
> > make: *** [Makefile:226: __sub-make] Error 2
> >
> > No warnings found in log.
>
> The code that causes this is drivers/net/ipa/ipa_mem.c:ipa_mem_valid():
>
>         DECLARE_BITMAP(regions, IPA_MEM_COUNT) = { };
>         ...
>         for_each_clear_bit(mem_id, regions, IPA_MEM_COUNT) {
>                 if (ipa_mem_id_required(ipa, mem_id))
>                         dev_err(dev, "required memory region %u missing\n",
>                                 mem_id);
>         }
>
> This only happens with gcc-8, not with gcc-9, so it might be a
> compiler bug. I don't see anything wrong with c:ipa_mem_valid()
> nor with m68k's find_first_zero_bit().

I've seen problems with warnings like this when gcc only partially
inlines one of the functions. Does it go away if you mark find_next_bit()
and find_first_bit() as __always_inline?

       Arnd
