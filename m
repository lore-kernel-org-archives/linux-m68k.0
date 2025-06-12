Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ADF42A82
	for <linux-m68k@vger.kernel.org>; Thu, 12 Jun 2025 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716354; cv=none; b=fICmYyAuoLVltDrow2AGqpsGVMS+hThJ4fqATXmoACsAy6MsF1rAcqviwOjY+cSWHAa+Qu/2wGPF1Kb1i1I/RzOicMcvkREYIEoM7GOu3P2WFvzbItnXFbMa0ZzGTHQum1fGiqoYcHyNiof/e3XlAps2FUFPo3Ebby1EX7Qquko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716354; c=relaxed/simple;
	bh=HXnt6E+BKXs/yeHANpH1jn5E3uhpcJCkPNTzAofiI5E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Le/kwhgcoLk9KKNZ52ze9tneOPC+MTCKYsm/NS1Hvak1kkVepVqgjptcwReVrPV0fCs5YkVuz/KxqQYo4P/0DTRKMWQj32TRM9D58B3gMqK0sQMnM2LSMIr3OeslQxWF7DX+RR2JklKW18A23UpXEuNUGZNUfLBjfWMhXpjfHNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iB237Tg8; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iB237Tg8"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C9131380401;
	Thu, 12 Jun 2025 04:19:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 12 Jun 2025 04:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749716349; x=1749802749; bh=6OKJHsC+43reayUFd/B3zQWYeLV3iDMxw2F
	tk/lZtJY=; b=iB237Tg88VU1revrgp7xcGAXYPF7/aufTtkw2GG4owQDzx6oSJ1
	nBHgBJMCgJUvFE6q5S/HrWF92no7OHNZSEu0Iwj3ov/649CSS60X0ELc2dI+Ui88
	5hKQCo+N0qWvasc9QzU7UDknAdzkDACsuXmQr8vIDXp/6bUVp5CiI9I2RMxq8n/6
	pwYVNTCbxVhkvuTpjcyN/1BQSpMptUlsySHSoyj8EiCo7jHfIHAWheRjiWhyyTB+
	OdAqTgEDOcF71y+NTvUwO7sU2vzxB50fkXHVR48EUNR9XkFJczG+nv3zaYSL6SbM
	nJurTh5WacNW6Qcg6FusLz0mc7N9lyOuFgg==
X-ME-Sender: <xms:fI1KaP7iSK16Y9ox4ZUpa20fuGJrjYyd-9ycFzJeNkwp_0aRprcUtg>
    <xme:fI1KaE72FhJWzF3GcU0LUfEpfXN6y8yV3EwmFqMZRawkE5Zvo0G8MAxcXYjqGalRA
    XJ1-K1igi5irTR8a7E>
X-ME-Received: <xmr:fI1KaGdLWQA7I7pYdbNHMEP_kXzasGUhMpJ1MCVWMWOGkWhFY7F7oqX5J3oxp2NUNUO3_AaIndJ6lQFr0BKrpnKb1OIZAG4KFJc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepgffhiefhgedvffeukeffteettdejudduledu
    keduuefhfefhjeeivdeggfdutdevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghi
    nheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeekpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggv
    rhhlihhnrdguvgdprhgtphhtthhopehsthgvfhgrnhdrkhdrrhgvihhnrghuvghrsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepuhhsvghrmhehjeeshigrhhhoohdrtghomhdprhgt
    phhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehjvg
    grnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdprhgtphhtthho
    pehpohhrthdqmheikehksehnvghtsghsugdrohhrghdprhgtphhtthhopeguvggsihgrnh
    dqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    mheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:fI1KaAIRm3k7o0HqdK7FNaqdg7vg-V5f3npbJ1gj0AWLeNabcFiHqQ>
    <xmx:fI1KaDLOab74myPHxLm7-uAsFVXproqy8QLUJIRKIRrS1ZEkvdGJDQ>
    <xmx:fI1KaJxTTBVpgXQfm9kpEai1SCTC23bM0XewyTXXkdAohAnJd3JJlQ>
    <xmx:fI1KaPJSC3OTOnb9MRVj1AhvGSCwXSzV_bz_mUlX2Tg-1vjVbGlEFg>
    <xmx:fY1KaGdGjndCw7oXlYWgZJGY6l-V2c7T7DdYH2__yParAkHQs9CNU10Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 04:19:06 -0400 (EDT)
Date: Thu, 12 Jun 2025 18:19:52 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Stefan Reinauer <stefan.k.reinauer@gmail.com>, 
    Stan Johnson <userm57@yahoo.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
Message-ID: <1625e816-3f04-e700-308e-990f86c9a647@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> 
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org> 
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de> 
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> 
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de> 
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com> 
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de> 
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> 
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de> 
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> 
 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de> 
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> 
 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de> 
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org> 
 <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Thu, 12 Jun 2025, John Paul Adrian Glaubitz wrote:

> On Wed, 2025-06-11 at 20:16 -0700, Stefan Reinauer wrote:
> > 
> > Fixing pthreads would probably go a long way. That's where we lost 
> > about half of our performance.
> 
> This may be accurate, but I'm again not sure how this is related to the 
> discussion we're having.
> 

It's related because such changes could impact all of the C libraries and 
compiler toolchains that you wish to port. So it's an example of a burden 
created by package archive growth. 
https://lists.debian.org/debian-68k/2025/06/msg00048.html

It's also related because such an enhancement may involve an ABI break. 
That's why I mentioned threading a week ago. 
https://lists.debian.org/debian-68k/2025/06/msg00018.html

> Finn accuses me that I deliberately slow down Linux on m68k when all I 
> do is continue to maintain vanilla Debian on m68k.

Citation needed. What I have said is, Debian is bloated (in part) because 
of its dependency graph e.g. the cmake dep on Qt, which you defended. 
https://lists.debian.org/debian-68k/2025/05/msg00038.html
