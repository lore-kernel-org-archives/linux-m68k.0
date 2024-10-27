Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C029A1
	for <linux-m68k@vger.kernel.org>; Sun, 27 Oct 2024 03:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730000875; cv=none; b=cIPY8a+RLOG9yWglF8NH1nA9W3efrleNOgst0yk9WSBYCnLhnbRxvNNf4hehGPmkEzbqxXMnsPfVUTETGSwm3+jxCy7ztL02Pa9SGiAUbyNyoQyHXk2pu97l3iylaHNyAmIQpe614zZ9c8T9lqonf7ydQ3Zs+BkqEaNPWxrxSxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730000875; c=relaxed/simple;
	bh=O0MyrkvloNoPJDskY4nrowfSFye3yI1Rbfm30G6YYfg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rd+bMh7+e4ZuFC6of9M+jqvTx45fCsWDJR5rUIYxLmOwKS3S2mg9aqAxaaK93JgDg/fVGDN5pZI3916X2LxqHz41zmR1kiFNySPWHd3ScVMCJ/J1IFxRQW7j/Jiu5ENLCAd9V/ajJ9tWPRiLUp0AZpocZOxPDh+o0r4C0fmStk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nha3wbql; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nha3wbql"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C3EF211400B8;
	Sat, 26 Oct 2024 23:47:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 26 Oct 2024 23:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730000870; x=1730087270; bh=klY+fzq1vnYMi4D+XsOpmznZKnWJ
	zbnCbRhfN8m3qAA=; b=nha3wbqlV0/lT27A5ymXcMfir+5vcyh7t84QE/gpb1/N
	ucEfdcCLX0JQo7ceLMhJzn0O0ie1joG9vVbA6jMq1wuO0h4hruE4xD9gAe6giG2v
	i+ojGIMFtD4dI1C+LkKTPDSF8ZR0JKbRIyQtPRN2MRRW3gf3zbDudz90Iu+Vkp4N
	ZBlN4AYCZBoaMBpEE5YYqtTc6+GwZoIRuQUvszhl3nHsKGeI+MEkNFo8Z5f45VyA
	eDqe33nztYktPJtQ5EelCY0/R8OMRiss5lnkzLUgnUEBCDjxP6STTBRzFT1P0XN9
	1rk8MYKpCnFAKdQVjvLdguRWZcin1vlYw/v45X1ZgQ==
X-ME-Sender: <xms:5rcdZ9s1bBcjyyYv1tguIlRyc5JeWMst8EEtU7bMbhXkfiAvgcayjQ>
    <xme:5rcdZ2fMTwnba4SjHQ_YEqVMmiimQTDy7KbDBR-nGCP83bVqtxpB3pSPyndIQf9ml
    zUzOAD5IJ0n1X5AzIA>
X-ME-Received: <xmr:5rcdZwzq8mAgFCZzANr4a6k3uEaTsIP4RdALwj9B1zz8g3oyF4BO9Mx4C3-pfoxpxQ1-SNSWj27Y7h1Li4Dr5k1ZeXg4Dm1aUfY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejhedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpedvfffgteehffefueeliefhgedvgeelgeefkefg
    tdfggeejgfeitdelvdegueegveenucffohhmrghinhepghhnuhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhi
    nhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehtghesuggvsghirghnrdhorhhgpdhrtghpthhtohepghhlrghu
    sghithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtoheplhhinh
    hugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvsghi
    rghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopegthhgvfi
    hisegruhhrrgdqohhnlhhinhgvrdgtohdruhhkpdhrtghpthhtohepshgrmhesghgvnhht
    ohhordhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpd
    hrtghpthhtohepshgthhifrggssehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthho
    pegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:5rcdZ0Pbp_VvH2uwlju-eHNXqPBa3HaCRj_CSRZYn4_qy4tMrbVn-Q>
    <xmx:5rcdZ99Rft9aml5k-Kes6j0zXVsjlszSH7t3C3mSN00TMo1NvhGCVA>
    <xmx:5rcdZ0XS0QKTWxQdaoWAAnIM4MadPUNfPHxnqHThgX9YZmLs8IHxZA>
    <xmx:5rcdZ-cWetaT5fJvTC9zFXFFvWRtRrWks_G66xkj1CyOq4jZGsuQeA>
    <xmx:5rcdZ5RtoEiayaB71-tNiqb6CbB6UDkJKoqN7zVh-Fv6pRwazA3GqCtO>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Oct 2024 23:47:47 -0400 (EDT)
Date: Sun, 27 Oct 2024 14:47:42 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Thorsten Glaser <tg@debian.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
Message-ID: <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de> <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de> <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org> <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1634310113-1730000862=:29"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1634310113-1730000862=:29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Sun, 27 Oct 2024, Thorsten Glaser wrote:

> >https://gcc.gnu.org/wiki/RustFrontEnd
>=20
> That=E2=80=99s assuming it can build the same stuff the same way so it ca=
n be=20
> used in packaging.
>=20

Not an assumption. I simply pointed out an opportunity for collaboration,=
=20
because I see the primary problem facing the m68k port is a lack of=20
resources.

> >I expect alignment assumptions like that will end up putting more=20
> >platforms in the same predicament in future.
>=20
> No, all the other platforms use natural alignment.
>=20
> >"Natural" alignment is meaningless in the context of portable data
> >structures, as they exist without reference to any particular integer
>=20
> Yeah, but in practice, all we have is ILP32 and LP64;=20

=2E.. for now.

> the Windows=C2=AE world has LLP64 in addition. And natural alignment just=
=20
> means that all the data types=E2=80=99 alignment is their size. (Which ki=
nd of=20
> makes sense, so you can read them without getting an unalignment trap on=
=20
> SPARC or so.)
>=20

That would mean __alignof__(foo.b) =3D=3D sizeof(foo.b) but that's not the=
=20
case on my Linux/i686 system. 4 !=3D 8:

struct baa {
        int a;
        long long b;
} foo;

> >Q. What is the size of this struct, assuming baa.b is naturally aligned?
> >
> >struct baa {
> >        int a;
> >        long long b;
> >};
>=20
> For ILP32, LP64 and LLP64, it=E2=80=99s 4 (a) + 4 (padding) + 8 (b) =3D 1=
6 chars.

So natural alignment is portable if you first assume a data model. But the=
=20
struct definition itself is not portable, since it doesn't specify a data=
=20
model.

> More importantly, and relevant for Qt, struct baa is also 8-byte
> aligned...
>=20

If the struct itself is not naturally aligned, it too will eventually=20
break someone's assumption of natural alignment.
---1463811774-1634310113-1730000862=:29--
