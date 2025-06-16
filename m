Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFDC1AC88A
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061701; cv=none; b=lXPaghJf759po+SWCBGTNh4KJlejhAH5E3jG8ACCvBuIqX24AaZOU2jSFTsAcSlObOQCaL+LEnbdB9Ljhk/7Uq8um7oVjPWqYJs+FtNbyr/z1H/Af1DdbyucULsiU4FXzjaDmkgg9NsQ1WVRj9m3CtXma90CAsBuDAoarC0xvtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061701; c=relaxed/simple;
	bh=SWcbjSZnwgKdVrdFLuL2okZljyTqRz42tXe25HrAOb8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EU7er1y4rVUheztbGlq88EJsle7VmDxVdfI9PZPpClUBbLlJiFJsuJsBH3IrDCLaQYo1VlbmeCMIfpuu5bHUNORP3wpo1Q26otlyAmQUvaCI4Jxmg95Gehpm9J7LLVBe2xtpVt3pioT3SvsCV4C24pdfClqmzqVOtbD6aZL206Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=DBz8h32X; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="DBz8h32X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NL+92S70ECGcHrspOKpnzL4+Z+CjKu4go8eZaEd8nyQ=; t=1750061698; x=1750666498; 
	b=DBz8h32Xp/poPECCublgIvfK39VYPcJDhO/+K2/nmqPlvV+iWJfYQ0dlAdi7yaKrqXgC2HDV4w7
	iKVY9EgNO8B52n5ve2Gvp+WmQvXuclXGNdppqx4mQmozmr+7vlromXpiyP0vyMSRWexBkW21vAuvT
	GUga4B3uLOzU/+JVnnmr7/BBPAbs75quTK63eoBnPNGROfFxRjZmdAb68edzpyYqXKj6+D7GI5mLA
	ZXPpnHp8hhIlt549fpUSTZDCWkGyyWyJlmJ8qy9FgR/ttgo352l761vYOyEz8Eu9TLWiJmK1lUJxp
	jiFXvhARsy9zEUlOa4Nx1wQslccrsZQeh2lA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR4zS-00000002IZe-2Vmf; Mon, 16 Jun 2025 10:14:50 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR4zS-00000003m7X-19gd; Mon, 16 Jun 2025 10:14:50 +0200
Message-ID: <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Laurent Vivier <laurent@vivier.eu>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 10:14:49 +0200
In-Reply-To: <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
	 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
	 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
	 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
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

On Mon, 2025-06-16 at 10:00 +0200, Laurent Vivier wrote:
> > Could you point me to these packages which assume 2 bytes alignment? I'=
m genuinely
> > interested as I would like to put these up on the wiki. So far I haven'=
t found any.
> >=20
> > I have used Debian's rebootstrap to create an initial set of m68k packa=
ges with
> > 4 bytes alignment and didn't run into any problems yet.
> >=20
> > The Gentoo developers have also successfully created a chroot with 4 by=
tes alignment:
> >=20
> > https://dev.gentoo.org/~dilfridge/m68k/
> >=20
> > I have tried it and it worked fine for me with qemu-user.
> >=20
> > So, if there is any software that is incompatible with 4 bytes alignmen=
t on m68k, I
> > would like to hear about it.
>=20
> qemu-user is one of these softwares that know m68k has alignment of=20
> 2byte. All the structures translated from the m68k chroot to the host=20
> kernel are with a 2byte alignment.

And yet it works without any problems so far. Please try the Gentoo chroot =
yourself.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
