Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA848226527
	for <linux-m68k@vger.kernel.org>; Tue, 10 Jun 2025 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554464; cv=none; b=rVz6u2nw9sDR1EGsCh+nKYXhhTjmxB30qmItpFLINZzrML5uJ5KySUw8xfpZett1t3OY9A5DM8pV4tDwIlc7iyZ0jwajkjS8fZcUoJ1eRIWOZwQ3wwC2/ygQp3esb/6HoJQcRpZcgBx0rZ9DYUCC6w8/R2fp4Ojjyr8EKYxh2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554464; c=relaxed/simple;
	bh=mjm5JgsAUrBfrkIgJdt6XThA+815AsP9i244Dx3clfo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A05295BM1Kk9eWais6ZvipLGNljndhGjcSEsoe8xqR25ofZ22pfACUQn2lcXWWbYy7NQWIoO7R2Ed7ju/4YmmlrH6L/MCmX0sibDkZcR7DV+pUz/OITbR+2vsfeBhN8y/zhL7qhG8SATzMSqbNcD0PnUPyNB0SZR0sJD8zp/xc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=UgQPqDNa; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="UgQPqDNa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OcHQTFq5qJ97QewXOOBUvOHGBIfDLCTG5nsM966Qff4=; t=1749554462; x=1750159262; 
	b=UgQPqDNa2HEMJuP6VKZ4Xzkf4e6H7gmJGQ48tbo6YrJMnIgsRfpBhm2L/Yt0iCIPxoUME85ZF8A
	3+KY4D7h/VKsi9Lz+7rOUV00WLM1B+nd/nVA8HK6GMSgOAVjBur0JAHknI8RgmUQ3DNU/hlc5cN/G
	WFGAT/aQZrY9MOL6dgDoudB31yZ+MjvpvXLbjwfa36xlQk2eRMtegJNgb/wdyhEMYwqSeHi8ITmWX
	AkxstG1XwRwUtQmIKnsXv8MwdOnVwaQuceaB+31u3Op582FS6pwmBJ8z5y0hSxwJOFuF7oAfy9Hi1
	UoVhQEI5ua5rnP0+1U9PnZxjDenXLCjjXn3Q==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uOx2J-00000000z1b-3z9d; Tue, 10 Jun 2025 13:20:59 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uOx2J-00000001MDM-2vTu; Tue, 10 Jun 2025 13:20:59 +0200
Message-ID: <8c42e73f7e1f682d2e5869e06ee72c3f0dc14db6.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Martin Husemann <martin@duskware.de>, Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Tue, 10 Jun 2025 13:20:59 +0200
In-Reply-To: <20250608114717.GB1644@mail.duskware.de>
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
	 <20250608114717.GB1644@mail.duskware.de>
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

Hi Martin,

On Sun, 2025-06-08 at 13:47 +0200, Martin Husemann wrote:
> Since this thread also hit a non-Linux lists I just want to point
> out that we (as in: NetBSD) did not break userland when adapting the
> SVR4 ABI including different alignment for ELF.
>=20
> I just tested it with some original 1994 NetBSD 1.0 / amiga binaries
> on an amiga running NetBSD-current as of earlier today.
>=20
> (...)
>=20
> So the 1.0 original release a.out binaries still work and a -current
> kernel provides the right data (with old alignment and 32bit time_t)
> for a stat(2) system call from 1994 using the a.out ABI.

Thanks a lot for answering this question. I was actually wondering whether
old a.out binaries would still run on current versions of NetBSD despite
the different alignment.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
