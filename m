Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4041FA178
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Dec 2024 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131703; cv=none; b=B/3E4Qjue70QPo7t10r4sa14Vj+FAxKXUfeyO2II2KA/C+kltDVB2UhDuvpDKHZpncVb38XKZyalnHlYRp+tOhW8EazQzbEOmMdE5CYOX5va8H+thz1IJ1qMyxiGmHThxtM/XCyrR4+rB8OjH3gP7ApcgreXbuT3kVQcNNBrykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131703; c=relaxed/simple;
	bh=YCKKHOkYcjU3eVZLXY4GlyGAzwYDGeB7zy/3/G0VBbY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lnSHUkQKVGsAqaGsu9qs97WrYnuVhX6PPjzmJz5gnLyNKXXeqHbTNF+2ozNH/6QiJoY5Z1Idx1AxgwYLBGs34U8hfV4Dv2zeCkd+cGmfDZFSqw5iFEtVG/CPP88uyXmilMUc7CgnjnabhHXLhR4cm39mOrZvUn89PR4MK/CeJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ROviGzmA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k3LcCnBv; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ROviGzmA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k3LcCnBv"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id C0838114013C;
	Mon,  2 Dec 2024 04:28:19 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 02 Dec 2024 04:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733131699;
	 x=1733218099; bh=0vtW7zcy28E3VWtcQ0tZtRDJt36nwZn3YMYcW1ufa64=; b=
	ROviGzmAG0HSz8q4qvRQB4L2vxZ0gTUFxFgbbqjP3qFHSXFOZA3VThUmc+unP1Cc
	uZEnvOXKZIzAKVX41xrDZqjAQxv7PJHyydGH/hoVNUCAKSrh+p0dtZPrEnZ3IJVS
	YSF/FCZAdcrFvD6pcwsve73p8u0mH7wn8LCxPDP2K3Ixzqvbwl2Blew/wKIeYP4c
	JaF7ghNbysxlP6oiXnb4g+Gm0aqbZP0smCJLoXl9MwZPYiOINoROiaIdtq2YXmOC
	Sr8VW6tGWZbKTeGftLb8qGFNeUGyBTPQMIVXasnp+4H6uEvGd6ibN6n9LopN8I7e
	aWJXEbONiw/rbzZQtY98uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733131699; x=
	1733218099; bh=0vtW7zcy28E3VWtcQ0tZtRDJt36nwZn3YMYcW1ufa64=; b=k
	3LcCnBvV+X2jdZd9wdvp80HUJMJstHohn95DFYLVckzEfQ1X3XkHIzZpIjkPTE3X
	wkxxXuUnGaBw356eMjbJTkqx97ilpYxO2DL8R0Pc6nZeLXUBDej4eMOFnCiNhMnh
	sPzstBlgjLd+LOw4fLOm82nJI4rl2smO3nglB5ZXEgHfuskt66lvuWTLtSf7GXSy
	8ky4EzFjihMQdQiv/R9R1cULK6/9sKgdc35ny1pFJB7Yny1dHtl57hCXgOKTLoKf
	7tGSrq2IIVVd1s2NHBGycl65p2IfGoUJiD33IVS9DBl2nixeDc2w6nzfPHAZ6Avq
	BJsnDOy7lZMhDosErilOw==
X-ME-Sender: <xms:s31NZ-nRfQMJS-BUHk1nRmAY9WzRgll4-zivZuUGtw27GDXLpH26MA>
    <xme:s31NZ13S61_8340ydO8o2jhozBFFBG2915JBF_Q8YfwIIu-sR4-LyqBhvAfV9Khp5
    XtZtUFrr7ivSN2eRIc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrheelgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeej
    vdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkh
    drohhrghdprhgtphhtthhopehgvghrgheslhhinhhugidqmheikehkrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:s31NZ8p3hEEM0UIl_wlTiFIuMGNbmCtkflOhpeB93BoD0s94Zuw1Wg>
    <xmx:s31NZynpIciuFdAJhdNVZYVBmyLhp2IF_SFyhGB8o8Os9FlZqF3A5A>
    <xmx:s31NZ83g-mk8H2OnybF7i1ix-WzVzHOBPjySl8-e9M_qjtcjhgPVLw>
    <xmx:s31NZ5uBrAmmmDNdBxVKqpHZ0f8ZjlXQt3XX6QJPi4KzRRDzpvOjhw>
    <xmx:s31NZ5xfy0l0R9U0OTyXSS99k9jvvwFUCiGFrKpAjUqokXnycc2d7I0_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 427592220071; Mon,  2 Dec 2024 04:28:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 02 Dec 2024 10:27:48 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Ungerer" <gerg@linux-m68k.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Message-Id: <992c4d62-380d-4908-a688-77197d9c4cbd@app.fastmail.com>
