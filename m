Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672E115573F
	for <linux-m68k@vger.kernel.org>; Thu, 12 Jun 2025 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716742; cv=none; b=Bzly9NKB3rkDQhycXr+mdktzs9DdZObzAAT9PiHVPGtSnAFN318EknvcGuqD1VExDD1ES9JocwYS5K/T38u4gZE20KzcAfdrVhxi4+fW7shoGCMmvxVNDXeYk+pAWsONnj8+mjt03DycUF5xhhLBe1qdF7gnrxYl6G9OSRZBeZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716742; c=relaxed/simple;
	bh=BIqkUG9arzpngpZ9/m0tkiUXdhhyZaOz1kBqtvxmGiA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZIaEwZVfMgSeigJEkBA9spXGzLOXwMinmm1GPU+wTfixud2H3DnmlgGECJQncrcADuQBu9R2rWEJTEJRaxekW6YCCvLrqLs5VaXGUNXWobRQYic9Qx0D0fnj78biO33EJ4wy6tQ5Ngd2WhDVINyRQJ+WhdKeTW31ocVOHCVvKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=r-v-e.co; spf=pass smtp.mailfrom=r-v-e.co; dkim=pass (2048-bit key) header.d=r-v-e.co header.i=@r-v-e.co header.b=I2EZALac; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=r-v-e.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-v-e.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-v-e.co header.i=@r-v-e.co header.b="I2EZALac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-v-e.co;
	s=protonmail2; t=1749716731; x=1749975931;
	bh=TI/Xa3RQonu2l2TAZ0xCqxCXxWJDQWX0LQjdbxCs2Wk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=I2EZALacOEpwE60nD+ROaSVzn0AoHz4hcigZRXcAoRXuMF6Wwm/RO/5z+ya8XhCQu
	 310FMrTTg5/ylzkLeD0Yn0fwt3kvbt5bfV9+yrsqrQ0+yA1fYPwiMxqRqfUlnFmIi9
	 1Yv/38rpcVw0v5M8UTn0cN0ymad5PMb6kkJYoEEpZZQaff9UL8gYRtLDf1SIWwOvIK
	 BTEBpzQFdJRBZo8yc/IBvnUswHqm8vQEKoiRVUOPp9PJQcfulyehZ2uYe5DOnROdoG
	 4kFxwqiTQXrY8Y8lb9rmUFH/weE1OAB5ol2ZEm2nlyT/uHj5igUTy6LyzkE8u1yEcR
	 5KtM4paS7KAiA==
Date: Thu, 12 Jun 2025 08:25:27 +0000
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
From: =?utf-8?Q?Administrator_=40_R=C2=B7V=C2=B7E?= <admin@r-v-e.co>
Cc: "stefan.k.reinauer@gmail.com" <stefan.k.reinauer@gmail.com>, "fthain@linux-m68k.org" <fthain@linux-m68k.org>, "userm57@yahoo.com" <userm57@yahoo.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "jeanmichel.hautbois@yoseli.org" <jeanmichel.hautbois@yoseli.org>, "port-m68k@netbsd.org" <port-m68k@netbsd.org>, "debian-68k@lists.debian.org" <debian-68k@lists.debian.org>, "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
Message-ID: <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
In-Reply-To: <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de> <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de> <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de> <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org> <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com> <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
Feedback-ID: 40622035:user:proton
X-Pm-Message-ID: 55686504ce882059a57dccf8a0bc276c6eb4b444
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for your great hard work and efforts to mantain the various and now =
considered exotic architectures running Debian, Adrian!


 - R=C2=B7V=C2=B7E -=C2=A0 =C2=A0=20
=C2=A0- REAL & VIRTUAL ENVIRONMENTS=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0http://www.r-v-e.org


-------- Original Message --------
On 12/06/2025 09:27, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.d=
e> wrote:

>  On Wed, 2025-06-11 at 20:16 -0700, Stefan Reinauer wrote:
>  > > Sorry, Adrian, but you can't have it both ways. Either you support s=
mall
>  > > systems or you don't. Debian's documentation says of m68k:
>  > >
>  > > =C2=A0 =C2=A0 This architecture covers Amigas and ATARIs having a Mo=
torola 680x0
>  > > =C2=A0 =C2=A0 processor for x>=3D2; with MMU. However, the port is s=
till active and
>  > > =C2=A0 =C2=A0 available for installation even if not a part of this =
official stable
>  > > =C2=A0 =C2=A0 release and might be reactivated for future releases.
>  > >
>  > > https://www.debian.org/doc/manuals/debian-faq/compatibility.en.html#=
arches
>  > >
>  > > There is no mention of fast emulators. Yet that's all you're targeti=
ng
>  > > now.
>  >
>  > Fixing pthreads would probably go a long way. That's where we lost abo=
ut half of our performance.
> =20
>  This may be accurate, but I'm again not sure how this is related to the =
discussion we're having.
> =20
>  Finn accuses me that I deliberately slow down Linux on m68k when all I d=
o is continue to maintain
>  vanilla Debian on m68k. Modern versions of Linux being slower on slow m6=
8k machines these days is
>  unfortunate, but it's not something I can be blamed for.
> =20
>  My goal is to keep Debian's m68k alive and healthy and one critical chan=
ge to make to make this whole
>  effort sustainable is to switch the default alignment to 4 bytes. If we =
want have a smaller and faster
>  Debian distribution available, that is still something that can be worke=
d in a separate project and if
>  users are willing to help with such an effort, I'm happy to look into it=
.
> =20
>  However, what I don't like is that multiple people in this thread dismis=
s my work completely with
>  questionable arguments and unrealistic counter-proposals when they have =
no clue how distributions
>  are maintained and how tedious it is to spin your own distribution.
> =20
>  Adrian
> =20
>  --
>   .''`.  John Paul Adrian Glaubitz
>  : :' :  Debian Developer
>  `. `'   Physicist
>    `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
> =20
>  
