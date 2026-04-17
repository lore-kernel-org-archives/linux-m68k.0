Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B53434753F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Apr 2026 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776442163; cv=none; b=aC1izwrfP11+RZv8lnKNXLHa2r2DRHtWWSkBec+vMRW+DspYjmAqVYI5LJS4G3aqpSo17kxLz541zhFSY4aIG/WnkAefJ7w7f+bNOf0b7q8Nouz0hxBju7Me5+vJ5G5G6r7gtlx13Jc0P20DG5Xw4LL7Wj2MEICC41fBCZ8/yMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776442163; c=relaxed/simple;
	bh=MFHe/JodABoKXerKi3atV7xZGaeASc16N8fsC8Nf3QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJGF2hlDe99Iupbzlwyy7yb05TyuU/9qWyufh+S0qnFAgOBnTAGIFBhm5P+7lvy5k3QTRiJqAqR1JjzYJ0yDvzvyjhahrnwgr2sbzAsJsBzdLRB3yVmXEcrrsmuGtq2wz0Cm/wOewEzGxam/t/hObZt+Bkg2MhTIVt78lUsvMm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfGr/WSp; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfGr/WSp"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDC8A40673;
	Fri, 17 Apr 2026 16:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0146C19425;
	Fri, 17 Apr 2026 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776442161;
	bh=MFHe/JodABoKXerKi3atV7xZGaeASc16N8fsC8Nf3QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfGr/WSpV76MKFAJdAlX8fWJ6OXLwxRuUDkaAyDOY0S+TPFyyxaHPV+rUxyH+sWky
	 m/g/bk6uXffxV6m8fMvmPHxM6gkiDXOm+NazvVXMvyJOsc4ftX7/ofZy4qdGWTggA8
	 lYYpfhX7blhzkPeuHg9YeZwz+oCsEQIRFNHca1ZAdRzBbalMTlPGdHb6VATDRSeTIh
	 +zfZQO+FH23fRXbH+fuBT+n0rcTNIY96Apxpn7jUmqtdbN7/rb5czLli6oNqgJ6xgr
	 Jjhis9/jHYZlFECOg3L4unzPG7z4i5P/D0nTZXIOZ2uY+6/LBvGOhkM/oAR8rmGp9F
	 4iwPeGhPAW5ew==
Date: Fri, 17 Apr 2026 17:09:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: reserved-memory: Change maintainer
 for BPMP SHMEM
Message-ID: <20260417-molecule-pending-b6a181b49abd@spud>
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
 <20260417131549.3154534-3-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nuU7S7AzXyEfyP0v"
Content-Disposition: inline
In-Reply-To: <20260417131549.3154534-3-thierry.reding@kernel.org>


--nuU7S7AzXyEfyP0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 03:15:48PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Peter sadly passed away a while ago, so change the maintainers for BPMP
> SHMEM to Jon and myself.
>=20
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nuU7S7AzXyEfyP0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeJbLQAKCRB4tDGHoIJi
0sjcAQDBUAS4q8bdLt4473Lh07kzn84oMHmG+AK7zOJ4U5NsFwD/aO7wDYB3REwc
/p7ATF7mluF/bwqsdq3R/8rZL/p42AU=
=1eL7
-----END PGP SIGNATURE-----

--nuU7S7AzXyEfyP0v--
