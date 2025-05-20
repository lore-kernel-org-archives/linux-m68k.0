Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A447F20E6E2
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727753; cv=none; b=IVkzAvkr+bflpHCaQOMXLM9XuuvcpCzOutPjRqpWnjo5PhsVcRplA6V7wx5VSFTnc11l0biJhFDB4tyP0Bnxm3ZVA/9CAD4o18qpS4Xpgj1EtZoGTblfE2N28XMr+VREOwnwl3cI6faCdoA6yTZLQ6wAxRARBpeCRIuEIzQGi8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727753; c=relaxed/simple;
	bh=+pqwrSHj8ZNSC++7KRVrLLyf5rYikoLt3KD2cy2OOJ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vp0RyBrR8gbqmDjMlqExf5mYy5epUbsRNa6OIbf29QYnkRCQJV2WT3DzYnkDQN4+o2TlhVAM1qmgNt0qOhElFjrJTjd8F1/6+lgcf9sLQEt2ZQDVP8PfqTO1pUEydLb5eUoBbRxvO+cADScZbVF164kQYIV2ELxC0TlxEOZriuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=dQYNy2yT; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="dQYNy2yT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=duCX+HYNkVkWvpPfIcbWdNS++XtYEHICtL/7A+X3ABo=; t=1747727749; x=1748332549; 
	b=dQYNy2yTFJQPuBJhmGgLJXjtOnOp9MsksUDB2iGczCN3e7+JHLm0kcjzT43o3CGbN1IfcAcy6T/
	a1ju6N8/ONClYiuKSKyLAn/L6ut7ecQrY5pOrM2YBs1rZTgUW12WmnjeljnOqxXYNot2mVg/rGH9X
	C9ekBiuhNyWbVkU2uBCqJafgawtzdKcLBX17cE1obVuDsTDsgHOH3hK2mN2yhQnpvHw98ZVQY4Vqg
	H8SFoGntETCCXk6FYahsKTRi/EDtPHbaWoiGUOZ7hxVOomld0aVjVKeerynkrVGjw8qmocrSsQJpI
	ASl89sg1yuN759eoSWrF0rpE4zp3rwy9pu+w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHHp5-00000003xiW-0xEG; Tue, 20 May 2025 09:55:39 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHHp4-00000003Y1p-48ih; Tue, 20 May 2025 09:55:39 +0200
Message-ID: <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Florian Weimer <fweimer@redhat.com>, James Le Cuirot	
 <chewi@aura-online.co.uk>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k	 <linux-m68k@vger.kernel.org>, Libc-help
 <libc-help@sourceware.org>
Date: Tue, 20 May 2025 09:55:38 +0200
In-Reply-To: <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	  <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	  <8734d1kofn.fsf@oldenburg.str.redhat.com>
	 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Tue, 2025-05-20 at 07:59 +1000, Finn Thain wrote:
> On Mon, 19 May 2025, John Paul Adrian Glaubitz wrote:
>=20
> >=20
> > My argument is that Linux/m68k is a pure hobbyist project and anyone=
=20
> > involved can deal with the changes coming from the alignment change.
> >=20
>=20
> If hobbyists can deal with ABI breakage, they can certainly deal with the=
=20
> longstanding lack of fancy toolchains and toolkits*.

Being able to build the build dependencies of cmake or parts of GCC such
as gccgo is not something I would consider "fancy". Furthermore, more and
more packages are being ported to Rust which means m68k will either die
a long death or have to switch to 4 bytes alignment.

> But you're being presumtuous. Your hobby may be the porting of fancy=20
> toolchains. It's not mine!

I am not asking you as you're not involved in maintaining Debian/m68k.

> There's no such thing as a "pure hobbyist" Linux port. This is a=20
> collaborative effort. Debian/m68k needs corporations just as RHEL needs=
=20
> volunteers.

Can you point me to anyone else who is involved in Debian/m68k except me?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
