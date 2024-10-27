Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86564C97
	for <linux-m68k@vger.kernel.org>; Sun, 27 Oct 2024 02:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729997365; cv=none; b=AVl5cpI7Mx19YDAlzcJLkf3/zaF0F+OgsjkGDRbh+wj2r3rXlKeKsuFweYdd7SiIJpbqD2/GOeaiUBd7qpNyKSaBrx7a4P6PBTyzfimzf9Y7Q4ZVUsoU2Vp48IcWms+SbhiI5Nlxf3cECWn5Lq6GYihedWpSgQueQn8ThFiMvHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729997365; c=relaxed/simple;
	bh=POyw5WqLDMGGY9Benf3ZvDNkZhXff4wclHPBbE3c5mc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U89yynWzjk7gCEnU17q6SJzCpatmO9CasDPaZV8/IVFxzB8puxV1euucWLn6hSjjpNz7ZUilyd+OR0LyPWhxRgM8l65T+NU9033jV10aII/g2y+8T/xWLPnFIY8GIcE5ZgqDcReZovkqkvLtdfCs1OYxiEe4hPQL2nuN5wToKAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R/HfCvnP; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R/HfCvnP"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 8A1E8114009C;
	Sat, 26 Oct 2024 22:49:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 26 Oct 2024 22:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-id:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729997359; x=
	1730083759; bh=f1gfuVhsV7kquAlrOl2WdvMo9eEyCDdND/5fSXWB66o=; b=R
	/HfCvnPJVfG8MNLb4XVHrBH9LjJmUsQUNDWHrW6PCRcqFpmLcX0zdhkf5AlKAQfW
	xWcZ4EHapqtV2we/J9UGTZ5xwYryZDTJ6RQh3I4kKNhgiBknMAkFC6rZWvE9P1fK
	onZAJUYzATVZv3aTAlgKse4zoHqCAOjLrP/uNk22lTPY9kSh/ZSzL2Jut6Bu95+D
	55bbhz/6QjqrZAF8EX12xa7galYDlPM8P5KtFR4yr3myaoRSfdWXVl1WGdwvuJwy
	BuDObetJZODuIPQTeb3p+tGnv7FevRbOENZnpXbA38t/ZsDx0Tksi7//OQhOwY5+
	6O9FoGyfGjBgQfC0hz7kQ==
X-ME-Sender: <xms:LqodZwbNahBz2TGRQC47SWhP6s8XJ3Wk1GHLiL9-h6etT56j93Xj_A>
    <xme:LqodZ7bLKm_IptoaxYf6kctUSQgdcnjcUbY-xB7tWOA6R-DmXftzuOv_m_Ige7pdR
    AS8UvGFEcRJDwpIqOI>
X-ME-Received: <xmr:LqodZ6-YZl-6lawSpaaz5dCpkBxu7w0SeCK9BzYEapv9aNp7dI2c4RMF2ivvYlueAOCOTqUrS6gEifpLIbPZWrwsRG0dIIRU2pI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejhedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeejvdevleduveekheefhfehkeevvdelveeutedu
    udfhvefffeefjefhhedvvdevhfenucffohhmrghinhepshgrfhgvtghpphdrohhrghdpgh
    hnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhope
    elpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtghesuggvsghirghnrdhorhhg
    pdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdrug
    gvpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrgh
    dprhgtphhtthhopegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgtohdruhhkpdhrtghp
    thhtohepshgrmhesghgvnhhtohhordhorhhgpdhrtghpthhtohepghgvvghrtheslhhinh
    hugidqmheikehkrdhorhhgpdhrtghpthhtohepshgthhifrggssehlihhnuhigqdhmieek
    khdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:LqodZ6qoE5RANezF1GshAEN4q2hF7fL9f8V1yiof61f6FAGbhU4d-A>
    <xmx:LqodZ7pQ49q22QFQ8_dYNrB3SoZOkZCejXrl_pBL5U_6kxHbEuugJw>
    <xmx:LqodZ4QXr6WVTYYpw5KySchuP8vSb7qHHEaoJ4cFyKKnZdrRF3V2kw>
    <xmx:LqodZ7os-3L_IZgkICMTaNvSc3TcobZd1ohPcamnAhvb68r7d1hPyQ>
    <xmx:L6odZ_cKOQ3Pjud2-Mb5riFZXIEA1jKY-QfhAeaJu9M4VeOEM0p4LWV_>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Oct 2024 22:49:15 -0400 (EDT)
Date: Sun, 27 Oct 2024 13:49:09 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Thorsten Glaser <tg@debian.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
Message-ID: <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de> <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-875482578-1729990302=:29"
Content-ID: <ddf4ffe5-a7c2-d286-f7d3-8231b1da8185@nippy.intranet>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-875482578-1729990302=:29
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <816fd454-6f5d-adf5-3f47-8a144b23b129@nippy.intranet>


On Sun, 27 Oct 2024, Thorsten Glaser wrote:

> >
> >That seems to imply that someone requires that those packages are=20
> >ported.
>=20
> Yes, we do. Rust especially is killing the entire FOSS ecosystem.
>=20
> These all are conditio sine qua n=C5=8Dn when it comes to continuing
> Linux/m68k, as a whole.
>=20

I think that's overstating the case. Alternatives to rust are available=20
and will be for the foreseeable future. Most notably,=20
https://safecpp.org/draft.html

I agree with your sentiment though, in that rust generally gets a lot of=20
funding and hype. Even if the Rust Foundation doesn't care about=20
supporting the backend for m68k, there is still a way for non-commercially=
=20
viable platforms to collaborate. In particular,=20
https://gcc.gnu.org/wiki/RustFrontEnd

> >Absent the right conditions, perhaps it is best focus limited porter and
> >developer effort on patching only those packages that are really require=
d.
>=20
> I tried my hand at Qt5. About 20 man-hours in I essentially gave up,
> and that was without even getting to something I could put to a
> compile and runtime test.
>=20

I take your point about the amount of effort required (and the lack of=20
resources). The answer may be to share the work better by enabling more=20
collaboration.

It appears that NetBSD/m68k has naturally aligned ints. Perhaps you could=
=20
look at adding kernel support for their ABI, and get access to Qt and LLVM=
=20
that way, without impacting the existing ABI and its ecosystem.

BTW, it has long annoyed me that two different 68k Mac bootloaders exist,=
=20
one each for Linux and NetBSD, which are duplicated effort, and have=20
different sets of bugs. To my mind, this is another good opportunity to=20
collaborate and avoid wasted developer effort (perhaps by dual licensing).

> =E2=80=9CNatural=E2=80=9D alignment of data types has essentially become =
a requirement=20
> these days, and m68k is the only true outlyer (i386 could in theory, but=
=20
> the Unix psABI designers were sensible enough to not do it).
>=20

I expect alignment assumptions like that will end up putting more=20
platforms in the same predicament in future. "Natural" alignment is=20
meaningless in the context of portable data structures, as they exist=20
without reference to any particular integer unit. It is because your=20
struct patches improve portability that I'd expect those patches to remain=
=20
acceptable upstream.

Q. What is the size of this struct, assuming baa.b is naturally aligned?

struct baa {
        int a;
        long long b;
};
---1463811774-875482578-1729990302=:29--
