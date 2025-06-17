Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7028F2135CE
	for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153738; cv=none; b=JtO8SwhTYJr9qG3QywCdDEbGn9nw6syrR90gpsWmRe0c+TsYe2JPswRmNx5hrQWyuPam1ZEr7HmG0TJGPs25yjwog9nxOMVX5ybe/kTchHpR8MgNh5G49YLoPJHJHj78XSZ4eMVtDDXRB+pudJqHGPOMT8kX0UVMyYCZYguXIYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153738; c=relaxed/simple;
	bh=Ldrk4zWsQq9rVz4rq/aW0Rhv0RwFxLyafYbRERLHwzs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t3/Lco6VvaI8LdgKNofTf7IHILjpRnSJkHVGZRBHT+Geyd8y+6Gn04NtTYR9kQa1mxDyN0fe9un3edDCW8rj3wUZ06YThLSVFzlUCFsY4IQ3z8K9mhVEkvf088QSOWtD8ct43iw3AKNQjlRpUazcXHf1Z8vncP9OOA6V0+ysunU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=oEFbd+Kz; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="oEFbd+Kz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Zhg+iWBLJLONfHKhcj3EtUo8JG2DaNekqmBeTrFHvcU=; t=1750153734; x=1750758534; 
	b=oEFbd+KzY0atKEIy2dVMY3oJLkcC3yzZCsaPigJzIjCealm+BUY1UlZvsL1ZfeXwE3/la421Rj/
	gJslTvmSR8oKXaqfDrkARClzA+YF93AYL5KWHpGK1I4z5WECSzsOxY/wOJw1y1faOTxKK6c1OZZ28
	x5Lrffg1SGzuWQXKSkYTOn2kXsVRPyw6Cn2Gz7c7nUs8qXpoauE67pdIqaztHzRsCJc8N/bw8H7jE
	Xfrn7IpICT1T6lENb5tGLmFJJ6TIVSmd1U/2o6QA+MURLoVjrFWoyEEW3cpjhLSJgGvtLwTuRdwsb
	E/jUIgxbICpAJmWvsT/tIANjXXKIG0YVZJCQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uRSvu-00000002quK-23sn; Tue, 17 Jun 2025 11:48:46 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uRSvu-000000003N1-14NE; Tue, 17 Jun 2025 11:48:46 +0200
Message-ID: <dd408059d1861b055623386e1b8aac5c5bd53e49.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Klos <john@klos.com>, debian-68k@lists.debian.org, linux-m68k
	 <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Date: Tue, 17 Jun 2025 11:48:45 +0200
In-Reply-To: <CAMuHMdV6zMWPOD_t0HoWgJDeGJardpqKgbZb9+HLCJZPsp-yCg@mail.gmail.com>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	 <8734d1kofn.fsf@oldenburg.str.redhat.com>
	 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
	 <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
	 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
	 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
	 <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org>
	 <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
	 <CAMuHMdUznJ3Zm9JnhLG4MmEO1WODL0bddwN4rvO-eTdVUDzFjQ@mail.gmail.com>
	 <bf1e84c20996f003645a182d46535758fea10b74.camel@physik.fu-berlin.de>
	 <CAMuHMdV6zMWPOD_t0HoWgJDeGJardpqKgbZb9+HLCJZPsp-yCg@mail.gmail.com>
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

On Tue, 2025-06-17 at 09:40 +0200, Geert Uytterhoeven wrote:
> > What's going to happen when Rust code becomes mandatory in key parts of=
 the kernel
> > and then we're unable to build it because we insisted on keeping the 2 =
byte ABI?
>=20
> We fix Rust? ;-)

What's keeping us from creating an ABI v2 using either e_ident or e_flags f=
rom the ELF
header so that we can fix also all the other packages that don't work like =
Javascript?

If MIPS can have a plethora of updated ABIs and even POWER got an ELF ABI v=
2, why should
that not be possible on m68k?

> Is this a Rust issue, or an LLVM issue?

https://github.com/M680x0/M680x0-mono-repo/issues/10

> In case of the latter, how does llvm-mos handle this?

llvm-mos does not build natively the 6502, so this is irrelevant.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
