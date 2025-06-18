Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29F8460
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238129; cv=none; b=Ln6PA+1mTPd0O+2qGMghkH7ff9Xf5kxqOr7Q1BorjQeklWMka8SozlBhd4moQ2rHBGQeTunprKJOkzFTBJVJnQr41V4Spyf+HdfDktEDi8bCkJ0A4EOLEGgk0LPRX3v/WhMC5rdBUJDZAuSU5o8KblUQokWWo0qEjq8QZVjx6xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238129; c=relaxed/simple;
	bh=Mi95H4qhyZKVzV4g0dZY9ioEEbdmhUXLvWxXfQyhHUA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QpO+PPhbD8Xn+snpEddDCZXxTXkRfS5mRk+at7+ww9yc/gIQtjDLMh2XuiPHBQFTnhjaE1oMrbGOIAYunv1AmYdOBmSQnSmfjM/zk2A0qLP3/4BHN4D/EOAoMb6/DiYdEaRDsXS6YM0r23Vgxf1+A3GN+9nM6tDKZPbUjbgempY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=ODAegL88; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="ODAegL88"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V0TwYsA0bUsmldefUxFuH2rc3rcsbI6TDOfe1ckJUN0=; t=1750238126; x=1750842926; 
	b=ODAegL88zl3bi7cX/LR95rORB/U9UtU642Nn6NHYDjTylSHSm34YDk8efYwpFS/0XSWyMYyVnC5
	foeRsu69e2jZyDOfAo2J+R7Yc5DBKYNmEXqV5PQPNFEBrF56kHaHk3p5F7bjmZmKIxhyapNKfpygu
	eblShkPdk72X1ovYbbp81pWUN4rQ2ypUEmRsus5NfiI6Ri6A+cY0K/E6XqEmRUVSJKCRaVyEV5NdV
	GU9FFqkX8eCavtwsR+SbKvrDXGHtdkJDgw7NpWA7rHEN/94GjawGno9w7D6c+3CtgO0L+olJodjF/
	fglUfaK6N+lco/kjPpbx3hfEJAMfkrHm1VpQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uRot9-00000003e8S-0Ugb; Wed, 18 Jun 2025 11:15:23 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uRot8-00000003KPT-3kJs; Wed, 18 Jun 2025 11:15:23 +0200
Message-ID: <1d14a2d7a1adc165fe77d25b1f8611beab14cf9c.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>, Jason Thorpe <thorpej@me.com>
Cc: Laurent Vivier <laurent@vivier.eu>, port-m68k <port-m68k@netbsd.org>, 
 debian-68k <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Wed, 18 Jun 2025 11:15:22 +0200
In-Reply-To: <daeee4ff-ff27-27ef-7e6f-71ccd556f6d2@linux-m68k.org>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
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
	 <758E94EA-113D-4FB4-B5EF-1203FB67F520@me.com>
	 <daeee4ff-ff27-27ef-7e6f-71ccd556f6d2@linux-m68k.org>
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

On Wed, 2025-06-18 at 13:19 +1000, Finn Thain wrote:
> Do you know of a good solution for this open bug?
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D30273

The proper solution would be to actually adhere to the official SVR4 ABI
when declaring elfosabi =3D=3D GDB_OSABI_SVR4 and using GDB_OSABI_LINUX for
the old Linux ABI.

This bug is another example why it was not a good idea to ignore the offici=
al
AT&T System V ABI ELF specification as it proves that independent upstream
projects look at the actual official specification when implementing code.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
