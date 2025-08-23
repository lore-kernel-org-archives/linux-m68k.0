Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6F85C96
	for <linux-m68k@vger.kernel.org>; Sat, 23 Aug 2025 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755947186; cv=none; b=rxCe6hgPBzzONS5RHO9DN6fDfzILzwoO3uyC02O4YRkmJvYP8IHC7rabqxhyrfB09Yh1rYH4eURyOzX0zbl4VyeqZs+kf78NDPV+GClp/7nLa/vKky4li8jDvvW13/OO44DrUlRgdCS841lqoGj+ApCUVnZ/uCAYS+jDcaFGIC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755947186; c=relaxed/simple;
	bh=9VvyqVBQm6gTSfPiyy9VmEq8gmCVeJSx0bKfWN7Cj5A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vGGoM/zvAnI+NX8q8LT4U3NjijkiqjD+NnCs2xRlb9a7+y/g0ceWe258YF+zVxvEK9fAuni6ZDoZqdTzEaVU0WZVJmtoLErxu8cSi3GvdvPZEJ9tKEpg87WSns0AgVUsBhfwSDaJXiIFxbjDkd6QdTKToyttcqR/1+phl70og70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=T7yLqrqV; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="T7yLqrqV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=OpUJUIx5NnLf7UUO20BYNfidNkWoKlc9wFkiYQVlK7o=; t=1755947181;
	x=1756551981; b=T7yLqrqVG5yIGssptjF+wFL+ZGX//OJL0Try+9MbcE0aSBCgPnnS+kDMUVAii
	miX8/ggTdDd39q2kn3SuoWY2K4UBXIv/jIMNR4ZEEQLMWGMe7tZcV6mymUdMLuf3Hp3glM8YBJKO4
	05Fu+mzdLuIj9X3zsHEoSEWrqG/WHnYZ6zWk2Us1U8LbQy2O+j/R42nZ6iY0pKsGm3T/s35qtlHTz
	0KS4zkauxZ0gPSaDWWaOV5s6Xsb5isFJPlFGifqkEMLt3Zu2NyRSrz/Yc0UrDJ/5nQPzg2LV8/rGY
	Y5KAd9zY0Z2qle2/EJ3ndHHcL+R0AspycKcUpn9O6vqvnQcKFQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1upm4c-00000002Ic4-2Udm; Sat, 23 Aug 2025 13:06:14 +0200
Received: from dynamic-078-054-253-150.78.54.pool.telefonica.de ([78.54.253.150] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1upm4c-0000000229y-1dle; Sat, 23 Aug 2025 13:06:14 +0200
Message-ID: <110b6ca9b56e87e6bcfd058a284f25453bc90465.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 1/1] hung_task: fix warnings by enforcing alignment on
 lock structures
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-68k <debian-68k@lists.debian.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>
Date: Sat, 23 Aug 2025 13:06:08 +0200
In-Reply-To: <20250823074048.92498-1-lance.yang@linux.dev>
References: <f79735e1-1625-4746-98ce-a3c40123c5af@linux.dev>
	 <20250823074048.92498-1-lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Sat, 2025-08-23 at 15:40 +0800, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
>=20
> The blocker tracking mechanism assumes that lock pointers are at least
> 4-byte aligned to use their lower bits for type encoding.
>=20
> However, as reported by Geert Uytterhoeven, some architectures like m68k
> only guarantee 2-byte alignment of 32-bit values. This breaks the
> assumption and causes two related WARN_ON_ONCE checks to trigger.

Another case for switching Debian m68k to 32-bit alignment.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
