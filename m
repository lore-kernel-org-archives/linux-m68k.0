Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C782C0303;
	Tue,  7 Jul 2026 12:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429105; cv=none; b=bNfGPl23FhFshIYDRseWnaYyMQ1ZBkESNPcKGrg98Ck3+xlxCZKYfibChDokZUt5Ut6CFnnHzw1TYwTXXJB8knceYuDP4R1qvLSEqbfcN2FeU7IKVgH4awljKnCu0Zm8svfVgImDcTSNCelZJr3NqhLq2zjV4bed49gh2of0KOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429105; c=relaxed/simple;
	bh=kZLYphKBM97iLjVYowO8MijChwaXN1kWBdPvvnxyV9g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c4c31kTIqUnsFofwIKCcRmWOnjtEagWcc6nqJtoscmgM06WutE0gMhj2lm3PAE7clrOPj1ypMdQ63uBoQlcXmVoiOaVeqKw9cuz/1Vd0pdDKqhNfLuK/0PqXkhemYsp7Iqwy8WTgkiaSKMoGgLtQqqcDp+X9NEjKlt0LHWR1BpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=RYA+GVen; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="RYA+GVen"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=iujFskOS+z6RBMoV3koIa8Hd9ZoK6qpX9cHjq7GaBEI=; t=1783429102;
	x=1784033902; b=RYA+GVentc5REie6NxqSm3Twm0163SfoxKQTFvv8fMn5uvPz41ZsQXhfRx6Pk
	RphsDYi855NOJdlbk9nS1J0JyejY1cV8PfJfM8YhFtgvpRCzoEJN66ndlaO1Fn7qxJWgNQPA+qJD2
	SsilV6OYyjgQV4hQtykU4NAW38c4gHbHfwfY7xkzTeji7hHE3vur9he4Gm3NQfQUTctf0rldhIfFP
	Ai5J2BZzb8uuhNM0Au2bCLYZQ5dw7Isgf3Wj1lYhs99EUeKCwvsgYr31razzwQMh6hmuuy5P1kcGb
	ILFzEfvrj0y15mRM35kASt8rPYGxKu44VqDdMCJOY9Jkw8uG9w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wh5NO-00000001TIk-22vG; Tue, 07 Jul 2026 14:58:14 +0200
Received: from p57bd94c1.dip0.t-ipconnect.de ([87.189.148.193] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wh5NO-00000000tUV-1CJy; Tue, 07 Jul 2026 14:58:14 +0200
Message-ID: <c35e031707d5168d10773877e042e11381683be7.camel@physik.fu-berlin.de>
Subject: Atari Jaguar port - was: Re: m68k: 68000 port for megadrive
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Daniel Palmer <daniel@thingy.jp>, linux-m68k
	 <linux-m68k@lists.linux-m68k.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date: Tue, 07 Jul 2026 14:58:13 +0200
In-Reply-To: <CAFr9PXnh7cxzLYpkxXDx9UVrxZmywmbByU386XdijAtVKECzXg@mail.gmail.com>
References: 
	<CAFr9PXnh7cxzLYpkxXDx9UVrxZmywmbByU386XdijAtVKECzXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Daniel,

On Fri, 2026-06-26 at 21:35 +0900, Daniel Palmer wrote:
> I'm not going to send patches* for this but I thought it'd at least be
> funny to someone.
> I've used my DeviceTree enabled version of the 68000 code to do a
> quick port to the megadrive.
>=20
> https://github.com/LinuxMD/linuxmd (screenshot is near the end)

You've probably seen this but other may have not, in any case, someone
has picked up your work and made Linux running on the Atari Jaguar:

https://cakehonolulu.github.io/linux-for-jaguar/

Pretty neat!

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