In-Reply-To: <7bb57485-c08c-4121-ade5-8c76bc48e615@linux-m68k.org>
References: <20231113133209.1367286-1-gerg@linux-m68k.org>
 <CAMuHMdVZh6-64hfx1jgOijBEG6cTftinqf+4fZvqjJtV1hO95g@mail.gmail.com>
 <1dd8be4b-d5c3-4074-a91e-3ce998ce3050@linux-m68k.org>
 <7bb57485-c08c-4121-ade5-8c76bc48e615@linux-m68k.org>
Subject: Re: [PATCH v2] m68k: use kernel's generic muldi3 libgcc function
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024, at 02:34, Greg Ungerer wrote:
> Arnd, ping...

Sorry I hadn't realized you were waiting for me.

> On 6/11/24 08:04, Greg Ungerer wrote:
>> On 5/11/24 21:46, Geert Uytterhoeven wrote:
>>> On Mon, Nov 13, 2023 at 2:32=E2=80=AFPM Greg Ungerer <gerg@linux-m68=
k.org> wrote:
>>>> Use the kernels own generic lib/muldi3.c implementation of muldi3 f=
or
>>>> 68K machines. Some 68K CPUs support 64bit multiplies so move the ar=
ch
>>>> specific umul_ppmm() macro into a header file that is included by
>>>> lib/muldi3.c. That way it can take advantage of the single instruct=
ion
>>>> when available.
>>>>
>>>> There does not appear to be any existing mechanism for the generic
>>>> lib/muldi3.c code to pick up an external arch definition of umul_pp=
mm().
>>>> Create an arch specific libgcc.h that can optionally be included by
>>>> the system include/linux/libgcc.h to allow for this.
>>>>
>>>> Somewhat oddly there is also a similar definition of umul_ppmm() in
>>>> the non-architecture code in lib/crypto/mpi/longlong.h for a wide r=
ange
>>>> or machines. Its presence ends up complicating the include setup and
>>>> means not being able to use something like compiler.h instead. Actu=
ally
>>>> there is a few other defines of umul_ppmm() macros spread around in
>>>> various architectures, but not directly usable for the m68k case.
>>>>
>>>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>>>
>>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>>
>>>> =C2=A0 arch/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +=
++
>>>> =C2=A0 arch/m68k/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>>>> =C2=A0 arch/m68k/include/asm/libgcc.h | 20 +++++++
>>>> =C2=A0 arch/m68k/lib/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
>>>> =C2=A0 arch/m68k/lib/muldi3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 97 ----------------------------------
>>>> =C2=A0 include/linux/libgcc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 ++
>>>> =C2=A0 6 files changed, 35 insertions(+), 98 deletions(-)
>>>> =C2=A0 create mode 100644 arch/m68k/include/asm/libgcc.h
>>>> =C2=A0 delete mode 100644 arch/m68k/lib/muldi3.c
>>>
>>> I had this in my local tree for about a year.
>>> Is it fine to queue this in the m68k tree, or does this need a broad=
er
>>> coverage?
>>=20
>> I am still in favor of it :-)
>> Would be good to get some feedback on the common code changes, like t=
he change
>> to libgcc.h.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

This looks fine to me, nice cleanup. My instinct at first was
to add an asm-generic/libgcc.h as a fallback in place of
the Kconfig symbol and move the common macro there, but there
really isn't much benefit to that over your version. Either way,
please merge this through the m68k tree.

      Arnd
