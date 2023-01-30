Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE58EC54EED
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 16:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjA3QOY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 11:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236272AbjA3QOX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 11:14:23 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B6C1BED
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 08:14:22 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id x17so10474098qto.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 08:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VpnAg6c01ddMFIAfXFSXbDXvFhkeh2RYYDvIM6lMH38=;
        b=CSgpULIfDTXjQ7MOAUrKw0g8MMKIQIG5KOEr5NvST/XAszfWALXIStVqTU0TecqjI8
         +mApfC1eUM59khcznpFZXTM84ZWbjyhDNPQZYufiaU2hqWQGA64uTR/mGVle7YTNl9jm
         9lfaO8bOHwIjubHpH+FPgZ7owlDw0WkYofUvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpnAg6c01ddMFIAfXFSXbDXvFhkeh2RYYDvIM6lMH38=;
        b=I6vLxy6vLgDKAKJR2MmmJI4cqu9j3Pb80t8uYoGmwvnyGFtkUuvBTm4V46NAabL+py
         RrQEgpK0ceWnDMlV6MO9O6g/9mzoAKxHpUmtyUhMMP+aaIlvWGIDafnuCT+E76W8k+Co
         gAAzwto1ktnT1ehG0lDnfGOUj/LNpp06XSysS28kxWyn097hZ7MyhwgN4prud75CWiu5
         W7T9I4tKl59fOdMHi7d/G+VJbzw2L22xgGvpAxaRVUyavvxjieOesSvKA+XX7v/Xk0pT
         hteRxGmyXGdM2Zie6Jfo+INASyzLLvRnOT03EgQ7earKt+1n2dIrxB0H2+Hc24nvXJMn
         XQfQ==
X-Gm-Message-State: AO0yUKX5jB6TrixZYggZMmXg0G5MWMmD4cFNj5Hi0O7wunNT/1RGiQxn
        IhpLV2w9oblrPrMGnCN2jSOMNA==
X-Google-Smtp-Source: AK7set/bj0033SorMObSwC7yuCNyzYLn3FyNNt2ZXmyMasDyiJqSpD+YIaYbiDhJaJEirZwkJb7Vcw==
X-Received: by 2002:ac8:7dc2:0:b0:3b8:68df:fc75 with SMTP id c2-20020ac87dc2000000b003b868dffc75mr8360087qte.31.1675095261499;
        Mon, 30 Jan 2023 08:14:21 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-31da-0362-f50e-b4ac.res6.spectrum.com. [2603:6081:7b00:6400:31da:362:f50e:b4ac])
        by smtp.gmail.com with ESMTPSA id k7-20020ac80747000000b003b860983973sm3278702qth.60.2023.01.30.08.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 08:14:21 -0800 (PST)
Date:   Mon, 30 Jan 2023 11:14:19 -0500
From:   Tom Rini <trini@konsulko.com>
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Subject: Re: U-Boot support for M68K removal
Message-ID: <Y9fs2wH4WHIzae5r@bill-the-cat>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
 <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7CNCTFi6wuCdXjwT"
Content-Disposition: inline
In-Reply-To: <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--7CNCTFi6wuCdXjwT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 01:49:11PM +0100, Angelo Dureghello wrote:

> Hi Tom and all,
>=20
> really have to apologize, had hard times these last 2 years
> and couldn't follow at all the activity, i am totally culprit
> and responsible.
>=20
> Now i can jump back on following, if there is any sense
> in keeping m68k/coldfire.
> Let me know, if ok i start back checking all old patches
> from tonight. Also, will have to update my email and rebase
> to master.

I'm glad you're back. I think the first thing to do would be to confirm
that U-Boot still works on at least some supported board, then
confirming you can still access
https://source.denx.de/u-boot/custodians/u-boot-coldfire

--=20
Tom

--7CNCTFi6wuCdXjwT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPX7NEACgkQFHw5/5Y0
tyxC4Av+Laa4zKWMMthxzKMwgtEuYrj5HtFOPvVkRR7QEaqWURaRpLP3wBKkIRk8
rLt/cpH0AhEEX+sJpBDZXpnYG+oxcg9HFxuF76EfcHY/ZRcgNRoo/2yUNb+0ijiI
g72RSBy6oWDSzaZK146koytE3a+8404cIqJC8BoPvgIyKm9qYpUs6/jtTlGr2pad
+5TOxEzssT5zEBS+HvbHeNuQRQCPKW4ULCmoE7O6TPvjLym4b/3barMGXDPaeaF+
Wmfl8dkO/w2bq64iZxc9rSjONGrAdqCv5bnaXfWlgWWIRJrTLzlWUM/mpzF1WH1+
1vQ/4X+8HiKOvfTxWF6KgWgE8p/ULR/wH4RmTcbvELR0O0Yd60xEfNkHozeiBK2U
z8XvTUhpsZdyUAriI3HaQlC1AJd3ytOs6K8gSwrLt/TJDqVvYNrsJGGJBMr9sQ4a
cEMqZW3rsFDTYYGpXBs9h1K0Y+qWblW9Swlt3yjdlYru52TUTikUUTld2xa7OHyJ
poIS3+FH
=We9y
-----END PGP SIGNATURE-----

--7CNCTFi6wuCdXjwT--
