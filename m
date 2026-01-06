Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D5F339843
	for <linux-m68k@vger.kernel.org>; Tue,  6 Jan 2026 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706851; cv=none; b=ZqgFnwVGii55ybAGDPsAa9zuwKK2ZL9vgqtMxTeKtQCeYu3P1fJTzGB0Jn44tgZr4Pc9rmtOLTGlUzFDbtbJDSPqFN+GnrRlXEyq+6HCil91A8KEZym0XIPUSJQsYxAQBTigMVw4t9yUFWCgMya4EO0dZ9tSYil4utL5eD574VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706851; c=relaxed/simple;
	bh=eQUlLzp42aTbsOmV7Iq9Ny8/PWIEO81VDfoTBl/LZtg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NzB1NGb+o2PuOqEslZWOB/YDPhITX9pRT7z+CYd7OExDKQ3N3JNt2wWoXyGA1EYodcul5HGuwP4eQWLTGD8gjTsd0FciUblp035TXe+WwU95R6JQ0jaA+DToYfRLr04OsSc8Z4wJX9fvKbneFamnXrNMEiU61FuRUQOumV5YwUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=RG3yl+8L; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="RG3yl+8L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=O5AOB7TP1vH9WaDeopPf7LMpNUMNG7AaSZbTMezZqx4=; t=1767706846;
	x=1768311646; b=RG3yl+8LGXphM71a74oL9AC1JaqG1YQ0SvOBn/9Bgaq6Tp4zBFJnNCpfh5HqT
	u2EI7RuMipGHNdX7cfPDL2o66r4iuHSbSaUcGMchs6uFLrjf4Ow2AYOXe5OjLUSHQ1K2Z376A/TlS
	+t1LuytuZBYTljNqjV03RovkATL+9BzErChriFPdPAyoYtPePV3oNbJyoe7JxHhzXsZ0eJYLY3HFr
	EZpZHtX2JoTrxIXFkk746hh6lWwRsNP9z1SLaySmMFldEHCxqioukmQI7eHLCektg/hlxJhvWBvFS
	vNECC62PyR3SeVpaEmZAUHKo7FcfEOzRCofRO+DSM4drV+bbTA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vd7IY-00000003Usn-0ovI; Tue, 06 Jan 2026 14:40:34 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vd7IX-00000002at7-3yr4; Tue, 06 Jan 2026 14:40:34 +0100
Message-ID: <9277b6ef0478bc6651c03b4220004a4c8a2e1cdb.camel@physik.fu-berlin.de>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: =?ISO-8859-1?Q?Kolbj=F8rn?= Barmen <linux-m68k@kolla.no>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "port-m68k@netbsd.org"
	 <port-m68k@netbsd.org>, "debian-68k@lists.debian.org"
	 <debian-68k@lists.debian.org>, "linux-m68k@vger.kernel.org"
	 <linux-m68k@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Date: Tue, 06 Jan 2026 14:40:33 +0100
In-Reply-To: <f1f4afab-51a4-10b5-106c-e9e6e5528e6f@kolla.no>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	  <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	  <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
	  <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
	  <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
	  <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
	  <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
	  <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
	  <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
	  <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
	  <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
	  <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
	  <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
	  <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
	 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
	 <f1f4afab-51a4-10b5-106c-e9e6e5528e6f@kolla.no>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Kolbj=C3=B8rn,

On Tue, 2026-01-06 at 14:34 +0100, Kolbj=C3=B8rn Barmen wrote:
> On Mon, 16 Jun 2025, John Paul Adrian Glaubitz wrote:
>=20
> > To summarize:
> >=20
> > - the ELF header provides provides the e_ident and e_flags fields which=
 could be
> >   used for identifying a Linux/m68k system using the 4 bytes alignment =
ABI
> > - MIPS uses e_flags for differentiating its ABIs
> > - PA-RISC sets e_ident to 0x03 (Linux) while every other arch uses 0x00=
 (SysV ABI)
> > - qemu-user needs to be patched to deal with the changed alignment (inc=
lude/user/abitypes.h)
> > - the kernel needs to be patched to deal with the changed alignment (ar=
ch/m68k/kernel/signal.c)
>=20
>=20
> Does this patch exist somewhere? I ask because I am migrating to
> 32bit-aligned userland (https://www.gentoo.org/downloads/#m68k) and the
> gcc provided fails building kernel, stopping at arch/m68k/kernel/signal.c

I haven't created that patch yet as my work on this effort is currently pau=
sed. However, it should
be straight-forward to update the asserts in the kernel code.

According to Geert, Arnd Bergmann made some changes to the kernel uapi that=
 would allow the kernel
to be built with either alignment. Not sure what the current state of thing=
s is.

Let's CC Arnd to find out.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
