Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3F079E1
	for <linux-m68k@vger.kernel.org>; Thu, 12 Jun 2025 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713245; cv=none; b=V8ujMWo+GRTIaO9fHlfFcXmWPCx/EKkW/iuTAWl04dPII4UKKRQoOMv/d662Pl29LCvYtOCH+5VxIBWkL/hRd13GFCWZsb3YWrkevY5O1sKfPc3PSyAvAaAWtVnBc3U3qb/MWFGNrSriJqg+qOUQDLZEfAxjxloX7TyoM3mrFfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713245; c=relaxed/simple;
	bh=EVtjR2PU28HOVO2FJ7v2mI6i2O+D3RxGvfpO+vueC8U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D39/dFH+dxoB+yAc53pSf7NH3ETsdKc+NKyOTtuFyNGzJsvXL4H5Tj41wrnIimn5kk3JOXIRiJeURQIAfEPFZuiV0PY7HLlVavhOeqiwX6eWhzrJdwzEN4SNVf00MikeQHLr9a1yJfkQkGEZEUkPQMJiZa36C+rxyO985d5R6to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=hQRwWyix; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="hQRwWyix"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qZ6gyiOKrm9r3Lh7BNljWD3yMP9x2BmNg9HHa6/P5WM=; t=1749713242; x=1750318042; 
	b=hQRwWyixkNXTQ2/gyXkkm+dtomfrs3YV4TR4lMQobbytZUfNb6wfxjPmFyJSh2z69c2+iV0+wxx
	0JuQ4woWaRnTMzPLH1u/ZPdBCVlZ38iCjv2HQN33aNWB09nbcz3ug6H5X247cFf+DescjribcRj3f
	O9QjIf5NwCdUx7ZVqf9f7OcVHfDU1hJHARDDiBaWL+UCVcCYKWZibziyl/961Bb73wwW8kIZiBM5r
	yWGU1C9w4n/4l30oBy4wlGbuh8rVwTliPL8YVc+TqT1z8aUJDeLwMUuO2nLqvoxNsmqeeKXeRcMFV
	cgrW3w11CfuG2UZBVRaGxL++ud+enZFmhJlA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uPcLH-00000002Yom-2ldS; Thu, 12 Jun 2025 09:27:19 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uPcLH-00000000cgH-1qzN; Thu, 12 Jun 2025 09:27:19 +0200
Message-ID: <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Stefan Reinauer <stefan.k.reinauer@gmail.com>, Finn Thain
	 <fthain@linux-m68k.org>
Cc: Stan Johnson <userm57@yahoo.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>,  Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Thu, 12 Jun 2025 09:27:18 +0200
In-Reply-To: <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
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
	 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
	 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
	 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
	 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
	 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
	 <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
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

On Wed, 2025-06-11 at 20:16 -0700, Stefan Reinauer wrote:
> > Sorry, Adrian, but you can't have it both ways. Either you support smal=
l=20
> > systems or you don't. Debian's documentation says of m68k:
> >=20
> > =C2=A0 =C2=A0 This architecture covers Amigas and ATARIs having a Motor=
ola 680x0=20
> > =C2=A0 =C2=A0 processor for x>=3D2; with MMU. However, the port is stil=
l active and=20
> > =C2=A0 =C2=A0 available for installation even if not a part of this off=
icial stable=20
> > =C2=A0 =C2=A0 release and might be reactivated for future releases.
> >=20
> > https://www.debian.org/doc/manuals/debian-faq/compatibility.en.html#arc=
hes
> >=20
> > There is no mention of fast emulators. Yet that's all you're targeting=
=20
> > now.
>=20
> Fixing pthreads would probably go a long way. That's where we lost about =
half of our performance.

This may be accurate, but I'm again not sure how this is related to the dis=
cussion we're having.

Finn accuses me that I deliberately slow down Linux on m68k when all I do i=
s continue to maintain
vanilla Debian on m68k. Modern versions of Linux being slower on slow m68k =
machines these days is
unfortunate, but it's not something I can be blamed for.

My goal is to keep Debian's m68k alive and healthy and one critical change =
to make to make this whole
effort sustainable is to switch the default alignment to 4 bytes. If we wan=
t have a smaller and faster
Debian distribution available, that is still something that can be worked i=
n a separate project and if
users are willing to help with such an effort, I'm happy to look into it.

However, what I don't like is that multiple people in this thread dismiss m=
y work completely with
questionable arguments and unrealistic counter-proposals when they have no =
clue how distributions
are maintained and how tedious it is to spin your own distribution.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
