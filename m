Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8923C2BF001
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087036; cv=none; b=iFzltYJ1H/Ln+WFSpw2iSkNZ9VOVESid1bLVdEc7jN0rmXbw+aYmxg+NOD3XISyuap8ObCWd1PKQRORuf9OL1CjVrwWIBR0DJa9lSvAwdakVKV6PHLO2LFfOs1jPacvTECXq9x+2/Q1mi7exSATFk4135GyhpiO17Ghka87Jeyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087036; c=relaxed/simple;
	bh=juBoJSbHb8kJX4tgyMxA+B7SXmKzhJEFMfReJ9AVAOI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gFpJYveoDb/1OhulJuYFKmkRFl4WBvtH3YyboBvWhvJkDGbz9kfOr/DIjyIz7wxCmp6f6C1WrwGC9nAdDB7Xaq6s5h1apiW9wS4eNUp3TOrPYh32ZlJoPT1H3fDkd5oS4HBubk/0r0IYASyR7GTxGLatByLutztx8rIJwDXIOis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Fh/ijSMb; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Fh/ijSMb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d0z9LZCKvEjG91pHngpMU2cWAi14wKA+dpKzwsDTzLY=; t=1750087032; x=1750691832; 
	b=Fh/ijSMbe4ZmsGyNs5IkoG9bdJWSaDkBDShT41J980ISQXZuKd8My25tm3v9W3lEI2FV2w6Oeph
	mY5UYxOV+YOdXDZcaezvxSELpGQ2qM40E5BShSvby+Zdkhb1dOnhiTBTVefkd0y9VpAJ32Frq0R0l
	xXAKKWLurNjGQtgaYAU8fDS0WU44GZg5WTWour1XTy0aHDCeNw1GgSZMuNtqRwZRlDykG5LWwInJh
	7gBP/FJQTNuZRyN3+dw9P+JQWiyqEf5pr94XC84LwNvZfeuDt+u+8sG3q9k1X2s0QqKQ9SphjIsCj
	laMB189bfbUs5wZQCty8RHltH+8OFA7fV30w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uRBaA-00000001cNY-17Sk; Mon, 16 Jun 2025 17:17:10 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uRBaA-00000001Bg1-0DA9; Mon, 16 Jun 2025 17:17:10 +0200
Message-ID: <035f9f778adf10131b026d9d215c6248a75cf88d.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Jason Thorpe <thorpej@me.com>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 17:17:09 +0200
In-Reply-To: <758E94EA-113D-4FB4-B5EF-1203FB67F520@me.com>
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
	 <758E94EA-113D-4FB4-B5EF-1203FB67F520@me.com>
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

Hi Jason,

On Mon, 2025-06-16 at 07:43 -0700, Jason Thorpe wrote:
> > On Jun 16, 2025, at 2:10=E2=80=AFAM, Laurent Vivier <laurent@vivier.eu>=
 wrote:
> >=20
> > I think you need to change the ABI type in the ELF header:
> > https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format
>=20
> 4-byte alignment binaries should have ELFOSABI_SYSV (0) (since that ABI s=
pec
> is where the 4 byte alignment comes from).  If Linux/m68k is already usin=
g that,
> then those binaries are broken by definition.

Unfortunately, that's exactly the case:

root@mitchy:~# uname -a
Linux mitchy 6.15.0-rc2-virt #1 Thu May  1 10:27:28 UTC 2025 m68k GNU/Linux
root@mitchy:~# readelf -h /bin/bash |grep "OS/ABI"
  OS/ABI:                            UNIX - System V
root@mitchy:~#

> Let=E2=80=99s hope existing Linux/m68k binaries are using ELFOSABI_LINUX =
/ ELFOSABI_GNU (3)
> (sorry, I don=E2=80=99t have any handy to check).

hppa is using it:

glaubitz@panama:~$=20
glaubitz@panama:~$ uname -a
Linux panama 6.12.32-parisc64 #1 SMP Debian 6.12.32-1 (2025-06-07) parisc64=
 GNU/Linux
glaubitz@panama:~$ readelf -h /bin/bash|grep "OS/ABI"
  OS/ABI:                            UNIX - GNU
glaubitz@panama:~$

> If the existing binaries correctly label themselves has having the Linux-=
specific ABI,
> then this is trivial and there=E2=80=99s no reason to use a note to diffe=
rentiate them.

I don't have a strong preference as both of them are used in the Linux kern=
el.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
