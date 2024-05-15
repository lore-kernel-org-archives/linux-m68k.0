Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1296E36AF2
	for <linux-m68k@vger.kernel.org>; Wed, 15 May 2024 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715792940; cv=none; b=WgkRYOgE41z2Tt+O8umhpK69KI7XC5KAQT2bKImjxZb26ynl+QhWtqNRrLFh5ee0U0CmP3COZsrriW1agpTv3EIoIdMdbXrG9+2Fg992npViuWqK5dWN/7CGbooqJmrrN2EhVfTzevAPoBfjRsCsP7OSsj/CdgTh71wuFYM+7yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715792940; c=relaxed/simple;
	bh=noyD5xbDbmhJLyuH9s4pTkSYG4cBvOFrS210x3iS+AA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cOf2PZsYNQCbU1v5x8WO1zHR/5D0iU1JU+1dLOf19TT6oN82HlIN46Z+6sPsWHm6oeTXtO3o2270/B5ECNfUN52U1M12jvK33/ukZ1815fgWnVoRa/MjCAM00z+OQJ0jy6fReziAU9233LrEsNW6jm2kKw9xJm/2GTPu6xPxVZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=PmybWALL; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="PmybWALL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E6EnmdbhMTIB8bvfDIa3xH/AyN7xJLEFvIjDoW2Zqj0=; t=1715792936; x=1716397736; 
	b=PmybWALLYNmImgCjYVUDADN9ab9vbCWeL2erbsNFWfxAjLdxFgHXiP0Kg8qiC+P/VP8/la7c8aK
	CAZZeBUpGvjoQstxw2eU04DSgptMpnxZzPIaNkdx5xB45l/CyBRiP7+IKBJLeqEIW5Fatm7WaYLnD
	WreNQoHgVSUxiG9n/x/l0PoTRYz+pw4QeqgC+yV/KEF8ynG4ZAPY5gZrP6HqlABSln1GTW+5ru/my
	wLXtRoSl752lH5Ejul+KebUIAJSsPWBcDOf6i0jSwQ49dksd3AgZzbB+qRgZ8zBgkVSbd+Cth8XkN
	+RySLwhsJDpzIxYi0pJu1x72ldqYfu4TngrA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.97)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1s7I7U-00000002BBX-1UBD; Wed, 15 May 2024 19:08:48 +0200
Received: from p5b13a15c.dip0.t-ipconnect.de ([91.19.161.92] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.97)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1s7I7U-000000042Uw-0RP3; Wed, 15 May 2024 19:08:48 +0200
Message-ID: <6009464ec0602cbf9e0262d955020438beeda18a.camel@physik.fu-berlin.de>
Subject: Python requires 32-bit alignment now - was: Re: Tuple and changes
 for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: James Le Cuirot <chewi@aura-online.co.uk>
Cc: libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>, 
 linux-m68k <linux-m68k@vger.kernel.org>
Date: Wed, 15 May 2024 19:08:47 +0200
In-Reply-To: <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi,

On Sat, 2023-08-26 at 12:51 +0200, John Paul Adrian Glaubitz wrote:
> > The Debian m68k maintainers proposed building their packages with -mali=
gn-int
> > last year, aligning to 32-bit instead of 16-bit, which improves compati=
bility
> > with some projects and should give better performance on 68020+, at the=
 cost
> > of slightly increased memory usage. The mold linker is at least one pro=
ject
> > that has been shown to work after making this change where it previousl=
y
> > didn't.
>=20
> Not only mold but also most notably the following projects:
>=20
> - LLVM
> - Firebird Database
> - OpenJDK
> - Various Qt packages

We can now add CPython to this list as 3.13 requires 32-bit alignment [1]:

In file included from ../Include/internal/pycore_backoff.h:12,
                 from ../Include/internal/pycore_code.h:474,
                 from ../Include/internal/pycore_interp.h:16,
                 from ../Include/internal/pycore_runtime.h:17,
                 from ../Include/internal/pycore_pystate.h:12,
                 from ../Include/internal/pycore_critical_section.h:9,
                 from ../Python/critical_section.c:4:
../Python/critical_section.c:6:1: error: static assertion failed: "critical=
 section must be aligned to at least 4 bytes"
    6 | static_assert(_Alignof(_PyCriticalSection) >=3D 4,
      | ^~~~~~~~~~~~~

We should really make the switch now. It's certainly not getting better.

Adrian

> [1] https://buildd.debian.org/status/fetch.php?pkg=3Dpython3.13&arch=3Dm6=
8k&ver=3D3.13.0%7Eb1-2&stamp=3D1715773703&raw=3D0

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
