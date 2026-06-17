Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37864418DB
	for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Jun 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781706465; cv=none; b=EURuyWbahYrzRuyt+d+77ptyYwB1J/KKgPxLKIEyz/8zKsk18d/T5OZi2cpaE0pVzjWqBOmcb0cS5wGlfPbgMyWK071qf+wPFoMEZeL9MbPLxSoKfJ2meDFze4nrf4RaohpTaGu9lCKsUvg2ASrP8+NGxQow0xSSTee99XjEeJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781706465; c=relaxed/simple;
	bh=Z3UHLEz+y1SdtaertQwQQoSqSykYCh5B71oIzAAnEIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3QGk3TFJDwbYfoq44TkWHXiqIDDJUWV4j8tuOdTK+Ew2zuYg7FJrxZraxyx7Zf1a9NCsnN8HYsCwLJJrXJT7oBH6cfgbjXHvxvarO8ehvJ+P+ZAoaLR9tw1H82S0Gpup7n73kDxuxe2PQUnajX8OOV1bB8ZwbWj7jdMGRQonwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LMFYuShq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LMFYuShq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49222fb062bso48879055e9.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Jun 2026 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781706462; x=1782311262; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V9sraqOdRVmI6MDGXZxWeHpZgfbvpy2FjfTccr96thk=;
        b=LMFYuShqpQcA+8TYM6Jng15k/gB/Kx//jqOFBWTeJoCc/5baIInRBZdIGo7n4N53Rm
         0/2D3VhLAS/ex4nZ/TLubfd7BhKwiYJgiBxThBE5WWoO0xO3FY8u5vQZ2XnAVrKBTto2
         45GDOmuc8kzNZL5eh1QxI9SeHgtg0g6pqVuP61zI9S6r3qgKYFGwrGtzmwPHMtBXbVOD
         Oe2KJX3cfn1A521KV4oaNpH80ALK3y4w/zz3iAg9HHySesuCl25i7KbhLFqpeNd9U65/
         hLYmq3kc7P2AZmcTEF1IcM2rwe1muWja1vHfBLa4LaGV0GoruDNUNmr1ZKULWukhXVVv
         D65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781706462; x=1782311262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9sraqOdRVmI6MDGXZxWeHpZgfbvpy2FjfTccr96thk=;
        b=J9henNka+TUroToGz2S7fTTsOjW8FxnMbpMex8o/zkOCUsvRhO1/xO3XjHw4JCczjO
         FMpaZs1EiSbBq5lfmShTHv3AEmJpzMkOB04M47NIbMgSceAXqp6pRfELukyGv9JX2chi
         g+gHraHJmjqH4GvkVKm5kIadix+9TjHcqv2UhU+yPta5gApe3XmIdkOq+Gf8EAdEtMfK
         yN/8zk/jaF/h8+K4DgnwTBO9MB0XMHEsl3M+3U86LHWaiHdGye7axQHTDiYThZOFKjNd
         0N+N647/xP/IgnlzMA1ul/q8fCyrl2hK2ZASswYNvQ4cUrr7AOYyCC43LjbQ0NW06Mps
         tRjw==
X-Forwarded-Encrypted: i=1; AFNElJ/+ofT/OAiHyt+WpD0DWhGt+ub90PROKxLPnmqGiDK31mMBVoltrAMHGIeg5//Bsy/53EPeuDxBoDrH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YylgQD629bjNQlVyDs0ln09LQ89RFxlfD/VaL24ywHkBZWo90O9
	cuK+9n0DLTqnV8rT5l2YbGuWGd/LJ5y6mFPnJMAzqQfecnSvQ+s/+2J+6Ci/+bGrBg0=
X-Gm-Gg: Acq92OEyqnO7JDWVS9+AZUQ1LjfT/wn/MqeHv92QmvQp98kFQtGSmgUnqASRO2fqgi9
	OttiBYG/JGe8hZ5mkjmLh3kHcZ5SAXNvBz4MQeK9lnViZAxPGjOv9WYf3gagQQ4oO1nyNaXp9p8
	efegVkOTawZHdPXty8WsRbTI0cThKbOuk05ZdxNX9NIco2AJsWRQRxLWwKtn2hL51EBEz/GcOT6
	kL+98cINW6hBM3A+EQQtiqZ4IA52VO8gCiLG6vo7+hzKSYWXpisUKkcOl9sIQ81oj9Tmi8fu7Aq
	JhYnTLMX80WiKqlY4+b2ADNDpsiWF4TyMWYonBUPT7KPJFlnRs0giM5Od+lHprRe2kGfKqJwv+9
	eqbdfnzNAeeC2NTgaOid5SnG1DxStkV5npgHsGcQeBFNobzUoOcUU6+MB4krR5z/ug8xyinKHLQ
	1OpZlNRG5Zq/RgwPwFh/MbI8PU723NtAUrUXyFo8pC6uFjXLBNWMEpjt8dYuuxOr6ws9qmZOI4W
	ip13Zh2XGhMVgw=
X-Received: by 2002:a05:600c:3b8b:b0:492:33a8:5499 with SMTP id 5b1f17b1804b1-49233a854cbmr77052255e9.17.1781706461860;
        Wed, 17 Jun 2026 07:27:41 -0700 (PDT)
Received: from localhost (p200300f65f47db043b42891e8adbe9a5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3b42:891e:8adb:e9a5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4922fa890d8sm182900215e9.10.2026.06.17.07.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 07:27:41 -0700 (PDT)
Date: Wed, 17 Jun 2026 16:27:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Sebastian Reichel <sre@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] power: reset: add MCF5441x RCM power-on reason
 driver
Message-ID: <ajKuoZQxRxp4ARDa@monoceros>
References: <20260607-coldfire-rcm-power-on-reason-v2-0-d0039d8a91e8@yoseli.org>
 <20260607-coldfire-rcm-power-on-reason-v2-1-d0039d8a91e8@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o43i2oqf42myx2f6"
Content-Disposition: inline
In-Reply-To: <20260607-coldfire-rcm-power-on-reason-v2-1-d0039d8a91e8@yoseli.org>


--o43i2oqf42myx2f6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 1/2] power: reset: add MCF5441x RCM power-on reason
 driver
MIME-Version: 1.0

Hello Jean-Michel,

On Sun, Jun 07, 2026 at 10:49:53AM +0200, Jean-Michel Hautbois wrote:
> +static const struct platform_device_id mcf_rcm_id[] = {
> +	{ "mcf-rcm-reset", 0 },

Please drop the 0 here (and the , before it).

> +	{ }
> +};

Best regards
Uwe

--o43i2oqf42myx2f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoyrtkACgkQj4D7WH0S
/k4HWwf7BWoWJEnsDOdF1eUd+yk0k0Vk7VN5aFqkdSwTdLhR603P2fSAN0RU2OWO
vZurzDc8U9lu7TyzO/d9I8eu+OjbU1QF46pGYJg9CHBYusTSmvrQNAG2LxjyxkX7
mhqfLCgOclh3tA3bcp8QEzALPxv0CyBKoZNAMUQhcUACeZL3Sdc0Pq4KNIHKnHjF
9XnUbG0SI/RsR/6nsBzXIH9cjTpY2yYt4RP50zqG1IKnAU2Z7asCHK34hO7mKp9z
fHMbgzLlZpGjFJoY830x8A9keoqRl0e8WzJt5JyzgJEj5qclK/RSQkUssSzU9anW
cwBO34/pyuJmx3yWFeohpayzJ0ithA==
=BRr1
-----END PGP SIGNATURE-----

--o43i2oqf42myx2f6--
