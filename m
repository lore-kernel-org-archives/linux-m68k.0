Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3969927701
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749308089; cv=none; b=sge75PzzdR7okUWig7r9GyG+D5E0kFs7jb3NI8q80bS2/tviVyJt6Ga42f2W3ui7hzwLRsPfN9ctesrXozFc1wjzrxPjL59UvmSOFCK4AnEXRi6PNu9TlPbFpglISPE3TdI4BCqITKqv/hHwUWWLCudoCWxBfha/QLg7KskOVVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749308089; c=relaxed/simple;
	bh=rhhH7TWeZZDUHHuZ+ZfMfkU9tEYBd/kl7FfYLEyeDgI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NnbyNi+p6Qo6z/CGer7grkNJFcm9Y8WRRS8y5Ode0qJ2YM6DPeiRUsyAMAdG6aajuBjQlJFNNfMu5iQaLupcAs11anJ2dFzAf9MUCyLTp2wn+RPGnTr73Nz+Ev58+3eDkZitQx7kWu2zD84SdIu9KJ1YpgDtE8zT5kyGdRberc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=aLfnpG9j; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="aLfnpG9j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=16rQb1BB502rYdwJIAiLZGt+pNM1ZuwK38W0jm7d+PU=; t=1749308086; x=1749912886; 
	b=aLfnpG9jyNSmZhR14xH9tw0BWuBK1QMCkio9U8/oYBsZp4zeMfObhMjaCi/Vng3vhL7zSPxwUBR
	Q1j7yHS0RH3jm2A3+jmacfeiMiwz1CHmDHMC6NLn2e88EbDsxG9UmCnUL3j5kDBCRC+8Dv7ngdh16
	fmVHsk8aE2V6P7YoXjClUdbEHW1ZjfEG1TqIrW3spG4gK8tzI9/HTOdPJEk1UXh86Sp70x8qK6uvr
	x6UqEaH/pUtpEkZ971OMvSUjoGkfltN1ME6Pqv3uA1vtYC6/668fGTThxHXOXAp+YSGr9vteTIzre
	V6v9pNQ5Nt3dptjJs1D3f88Fwg1hAOV3gfbQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uNuwW-000000029Di-1ddI; Sat, 07 Jun 2025 16:54:44 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uNuwW-00000003ahc-0hqm; Sat, 07 Jun 2025 16:54:44 +0200
Message-ID: <cca30c2641b40815e58add6bebee3178896666a4.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>
Date: Sat, 07 Jun 2025 16:54:43 +0200
In-Reply-To: <87cybfaa74.fsf@igel.home>
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
		<87sekbq3f8.fsf@linux-m68k.org>
		<2bd7d3370101b73288f9a1cd1b6eed0ba0da700e.camel@physik.fu-berlin.de>
	 <87cybfaa74.fsf@igel.home>
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

On Sat, 2025-06-07 at 16:38 +0200, Andreas Schwab wrote:
> On Jun 07 2025, John Paul Adrian Glaubitz wrote:
>=20
> > On Sat, 2025-06-07 at 11:58 +0200, Andreas Schwab wrote:
> > > On Jun 07 2025, John Paul Adrian Glaubitz wrote:
> > >=20
> > > > Who is "we"? The official(!) ABI says that pointers are supposed to=
 be aligned
> > > > with 4 bytes, not 2 bytes.
> > >=20
> > > No, that is wrong.  The official ABI uses 2 byte alignment.
> >=20
> > The official AT&T SysV ABI states that pointers must be aligned with 4 =
bytes.
>=20
> If you want to use AT&T System V, you are free to do so.  But Linux is
> not AT&T System V.

It kinda is:

glaubitz@esk:~/gcc/gcc/config/m68k$ grep -i svr4 linux.h
   m68k/SVR4 allow d0, a0, or fp0 as return registers, for integral,
   FUNCTION_DECL; otherwise, FUNC is 0.  For m68k/SVR4 generate the
   For m68k/SVR4 look for integer values in d0, pointer values in d0
/* For m68k SVR4, structures are returned using the reentrant
   For m68k/SVR4, some types (doubles for example) are aligned on 8 byte
glaubitz@esk:~/gcc/gcc/config/m68k$

What I don't understand: What's the deal with changing the ABI now? The peo=
ple
who object the change still haven't come with a convincing argument so far =
except
for the circular reasoning that you cannot change the ABI because that woul=
d change
the ABI.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
