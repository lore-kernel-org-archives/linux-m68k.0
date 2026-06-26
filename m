Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1793CE0AE;
	Fri, 26 Jun 2026 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478279; cv=none; b=WN8qH/2OpPzUsgxgfT6xMFqvSWNEPTls052M4TfNN1IJcreNNx8/okjVSauJsERbZtYS/sy0nA6JYnpdpzIxoPHq9SRKsvr+qhksFq5rR3NJeN3m/ivgCht1brgd061jKVdZDDmXqM6sL6za+YpudtDSc6/+tSTO8dVCT4b4eGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478279; c=relaxed/simple;
	bh=0yFoc4YeCNdDric2MGPzDbpJB+xSzHlLNE22CI6qqpw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JQWphLcASs1gG1haO4StgPCSPcJcWlN0HBrjolcMMwNvE1XCyCmya47sIIMsHyncgUWR7SvmTrgiyp/FSJQuwtV7E6H0hVe4SaX5tbmPvcT7OAG0dQUmIt3BS0ZugNPMT/mPQpRRNsuGKlQB2Pl5lJ3Xyz7x3PzYbtuCcP/m34s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=IM3Rwj8c; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="IM3Rwj8c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ghouvexSU+ZTHxpGv1CIbHZsQbddQbbz9NyHvszJfpo=; t=1782478276;
	x=1783083076; b=IM3Rwj8cKurNwzmU9FMIOQy6lUPHOMozF+kedMb5/dkxXlSwLBEqMvKl4Npgh
	zWYQ5dygNCjX3qo8+kh2+JtUYhgg3pbtrAq+TfYRaRU8mVW8Pvm4e5CVMFvLzeNz/e0j0B7Ax+YBa
	R34fhju3YpQPsafpjZFyiMCXBqLjN/R8Xqh5gQC4tVtInPyuDgWpZ4cO/kmAwvPH5Xi/7VuaEvk60
	cDaXDYe1b/n+WRBml47fCfN2IEASvlHUovrAmrME+KvpIeNx55mNuMWsgcaavcuaLIgAal4SQW7kF
	Euvn1D9QN2WO3Ghw9aRzjjrsCuIZNz1l3r2oP4z+2x945rj7wg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wd5xf-00000001BgN-2JYD; Fri, 26 Jun 2026 14:47:11 +0200
Received: from p57bd94c1.dip0.t-ipconnect.de ([87.189.148.193] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wd5xf-00000001p2N-0t9z; Fri, 26 Jun 2026 14:47:11 +0200
Message-ID: <6b9f05356a9ef6460cb9358ebffd932fd151a66d.camel@physik.fu-berlin.de>
Subject: Re: m68k: 68000 port for megadrive
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Daniel Palmer <daniel@thingy.jp>, linux-m68k
	 <linux-m68k@lists.linux-m68k.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date: Fri, 26 Jun 2026 14:47:10 +0200
In-Reply-To: <CAFr9PXnh7cxzLYpkxXDx9UVrxZmywmbByU386XdijAtVKECzXg@mail.gmail.com>
References: 
	<CAFr9PXnh7cxzLYpkxXDx9UVrxZmywmbByU386XdijAtVKECzXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Daniel,

On Fri, 2026-06-26 at 21:35 +0900, Daniel Palmer wrote:
> I'm not going to send patches* for this but I thought it'd at least be
> funny to someone.
> I've used my DeviceTree enabled version of the 68000 code to do a
> quick port to the megadrive.
>=20
> https://github.com/LinuxMD/linuxmd (screenshot is near the end)

That's super cool. Would be cool to have this upstream.

Reminds me of Yoshinori Sato's Linux port for the X68000 [1].

Adrian

> [1] https://m68k.info/#orgd02810a

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
