Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3FD1DDC0F
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066344; cv=none; b=U1U1h9+sYoSZxffWISUgOb6eudQUjIvyQ5Y5Zw3BjBl4z4gqYcCjLWSy6ROzeKfUcbhRxBjtplPs16f4mhT6VsoSj2rYNcdc48hHO0+PY1K8HJ1U0jxSnnWNYGmLK05QTL8vraYwb5VC7W70s2AWLPIlNfjAlqiBz6daoCe2jSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066344; c=relaxed/simple;
	bh=0wZN7RHtripe9N+WeAYlWA1H+zGr9oRalx00pxORzUY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nGNiD5eWc/cF//mTAZOFRswa7QMalBBgWkUAZKacULa8ZqOPZP//1d6GkvKDxZdkqTn7MBsQO5Ddh3rMXIODaNr0ascRMqnw/7AjIoQOe0JSEQtnRP+PtiTjwrDvl8f/8I8FSq9t+I1eqUXG+TP9AjHc6wgv45oBDPZZ63QLBQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=ZcTyG+zx; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="ZcTyG+zx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q1/BGielZqNMCyqbHDXSTDp6ADeb940y/j/oRZf1NFc=; t=1750066341; x=1750671141; 
	b=ZcTyG+zxULuicG/afyK+Y0zrj+9e+iJyCOP4dM24idt15blPHj6b0d1tnlWLv1k7xj8fIpYPKvL
	4VwULAPExsWrRM8DqKGa2ulX9WYNiYQyYCjdwXxl5HAjkgzmk5REWZdw8feUFK+6AEfuQWMo2SggG
	oeErK5VIXqMJnVbC4G7pP3MH+7DQ7YuH3+ElXu4DEXHQ1BrYMkc2T9riYlkExAfDhyHrvSmRI0xFO
	g8H8JtHrqMGALUVTYAUs9CHbdvM46AONfnh927BHO0oLuAK+Rgp7ILdipXyZIEMhb5tT3YnRj25kF
	8LuhlYz5UEEfy2xJZtB8zgFLOX1v8gjgdLKg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR6CS-00000002uHf-0Isc; Mon, 16 Jun 2025 11:32:20 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR6CR-0000000437D-3XVW; Mon, 16 Jun 2025 11:32:20 +0200
Message-ID: <67d0fd72abb56ccb580edbf31ae5142f0db760f5.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Laurent Vivier <laurent@vivier.eu>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 11:32:19 +0200
In-Reply-To: <0c3d93e4-e170-4a8c-baeb-de68a7d4d099@vivier.eu>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
	 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
	 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
	 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
	 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
	 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
	 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
	 <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
	 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
	 <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
	 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
	 <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de>
	 <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
	 <f73add213b5c43b977967ff5c5cbd2c83c0ffb07.camel@physik.fu-berlin.de>
	 <0c3d93e4-e170-4a8c-baeb-de68a7d4d099@vivier.eu>
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

On Mon, 2025-06-16 at 11:26 +0200, Laurent Vivier wrote:
> > > binfmt_misc doesn't use the sections to select the interpreter, but t=
he
> > > 128 first bytes of the file.
> > >=20
> > > I think you need to change the ABI type in the ELF header:
> > > https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format
> >=20
> > How does binfmt_misc handle the various MIPS ABIs then?
>=20
> It doesn't and it's a problem.

Very interesting. Is there a bug report for that?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
