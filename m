Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449E41EB2F
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749304645; cv=none; b=I82jaxZEPuq5aLZC339Ii5q+bqUCRYOKPQn22JMjI8nIe2CuKZ+Gq7T0wkByjCMg4hWXv7APC4B+XyVt6no1As43mqeBIkdqeMdy6azg4p3xHG+pCGtkUljBAX+B1k8uYouhwKn6Fzh6zho5nhFeUKhUKYiN+RIc8vykOZn4WrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749304645; c=relaxed/simple;
	bh=NVdQMH/bvyFe3XaQBCCtp8nYQmdhYBVafCdtvt11V3s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qhjN9cOGZaCIY0yXo4UwphUxTXkMOR2rq9IBzAV1CGLSEUFr0WI6BctQ0JDuvohBiHasA9IC34HZ1kFEpufa6QpM9sobeeH33y+RoYMKjbo6CSifQm6N9PKzFjFmovflctclq5t0OtXeVKmgVLzL8IHCNP3ZIUHA5vtd5v/Sng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=RKfb1irw; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="RKfb1irw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mtS594VOP3FVYKuY0lJSIWbiMD2GGPo+MSracMryRT8=; t=1749304643; x=1749909443; 
	b=RKfb1irwO0vNtH3lzZLrMWxZR4Wr6Vr1nhatpVR7/t/HWXw/J7WoWTq1lfhmR17vAMFZSFPipOC
	s26m7nL+IIEF1iZoBpSCyLfPd2c9yci+AznYMWNyXew7pkMMa8qF5UzTJBVb+tw8FIEKIRmjd8kOi
	Ci7Fngdb31iShEbGQSYPhSDyLMQJd0a+bgAVHfcbL1TdvrV0XrxJNTCEvi0yx8BZDmqqu3eeMqbE2
	yE50kufF2SwN0ugmDiBmjKpDWa8RFS3b0mTb61pa/eU3r97tUuDVH7vEe168T/QRfqq28m7LMJpcM
	U34zW6lhCEVmJjTdozcJai/QlOi5vK6w5TVw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uNu2z-00000001y81-0IuU; Sat, 07 Jun 2025 15:57:21 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uNu2y-00000003U88-3W6f; Sat, 07 Jun 2025 15:57:21 +0200
Message-ID: <c4b8dd82377dec8b6a77d2f10eeddcbfaf311645.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Anders Magnusson <ragge@tethuvudet.se>, Andreas Schwab
	 <schwab@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>
Date: Sat, 07 Jun 2025 15:57:19 +0200
In-Reply-To: <a2e94873-ca10-4478-bfbc-b22031bedbb1@tethuvudet.se>
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
	 <87sekbq3f8.fsf@linux-m68k.org>
	 <cb873001-0287-4a60-a793-07b553d92224@tethuvudet.se>
	 <87ldq3ajsa.fsf@igel.home>
	 <a2e94873-ca10-4478-bfbc-b22031bedbb1@tethuvudet.se>
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

On Sat, 2025-06-07 at 14:55 +0200, Anders Magnusson wrote:
> Den 2025-06-07 kl. 13:11, skrev Andreas Schwab:
> > On Jun 07 2025, Anders Magnusson wrote:
> >=20
> > > The paper copy of the "System V Application Binary Interface" for 680=
00
> > > that I have here says that all pointers should be aligned 4 bytes (fi=
gure
> > > 3-1).=C2=A0 Nothing else.
> > And how is that relevant?
>
> Well, were we not discussing the ELF specification for 68k?

It's odd that Andreas would claim that an alignment of 2 bytes is the offic=
ial
ABI when he himself that admitted himself that the 2 bytes is a mistake, i.=
e.
wrong [1].

But let's get back to my proposal: I would suggest adding an option to the =
Linux
kernel, glibc and gcc to configure them with 4 bytes alignment. Since that =
adheres
to the official SVR4 specification, we could use the appropriate moniker fo=
r that.

Providing users with options is usually the best way to deal with conflicts=
.

Adrian

> [1] https://lore.kernel.org/all/87y3i442w1.fsf@linux-m68k.org/

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
