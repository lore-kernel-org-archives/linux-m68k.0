Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF68418562F
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502491; cv=none; b=UWnBWx+cCmLL6Au8FFj22FfA0P9SSGkLCYuOyg/6dcDgjOgETa7qbpjKotJD7g90Bb5U8VOayjkpCV/1GoHtVbSAQynl+USCJxN8gUpxm3JqtWYonXV58uIMHOBVD623TcifGmR8teR5wdmmxcZUE4ksI79OG7CvaunzdYcgXy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502491; c=relaxed/simple;
	bh=k01YVbJHqn0+9R2rKWZhsKcuqjCPCcIZFshPcSZHl6A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NfTNVSw8fhqeJW4jTtYcf2MbPgSF6+pbp//6wZGXz4NqF3he5CTsSpS4k9LFJnnwqC5fXyBrepLwHU4Vvtv1RSXqaohF60JYCASVL0gIe8cydEbCC9s9qJTBGhg1gjOgMt+QT3/8XbzqaOH/HKE4i4bDtXLGxanLEvN9tB9IyrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=WC3JdPBr; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="WC3JdPBr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BBvjwXRWIuXtdkiX6gIa/WJBglPPwnovSP7E5ulkXkg=; t=1731502489; x=1732107289; 
	b=WC3JdPBrZUH7XbZ49msDFZ4Q9A7dkLljygWLDdzymKrUAo+r0aBO2EISPFdV23JJpGLCScKa+6x
	QuQBtYxc6i+RCCAeeauaE0Hwl/8Clsp21q7gCKt+DZy9I9SF5f/H1ssHzkps1Ki+0+uPtsKHrPxiY
	UdwQf4Q3hjsvp/0YBedmWWtjKLqgDuCJGakCl6PkLUGWVzuVaMt1Q0uOhdW/x01OxQzmja55miwFu
	WfnUATZJRZJkhBFCIP7dYHJGciC2fbK57+Loo0ClOyW3/p0Nz8Ke4FMbmtdLrP6mRxUHesFkMm5se
	QIiuy8/mWodNGZjUwlysZ6atrTqBrSIh7yCA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBCtU-00000003ZGC-0X7E; Wed, 13 Nov 2024 13:54:48 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBCtT-00000000BvJ-3fz5; Wed, 13 Nov 2024 13:54:48 +0100
Message-ID: <8ca13b4b1a3c2d8d2e6d99c29b901659bb4108e1.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-m68k <linux-m68k@vger.kernel.org>
Cc: debian-68k <debian-68k@lists.debian.org>, James Le Cuirot	
 <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Thorsten
 Glaser	 <tg@mirbsd.de>
Date: Wed, 13 Nov 2024 13:54:47 +0100
In-Reply-To: <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
	 <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
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

On Tue, 2024-10-29 at 07:57 +1300, Michael Schmitz wrote:
> Arnd,
>=20
> On 25/10/24 22:55, Arnd Bergmann wrote:
> > I also expect that a lot of users (of m68k kernels) are
> > never going to get the benefits as they are already stuck on
> > older userspace because of added bloat in new software
> > releases. I assume you have better understanding than me
> > of what m68k hardware is commonly used these days, and
> > how constrained that is in practice.
>=20
> I second that - currently bisecting to find out what makes my extremely=
=20
> RAM constrained m68k system fail to boot or run anything past 6.9-rc4=20
> (sysvinit, not systemd).

Should extremely RAM-constrained systems be the reference target for m68k?

> Much as I appreciate Adrian's efforts to keep up with user space=20
> development, I won't be in a position to help with an ABI change.

Thanks, I will then just do it myself with brute force or drop the port.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
