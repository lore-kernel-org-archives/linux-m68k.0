Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95197C636D3
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 19:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237828AbjA3TbU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 14:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236733AbjA3TbN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 14:31:13 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4045266
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 11:31:08 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id k2so9570699qvd.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 11:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oGVFWD+PO3F0rucdRMyF+bANyhs6MNMhdHt3CYe8VFM=;
        b=qGnY5iwIRtHbR0lY7JhM8jx0CSMErOYotniB3b3Kg0rpMlCkP7RyUTL4ooP70VghRV
         5CkFttk30LPbdbPHAAjpZ5gmitxwWu4Q877rThe3hEpcbufzVt7aM8CLvnrGLN3S37V3
         p4pJB/u1kr5DZU2R78ePHxnFrrpCMd6Vohyuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGVFWD+PO3F0rucdRMyF+bANyhs6MNMhdHt3CYe8VFM=;
        b=xKzu0jfJdfaszbVkTAUABktTMj78DQd/BU2z65EwoYgbCaVKaxmiOB3iPPvSGu7CEA
         JXH3SFZDaRb6yA88iZsfveXfLoc8GXQug+GZR/sbNzbGtjAX2QHly0AI8P2RBdQszIgn
         /qBrkyK3h+dhauVf1HM1/gdWuCrgD5zr0HDtXgCXZfEXodjjfa4GHdrNghESUYxj2HXd
         tYxnB/ZTnHVdSJXyTLJEhQC8UCVmYySVHKYcVNCkfKmwu0DmH/q7+DOsm06zL7q/cc7l
         UC/tPxI6Y1PNzrk82tV7jufPU8L1+r2cWNlMMDQhZFPT0ga3mDNHNrX1T1c/HF8v6bDz
         DOKQ==
X-Gm-Message-State: AO0yUKVHd09t7kRjCKqU8j8RXeNvqbc1nz3juHwDlcK+do1o2ZqC9TnL
        Zh7FU+vh0fYZ/un9O9pQOz91CQ==
X-Google-Smtp-Source: AK7set+Td9SD4zoMqhPVPlDn6aVrLuUMqty04pEQ/hPtWdmnBfq6WIwouRj9LeqX5GfzDDHCSnpHZQ==
X-Received: by 2002:a05:6214:5e0c:b0:53c:14c0:2137 with SMTP id li12-20020a0562145e0c00b0053c14c02137mr6883727qvb.25.1675107068041;
        Mon, 30 Jan 2023 11:31:08 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-31da-0362-f50e-b4ac.res6.spectrum.com. [2603:6081:7b00:6400:31da:362:f50e:b4ac])
        by smtp.gmail.com with ESMTPSA id bj34-20020a05620a192200b007208dd55183sm1782361qkb.40.2023.01.30.11.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 11:31:07 -0800 (PST)
Date:   Mon, 30 Jan 2023 14:31:05 -0500
From:   Tom Rini <trini@konsulko.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eero Tamminen <oak@helsinkinet.fi>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Subject: Re: U-Boot support for M68K removal
Message-ID: <Y9ga+bN+wHEI7w0m@bill-the-cat>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
 <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat>
 <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <Y9fxfNDNXXyJQ0Dn@bill-the-cat>
 <6558aca3-63aa-c89c-93fc-a5afe48cbe78@helsinkinet.fi>
 <CAMuHMdV3xawhr_syeM_5vLrQsF1nMqZhOuyBbUW2mjyPy6Om8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NSgONl4pfoxld3d2"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV3xawhr_syeM_5vLrQsF1nMqZhOuyBbUW2mjyPy6Om8Q@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--NSgONl4pfoxld3d2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 08:10:36PM +0100, Geert Uytterhoeven wrote:
> Hi Eero,
>=20
> On Mon, Jan 30, 2023 at 8:02 PM Eero Tamminen <oak@helsinkinet.fi> wrote:
> > On 30.1.2023 18.34, Tom Rini wrote:
> > > That's great to hear. While I started my life on m68k machines, I nev=
er
> > > did get Linux up on one. Do the coldfire platforms you have run U-Boot
> > > today? If so, are they already supported upstream? One of my biggest
> > > concerns about the architecture, in U-Boot, is that I've just not hea=
rd
> > > of anyone using it in quite some time, and we don't have any emulated
> > > platforms either (can it be done in QEMU? We have other plaforms in CI
> > > via QEMU) so I worry it's not working.
> >
> > Qemu supports both m68k and ColdFire nowadays:
> > https://www.qemu.org/docs/master/system/target-m68k.html
> >
> >
> >         - Eero
> >
> > PS. For m68k there are also a lot of other emulators that emulate
> > specific platforms.
> >
> > Aranym, 68040 Atari "clone", used a lot by Debian m68k port before Qemu
> > got m68k support.
> >
> > WinAUE, 68000-68040 Amiga emulation.  Unlike Aranym or Qemu, this
> > emulates also CPU cache.
> >
> > Hatari, 68000-68040 Atari emulation (based on WinUAE CPU core).
> >
> > Previous, 68030 NeXT emulator (based on Hatari).
>=20
> But none of the platforms listed above boot using U-Boot, which is
> what Tom is interested in...
>=20
> "qemu-system-m68k -machine help" lists a.o.:
>=20
>     an5206               Arnewsh 5206
>     mcf5208evb           MCF5208EVB (default)
>=20
> U-Boot still contains include/configs/M5208EVBE.h, but there are no
> actual users...
>=20
> Angelo: so support for amcore in qemu would be nice ;-)

I did a little searching after sending and I see there's been some
patches for mcf5208evb and U-Boot, in QEMU but the last message (2019)
was that the CPU emulation wasn't quite complete enough.  But yes, one
way or another, it would be really great to get a virtualized platform
in CI to prevent future breakage.

--=20
Tom

--NSgONl4pfoxld3d2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPYGvUACgkQFHw5/5Y0
tyzB7AwAnWVPtjSEHq5Dlm5bxKRWREl5mS7LjwoTj82c9etodo010r+2G64go5u1
hoMkGdV/K+90nQuybQ3v4liuT8NcXmy0Lg0rcFfeK3fnZzji/gwZsANvJhbgZRNA
32dmg985VpZAIYUEuyVamOiyE7HkY/pQn88CTt7SgKa5QJWQwow/9PtygxHZAQu3
iUReGa+i/BYlSjPItxRMEBPRa4GeEsk+NoQ3AqEMR76ofVnZxm7zGxxYxA3w0egg
FX3DUJFoEqDKBBhz1sbQtjLCu/itlT17PhqfW3Lp8zANxwz+yBAY/TrYmuXejHmt
tG9C11SSHuVybH7dHZ+AWNjHBMgicA1U4KdGWbwE09p+w3v3O3YJBRUBfsXhFkge
ix/nU6PfW00V9zKLaaHrUp6Opfg2wn4PSjJBns1NvqyWoSZqViAZmYcnAzgAJKBa
5YMGLa3lsJ19QJqprzZhHaH9C9CHYobES+A+8HnLibISJ/VHkz60VYB0d/ZgyRBL
DYX8qogC
=GcYG
-----END PGP SIGNATURE-----

--NSgONl4pfoxld3d2--
