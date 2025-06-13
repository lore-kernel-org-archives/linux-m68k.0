Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E43D111BF
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821601; cv=none; b=pwvXHUa9xLYZisL8mV2BVY9eRGbhae1kumdCipRdWXSTVwDiER2/fKpyYFItvUDfWHDyjAw2laO/ynniDjLc7pZlkeWUqViC4WqXsYhrT02J9HgKDvOINfNzGEohTdQsWMrUhXeDaomG1CQ4sA0axhG8jr9okLiVDAxu666WLnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821601; c=relaxed/simple;
	bh=+oI3lZsZLPtpX43d4Sy/VcNg1WVzfOs1BQiUk/LyPa8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cwHJ4LsTamV8/SCQUTDTXbzuBvf1M6Aej6FLZzRsFt6F5mIEBOFFa4FtMXpnR59piGJgcfMdsuwrZZJurOeMawhvXLbkZfFDoBCrD+eEkT71r+tVNmm/LbeLBmiQz1N8309Y3Us5ezgOUvZ1ySI0I0r/M7MiZZxuf8tmN3WF5oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=HTv9ZInY; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="HTv9ZInY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EEO+BVIQu4Prug77mVWW612v4qYH22537W0/ULMqpas=; t=1749821598; x=1750426398; 
	b=HTv9ZInY5M/6feENvDCOVoZHoLxE/xD9JYaVSArtVq1/ynQ0eY2X6L5V1H0DCY9Zs9BxzAMJuPY
	XqxkI2SEbDgpfFVw4A0EZtIgWco4xhHKvL++VYrB8hd6npfMc9wyPtnlKRgJGeSyi8rr1H3vTNwVg
	xgbBYeJcAbiYRuZREzCDL6AgTZIgxeue908OXodB8aRe3WLwr7ousbBIPFQr0OExLtGgS2ZXNdtmY
	AI1rS6YRvs7oYCV0pNYm7KG2pA/h2ZV1E4zZMhcvQN1WNidD3hQGx5yc9fiDO8NVZhfGU21Guo2sa
	bCCeKNwDDUKxcazvtvAgzoOrmwOmoG8sOZKw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQ4Wx-00000001ORQ-3eCD; Fri, 13 Jun 2025 15:33:15 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQ4Wx-00000002Di6-2kRP; Fri, 13 Jun 2025 15:33:15 +0200
Message-ID: <a33a70a1e8b90936dbe5ea43c81810ab75a9e94a.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: John Klos <john@klos.com>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Fri, 13 Jun 2025 15:33:15 +0200
In-Reply-To: <d6a5e25c-70bc-a7a2-1512-c7059c092f72@daisy.zia.io>
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
	  <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi>
	  <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de>
	  <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
	 <6c9b49aaab26bd7fda7a95e7e0c5392b26abbcb4.camel@physik.fu-berlin.de>
	 <d6a5e25c-70bc-a7a2-1512-c7059c092f72@daisy.zia.io>
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

Hi John,

On Fri, 2025-06-13 at 13:21 +0000, John Klos wrote:
> > You're not offering help. You, like Finn as well, are trying to block f=
ixing
> > a long-standing problem of Linux/m68k without offering any sustainable =
alternatives
> > to fix this problem.
>=20
> I didn't see anywhere that Eero was blocking or hinting at blocking. I=
=20
> only saw Eero offering to collect data, which I think is a good idea.
>=20
> It might not be directly relevant to the issue at hand, but we shouldn't=
=20
> say no to more information that might inform these changes, either for=
=20
> better or for worse.

I'm not saying that any criticism is wrong per se. I just want anyone in th=
is
thread to understand that suggestions like bumping all SO versions or rolli=
ng
your own version of Debian is not helping the cause and Eero has made such
suggestions.

Some people seem to have the impression that I maintain the source code ove=
r all
the packages being built on Debian/m68k. I don't. I am building what's avai=
lable
in Debian unstable and I want to be able to build as many of these packages=
 without
having to patch them.

While patching packages is possible in general, most upstream and Debian ma=
intainers
don't really want to deal with patches that enable the build on 2 bytes ali=
gnment
meaning that I have to keep building the affected packages in question manu=
ally
forever which I really don't want to.

Switching the default alignment will fix a plethora of broken packages and =
while it
may come with some regressions here and there, I am very confident it's the=
 right
way to go.

The Gentoo developers are pursuing this path as well meaning that there won=
't be
any distributions with 2 bytes alignment left.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
