Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EFE200B91
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502221; cv=none; b=q2tgCVhYFmgLe6cS4OzNlXa9pdz+cBZGBy0Wz/dbGc1Dddw3TQbiS2m/RowtcibMeiO13sCiVWfKw1afbgYQRsMx55uNrrLyyJiHD5bDkanK+dMDBYQRM9B8q3g28AALsj5zeVl/xN1jO6Uogp9U9BQ5A9cuBXFymfTD4LFgaWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502221; c=relaxed/simple;
	bh=tWcL8F8+IW3Occ/j5dFrsBXDzC1L0WFmaLTNHOznh+A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LyhZTBvLbeLAfSILAJWuG2oS+fcl5zwp5iQn9y3f/ZYDwqh6EIZ4iOg221qqVp2lbZTpCD+2UAvnrsc35Eb+2KcHI+K4GQoBcq33TYvgUiDuf+wnn/Dlf2FrWYNWe9oS38bLrSWZ0k86Q0gYKsiiC6PRxu8tDjHs7lg5WsjE3vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=baMvSDnj; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="baMvSDnj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Tdwa96WlfRLbsMq/yKKnm4okLkHqYHvgKqKMeXkrirI=; t=1731502218; x=1732107018; 
	b=baMvSDnjl1oYXuZ4PO6FSODYSvcSIbnqrwOtt56xwr3+4geYtmAleuoHumDBGJLVGg8W/Xc/Cg6
	VyHwYR7gDqwQahMKbtUxoRydcoAdyu64/ind/SToTWKKnZMRKodbKBwEJJLtwnnNB+AF7g9Ut0Cu1
	jixr/U3K1zBwYmCzIDf6GVlavF16/KMTEPY8Vf7WCb+nVMvX5ydRqQqFGGBpwKbpZjqmqj0+IYXJh
	RV5FYI6tOtdNHm1oDgMjSwI4cUJImXNsJKMfHdCfdH7AeqxoYM42VvxMc8jDeJ5pums6HYy6Tkht1
	LRw57rxVDHxIMPBrrKMj9NcTxTv5rju1AgzQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBCp5-00000003XCc-3f50; Wed, 13 Nov 2024 13:50:15 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBCp5-00000000AZG-2blS; Wed, 13 Nov 2024 13:50:15 +0100
Message-ID: <9a8839fafacc0e89816626b40a4167ad6f0fb47f.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Thorsten Glaser <tg@debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>,  debian-68k <debian-68k@lists.debian.org>,
 James Le Cuirot <chewi@aura-online.co.uk>, Sam James	 <sam@gentoo.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab	
 <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Nov 2024 13:50:14 +0100
In-Reply-To: <7c59a9b6-4867-5191-fa72-8b3664aed970@linux-m68k.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	   <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
	  <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
	  <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
	  <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
	  <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
	 <90616d852357d7489e1404dcf4a9a04f881b4007.camel@physik.fu-berlin.de>
	 <7c59a9b6-4867-5191-fa72-8b3664aed970@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Mon, 2024-10-28 at 19:40 +1100, Finn Thain wrote:
> On Mon, 28 Oct 2024, John Paul Adrian Glaubitz wrote:
>=20
> > What ecosystem? Do you honestly care that any hobbyist cares about=20
> > having to reinstall their retro computers?
> >=20
>=20
> The issue is not just old binaries. You made the same mistake in your=20
> message to Arnd when you said "we're not allowed to fix that [ABI] becaus=
e=20
> someone might run an old binary". For some reason you're choosing to=20
> ignore numerous objections that have been covered on the mailing lists to=
=20
> date.

I have only seen real objections from your side. Everyone else agrees that
future development of the platform is not feasible without making the switc=
h.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
