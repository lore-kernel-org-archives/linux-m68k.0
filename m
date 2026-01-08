Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555842BEC41
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 23:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767914196; cv=none; b=IdHSF1fb8MmHlDfzoNG5f+ALhvqvGOW7s3lap1JMRnQ8rm01FmvGIQIMER2JMkPRlEj4KWGM1c4h2bOqbvTjChyIwJyrORt0AnXbLuRg5Mp+65o62NiAgSi6tC3rFYpVXLgLAzkIgvchxtsq+RskKAPKxTlI/CtTaEAiRKweaGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767914196; c=relaxed/simple;
	bh=elVKQORFK7IIB88lBfAL2n8n1/nKX9kuRZY8S9Nu+Ys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oteSxXqpsKeWFKNjyeOhl76W5PcHLqKAZX4UHneJN2dCxSVV9YWpQesW3eomj/QMOdAO/KfKh4ob05nV7M//rJ7rLadggfIK3veDkZkPBSvYnHFoFALiJSwG3Z5gLDgKFgipncXkOF6QHZqSKtWROYTTfYxGlqPa/pF/nvjX7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=XWKEwS9a; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="XWKEwS9a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=YAaF0arvrsQT+/UKjpHg6mOPsFjVs67jt+B3f9LOzIU=; t=1767914193;
	x=1768518993; b=XWKEwS9aCe0yEyUTvpsv/zswLRAZANoSOEjWyC4kHmqPniB6X5PQTQXLenQD5
	M/tv3agA0G/akWvdI28PIEOXbXL0fsIU00LjVD7a84Q3vDsFwq0fq0sFQhz0iMw/x8AcdjZCJGG92
	8tLvYzOeJgKbbgFkw4LzigFCq/+uVF9QonJ7/7laW+EqrFfBl0SifS0wNPRTvAANJwbFjNgPNcwjy
	41DOvmFw8ipjSQ7tSstnE1djVDhFmeLxwA5mWGGVmRVTc9Q4Gt2qYKIBQDun5PG3z8qTV/mgQtsEO
	xQz9cXFaYIbxqMvP/1YUk2nzaSnPOCMem5/pgKbm+j1pN4xAiQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vdzEv-00000003Z9m-2Uz3; Fri, 09 Jan 2026 00:16:25 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vdzEv-00000000hOp-1XDf; Fri, 09 Jan 2026 00:16:25 +0100
Message-ID: <c68424f1589a2f666f643c7dfc4268b3c8e06068.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 4/5] m68k: Add vDSO userspace clock_gettime64
 implementation
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>, Stefan Reinauer
	 <stefan.reinauer@coreboot.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Date: Fri, 09 Jan 2026 00:16:24 +0100
In-Reply-To: <7b9db499-6dda-551f-a1a7-97740503cca3@linux-m68k.org>
References: <20260108060533.3891380-1-stefan.reinauer@coreboot.org>
	 <20260108060533.3891380-5-stefan.reinauer@coreboot.org>
	 <3252e3e6-5eb4-3cba-9113-09e3febcc953@linux-m68k.org>
	 <CABq5eXHitcC-zWkYNVi0zCvqpo-y1BBNUDU=6HtZWES7VBY26g@mail.gmail.com>
	 <7b9db499-6dda-551f-a1a7-97740503cca3@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello Finn,

On Fri, 2026-01-09 at 09:39 +1100, Finn Thain wrote:
> How much of it is AI generated?

can you please not treat contributors like this? This is not okay!

I'm always glad to see people contribute new features to the m68k
port and I would appreciate if reviewers could be welcoming to such
contributions.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
