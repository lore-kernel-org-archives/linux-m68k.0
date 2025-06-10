Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C987D223DC4
	for <linux-m68k@vger.kernel.org>; Tue, 10 Jun 2025 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554338; cv=none; b=F4sVSXxDx68kQuJ0daxdWlKmqn1p3Jzp4Y91uHFPSx8q8HP+VQIkJ7L2mv0y0TeZGwGjpdjivzAHzmqRnIEWsmfcYeWNzuxTWdf8KYflXwn7P4ZkNjzB/993fLqwrxIfCnAOagj83X296E3t7IczVJd2o7x8ryYGAS0ibFyw/tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554338; c=relaxed/simple;
	bh=+3BvZZQIrMsgF4CfdEKU482Ky5kymP9RYjuxljagqEI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ogcpDmB1iMrW8ksxK2bNC7dRjsfwdSRCeoz33qXLZpxvQvPERp1yt55ZTZ2Czkg8nDspY0qS6MCerCGCuh3nsxZ+nbqTe/JDmNJBLE28M//WJKYg8deSxN+uJmcww8RsEcsCVcaeFWhnIzQKEPtZpSvQyNlBRDt6vFRTTIZ52To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=jyom++XM; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="jyom++XM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u/KeIWL5DK9z9tW8tyKriXGhlaPaJtXSLvp+N19VVWg=; t=1749554335; x=1750159135; 
	b=jyom++XM+w6DgfQq94Gij42iqokb2qH2xvVRQwNuty4h+aOcS6KEs0lEQgj1PdYQkCETj2SXVkj
	Xx2gCfSHLBOHil+6wwZCAkcqcOfZ/Rbr/TW0m7FHjSRBPgZ8hI0NMd1Sv2COccM12xYDLCdxVJQcZ
	sWmAfyKPpzVmYuMCNgYtbIYawIMjFxHT4oz8TAR34MfvByDDe3c27ID4E8IGMmr6FlpCiD0jxooWh
	5z7fkSlsa+SwT9K4g0Dr8j7Q1r2aEE9d1cttzAlL8hh6z3QoyFgUd0WXvsG1ah0aKXJDcMhSm/hYM
	dJ1RE9BknUPETljO38cu+Bc4BmZYE3dCiZkQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uOx0H-00000000xzJ-3WqX; Tue, 10 Jun 2025 13:18:53 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uOx0H-00000001LNL-2ZSF; Tue, 10 Jun 2025 13:18:53 +0200
Message-ID: <f4523e2c034056458fcff558ce3e27eb4699b710.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Tue, 10 Jun 2025 13:18:52 +0200
In-Reply-To: <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
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

On Sun, 2025-06-08 at 11:10 +1000, Finn Thain wrote:
> > I don't see the point in maintaining something that becomes increasingl=
y=20
> > useless because more and more packages are no longer buildable.
>=20
> That's because you still haven't identified those packages in the Debian=
=20
> archive which actually need porting.

Finn, you seriously have to be kidding me. I have created a wiki page with
all the packages in question and I have posted a link to that page multiple
times.

See: https://wiki.debian.org/M68k/Alignment

Are you deliberately ignoring that?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
