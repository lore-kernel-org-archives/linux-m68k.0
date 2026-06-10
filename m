Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A92A3446BC
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781112454; cv=none; b=j2uUtWjWrfzmp3hj9lqLomsG1hZGgJ5e37JPkaecnJQIsgUztadonWauhAmnrIHgwuTuEtiDK8EUa2/NH3W+rny9lT3S1JACuyFmNU2PW12Lyy8iMIzoBUFQlM7jf9dOjbbS48vkfS8A2Efh6adROYCEYSdqr1jOUVWpQ9VcIB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781112454; c=relaxed/simple;
	bh=kzErf+z7JSp8P7msfJBxTyBqs3Tz4zofU5rff5W0bhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hclYuhUN0jCva1lg6V2+RYpB8xH41eOFUDfWpOnreOPI+XJMLuKstf+zVS4mkLSQWcJ77+eSFscUIGPN5jIcdkWegWjKnZMmzDpFHkeN+G9EwbAiaBAzXPD+UYxBOFy1Hd0uxp3/mVxJbWP4hhJjNiQj5neb9PjCa/rCkMS44aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AxrQeQ08; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AxrQeQ08"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so5341101f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781112451; x=1781717251; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kzErf+z7JSp8P7msfJBxTyBqs3Tz4zofU5rff5W0bhY=;
        b=AxrQeQ084U+0Poim6LPncYbFKd02sTof3zEn7x1FTntShndOIH7SBpz7o5ciF+k1b6
         LJT4keNFWy/Jdc8Qi3SrpvZEOZMF13FAzOK22uEJHZ/czlVXXlRixxBz4mXluxnzmNS0
         QfvzwFiesqs4C1RfUHLumVmNJHmS2kPoKjnW64AicXGRtVvz+mf2MlTlzrvXuIpCFUns
         epKZJjIB6YGFGKBdD3C6N3XaUYmOge3/SHPCA6DntlnaK/oDso0TYHFRsyJbLMb8i8fU
         kIkVZC7lAIoOOfM9b44zajFMMr7JgqWsi53ezej/UI9Uqe/d9rYiTxOMo9tJd7q9joH7
         UjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781112451; x=1781717251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzErf+z7JSp8P7msfJBxTyBqs3Tz4zofU5rff5W0bhY=;
        b=rmPgR0JlEV69Vt7bF7pEMu6uKwTaU+e+m0PNLr5kgtL18dkvb3phDKKV0CCNd300Rq
         U2chBr0PlMIEDt/5LGUgGHKrPBmXh9NbmMKZfSdoRw034BhTEwGTMgmnONcVMHtyyLG4
         /aDuG+iXL8E/hO+SqXLhVsy8RNR19gFkN91gniE3OFkO0mDOzADfL0u/muCp2pJIWI2p
         5Q2OUs4iLAooVbeQnvd39CeRxjPOhjQejEvl4gMWqXNRB387pHe0jnrqorDHzW5p+beA
         CNHDKnmL2vmVCPuR4MmfkbOjVQd4+sYIpanZA3OkwwFJGrJBqIPlUXSBm0x83Jcue5Sh
         0kyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FYphBOk+bBibWyB/eBDbjOF56uqX1vsqJo88jq864iQ97Zr3vXNlUfsOYL6p9RatVK6VJjEiHTOog@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzgyI5GOAP8S5+xa/0vujgIOuM894dCNxFjw6XQX4dvbL641iIG
	W5FWqIEzEKBMcobWvy4V7t9RJD12QMoDh0zJHy6KCoNGleo20KveaIj5DelwLX3TuYU=
