Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAC6C54EED
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 16:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237585AbjA3QeM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 11:34:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbjA3QeK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 11:34:10 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6047E3B66A
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 08:34:08 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id x17so10549140qto.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 08:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sO/BCKBcW+oUYD0i16ps1UezrHWq98Qf5GASk/3ASc0=;
        b=pXb7XvokXH5JKaGAUARVYzx+RzQxi5qrVYUI5pTVa3g2UOmtWBplcMi/zBHPRGw3K4
         qQRVg4BDwXMEjQP9NAUmLCLEaHhAWT1mmR7Vuv9cX+5ACMwnIB6WPWklzDzQQsWYatsi
         +GpXAjSWsipKqRWiDFLk1wmLojPOE1peSc2E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO/BCKBcW+oUYD0i16ps1UezrHWq98Qf5GASk/3ASc0=;
        b=1THTxcdkoms7YcrcZHQAb4plnkhyMSxoj//X6nD0SypPED1NSWcb7k/MpuUpWNEMpf
         toygUvO+5SJzOWbikFsmSUDRQ4qKWcTpgbjb1tUDfIzc3IubhiZdl21Dd1m83TLPXV9E
         DHXp7CnKkoel3SeL3+Ll/JpRcuwK+aM0jdpnl+YzrSI0HvjS0tDN/pTcDeDJM5W2VcVU
         Thl0Sa3K/i18FhKPy4N5tjsEasaV1UumtfWPk/ch0QZwkLC6DK/Zlnjxge/eDj0X/2fS
         BiTri01i6M2d+gE28xo2jdQAHWPbdd2irS9Bby8PWcB/XSA/Hnml04Nu/q2dTom6WGUF
         d5tQ==
X-Gm-Message-State: AO0yUKWxqL74laguReiTz0XLRdEoBGiYG8VpBSKcLE1DR73q2kJKAuZJ
        716rSjU0PUyi9LwLR7oHPTwAmw==
X-Google-Smtp-Source: AK7set9FdYP4QFge4VVnJ3hNfygcrOhoX7vRK++3KRMZ89EUmc5IFWJfqRtLT21+LhfjVWE7wfaKxQ==
X-Received: by 2002:a05:622a:cd:b0:3b8:2c34:b9f2 with SMTP id p13-20020a05622a00cd00b003b82c34b9f2mr19396820qtw.63.1675096447403;
        Mon, 30 Jan 2023 08:34:07 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-31da-0362-f50e-b4ac.res6.spectrum.com. [2603:6081:7b00:6400:31da:362:f50e:b4ac])
        by smtp.gmail.com with ESMTPSA id k14-20020ac8604e000000b003ab7aee56a0sm8197258qtm.39.2023.01.30.08.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 08:34:06 -0800 (PST)
Date:   Mon, 30 Jan 2023 11:34:04 -0500
From:   Tom Rini <trini@konsulko.com>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Angelo Dureghello <angelo.dureghello@timesys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Subject: Re: U-Boot support for M68K removal
Message-ID: <Y9fxfNDNXXyJQ0Dn@bill-the-cat>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
 <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat>
 <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+D2WEB2+7/XpB7cV"
Content-Disposition: inline
In-Reply-To: <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
X-Clacks-Overhead: GNU Terry Pratchett
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--+D2WEB2+7/XpB7cV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 05:22:17PM +0100, John Paul Adrian Glaubitz wrote:
> Hi!
>=20
> On Mon, 2023-01-30 at 11:14 -0500, Tom Rini wrote:
> > On Mon, Jan 30, 2023 at 01:49:11PM +0100, Angelo Dureghello wrote:
> >=20
> > > Hi Tom and all,
> > >=20
> > > really have to apologize, had hard times these last 2 years
> > > and couldn't follow at all the activity, i am totally culprit
> > > and responsible.
> > >=20
> > > Now i can jump back on following, if there is any sense
> > > in keeping m68k/coldfire.
> > > Let me know, if ok i start back checking all old patches
> > > from tonight. Also, will have to update my email and rebase
> > > to master.
> >=20
> > I'm glad you're back. I think the first thing to do would be to
> > confirm
> > that U-Boot still works on at least some supported board, then
> > confirming you can still access
> > https://source.denx.de/u-boot/custodians/u-boot-coldfire
> >=20
>=20
> FWIW, m68k is still a very actively maintained architecture in the
> Linux kernel and userland with even LLVM and Rust having recently
> added support for m68k.
>=20
> I also own a Coldfire board myself (not sure which one without
> looking), so I can offer to test U-Boot patches in the future.

That's great to hear. While I started my life on m68k machines, I never
did get Linux up on one. Do the coldfire platforms you have run U-Boot
today? If so, are they already supported upstream? One of my biggest
concerns about the architecture, in U-Boot, is that I've just not heard
of anyone using it in quite some time, and we don't have any emulated
platforms either (can it be done in QEMU? We have other plaforms in CI
via QEMU) so I worry it's not working.

--=20
Tom

--+D2WEB2+7/XpB7cV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPX8XwACgkQFHw5/5Y0
tyyx5gwAlaHfL/uMF6SYvDdIG6i2ij/zzCchxGYXx0k6qHsRZ/57qJAYSANG11R1
oXUrIWMzCkey/chO1rtCTi7ZVz854RTq2TfSwAtF/3niQBGBxQmCERsBFmqck8pM
5R05Bnkzofsq3oRSsYHV87E27wJr2hIi6V5ie6ovy6U6HXhxcUthps09J6zP3ZIS
8FbmDJu1R47zTG52DbwyGKAL21sbNfhgoZl7Vxal8m3IdNVeiLV04ZNXppmV7+re
ey+6A7LcaUP7J+pXK5wgSoCUDMajWfIRN2jVLTdIwhpV6LoL2RxGGXHQDkVYMDLO
SH03wifR+IHhj6XowCUTpCIrDDllvCmvwhHhi4Y2nF2jCs622xZUjTSb9KmumZTW
EB3UprlsBIXZSZCATuDymURhH7nXIq1VHiAWiypLSaLm3L2pTPhM190sWkCtecwZ
Gm/CSUhYlXWt/b7TkuWlL57vuOdIdXMAUosy8Pa8iMFAGQEhMBIAtlIFk63ir5At
ndIP5HQM
=7ceq
-----END PGP SIGNATURE-----

--+D2WEB2+7/XpB7cV--
