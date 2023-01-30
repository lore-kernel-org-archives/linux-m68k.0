Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FB0C636D3
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 19:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbjA3Tcx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 14:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236396AbjA3Tcx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 14:32:53 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741132133
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 11:32:48 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id v19so11185254qtq.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 11:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yGlwB5+mDvVhzxU1IWfuYh4wXkYc3nPJ1hNISQvaF9w=;
        b=NMF0IF0wdOZM9FjYfKiIg8P078PUMABR4ovfA6NS3tb4IMC3SdgXQhHeaT/xioagxp
         HlbbpLimJwz35tETP8sa1DSIVj43RxqakvgMK27/h+l0MiDr892IoH9K/zCeUIoMWVDh
         G4uFl3VmIQTwBn0T8O9EfzMjoWCGOy/AN8vM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGlwB5+mDvVhzxU1IWfuYh4wXkYc3nPJ1hNISQvaF9w=;
        b=ZLjukMl5e+dPQ0/Nze22jEFDRdEQjcOh0OLu9+xNbKmImc8uSZLcxGLR/5BF9FB1A5
         hnfd3IDXZMa01sURAW9przdedsE5lGaGvG3VJVnuntlQpzpnMUTJcUHHdF/4MPuV6lX0
         GqvMWx/cdZD2/oo990RWXBo7kYR9bvI9BEPALKkAkSDVAB6FQD9XFsyHA442O5jEmm7l
         a6zfCv/MAuiq7L+sehmD8xVhTduE0LaQU4LXecCqG+lwYGIDFdFhb9v2Ep4mrN6+3wgv
         155n2leNugE4ENM43h2YCgzXedz8VMT7BIBISiEIEovnn1XlfHpkwlCfsTgLOZpJmrGe
         Y2hw==
X-Gm-Message-State: AO0yUKWFJv94Ed6gSzS1l/i6zbPrrCY2vISvYRE4j3kURskGm79/Wl/9
        YgSgDzD1QPTxNfsXmSdyP5EO7A==
X-Google-Smtp-Source: AK7set9LrhjNn1k2uRY1XjtlC3rvVKrE2zXqja3ohwV1D+yMJlYS7UFnUMD+Z6r+uXSz240KIZbPaQ==
X-Received: by 2002:ac8:7fc6:0:b0:3b8:4bb8:5aa5 with SMTP id b6-20020ac87fc6000000b003b84bb85aa5mr15211413qtk.54.1675107167584;
        Mon, 30 Jan 2023 11:32:47 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-31da-0362-f50e-b4ac.res6.spectrum.com. [2603:6081:7b00:6400:31da:362:f50e:b4ac])
        by smtp.gmail.com with ESMTPSA id k17-20020a05620a143100b007242a18ee8asm869031qkj.128.2023.01.30.11.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 11:32:47 -0800 (PST)
Date:   Mon, 30 Jan 2023 14:32:45 -0500
From:   Tom Rini <trini@konsulko.com>
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Subject: Re: U-Boot support for M68K removal
Message-ID: <Y9gbXXS1Z38gbyGm@bill-the-cat>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
 <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat>
 <CALJHbkCTbhBrn5_XLPBADswOdhwah7vz7eke_YOr-D1spVRmyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QryWxdrE/Y3nndm+"
Content-Disposition: inline
In-Reply-To: <CALJHbkCTbhBrn5_XLPBADswOdhwah7vz7eke_YOr-D1spVRmyQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--QryWxdrE/Y3nndm+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 08:22:15PM +0100, Angelo Dureghello wrote:
> Hi Tom,
>=20
> thanks a lot, and thanks Geert for forwarding this :)
>=20
> On Mon, Jan 30, 2023 at 5:14 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Mon, Jan 30, 2023 at 01:49:11PM +0100, Angelo Dureghello wrote:
> >
> > > Hi Tom and all,
> > >
> > > really have to apologize, had hard times these last 2 years
> > > and couldn't follow at all the activity, i am totally culprit
> > > and responsible.
> > >
> > > Now i can jump back on following, if there is any sense
> > > in keeping m68k/coldfire.
> > > Let me know, if ok i start back checking all old patches
> > > from tonight. Also, will have to update my email and rebase
> > > to master.
> >
> > I'm glad you're back. I think the first thing to do would be to confirm
> > that U-Boot still works on at least some supported board, then
> > confirming you can still access
> > https://source.denx.de/u-boot/custodians/u-boot-coldfire
> >
> first 2 tests:
>=20
> 1) rebased u-boot to master, flashed to stmark2 (mcf54415),
> no boot, black console. Working on this.

OK.  Based on some other reports in general, I suspect there's probably
2 or 3 different bugs uncovered / introduced.  Hopefully it's not too
hard to flash and test so bisect'ing these down won't be super painful.

> 2) seems i can still access
> https://source.denx.de/u-boot/custodians/u-boot-coldfire

Great!

--=20
Tom

--QryWxdrE/Y3nndm+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPYG10ACgkQFHw5/5Y0
tyw3/Qv+NDnOSwdYob6zu2yOmX9LjbwvwOs2akuMlSoYI6d0uEraGXAH2A//SNpu
PVlHn6nbBPGWOi+/dPYEiXJHEqePh2tKA+iprRRxe47o+Ot/G3zUdimPIenfP+zg
AVeLwW8ykPhGGcAQvCbmL0WInuKgJCos6MnrBvzEEetX5ov59ZNfE6rvizjPt1RP
pzvrkD/P+3KZeZxbh2SF0Sv+P1mVmst0pExY+vriF2Ok27gtcnClA+39Fd+0TIW4
U06ueJwgbZg3d69axraeCeT+jamLgg09tKAmdb5T1kZDDpF53q9M/elO3I29w5WI
TErKMHvv6r5d+5QQXhHGNs563CbeU9z0hOqk6A9WyofgicjwH+rWRq7G2fSCjrvl
/52KI9e9Kk8xz7MAw0cvrApRhdxkguZmXC7MqMD2PYVWegAKf5LmyId8OtOcO4Rf
G9079lNT480v9oGmboD5ND5YXRcyeodk8/zbWTQF0wuSyk/4za4/T3s/qSWD+IaZ
TcldyPn/
=fOP0
-----END PGP SIGNATURE-----

--QryWxdrE/Y3nndm+--
