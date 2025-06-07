Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808C6207669
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749289474; cv=none; b=ezimFQDQ35qtOAVMd2+bHfv62/JFbE7UYBJ1wA92etXiepJ7WxSOceca9BwUZBPREMp7XV4Fryfi0r29iqRoctvK0zq56jwoV1ysNbNPhxfsV/h/cz4SNm9dcmEfLW2ER7d2xO6tDc2SKtI5P4B1O/XcEYHvrpR9eZ3tfcZQORo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749289474; c=relaxed/simple;
	bh=s1Z2+yR9BGQuXTfn4GXHWkU1PUHsoIf74O7s89o96do=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RwoIqTwSXZCydvqLYo8BBiHdVfeaIsoR/wwrWLgw5GOOR+Ih6pn8atShf3ZF6JKEh1M/WoUo8YAGfQXjI5dJRDgcKVsHjobg7+c199b/fF2BuFN+4x4B2uOAPdrCfs8P9k19kAY8kgJdAXmjojKhcUF7VAz1tD9Ud0LD4oR1jBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=pDK6GxGa; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="pDK6GxGa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NOeworqpELATt9mAU+Zgo0MD8Fd5HIylnebZ+XKa7XQ=; t=1749289471; x=1749894271; 
	b=pDK6GxGatyPqtN8MHOCm/Sxc2AlpFWhzM+8JWN0tDlZWN65wqWMWsQaDoWIRubvZfnZQcHR06vH
	COiKx532LTBtjLdDW5ww4v3yyvoPaMHFTloWYE/jnp4ppT+ytEcHKeFJp9qtLhv+AsgkucU6HwKlH
	T8hG2epV7q6LlcrjPVzwOHhmyn33QRYVXMKUqYlORiDmkbFhrMvQo1tZfp9vEUR4xk11/MDPX+OZr
	ShPYlcRdPTGWn6gTqVgljaGAOdnJBH1D9q2VQB03TFzKFDrg/IBlAFyFV+2OswDlDfwPodyxqjqar
	s6DlBvIRcr9DKNwWwmgnXtLSK8CNrzEoj1ww==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uNq6C-000000018A9-0yef; Sat, 07 Jun 2025 11:44:24 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uNq6B-00000002zza-4BZ8; Sat, 07 Jun 2025 11:44:24 +0200
Message-ID: <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Sat, 07 Jun 2025 11:44:23 +0200
In-Reply-To: <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	  <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
	  <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
	  <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	  <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	  <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
	 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
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

On Fri, 2025-06-06 at 20:20 +1000, Finn Thain wrote:
> Whereas, the ability to use old binaries is proof that we care about rule=
=20
> #1 don't break userspace.

Who is "we"? The official(!) ABI says that pointers are supposed to be alig=
ned
with 4 bytes, not 2 bytes. It's the current implementation that violates th=
e
ABI, not what I want to achieve which is make Linux/m68k adhere to the offi=
cial
specification.

Furthermore, we're still talking about a hobbyist platform here which hasn'=
t been
in production use for more than ten years. It doesn't really matter whether=
 we break
the ABI or not.

And it's not like there isn't strong case for making this change. As I have=
 tirelessly
explained, the current port with 2 bytes alignment is simply no longer feas=
ible since
an increasing number of packages either require 4 bytes alignment or requir=
e Rust.

These include more and more fundamental packages such as coreutils, the ker=
nel or various
Python packages such as python-cryptography. It's simply not an option to c=
ontinue on
the current path as it has become a dead-end.

I don't see the point in maintaining something that becomes increasingly us=
eless because
more and more packages are no longer buildable. If kernel people think that=
 usefulness
is already established when you can boot busybox and type some commands, th=
en you might
be able to continue on that path.

But I'm a distribution maintainer and distributions consist of way more pac=
kages than
the kernel, busybox and the toolchain. And even the toolchain doesn't even =
fully build
on Linux/m68k anymore because it requires 4 bytes alignment for LLVM, gccgo=
 and mold.

So, whatever we currently have that we would break compatibility with, I do=
 not think
that it's worth the effort to keep it alive.

> Having said that, I agree that there is scope for a better ABI.=20
> Users/developers will eventually want solutions to the Y2038 problem.

This has already been addressed in Debian and surprisingly, no started a fi=
ght over it.

I don't see why it shouldn't be possible to do the same with the alignment.=
 We have the
full source available. We can rebuild everything and I have already created=
 an initial
4 bytes alignment bootstrap with the help of Helmut Grohne's fantastic rebo=
otstrap project.

So far, it works as expected and multiple packages that previously didn't b=
uild because
of the 2 bytes alignment, just built fine and without any further patches. =
This is
exactly what I want.

> > > BTW, looking into the history of __ADDR_BND_PKEY_PAD() (which is=20
> > > overkill on m68k, as __alignof__(void *) =3D 2, but might still be=
=20
> > > useful for anyone wanting to revive CRIS support ;-), I ran into=20
> > > Andreas' explanation why the minimal alignment is still 2 bytes:=20
> > > https://lore.kernel.org/all/87y3i442w1.fsf@linux-m68k.org/.
> >=20
> > This post just proves that it's always a bad idea to keep historical=
=20
> > burden instead of fixing it.
> >=20
> > Again, can you please bring up a convincing argument why it would be a=
=20
> > hard problem to break the ABI for Linux on 40-year-old hardware? And wh=
o=20
> > would be affected by it?
> >=20
>=20
> I think Arnd already answered those questions:=20
> https://lore.kernel.org/all/383faec7-8987-4680-920d-8f802e1bea34@app.fast=
mail.com/
>=20
> Moreover, "what's wrong with my idea" is the wrong question. The right=
=20
> question is, "what's wrong with my patches?"

Finn, again, you haven't contributed any useful input to help alleviate the
original problem. I don't really understand why you think it's acceptable t=
o
constantly bombard my efforts with such comments. How does this help?

Please re-read what John Klos wrote on this matter as he already pointed ou=
t
why your comments to this discussion aren't moving us any further here.

> > The ABI isn't set in stone and if need to break it to fix fundamental=
=20
> > problems, then be it.
>=20
> Well, that's a value judgement you're free to make regarding your systems=
.=20
> It's easy to find fault in other peoples' systems but it's also pointless=
.=20
> It won't get us closer to a consensus that will hold for another 30 years=
.

I'm not seeing how violating the official ABI was ever agreed upon. It seem=
s
that Andreas took this decision in his own hand while the NetBSD people wer=
e
courageous enough to switch the default alignment when switching the execut=
able
format.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
