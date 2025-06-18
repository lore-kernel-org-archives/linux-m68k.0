Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08D27FD40
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 12:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249649; cv=none; b=tBEPkL0KRUDcvMw9EvKGxPYM7MXiRvoiMf6hxPg9gaOi5p4C1NrH68VFGjiX+n4uI72M6N+8Hk8DjaiQiZBha+geVZ2QBFk099kC6+TJSqH5kq3Ew3BmZ+frlIf/5C2F/1htHKjR7LdxWB1YG4oQOK+DYiAtfJ1RxQOzz5eYSH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249649; c=relaxed/simple;
	bh=+zYuxIHCuZrdH/jOaiz/hIoMZ4zxFhuqISXE6FiJFR8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CHX+eRKDihBbjPsnGhr35W2UHjDMEg7HhDXrYtAIFW/orN+gAgKm7JoGQbwmAvPR1AWbkNeplnGFkf5RtSvI3VdTuD9H282dDgFRVMGCQ3VfXmLQsTTTwUgM+4Ry6dHkbjkNf6Uyy/ONWY5lD7iVGUmiPF642cJ7DIA/KcBfnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=jJfG2gep; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="jJfG2gep"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4/xsqnDcTeVV9WtEgeLwW8DNs1jigugJGvWw3or1sNw=; t=1750249647; x=1750854447; 
	b=jJfG2gepAswqD5tQSHaZZd6NdE/yB3Q9o6QvMkGWTeGjTh2sdnZawFSNHYMuVBPGn+t9YPQCTWh
	v2BPkrxPGDx64mK4vfWhNipaixc93qgaA8KKwDcThr1laAUHQFaxO1gs8G5UxZDRk0YCigBVBmtOV
	7zt/taaWFYxw4BWB7V/lTO9WaVaM6omMHoGBnjkyp8gX8dZwdrBipi8vpRba/S4hEA9mBisJ0osIx
	VNatwWKxPwsp5QbLto7seEcSfUY8Ade3YeyeJFj+kikph6Ucib9d8PD+LRlGfUZMY0E8NORn6w3LV
	DB6497Eb7YHhuy9hvKS8UeTjXBpmqi7OUq5A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uRrsx-000000013RS-0l3B; Wed, 18 Jun 2025 14:27:23 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uRrsw-00000003zBe-44sd; Wed, 18 Jun 2025 14:27:23 +0200
Message-ID: <6e0e0cf97b77d881b67916889d4b172c5bbdda00.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Greg Ungerer <gerg@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Wed, 18 Jun 2025 14:27:22 +0200
In-Reply-To: <38c670cc-6169-4720-a883-c34df26e1a4f@kernel.org>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
	 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
	 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
	 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
	 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org>
	 <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
	 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org>
	 <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
	 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org>
	 <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
	 <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com>
	 <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de>
	 <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
	 <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
	 <38c670cc-6169-4720-a883-c34df26e1a4f@kernel.org>
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

Hi Greg,

On Wed, 2025-06-18 at 22:21 +1000, Greg Ungerer wrote:
> > Could you please elaborate this a bit more, please?
> >=20
> > Coldfire is handled as a separate target via TARGET_COLDFIRE in GCC, so=
 we
> > would certainly be able to toggle the alignment settings independent of
> > what's done on classic m68k.
>=20
> The net out is that it is the same gcc compiler, m68k-linux-gcc.
> ColdFire just needs specific code generation via command line switches,
> like -m5200 (or -m5206e or -m5307 or -mcfv4e, etc). This is the same way
> you would specify 680x0 level - m68020, -m68030, etc.

Yes, but there is a TARGET_COLDFIRE macro as I mentioned above which could
be used to trigger which alignment to use by default. I don't see how that
would complicate things.

> The bulk of the instruction set is the same. Asm code will look totally
> familiar to anyone who knows m68k :-)   One notable difference is that
> there is a more limited set addressing modes for some instructions.

True, but you won't be able to run any classic m68k binaries on ColdFire
and the other way around, are you?

> FWIW ColdFire currently uses the same ABI as all other m68k, so it uses
> 2-byte alignment today.

I know. And one user on the LKML has already demonstrated that his Coldfire
board booted fine with buildroot set to 4 bytes alignment.

> > In the Linux kernel, Coldfire is also a separate
> > arch, so the alignment settings can also be handled there separately if=
 necessary.
>=20
> ColdFire is not handled as a separate architecture in linux, it is just a
> variant of m68k - so uses arch/m68k in the source.

Well, it's a separate sub-architecture, similar to what's done for sh3/sh4 =
on sh
or the various ARM flavors. My point was just that there is a way to separa=
te
classic m68k and Coldfire code if necessary.

> > It's not really necessary to enforce this on Coldfire. However, since b=
uildroot
> > builds completely from source, it wouldn't even be a problem to change =
the alignment
> > there as well.
>=20
> Yes, that is totally right in my experience. Certainly in my ColdFire wor=
k
> it is pretty much always a build-everything approach via buildroot or sim=
ilar.
> I wouldn't think an ABI change would actually worry too many ColdFire use=
s,
> they don't use distributions like debian on them. (I would love to hear f=
rom
> anyone who does!).

Thanks a lot for confirming this!

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
