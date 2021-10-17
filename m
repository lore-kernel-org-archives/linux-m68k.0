Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6134CC433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Oct 2021 19:39:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 373F260FED
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Oct 2021 19:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242728AbhJQTlS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 17 Oct 2021 15:41:18 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:40185 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242711AbhJQTlR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 17 Oct 2021 15:41:17 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N6Kl7-1mnTQ80YIL-016iKG for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Oct
 2021 21:39:05 +0200
Received: by mail-wr1-f50.google.com with SMTP id r18so37234295wrg.6
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Oct 2021 12:39:05 -0700 (PDT)
X-Gm-Message-State: AOAM530tih6GPbU3gxrQ9GjhsfTCjCpJGse4g1Q6M6Ph16j/b1q+ag4R
        uEzAXaoE4s68jomS30KL32AKS0vXzL6KsXfk5Pg=
X-Google-Smtp-Source: ABdhPJz5+Je/J0Is5f2zcgCsNreFzyPUIKhSX6FNRyl+A6AdSx8zttNwbnS/mVxRD1V43yOgwRrFUisC7cXMxa19sXc=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr30368956wra.428.1634499544806;
 Sun, 17 Oct 2021 12:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211017174905.18943-1-rdunlap@infradead.org> <CAK8P3a3XDY5gMUA3h3tVmQuxSHn_J3qOw_rDurzBx-KFdGhCKA@mail.gmail.com>
 <8aad5fd2-6850-800a-3c56-199bb5d4f4ae@infradead.org> <CAK8P3a21-mu=eN7qu+1C11Rwp_S3T0iJ+ronmMGyeYcw=Ym61A@mail.gmail.com>
 <fec67616-f1d0-08da-f393-489233210cbd@infradead.org>
In-Reply-To: <fec67616-f1d0-08da-f393-489233210cbd@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 17 Oct 2021 21:38:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2PuTe2h49n72Z-GHnn_wyq-naPm55LJJG+OnCdSLz5tw@mail.gmail.com>
Message-ID: <CAK8P3a2PuTe2h49n72Z-GHnn_wyq-naPm55LJJG+OnCdSLz5tw@mail.gmail.com>
Subject: Re: [PATCH] asm-generic: bug.h: add unreachable() in BUG() for
 CONFIG_BUG not set
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ycrY+VS22MsH77Dg6//CFmhTIEbFmDwSkthaxQYw/VS6GBAgItZ
 LiFHh5aJCjWRny0Fv+xBGVTJ/A6fCaRZXFNxKlM+KIN9ZRvmm42fj/o+tZWmbjisVIzak4V
 GCwhtDPt9Uw7yuBDkGCh1foZCz7XVWHPOak5ghnBgcKV3Y1ww1FYaCaYfK5GIdIbQdsSZgB
 OEiUKS15R1CKsbiR5tP1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dwD+jbA1qjM=:I6WNgvtQUhrwDOQTzej3Do
 iV0geczrQaclQRXVFdf1Xf5ofTLFCZVuNA0tMzzl71+JahIlHH9ga49gltHMna7g82LyReGGZ
 SDjCRANbL19UPBCjtnicHmM4CzKT23P9lt7L0cVh00hLr/gMGl06hMwTO5fF5EkdecrBJ2tmz
 YjSBpfM3g53B3+czVLmFQX6yoJk7isbTwsRoiESeiDUA0a2MV/L+8J3n3WyfEuN8ojOWeu3Go
 BaSFpxPcDrrMYJ0u4zfhH61bExWxCTDAG9i6g8FXL3TsJgVOS8JlOBVXgsGdgpN+MUAQqIcOf
 rtWLPHdkck/izhw5e1649pc7aVyP0OpFfuHUaeltsr/RMGSqGPvTZBCb+wL8EtD1CA7v8/wud
 v4ApRTjWOwRRvnVVTDLanDmWHXGYCgkC0NdcqbgtyXVRGFGpRokNvRvdFSuIDNHQcWGs+2t0K
 3HOz12QqmONJD0ibHDSpguwkp9N/d2TcQzXki1MdhFzZnnLDUGkH/ffvFV9PZcbTyyNEs8/Sb
 rh9mBiMeT0Bh+JQlqs0XfDLGQbo8rTqSI6rezeye4OEPgVC/ASYht4Ko4fcpUj9ojZfzHk1Xq
 aUVFzgW4aCi0zh/W9VVP5bNpQw54FFTArq7IoxPDVi/rYqgOM9Xr/6VzvU4ruXVDbNihjiE9B
 z4XSW+7XTPLJBMek0TUecNXdhAEfa2FIQofavD3RxD0mbVsQLMEO5UHEAsKAPH3TeK+4rzPE6
 eKoaSEbVr2wmvwVMskWNjGwA9yq9C5RD/tCq+XsrQEHZ/cUiDQSZ7Vrcebmxbj2zKGGkaSsl0
 MBEXtnA6C6eihQFj1FfoDZkU7LVGPEsVjUNzFUezHvKGJyslrygYxY6xfRDNJVLx0TEWi3eJx
 Nle/7wgVwBTH07yjtBaQ==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Oct 17, 2021 at 9:27 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 10/17/21 12:24 PM, Arnd Bergmann wrote:
> > On Sun, Oct 17, 2021 at 9:17 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >> On 10/17/21 12:09 PM, Arnd Bergmann wrote:
> >>> On Sun, Oct 17, 2021 at 7:49 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >>> Did you see any other issues like this one on m68k, or the
> >>> same one on another architecture?
> >>
> >> No and no.
> >
> > Ok, maybe before we waste too much time on it, just add an extra
> > return statement to afs_dir_set_page_dirty()?
>
> I think that patch has already been rejected a few times...

Indeed, this is one I had looked at before:

https://lore.kernel.org/all/CAK8P3a3L6B9HXsOXSu9_c6pz1kN91Vig6EPsetLuYVW=M72XaQ@mail.gmail.com/

It seems that this version:

+#define BUG() do {                                             \
+               do {} while (1);                                \
+               unreachable();                                  \
+       } while (0)

ended up being one that didn't see any objections.

        Arnd
