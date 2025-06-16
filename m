Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8158BEAF1
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072573; cv=none; b=Mw2IZQL6GmfsmLWub4gbEWgKtEFWuaecOX1+tNtY+65jdJsjmgZYGfg7cE13IocAvWKaOE5pV9/ZsgIOFfwiftyt5rNqe6c+cJ9h5Z1jsszAV6eKHLkX/HvGu0vSzFaUljuWKcGSRFR4cHZC+eXFHbLpGhdo8PhYiv7lslK8lkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072573; c=relaxed/simple;
	bh=WIkrNPHfL/B0FP/U6rtBqzBR0K3aq+QKSsbGJS6HUiM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LfFiYjRdPCMQzFlnYgFt1vP0PEAo2CMtMxCcTZ1+mh7GxASVR1KZhb9sHFj1Y+RS2/6ktzv0ua+3NgyRWErDeX73bG2sk5QNiAGWJ5jt54pD2q1qERx6QfOsx3oR9XYdZ4BMztZ8fMdugb1YrJiR+PF9T5RJ9fZT0CaEOJ9iJKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=GEW03n+o; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="GEW03n+o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h5mBDMYim0tECRpDqDV5VF2tEvm/TXyjrY4evfO7Ldk=; t=1750072570; x=1750677370; 
	b=GEW03n+oTFvzYEG11DWnY3IP3nzEZM68fqBvlsjCWcJmwpduMzY9DlZsLmwGmfaU/slqzVi0+Vw
	/gZ1rphEi7/rNgJFVDP76I/BqUR5vKlmE3qgTwIZTj3QhSgzfUHGvmHns+vO6GiDMobqAJvx5M7Na
	SK6houPrqyhhck1Zk/pcYBVsbJTOGsnwFBTsi4BJcDL+iZLoII7pNX1rAheGCUouA9waf3wPBexcf
	J5Ndf/0prKK+MUTOuTCLeblyJZuqN/o1vSJ6DC5O+TKFJeO0GjAJOtPtIjJVuE20LMDENDnG8Z8iU
	ImP6YRBhArBqbb92cvRNepLWZXu5SZxqemqQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR7ot-00000003l5j-2QMS; Mon, 16 Jun 2025 13:16:07 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR7ot-00000000D1K-1NOw; Mon, 16 Jun 2025 13:16:07 +0200
Message-ID: <10bd814a93045ee24ef9909ebf04310275e02822.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Laurent Vivier <laurent@vivier.eu>, Geert Uytterhoeven
	 <geert@linux-m68k.org>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 13:16:06 +0200
In-Reply-To: <a88f88d647aa116ae324d4897928adb82b466d65.camel@physik.fu-berlin.de>
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
	 <a88f88d647aa116ae324d4897928adb82b466d65.camel@physik.fu-berlin.de>
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

On Mon, 2025-06-16 at 13:10 +0200, John Paul Adrian Glaubitz wrote:
> On Mon, 2025-06-16 at 13:05 +0200, Laurent Vivier wrote:
> > I think an e_flags with a new value like EF_M68K_ABI2 would be more app=
ropriate.
>=20
> How is it currently used on m68k and does QEMU use it? I think that would=
 be
> certainly a way to go.

So, it seems that this is what's being used on MIPS:

https://elixir.bootlin.com/linux/v6.15.2/source/arch/mips/include/asm/elf.h=
#L289

Looks like this would be the way to go!

Thanks Laurent for digging this out! The discussion definitely yields some =
results ;-).

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
