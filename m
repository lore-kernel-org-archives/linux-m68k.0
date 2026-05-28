Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A39C3F39F8
	for <linux-m68k@lists.linux-m68k.org>; Thu, 28 May 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974796; cv=none; b=iDkRKddgb8+lxWRrtueNfoWi1Bb2uljMPXFv89Y7Z7eKE9+zByiL7sJplzeeDnOwx12pTi+Zt+0vrFwTxADJleEoPreLYg8gepmUSSa7G35Y5AJEKP7XfIUHyJOH0Xw1nXmNu91Y7wGZ6gQYPdS5LEfwQQ2fwwBy/suELzpbf5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974796; c=relaxed/simple;
	bh=03lGqlF+0BEi21i0yMRj08s+nfpxN0o2kGLw0gW00Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXyzBAIedJCuGFAaM7b49LNlVIgzk1vncmE1mlK7A1NiRw2266zgnodjE1Wr26cO4wcJm1NsXXeTi2iuktuIcOPZcgYLvQThfeYNf4go1voaBPGxgh2ZYRHtesYiExF9I7+b/dglKDVjM8LVtbsKgZeyEGeY5iHfbzh95UDq5Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FI/45MV9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FI/45MV9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so66520185e9.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 28 May 2026 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779974790; x=1780579590; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03lGqlF+0BEi21i0yMRj08s+nfpxN0o2kGLw0gW00Qg=;
        b=FI/45MV9yPpZjV+AmeUQa2Z/IycXQho3zPmbbbUPQh7NP3lWeHv0N1DBBUV//Ih1dq
         q2DWrq92kTn8ei9AtOwx+ACn9W/8EmjInVUDbE8g9RRl+ZB7nuxFnvIfpSM8grQmF2qU
         1x4hhT8X9zMlRq7XC+GS2krZc92K6aoJyYuf7/oQiZsa/zYEFMCOUcmSR1C6Orw5kWkU
         Jg4DLYwwboUiqdX8ieFKPI8clNMTZap/qPgKwzGyex96f1lFYEayUn8VUz+ojwTcnY4m
         7THnJeUvwgRZPMu8CTwtwvayQZu/vmUQcdg2kufmwCO+EJC5Hx4zMJS8Z4qGZEGLZP3B
         +f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974790; x=1780579590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03lGqlF+0BEi21i0yMRj08s+nfpxN0o2kGLw0gW00Qg=;
        b=izOeX6nPegfqQutKz5sdVRp/5maUSO6SFlrea+GkrolatWCkKsUkEN5VmT52q6ADAD
         h7PZPCF1QbQ99vjPk6zt7AIk/MCxB6+78MWrzDS8UC4sUgJ/O4eerMF+1CuTPTpd4Una
         SC+Gp1hPGwwGhoyPa0l9HXaVGbPd2Vr2gP06KrkwJw150bwtNe1o1X2C6eLxw6eKlXrl
         t5tKoZXLxKmaADjwArVQENXsvVss7GCw7PeWHjnlZQOHF/ZmDCeEuQ9GMHX6JgyKjY3x
         3/22DYkCueT4HY7Cpleb8FnQ6lQu4rkOhz/LsdRY9LDtKJu7OYwXGOU9C3hzJWtIofF2
         arbA==
X-Forwarded-Encrypted: i=1; AFNElJ8bC8QQHWCItXfwyFVW1mXeupZkC1CDrFAXmDBWKSKT9xNBqq/oKEeKRPAOx+aCcUREaiGpTmwjjNed@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzCcH0hkWAqNPinShsdL3HkGX/RDZ+GZSONXuIEmnWEDMGBWB6e
	jg4V0+4XuGDXfYVimIAPEouBy3F611qTGGSoPk1xoecpGtxayRdbsIrs4vy4038g9GQ=
