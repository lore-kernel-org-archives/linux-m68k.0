Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F322B275B0E
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816051; cv=none; b=oOfkmOZPxZgLyWX+iKzkZiPGGc6GhJDL1i2wgB9YkdIeEG/feW1QdnO2NPj00yecfMusEsNqoi2/yCxFop0pzV4l0OdoNuEQybzUmkGN89iZUIJ+ysIJDOyY8+jkqH3VL9WHSv4J+ucaWJB0tPGnY+VWEvlt0zHqbSQvhTjnVS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816051; c=relaxed/simple;
	bh=u3DY+STntzpH1QeYi37a+fHTyCiUK48yVFpPSW96UoE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZjQ9/31V326kAob8qqxFf3XuSy/MhOD6jMRco1ext/mPaaHI0+pci40Ga4ULAWZScJy1+S2v6VgIWB2zFe+hYFm8ZCaRzt0QcsU4WM/n/4Y2j21J9Yt/1MilviPAW/1/MHZprdUMaGZflU8UGtzL3jZH0SWkl22QtWhr5nbIzrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=KSXMzvtL; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="KSXMzvtL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dxvER+WMyMGA3ldEfdZszbpfCjCrD2Fuxe7sbrqrQ3w=; t=1749816049; x=1750420849; 
	b=KSXMzvtLTDauxzMhPr6wI000mRYIGatezEjfnanA8cMLWxjSx5voN2gE3zvdGrjKdNof4jhohDm
	3WSzznH8LUd7AKzIwqUSrYul89f6NV69lh0X6s1skJws6LUTM61nEgdv+mbooO2dMwvHtMm2jT62w
	mZMo4Q8Zqr+LdWbsNhNJ01jcr/Az+KW20cBBQfCzeTE0mJIPNJjDGgg7Fc0fPHR4LLYGscfc0mjmm
	q2Ci6XdFg/JT271SQd6MH39uoxIcEEwGJL43rfpAkbynjMli/pBn5wiN6zsYGowoC7D2Rwx0U1Axe
	ljkKYwu89dO4rSAcSED4LERY+zMNuyI+sJIA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQ35T-00000000pPO-1H0e; Fri, 13 Jun 2025 14:00:47 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQ35T-00000001fHZ-0IMV; Fri, 13 Jun 2025 14:00:47 +0200
Message-ID: <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Fri, 13 Jun 2025 14:00:46 +0200
In-Reply-To: <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
	 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
	 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
	 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
	 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
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

Hello Geert,

On Fri, 2025-06-13 at 13:55 +0200, Geert Uytterhoeven wrote:
> "The official(!) ABI"...
>=20
> Official according to what and to who?
> There are de jure and de facto standards.
>=20
> There's a lot of discussion and talking next to each other about
> "the ABI", and which ABI applies to what...
>=20
> The SVR4 ABI applies to systems claiming compatibility with SVR4, which
> was (AFAIK) never a goal for Linux. Before that, there were other ABIs
> used by various UNIX systems (BSD, SYSV, ...) and non-Unix systems
> (AmigaOS, Atari TOS, MacOS, ...).
>=20
> From its inception, Linux/m68k used an ABI compatible with SunOS,
> which dates back to the MC68000, and was probably the most popular
> UNIX OS running on m68k at that time.  Several other UNIX vendors
> followed a similar path, starting from the MC68000.  E.g. the HP-UX
> Portability Guide[1] states that HP-UX on HP9000/300 (based on SVR2
> at that time, apparently) uses an alignment of 2 bytes, too.
>=20
> SVR4 was an attempt to consolidate the various flavors of UNIX at
> that time (with BSD and SYSV being the two largest flavours), and
> "rebooted" the ABI.  Binary-compatibility with older versions was
> ignored, as the UNIX landscape was wildly differing anyway, and
> people cared mostly about source-compatibility.
>=20
> Linux has a strong history of not breaking the ABI between kernel and
> user space, so changing that ABI is a no-go.  What you do in the layers
> above (in the kernel), or above (in userspace) is something different...
>=20
> [1] http://www.bitsavers.org/pdf/hp/9000_hpux/7.x/98794-90047_HP-UX_Porta=
bility_Guide_Sep89.pdf

Okay and how does this now fix the problems we're having on Linux/m68k?

https://wiki.debian.org/M68k/Alignment

We're compatible to "fails to build from source" now. I'm not sure how this
is any helpful.

I'm not sure why several people are contributing to this discussion with
the argument that this change would break the "Linux ABI" when the Linux
ABI is currently broken and doesn't even allow for Python to be built witho=
ut
further modifications.

What is your suggested alternative? Do you expect me to patch broken packag=
es
into all eternity? If keeping 2 bytes alignment ABI is so important to so m=
any
people, I would expect proponents to come up with solutions.

So far, I haven't seen any. Just arguments why my approach is wrong.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
