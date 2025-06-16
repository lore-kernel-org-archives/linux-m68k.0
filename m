Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC6314A8E
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750055985; cv=none; b=P4EqbsiXS9tzejp8Q4zORNQBAwu+idNeYRPgVAxQozEFjdo+hzT2vbDPKXLR3qqt/2HANlh37uIY7YKnwCxq0d8wAYlGHLMC3XG8+bIXJgYac5n0r9Es0MHPLvox/JJ9QoKLfxnrYPggiKrOs/QUzvOVIGCPHQYyIfkmBPCg7wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750055985; c=relaxed/simple;
	bh=MgUFC56lHtbb8ysSXzA9V9X+a0n/kOLCfB9ca85yvn8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PSKXPdQEG0/hSdwuvWcHQIYsleyrzR5z/iwevR4he/sp6LOmVcu6NhrX0lLSWeBfA2NUJanxusuAp1QfQwlVO5EQr9fZXS7PGuw2dwWf2fOIj2K53rCcl4ljK2xP4FbxKD7hxGTGdAWdWlDtc1DvhMDspCumdPnCJhpHKYFESHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=YyaCZPYo; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="YyaCZPYo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2nBdApI9h2+u/3ZENzG3x8sQzMZfFnySjWUilEVLyY8=; t=1750055981; x=1750660781; 
	b=YyaCZPYoAGxV9OanC8hvXuPEieH7xHBODZZqe7W4VIZn8gaL5e/TbadWCnpHq2Tkq/fxBP/eVMU
	qTQVUQFaCASKOW22fuqvCH9tXQ6noI3P74w+PhjLk/Wg6VqWGbAOLeytIaRw4Y3a3IcAhkLmFC5A6
	UNHAQPNAjS6j9QbNk+VnsjQi7SsVjNn9qvK8LT0ofC2gVLgP/Nkh7vo4XKsfYXPs1LG1IdVMOVtov
	DBezjuYNQ/AEMp6iEtFTIGj5P7YyvkJtyLTu2MgqNz+jxGeq/OOL8s5MkPPcbKKnLsSDd3lyNLyAA
	uZmt6qrhrAviPmzE/epdLwgMT2x3KH7b9b5g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR3VJ-00000001UyO-32OQ; Mon, 16 Jun 2025 08:39:37 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR3VJ-00000003MWn-29E3; Mon, 16 Jun 2025 08:39:37 +0200
Message-ID: <54e3f3f49f1c1149de3dffee1174f615acebd339.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: David Brownlee <abs@netbsd.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 08:39:36 +0200
In-Reply-To: <CAGN_6pZn64Ji44PdgqVm1=JPFFoQTRUjqWy6+bOCf=yQNvz28w@mail.gmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
	 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
	 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
	 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
	 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
	 <CAGN_6pZn64Ji44PdgqVm1=JPFFoQTRUjqWy6+bOCf=yQNvz28w@mail.gmail.com>
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

Hello David,

On Fri, 2025-06-13 at 17:26 +0100, David Brownlee wrote:
> I think it is generally accepted that this would be a new ABI - a
> little similar to MIPS o32 vs n32, but with the twist that all CPUs
> support the new ABI and the goal would be for the old ABI to be
> entirely replaced.
>=20
> If that is the case, the real issue would be how to manage the
> coexistence with the existing 2 byte alignment ABI port.
>=20
> One option would be to give it a new port name. Sensible if this was a
> more mainstream port, but given the limited Debian engineering
> resources (waves at glaubitz@), and desire to replace the existing ABI
> entirely, I think the effort (and breakage in packages not knowing
> about the new cpu name) is probably not warranted.

Exactly.

> Given that, I think there are a number of options (of increasing effort):
>=20
> 1) Just to build the new ABI port with the same name, and accept that
> attempts to run binaries between the two systems will fail without any
> specific indication
>=20
> 2) Add an ELF note on new ABI binaries (similar to NetBSD/sparc64),
> and have the new system fail to run old binaries with a helpful
> message

I think this is actually a very good idea. Thanks a lot for bringing this u=
p.

> 3) Also add a compat layer to the new system to be able to call into a
> separate set of abi libs and to versioned system calls (rewriting the
> alignment data as needed), similar to NetBSD with it's a.out (2 byte
> alignment) to ELF transition (4 byte alignment). That kernel ABI
> versioning is likely to be a.... non trivial amount of effort, but
> would allow old binaries to run transparently

This is also great, but would also require too much engineering effort,
I'm afraid.

> These stack, so 2) only makes sense if 1) is working, and 3) if 2) is wor=
king.
>=20
> My understanding is glaubitz@ is working on 1). Assuming that goes
> well and unlocks a bunch of additional packages for m68k as expected,
> then I think it is worth discussing whether 2) or 3) are needed and
> who would work on them.

Agreed.

> I personally think 2) is definitely worth considering, but as I'm not
> volunteering to do the work, my opinion can be taken with a pinch of
> salt :-p

Yes, I fully agree. It's a great idea which also doesn't require mich effor=
t.

> An elephant in the room is "what if the performance hit of 4 byte
> alignment is significant".
>=20
> In that case some people may want to continue the 2 byte alignment
> port (though I think it's safe to say at this point that unless it
> reduces the performance to NS32008 leves, glaubitz@ plans to complete
> and maintain the 4 byte alignment port).

As I said before, the 2 bytes alignment port is pretty much a dead end
for Debian, so I don't really see how the performance discussion is helping
here.

Btw, I don't understand the reference to the NS32008 architecture?!

> In that case adding 2) plus the code to detect and reject new ABI
> binaries on old systems becomes if anything more interesting, and....
> I'm sure we can look forward to more animated discussions on these
> lists...

Yes!

Thanks a lot for the constructive input. Much appreciated!

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
