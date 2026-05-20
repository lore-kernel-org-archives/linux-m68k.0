Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611383EAC89
	for <linux-m68k@vger.kernel.org>; Wed, 20 May 2026 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276031; cv=none; b=TQWmSG50d89trLCD7QEZPTgdlX2y4Kz6bvm0p497SduJjyK0xk/AAUAbLtdOMzu7cbe3WXSIn+so9W2QVE3tvIrMAwBm95zAHZdfHhX+JKlrEBH0lsQoD3SOOHCxns9UWFP5qzXYbMGjEp5on/qNdkXrxCXnpe+ZE5L/D5MImbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276031; c=relaxed/simple;
	bh=FllvfJAS1gyU4r3tIFTz0upre4Bk/KdbJF3/rt4bEfQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OyiK/aEssF1fG5ELtFy6A0x+InHUoPRISSWj/z/V59vbigzHC5Y9hh7R/ME5R1vpBHAQQejjExwHnVWwevGsQYT4NFNmsO5Km74PHQhH0D+f5EhoiuJ2DoqyQqpMhXuM2Utt2PqDh+OgAd4panQjR/UeztobLqzZuY01cP8TGjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=iWJYZQQy; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="iWJYZQQy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=EvLrcH9x1V4yewPnOOWYv8WPWOnvNw+MHFA4tkLv8O4=; t=1779276027;
	x=1779880827; b=iWJYZQQyx1iNF8otFBlRVuxVJKXUna47lcKK5J42yXtVtaAvW4MWl9jb7Q/IC
	MwxMwbBJz7uuoa2MyWVnEwrwk7mjrAK4IKLo8dRdwzgBBMhu7uSS611f3Kd1mqegibArUmdREBbVm
	m2fU8bYAmUayK3o3p5si3/YgmICTX0Ye/hMjwLepeV/cEOTe2NGRqQnLPaIyJJyO4mo85OM4aQzzh
	C+8wRY7twf0NsPJAjqxlvm07GaI/bNBhsFeok6emPyDo+1rB1xuW8h2ZZfrFIefTwgORRRvYDqt7E
	ID8g2m6Ide7i0l0TTtLthMFZczoOfiSOnb748CjUCqHupi8RWw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wPeyP-00000002JB7-1iKf; Wed, 20 May 2026 13:20:25 +0200
Received: from p5b13a134.dip0.t-ipconnect.de ([91.19.161.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wPeyP-00000000bwR-0pXG; Wed, 20 May 2026 13:20:25 +0200
Message-ID: <fb40846e9f991895cda16deb7ea7cf7c02c84458.camel@physik.fu-berlin.de>
Subject: Re: First successful cargo build - Re: Summary on what's blocking
 full Rust support on m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: noloader@gmail.com
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>, port-m68k <port-m68k@netbsd.org>
Date: Wed, 20 May 2026 13:20:24 +0200
In-Reply-To: <CAH8yC8kmOL39PKZBk=JK4GbjPR6WcAUnr3JGCjN3aRKOtmJ6Dg@mail.gmail.com>
References: 
	<29d725b5647c176b8cef0d3442d1b3440e6a1a9a.camel@physik.fu-berlin.de>
	 <6efb67b12fd971c6d38a692d7b391ce4a75b0f4a.camel@physik.fu-berlin.de>
	 <e6e99dd2a47881aaf34ea8d1dbc5ea8d6080c1c1.camel@physik.fu-berlin.de>
	 <CAH8yC8kmOL39PKZBk=JK4GbjPR6WcAUnr3JGCjN3aRKOtmJ6Dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Jeff,

On Wed, 2026-05-20 at 07:08 -0400, Jeffrey Walton wrote:
> > I was eventually able to build cargo for m68k-unknown-linux-gnu:
> >=20
> > (unstable-amd64-sbuild)glaubitz@esk:~/rust/build$ file ./x86_64-unknown=
-linux-gnu/stage2-tools/m68k-unknown-linux-gnu/release/cargo
> > ./x86_64-unknown-linux-gnu/stage2-tools/m68k-unknown-linux-gnu/release/=
cargo: ELF 32-bit MSB pie executable, Motorola m68k, 68020, version 1 (SYSV=
), dynamically linked, interpreter /lib/ld.so.1,
> > BuildID[sha1]=3D7e5bf08930f87b9eaee173cf163b067f620cb841, for GNU/Linux=
 3.2.0, not stripped
> > (unstable-amd64-sbuild)glaubitz@esk:~/rust/build$
> >=20
> > The binary runs on m68k but there is no output, unfortunately. Needs mo=
re debugging.
>=20
> Congratulations!

Thanks!

> I'm still not convinced Rust can take over the world.  It has too many
> poorly supported architectures and platforms, including m68k.  Confer,
> <https://doc.rust-lang.org/nightly/rustc/platform-support.html>.

Luckily, there are projects like gccrs and rustc-codegen-gcc which are aimi=
ng to change that.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