X-Gm-Gg: Acq92OEAOTYJ7yW5sT8eIQ/OvJZmGUf0qZVQe2ao2dsd8YHvQlbdzeHo7ippF4J9stz
	5VzAoMJRICEzQXvMlL/kQsDGauRtFyBcoixVU5gqI7SbZ8yWucR/fSZ8kOOaDQBwOF19cZ/ERuF
	uuvuKUnX4p5BLpCHen1eNvxtB5Eu0DrI1jyQk+AENCUWk2gl03JHrPWxSjFLIC7ZXgMYGaoJVa+
	1hmInMYqmiPH0Oo8YwQwL4FLK4eMPm+oryy9+bt5b8PN66Nhmh8lOw3ukphcE8QRs/sArlm3nwW
	kt6XJrX/BjzO1OMwpySDF0mZojbuwvXIWMzHxVdQXsSuSvVrZyeXXiPxfy1A3OVfD0Pxm6TJMlS
	xMhkEBw+ptQA4vV+23mJmhcd/kkIA7Zk3xcKXJQ0CVyNVdRLW8+nSo43OarjdMtylvPmwRXO7b8
	0aHgxpF7/BlZPuLuYz+WTgRMarpxWBLKFOmFNO717JsZGcDy7KWoqVLG1xdh8joPo++0wpaA6Uh
	ysKSnNQGXP6RpDpeSeu7n3sQg==
X-Received: by 2002:a05:6000:29d6:b0:45e:e509:d2fa with SMTP id ffacd0b85a97d-460302dc8cemr29014867f8f.3.1781112451467;
        Wed, 10 Jun 2026 10:27:31 -0700 (PDT)
Received: from localhost (p200300f65f47db046aec8c3a4b621e71.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6aec:8c3a:4b62:1e71])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f34413csm72375859f8f.21.2026.06.10.10.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:27:30 -0700 (PDT)
Date: Wed, 10 Jun 2026 19:27:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v1] can: flexcan: Drop unused platform driver data
Message-ID: <aimeLxHiQ74wwlR3@monoceros>
References: <20260528094540.1867783-2-u.kleine-koenig@baylibre.com>
 <20260528-fluorescent-sage-ladybug-43261b-mkl@pengutronix.de>
 <ahhAhZ76nLc-eZg8@monoceros>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="va5ro6u5yud5cge3"
Content-Disposition: inline
In-Reply-To: <ahhAhZ76nLc-eZg8@monoceros>


--va5ro6u5yud5cge3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] can: flexcan: Drop unused platform driver data
MIME-Version: 1.0

Hey Marc,

On Thu, May 28, 2026 at 03:26:29PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> On Thu, May 28, 2026 at 01:00:15PM +0200, Marc Kleine-Budde wrote:
> > On 28.05.2026 11:45:39, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > > No function in the flexcan driver ever accesses the .driver_data memb=
er
> > > of its .id_table array as device_get_match_data() returns NULL for
> > > non-of platform devices. So drop that unused assignment.
> > >
> > > While touching that array, drop the trailing comma after the terminat=
or
> > > entry.
> >=20
> > Does this mean that commit 5e6c3454b405 ("net: can: Use
> > device_get_match_data()") introduced a regression?
>=20
> Yes, I'd claim that this commit introduces a null pointer exception when
> mcf_flexcan0 (defined in arch/m68k/coldfire/device.c) probes.

I wonder what your plan is here. Should I send a v2 that also drops the
unused variable that I missed in my v1, or do you want this NPE
addressed first?

Best regards
Uwe

--va5ro6u5yud5cge3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmopnn0ACgkQj4D7WH0S
/k6vGAf+P07h8wiZcTaqCGFDv3/2aYJax+UlwADLeBRQ17i1kGZEG57kJGO/DtG3
AJ3UwGF1EmwGKsZe0o1RY2aslrGi/H+9/YoB6DmZVyG+tox+0yvi4bM18XZOyllV
mklJFAB1Zm7Lbavlmq7U0WsaQ5JcNIOn5VvRTBuJsyGluJfMHr+F0n8qrzqEtMYY
XR/+Iaexegpe75VAXdLqPnlKPC6FzStBYkOWr1jLgIKJj5BrvXmlkAoL90+4yiJy
zv4gtclllsXd5q8/Btjclk5kPNVk1HYYVVVZDPRZ1VXeWg4zK5E8a8Gktu8SHbri
co1ZFXcx/TxF9w1oYwXWBdkD4jWZ3A==
=yx/5
-----END PGP SIGNATURE-----

--va5ro6u5yud5cge3--
