Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE36FC636D3
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 22:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjA3WE7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 17:04:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjA3WEv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 17:04:51 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806C72F79F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 14:04:41 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id m26so11645477qtp.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C02woHUh44RrGPmLMOW2pFPkYS764K6xxrpUbrcHhaI=;
        b=JlPVv/ztLW436tEU2A5i2/hZ6SMgnUIWp0Xn/zCpIjlu5y5zlzdOfnbbs1IYZRcQTv
         JSqEEffdcPJsAePX3z8GVN7SW/8Sq7OneW8yIEAK4YL3GmCaK4kGJyq5Lj9hgd3e2TGJ
         sw8e7KcRnAa4FpYnEHogXwROidAqON+uHoYOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C02woHUh44RrGPmLMOW2pFPkYS764K6xxrpUbrcHhaI=;
        b=eVA1HssX9tBTnKYM96f1Hp2GZ+zZvyoNjiGYDBEfpF/TvFFUG2VK0IIbZutpM0aMBX
         a/sXFm2K4eclYCc1KBQDKfHI8hNc7RsgbjcjMM5sAfCXGR7sbgMIZHp08t6nIna04CK2
         sev260kTkvbnhKozVCDyH+waygPDnzP1ki6zLO2abJhaOe1WgCyEEQhckdWzodCNySQg
         J5740n5vyddji2G7/yugx1Kbshu+ilFWRsVGXDJLOIHIsnMpnXS7rP0wKCFK9+/WeL8/
         7i7Bh3bFC0UcJCCWOVInE4VJkrQGlYkVzuu/AA047GbCjH1CubKikSf2aY+iIlvbAf0J
         l9XQ==
X-Gm-Message-State: AO0yUKWAyU6to5TTlZvhL3KuSBzQqBbEjSPfCE1rmizbRaEkaHDN7P6G
        FDliu+aiV1jQwkzRgMk+VQMLvw==
X-Google-Smtp-Source: AK7set9t2w1SgEMMGLQKOQAi9Q5Dz1x+YpevXJ0STNjShCIpIIWFmjdKv34qudadPY4Mdb9lAT6tyw==
X-Received: by 2002:a05:622a:1887:b0:3b9:a63e:35c0 with SMTP id v7-20020a05622a188700b003b9a63e35c0mr1330092qtc.16.1675116280566;
        Mon, 30 Jan 2023 14:04:40 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-31da-0362-f50e-b4ac.res6.spectrum.com. [2603:6081:7b00:6400:31da:362:f50e:b4ac])
        by smtp.gmail.com with ESMTPSA id x12-20020a05620a14ac00b0071ddbe8fe23sm3608042qkj.24.2023.01.30.14.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 14:04:40 -0800 (PST)
Date:   Mon, 30 Jan 2023 17:04:38 -0500
From:   Tom Rini <trini@konsulko.com>
To:     Greg Ungerer <gerg@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Eero Tamminen <oak@helsinkinet.fi>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Subject: Re: U-Boot support for M68K removal
Message-ID: <Y9g+9k/8Hwk5ARv5@bill-the-cat>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
 <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat>
 <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <Y9fxfNDNXXyJQ0Dn@bill-the-cat>
 <6558aca3-63aa-c89c-93fc-a5afe48cbe78@helsinkinet.fi>
 <CAMuHMdV3xawhr_syeM_5vLrQsF1nMqZhOuyBbUW2mjyPy6Om8Q@mail.gmail.com>
 <Y9ga+bN+wHEI7w0m@bill-the-cat>
 <b3480cff-970b-bae3-4b8d-01cd587dcb94@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z7Bj5CJkyVoADOmG"
Content-Disposition: inline
In-Reply-To: <b3480cff-970b-bae3-4b8d-01cd587dcb94@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--z7Bj5CJkyVoADOmG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2023 at 07:50:45AM +1000, Greg Ungerer wrote:
> Hi Tom,
>=20
> On 31/1/23 05:31, Tom Rini wrote:
> > On Mon, Jan 30, 2023 at 08:10:36PM +0100, Geert Uytterhoeven wrote:
> > > Hi Eero,
> > >=20
> > > On Mon, Jan 30, 2023 at 8:02 PM Eero Tamminen <oak@helsinkinet.fi> wr=
ote:
> > > > On 30.1.2023 18.34, Tom Rini wrote:
> > > > > That's great to hear. While I started my life on m68k machines, I=
 never
