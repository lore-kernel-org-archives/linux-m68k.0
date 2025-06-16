Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E152E427E
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076506; cv=none; b=mzwsQnQ/hk7D+/bcsskhP0JYwdoisq8kOcF62brReD1OYTWv+MyVwz0XzfikPlOby/e19sP6xEdjybSdkZgeQM8d97PXpf/BH6wTbU0jCkzeanL10qfuTokYE5ho1Trbo3bHJTegbaeHYdGWf5uMLQZpyo2ZnUTPhzCyyJH8bQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076506; c=relaxed/simple;
	bh=1uYnpoqFvIO3WAfyooDrAXh7y+jdbMGuXiGihf+iRMc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IfsXrErFk8zd9F2Da7GFctbk/QL20uuzW/GCbWEaO2Z3jqJ1iaWx1VkUjHVqHj+oXbj1uL4LbnCgHiknN/iP6PTAa1+TUH6k7L3QhugniUoPWJjRfF4EnkA5Or7mUp9LRPlE7dXmy4sdaJfFVy/QnWH4767CXb1mQSMSiNwxBXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Y5Dkaw+x; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Y5Dkaw+x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z8TIpB3THzPdg8SiSouqn62NnNWI2gfdlLlIlQSYHIs=; t=1750076503; x=1750681303; 
	b=Y5Dkaw+xdx9T63j2c0xDtL8pJEsGcHqQOjv1v2mccD52qN94/eKrtaYDrHa3gRXIWNaCE2ireyw
	ymE6faEiQ77/SC8TT3GzzGkajDEKeZWKbxSyBn348smwXX9cru2+LClqBLxLQjuQyId4FJaNkQ5Qt
	GGuMVBxjoH2mYY/ZVj88LqtAJIqNNUFv3bjXhZEXR4pmrktSyQHOaCRSJXm9q8KTMvFm11ViYpJDR
	vnPeY8eJsWlU56ZX9VDfYOFGzUAMZejJBmuzi8IJV8TYRcfmQzjZ+gJfi58jT9/CZtCJlO5Ez4IxY
	K4qaolJM3c1rTVYjTqDr9wZ1X87rrxyfPcSA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR8qM-000000007Fn-0Gob; Mon, 16 Jun 2025 14:21:42 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR8qL-00000000Uv4-3Zhy; Mon, 16 Jun 2025 14:21:42 +0200
Message-ID: <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
 "debian-68k@lists.debian.org"
	 <debian-68k@lists.debian.org>, "linux-m68k@vger.kernel.org"
	 <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 14:21:41 +0200
In-Reply-To: <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
	 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
	 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
	 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
	 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
	 <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
	 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
	 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
	 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
	 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
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

On Mon, 2025-06-16 at 13:54 +0200, Geert Uytterhoeven wrote:
> On Mon, 16 Jun 2025 at 13:48, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On Thu, 2025-06-12 at 08:25 +0000, Administrator @ R=C2=B7V=C2=B7E wrot=
e:
> > > Thanks for your great hard work and efforts to mantain the various an=
d now
> > > considered exotic architectures running Debian, Adrian!
> >=20
> > Thanks, and you're welcome. Unfortunately, some people like Finn and Ee=
ro don't
> > appreciate these efforts and seem to think that this all comes at zero =
costs.
>=20
> Please calm down...

I wrote that message on Friday. Odd that your email client claims it was se=
nt today.
Besides that, I would like to point again at what John Klos wrote in reply =
to Finn [1].

Adrian

> [1] https://lists.debian.org/debian-68k/2025/05/msg00051.html

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