X-Gm-Gg: Acq92OHcNKg5N6ABlXKfmcYvC1f7A/4uKpE2QEKwsBYPY4Xz0Z/PC8ZDJdFoBSjp0/P
	1EWU0GJto+kA698BOb2uymoTZnMAc2tNht4jJryqdR4NLcFebXkhLt/iEeOPZuZW2CN9+AdSOiW
	2JNrqIubfRq0zBTE+6ews9Kf8TbAK+DTV2LSakzTLM0yR3DHAzpni8aC331hhi2S4aG+t8ai6X/
	bHHMe5OloC/h2JxUDYxgXq+rlMOGwBnXC9mn7POhdRPsFzjTAABVzB5MeuX4hsCvVAJ47ivewbq
	c/W7PVqZuweP0YM9qTtGTUYZNe3LuVFCrhY+rD971VTAuQj/8Ca7u3zQzsZqsWPSxbiEXRbJG83
	/xYdLxpypjvwM0XKqCMYYh/Xv1kFzEf2axHWyhobyJlCS5Loqb5timUbY4o4smnEjVT83Ed8tQS
	o+13Xj85MIW9YXcxTbLephttjbUu8InNDGkwgux7DIY4WA/C/PFukIrBKLjC+uWlCOuoqB26ORa
	KRGS4Z5RKZZjalQM6GGZp2Qeg==
X-Received: by 2002:a05:600c:8210:b0:490:4663:691b with SMTP id 5b1f17b1804b1-490466369f4mr444171865e9.7.1779974789615;
        Thu, 28 May 2026 06:26:29 -0700 (PDT)
Received: from localhost (p200300f65f47db04e567da92d09b3dda.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e567:da92:d09b:3dda])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49092a82ea2sm71703465e9.9.2026.05.28.06.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:26:28 -0700 (PDT)
Date: Thu, 28 May 2026 15:26:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v1] can: flexcan: Drop unused platform driver data
Message-ID: <ahhAhZ76nLc-eZg8@monoceros>
References: <20260528094540.1867783-2-u.kleine-koenig@baylibre.com>
 <20260528-fluorescent-sage-ladybug-43261b-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jr5ezym2bbxklprz"
Content-Disposition: inline
In-Reply-To: <20260528-fluorescent-sage-ladybug-43261b-mkl@pengutronix.de>


--jr5ezym2bbxklprz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] can: flexcan: Drop unused platform driver data
MIME-Version: 1.0

Hello Marc,

On Thu, May 28, 2026 at 01:00:15PM +0200, Marc Kleine-Budde wrote:
> On 28.05.2026 11:45:39, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > No function in the flexcan driver ever accesses the .driver_data member
> > of its .id_table array as device_get_match_data() returns NULL for
> > non-of platform devices. So drop that unused assignment.
> >
> > While touching that array, drop the trailing comma after the terminator
> > entry.
>=20
> Does this mean that commit 5e6c3454b405 ("net: can: Use
> device_get_match_data()") introduced a regression?

Yes, I'd claim that this commit introduces a null pointer exception when
mcf_flexcan0 (defined in arch/m68k/coldfire/device.c) probes.

Best regards
Uwe

--jr5ezym2bbxklprz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoYQm0ACgkQj4D7WH0S
/k6P5Af/RigOk1qBi0phQGZoqolZBtvjNCOPhXdtTXZsPHFrRSQHlnNNrCwumgF4
gXsU30alRevFmOywvJQjR20jiQdfyqOz/Lh4rLmTP3/I7kfhEHsQHe35v2Rartas
20cbq4rj8aeF1jFaHth7acd0i0vpLMDS228PzL2qlnNTam51AZWKBqj6GoOzGsmt
00cRVpIB3ZYd8S5sI5g1go5xSeDGFaUgtPMYzzZoBrhzAsqYb+ypG/qSNLvDgn5l
6D4LUQLaDD+Ds6gwzkFPPXfAEmxMQwnT07u6+PQCfPbuGmSNye7H4KEFgdStSD95
6tdn5MsdA99T+oswj7W1DmgD27Gbwg==
=UgOY
-----END PGP SIGNATURE-----

--jr5ezym2bbxklprz--
