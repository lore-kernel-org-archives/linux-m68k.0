Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C801E501C
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072252; cv=none; b=Hhw0SsAUQI/z8OaNcTYx68xZvoKYl3XS9U1TUrrIHOgCH1V/baPPpmqOaEueJ4UGaygKtYy3OCCnrYf0Q60Ildsyi5T/oT+XBao6/glVUBQV7tfp6KpGfUbRRQmn2PVjOdphwC9XDmWREtqBBC58xpLVYziNAchfauw3f63Bsgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072252; c=relaxed/simple;
	bh=BOnVNbUHQG7gid2GZ28sYv4AovLjkphJon3nojqgHBc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qJSoK6OtHvdZzDG6r/s5+tlM/D8OUd1n8j5mG395iPR8sE5Lq9yHC3eutkf2nUwmUs4bsNEB7zfHfucFw8VtBVgLvXpvWueOTHDfuarXPTOP7H5DtGFftIi4qNKPdYKisalcGIzqCPXynpUZb44h9Z0mxtM41El/KGjBtl269r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=BMfu+aQV; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="BMfu+aQV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K9S47laos81pBDuREqJyrr82chUyYyZmrC6+vvFxCIA=; t=1750072250; x=1750677050; 
	b=BMfu+aQVuRkDsTeCxf63B13P/5duhlRQp5ZvVlJmfk6+MKtzHqjPQ/PKYLIRLrOdBoYiBnP2wPg
	Hpdyl4o3ZAz4d29hCCNhVb7bkMvjLAGxM6O/b+ZYvq+dO+3/w/w48onKVerXuVVwrO9MVgc9skM42
	AJRA/6obzwmcPLb4q2tfcxOKWMksrYwoFAaUULB7V0aKPnFbK2onvkUGnv6E/eF/YsdgyRMuOnJTk
	+JERHjVSW/y5Nx4rbEN9lwTdgPZRHTcT3a0x3YY/C3CLx5w8pzTcsjYbBf7j+m5HB1fpaYzWITGjP
	Du8YcGkDpRhWyzYmm6HjM1TpJ2Ezp/P2AQig==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR7jj-00000003idu-383z; Mon, 16 Jun 2025 13:10:47 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR7jj-00000000BnV-24ei; Mon, 16 Jun 2025 13:10:47 +0200
Message-ID: <a88f88d647aa116ae324d4897928adb82b466d65.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Laurent Vivier <laurent@vivier.eu>, Geert Uytterhoeven
	 <geert@linux-m68k.org>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 13:10:46 +0200
In-Reply-To: <52a181ca-a6fa-4f1a-9344-3e809a036cfa@vivier.eu>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
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
	 <CAMuHMdUH3zfrxSV9UqxnG1dEnHA_SmeYVsmKzV3kzYq6TLnucg@mail.gmail.com>
	 <f869d1238c15875a29f4cdf7569c176ba81fd6c4.camel@physik.fu-berlin.de>
	 <52a181ca-a6fa-4f1a-9344-3e809a036cfa@vivier.eu>
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

On Mon, 2025-06-16 at 13:05 +0200, Laurent Vivier wrote:
> I think an e_flags with a new value like EF_M68K_ABI2 would be more appro=
priate.

How is it currently used on m68k and does QEMU use it? I think that would b=
e
certainly a way to go.

FWIW, I checked EI_OSABI on hppa out of curiosity:

glaubitz@panama:~$ uname -a
Linux panama 6.12.32-parisc64 #1 SMP Debian 6.12.32-1 (2025-06-07) parisc64=
 GNU/Linux
glaubitz@panama:~$ readelf -h /bin/bash|grep "OS/ABI"
  OS/ABI:                            UNIX - GNU
glaubitz@panama:~$

Compare that to x86_64:

glaubitz@suse-laptop:~> uname -a
Linux suse-laptop 6.15.1-1-default #1 SMP PREEMPT_DYNAMIC Thu Jun  5 14:29:=
05 UTC 2025 (75961ad) x86_64 x86_64 x86_64 GNU/Linux
glaubitz@suse-laptop:~> readelf -h /bin/bash|grep "OS/ABI"
  OS/ABI:                            UNIX - System V
glaubitz@suse-laptop:~>

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
