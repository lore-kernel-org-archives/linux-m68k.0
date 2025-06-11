Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D3E1D516F
	for <linux-m68k@vger.kernel.org>; Wed, 11 Jun 2025 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656972; cv=none; b=f6Du+nH/Y4IR1jUIgWyr0XHIGuVi136gj/H94JNfcWhMJcpTX6BRraP+OcGfip6PgJmRy/MKGgi1vqgfL3H/2AwhVEhLqQTe5er40a6d3iEIOzQrB+vgd96L7lnAscYZXN5STMC46XEKG0onKqlatTIFTNUhuxCg4bcdQmR9Bsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656972; c=relaxed/simple;
	bh=CHs5x5zOA4EtQKhS23XHATvRxtQfeFIEVX78IxxXpf0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q/n6xLxD6l6Wdh/hqNjuyGfZv7EzCHiW+YiK28dbCRxZF383M6ToewZ4yGvBN7zshcTy2FS9UkzreTLFUwCl7N88sTIqLdKGqOOcDroDTHCzvqgb6IKBu9yzR1+U5/0yd6od3tBRl9hOI5HDl6QdT5QaPfnSg7es/9AOyBriwgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=NXwVgcuG; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="NXwVgcuG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wv8DtxU9aqeGvw4joYvXCBonmzu3vqnEStm825gzpRg=; t=1749656968; x=1750261768; 
	b=NXwVgcuGhhcz7EN0vcUGVPvh9BLmn+JNOJAKW9BCiKg4L6eRjvJdP3p/CAjNSirVxf0hfcsztz5
	PPcoPnsEkMU7m3RDfJTOKLuoSnWH5plDYlGRz/3ICTJHmdefX+Fnd8WORIxV7qE/OR03FRwKSvsi3
	ZL3o6aVmlasPypx30/Enymvq/YtvMaUUR1BYX5xBbM3x5MVTC6Ugh8EqdZFp0bXDFQLVCZQ4bdVqV
	yHJk7RMFvuyfdcZp+tXMWCUqgyoWOftVEz3hjmY7cmYoBkJ3L62NatG4M1vl4z94Zfufopyz4x5ia
	k4JGnaMjVORWkV2Lh5vZd6WvBggNPTLF2sag==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uPNhX-000000023oL-2hIl; Wed, 11 Jun 2025 17:49:19 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uPNhX-00000002auK-1gj1; Wed, 11 Jun 2025 17:49:19 +0200
Message-ID: <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Eero Tamminen <oak@helsinkinet.fi>, Stan Johnson <userm57@yahoo.com>
Cc: Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>
Date: Wed, 11 Jun 2025 17:49:18 +0200
In-Reply-To: <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi>
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

On Wed, 2025-06-11 at 18:32 +0300, Eero Tamminen wrote:
> It will decrease performance if increased alignment means that something=
=20
> that fit earlier into i/d-cache, does not fit any more.

=C2=BBControl whether GCC aligns int, long, long long, float, double, and l=
ong double
 variables on a 32-bit boundary (-malign-int) or a 16-bit boundary (-mno-al=
ign-int).
 Aligning variables on 32-bit boundaries produces code that runs somewhat f=
aster on
 processors with 32-bit busses at the expense of more memory.=C2=AB

Source: https://gcc.gnu.org/onlinedocs/gcc-3.1.1/gcc/M680x0-Options.html

> (68030 has 256 bytes, 68040 has 4 KB, and 68060 has 8 KB, of both.)
>=20
> To get some numbers on this...
>=20
> if you could provide vmlinuz & System.map files for both (otherwise=20
> identical) 2-byte & 4-byte alignment kernel builds, using kernel config=
=20
> here:
> https://github.com/hatari/hatari/blob/main/tools/linux/kernel.config
>=20
> I could measure the perf difference for the whole kernel boot, and if=20
> there are differences, profile what causes those differences.

But anyway, as I have said before, I am not going to change my mind on this
and I'm already working on it. If you prefer maintaining a Linux port with
2 bytes alignment, you are free to do so. But please don't expect me to was=
te
my time on it.

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