> > > > > did get Linux up on one. Do the coldfire platforms you have run U=
-Boot
> > > > > today? If so, are they already supported upstream? One of my bigg=
est
> > > > > concerns about the architecture, in U-Boot, is that I've just not=
 heard
> > > > > of anyone using it in quite some time, and we don't have any emul=
ated
> > > > > platforms either (can it be done in QEMU? We have other plaforms =
in CI
> > > > > via QEMU) so I worry it's not working.
> > > >=20
> > > > Qemu supports both m68k and ColdFire nowadays:
> > > > https://www.qemu.org/docs/master/system/target-m68k.html
> > > >=20
> > > >=20
> > > >          - Eero
> > > >=20
> > > > PS. For m68k there are also a lot of other emulators that emulate
> > > > specific platforms.
> > > >=20
> > > > Aranym, 68040 Atari "clone", used a lot by Debian m68k port before =
Qemu
> > > > got m68k support.
> > > >=20
> > > > WinAUE, 68000-68040 Amiga emulation.  Unlike Aranym or Qemu, this
> > > > emulates also CPU cache.
> > > >=20
> > > > Hatari, 68000-68040 Atari emulation (based on WinUAE CPU core).
> > > >=20
> > > > Previous, 68030 NeXT emulator (based on Hatari).
> > >=20
> > > But none of the platforms listed above boot using U-Boot, which is
> > > what Tom is interested in...
> > >=20
> > > "qemu-system-m68k -machine help" lists a.o.:
> > >=20
> > >      an5206               Arnewsh 5206
> > >      mcf5208evb           MCF5208EVB (default)
> > >=20
> > > U-Boot still contains include/configs/M5208EVBE.h, but there are no
> > > actual users...
> > >=20
> > > Angelo: so support for amcore in qemu would be nice ;-)
> >=20
> > I did a little searching after sending and I see there's been some
> > patches for mcf5208evb and U-Boot, in QEMU but the last message (2019)
> > was that the CPU emulation wasn't quite complete enough.  But yes, one
> > way or another, it would be really great to get a virtualized platform
> > in CI to prevent future breakage.
>=20
> FWIW the QEMU emulation of the m5208evb is good enough to run Linux.
> I do a lot of kernel testing (and development!) using that.

That's good to know! I was a little surprised at the message and it's
possible that the platform was just broken in U-Boot and the person
assumed that it was a QEMU issue instead.

--=20
Tom

--z7Bj5CJkyVoADOmG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPYPvIACgkQFHw5/5Y0
tyxKpQv+PRni/489ykN53CC9iMnUDl2Jpc6P4srZyvVOaIMVviCqhrTSSuenu/Fv
PmG3nz1R/zjiCpcf+D8z9wYEtiM+oVj6y9lWb1G8mqiey1HHcF+1j8roy3KVQQsp
MVrs+CM26HfAOSxC7DwIUuxJX0Wbs/eezb+eFq1NjHr8H30AgrMdwieTt76eFW9b
/MaFV5CmaWdpSBperQl7zMldS2qvJQGn+Uz2bYuJjR+aW0jXXYz2L0YFIk577XvH
dKF185lvEdVSY+aWTEkrLvI362PSuAX77g7qCoD+ekuQ3jZYTdl+Ty3jxOO/1ysK
OZPHagk28ZeIOjWiHbv7i9j/BqHGfjdXsdlzdEFnbF/hHg9PUx0hIn+vS/MkJlyJ
V6hQqdIGpKUZFLr5X79yhQ0e/nCXHut1zc+WTUwhpYR/k7Qa8O8gwm/DeDlVuXEI
Wty5irGJ78DaMbeog4X3RXuFDnZJfHQ4F3tmZ36dHbqKF2j/XT0WK5QjfNqoLbPZ
LuoLAoLi
=ohmy
-----END PGP SIGNATURE-----

--z7Bj5CJkyVoADOmG--
