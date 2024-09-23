Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657EE194A73
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Sep 2024 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082272; cv=none; b=c437cSJzHTccbYngyrIN6t7U2lkw/nhCR831RBwxXTr0sMwyUy/eN5vddye62KDNI+p4LZJxE71IE3jJFT2SMqG8qqVzqGR7ZGpZmn1P11sgf4NBqezEmXTrH9hPKNFNURoAnHD9GL7tRZHWXRa+w92wfpg+Md/azPN+rLPYhGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082272; c=relaxed/simple;
	bh=SSTu3AvyKs6tttGT23Jl0UmCyU/GL3fFmzbpPW4TOkg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kT7/hH004xLKMIvI6/eJ+d5qUIQ6IZJjthS4kMfaQsGR2O7Dtcx5U+LET5E9vbTdto0pMm6EL+z/FN6X2XAuaAqVkkzC4XlH3YibU8FFlDw1dWkaIAv3sl57nwikOxWBnd6+KBUM0rBtfrmuI9nsSPsr0//ldEG2bq2a9HbcwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=iweLsUhy; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="iweLsUhy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xms+I0fZSZP6d0xCcH7B+KMMRC3zRHU6qWryZgqtHls=; t=1727082268; x=1727687068; 
	b=iweLsUhyrSIInlFGoY7Y9THOEfN/+Um3t1D2FyRYDhayaktpgWm7VpNMrlgpE6rPxTMU1NFoEiO
	EkmQP9KyfY+Vy1nlCAA/INQauyR2wbGN+qTAEp8KhKy3O0vcNxogyIMJ/bU5ZPMReuddGhAkcI1FZ
	/YRrStWcXA32bsj3usT2GzDTJhxl2A87K2rLnwFrMZyTKPwzoKD5h8Xp/AmMXMhQLrSAcxMaYTKOG
	duxDDyqseepFXe52yr/exeea32s2zn4ts0LlG/eSnmxCKbJxBPkeB5Hw0S30DR21xyvpA6HSX7WbI
	ZLhTn4fyIgQUEbfWu3lwu3DujiqVQBzJElsg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sseza-00000000HxD-0MOW; Mon, 23 Sep 2024 11:04:26 +0200
Received: from p5dc55b97.dip0.t-ipconnect.de ([93.197.91.151] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1ssezZ-00000003RXV-3jVt; Mon, 23 Sep 2024 11:04:26 +0200
Message-ID: <ee96d37e9ea26159a3883812f6e70b2db6bfaf3b.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 1/2] m68k: Drop Atari EtherNAT support when it's not
 configured in
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Eero Tamminen <oak@helsinkinet.fi>, linux-m68k
	 <linux-m68k@lists.linux-m68k.org>
Date: Mon, 23 Sep 2024 11:04:25 +0200
In-Reply-To: <e3d58da9-e0f6-43b4-b907-e056581ef482@helsinkinet.fi>
References: <20240922214821.16818-1-oak@helsinkinet.fi>
	 <5dfbab6334853cc2efd6cc223c198d698bdb5fd3.camel@physik.fu-berlin.de>
	 <e3d58da9-e0f6-43b4-b907-e056581ef482@helsinkinet.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Mon, 2024-09-23 at 11:39 +0300, Eero Tamminen wrote:
> Hi,
>=20
> On 23.9.2024 0.58, John Paul Adrian Glaubitz wrote:
> > On Mon, 2024-09-23 at 00:48 +0300, Eero Tamminen wrote:
> > > Not having it configured, but crash backtraces going through its IRQ
> > > handling code, is confusing (found while debugging issues in Atari
> > > emulation).
> >=20
> > Please rephrase the patch title. The word "drop" has a very specific
> > meaning in this context, namely removing a feature. I would rather
> > call it "disable".
>=20
> Maybe "Call Atari EtherNAT functions only when it's configured in"?

Yes, that's much better. Maybe eben use:

	"Call Atari EtherNAT functions only with CONFIG_FOO_BAR enabled"

> > Also, I think the longer description is slightly hard to parse due to
> > too much brevity.
>=20
> Would this be easier to parse?
>=20
> "Found while debugging emulation problems.  EtherNAT functions were=20
> visible in some backtraces, although EtherNAT config option was=20
> disabled, and emulator did not support EtherNAT."

Yes, this is way better to parse. I would add a "the" before "emulator" tho=
ugh.

> (This is from many years ago, these patches have been part of Hatari=20
> emulator, I just haven't posted them here before.)

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
