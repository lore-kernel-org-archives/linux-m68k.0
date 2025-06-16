Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1680298CDE
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071724; cv=none; b=nVp0PjddBmGiufgRXC8ZFTBqDkO2Ue2VHfCzTIn9VfMLz68THwBPUERW9FeElrd8qutt3kw5U5i6AhDy+88RDBBQkzGahI9nxezuOwn4c/kzpba+h7itEuE9JU74QsmbOSXBcLNf7fn4aSJE9vfQLj6VyeOWQdV0c4kQdZZqFaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071724; c=relaxed/simple;
	bh=sWh6DqC2sBxhCvjWW698GGsyaX4pwv30vZSEDMWCuoQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gPDVZYS4UekUTSbB0QLypoV6Rb+1lXKS0cLfXNin4oihrYg+FjbefiKXCzmO71d3OVsRTuxe8l0KVVyoDxPHGSCfumZjqow+LvwXpFVyvubr9AKD14wuyFpdRr7JuJC1Rufivcc2LIdvASGqOckGHl+hHmm5r/nPzx5R+AzKfoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=JUPGhFxp; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="JUPGhFxp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RpcTvCaPbjzd85SI2f9BWJOocSu5hR1BiS3nr/+BGkM=; t=1750071721; x=1750676521; 
	b=JUPGhFxpLU8va0xrJi1kZ1iEdGSZDjlN/jn+y7qgU7xIAtQVMT2a1UUjU/R3n5B9DXQrsoxYz0y
	FAOchRPgOC+XtJ7LAeauhIq1tpYJkS8LC8YIbTwtAt/qYzDzyI/xWyiVrjpL/jEQVGfQifDOVXUnb
	QdBQiBXz2c1hrRHYej3UJdhbAwVRn8h2afi4tf0xV0dNP7iG3mFSr86rwHLg/8J/ddY3CRBCjZZOl
	dZPT1u/RKJZQx5tOIU+LzTzRY1zHCWOj5+AC09V8Ciewg2nXLcjY9MPtlBGRNpJdKUH/kAZ/coIeF
	/4cHjdrPTR4H38es9nBHSicK+GPx9XSCF7lw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR7bD-00000003d4m-1qOR; Mon, 16 Jun 2025 13:01:59 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR7bD-00000000APK-0thc; Mon, 16 Jun 2025 13:01:59 +0200
Message-ID: <f869d1238c15875a29f4cdf7569c176ba81fd6c4.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Vivier
	 <laurent@vivier.eu>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 13:01:58 +0200
In-Reply-To: <CAMuHMdUH3zfrxSV9UqxnG1dEnHA_SmeYVsmKzV3kzYq6TLnucg@mail.gmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
	 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
	 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
	 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
	 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
	 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
	 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
	 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
	 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
	 <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
	 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
	 <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
	 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
	 <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de>
	 <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
	 <CAMuHMdUH3zfrxSV9UqxnG1dEnHA_SmeYVsmKzV3kzYq6TLnucg@mail.gmail.com>
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

On Mon, 2025-06-16 at 12:07 +0200, Geert Uytterhoeven wrote:
> > I think you need to change the ABI type in the ELF header:
> > https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format
>=20
> Interesting....
>=20
> Does any system actually use ABI (byte 7) =3D 3 (Linux)?
> All of amd64/arm/arm64/ia64/i386/m68k/microblaze/mips(el)/powerpc/risvc/s=
390/sh/sparc
> seem to use 0 (SYSV).
>=20
> #define ELFOSABI_NONE   0
> #define ELFOSABI_LINUX  3

Strictly speaking, a value of 0x00 indicates SysV ABI [1].

But maybe we could use 0x03 for Linux/m68k with 4 bytes alignment.

Adrian

> [1] https://en.wikipedia.org/wiki/Executable_and_Linkable_Format#ELF_head=
er

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
