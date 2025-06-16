Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6AF1EF375
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059551; cv=none; b=gLbgWGIv9rvAOh+Zm4TSdFfnRZ2tHD4shNj4EXrnr7iyIjwObqknXS0RWOI2Bhbnhx0QplHQGk8MfumWLli25IPfzJ2Y+93H5RggTvO4M6IuRBprtOzmW972AWyMqIG6TviR+3HV3rIJp6PRm6yodso42FZoPLXcD2RIO2nD300=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059551; c=relaxed/simple;
	bh=/pE+g0xQitzVltSXIJdLXPWhWfrP757bq7t1AHnEDw4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FiD+KMFGlMKLwMeAc4U1cofRNdycB8EImkheLW+58loAFMcNRO22GEFFA8FYe89PoplZPPxv+xYR9F7mm05MytPssDEug1En/PkonHQhSKP/aCDsGv99ArCknZivkvgjhNVKqRFthfzDeeE/zP1FRC8iRBMjNFjaQc29Qs2Zx/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=QbCEnHpb; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="QbCEnHpb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UQrl4kGAUHrLt6MFlh/nrO7A5Z21uwpLqtkNm3FXOSI=; t=1750059548; x=1750664348; 
	b=QbCEnHpbDfxi1UoJetTspOStuAlf0Rgf9icQkP4zRRGGmqBd+rA2f7gpfluhnizLWuDajrULEny
	RoNVr8tcBDiwsoF1Zw0EmutpgdID42Oc7C+xHLV4j/seCsdONyuynNOfWEy0k3M5fGTTz09TO8nJP
	4UJMgdQ0Enh0lW15qLFWCl24LROjB0Hbmkaa5SewFatMuSnzU8gBrEyDxRrxy835cpAyOpgXeNS/4
	wNKMuH/iwSLVBWuZGMpTzAqwrXhUqQdmN+zqZThI7wpcY6elYQDHdBvZBuZyjieauf66Y6FaIYdWJ
	98M8kiPsBvHOtCvVU4mMOTfSvGlGAUoTCYjw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR4Qr-00000001xFy-25MV; Mon, 16 Jun 2025 09:39:05 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR4Qr-00000003cJI-10Tx; Mon, 16 Jun 2025 09:39:05 +0200
Message-ID: <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Laurent Vivier <laurent@vivier.eu>, Eero Tamminen <oak@helsinkinet.fi>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 09:39:04 +0200
In-Reply-To: <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
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

On Mon, 2025-06-16 at 08:33 +0200, Laurent Vivier wrote:
>=20
> Le 14/06/2025 =C3=A0 09:21, John Paul Adrian Glaubitz a =C3=A9crit=C2=A0:
> > On Fri, 2025-06-13 at 17:24 +0200, Laurent Vivier wrote:
> > > A stupid question: is this possible to remove from debian the packets
> > > that are broken?
> > > (I'm sorry if you already answered to this question).
> >=20
> > Sure, we can remove Python on m68k. But whether it will still be useful
> > after that remains a different question. I would argue we should rather
> > totally drop the port then because Linux without Python doesn't really
> > work these days.
>=20
> You can see the fix for python has been merged 5 days ago...

And yet it's not just Python. The 2 bytes alignment is still the main block=
er
for Rust on m68k. More and more important Python packages such as python-
cryptography are embedding Rust code these days. There is no way around it.

> > > Because I'm afraid that changing the ABI could cause more problems th=
an
> > > it solves.
> >=20
> > For what exact reason? NetBSD/m68k runs with 4 bytes alignment.
> > Why shouldn't this work for Linux?
>=20
> The problem is not the 4 byte alignment but changing the ABI.

Gentoo does it as well. I haven't heard any criticism towards Gentoo, just
people unloading all their frustration on me.

> You will create the exact same problem you want to fix: we can guess=20
> some softwares are built on linux/m68k with 2byte alignment in mind. So=
=20
> once the ABI is changed, you'll have to track them to fix them.

Could you point me to these packages which assume 2 bytes alignment? I'm ge=
nuinely
interested as I would like to put these up on the wiki. So far I haven't fo=
und any.

I have used Debian's rebootstrap to create an initial set of m68k packages =
with
4 bytes alignment and didn't run into any problems yet.

The Gentoo developers have also successfully created a chroot with 4 bytes =
alignment:

https://dev.gentoo.org/~dilfridge/m68k/

I have tried it and it worked fine for me with qemu-user.

So, if there is any software that is incompatible with 4 bytes alignment on=
 m68k, I
would like to hear about it.

> >=20
> > And I have bootstrapped Debian/m68k using rebootstrap with 4 bytes alig=
nment
> > without any problems. If you think there are problems with 4 bytes alig=
nment,
> > I would like to see them reported.
>=20
> Adrian, I respect all the work you do for debian ports and particularly=
=20
> on m68k, but I want to point out that this ABI change can generate more=
=20
> problems than it solves.

Then you should point me to these problems. So far, I have only heard vague=
 warnings
but not concrete evidence that justifies your fear. In fact, I have provide=
d more
evidence for the transition to work than any of the people in this discussi=
on that
claim that it won't.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
