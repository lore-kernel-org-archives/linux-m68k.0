Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D4EAD2D
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 00:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749862697; cv=none; b=c+ei45uHg7DidZgareBQOKyy0dS+52AJeP/ajpPBlg1HEUQlZHQ7N3cwCGrF8nyk4PjOqvOhPJbXzJ0SIcOqNWqJF+F78TeTQDHfHZJtH7hXM9qfdAHGfXLvUP4S1gdz60sPojgL6bQMTLIu5UDJYcN9XYzvvK726/9289qKlv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749862697; c=relaxed/simple;
	bh=BPbsXS3CY3fmPv8zACWcWWS/m3khQUtmsltlZTvkeK0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fmy3eCvXxB4tzhYmMoNCkSY+tPT8RCXiv20fPj2pQr/G2AVLlg7TVhtdkAnI6mY6euOKpE5ocElpM9qASNA/FpvouSvI4VfeQYinMX8xc5cy6qPJgSQnZDpp7u2Z0gx1EigPO1uWuurjhWm6+YAJ1Vy2XxdYTXCQ0iP+eauXuo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MmmHIAao; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MmmHIAao"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CA64B11400D2;
	Fri, 13 Jun 2025 20:58:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 20:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749862692; x=1749949092; bh=nkO5gofp4cAhq+hzqEd39IS/TQoi3Xv/GW8
	18k5045E=; b=MmmHIAaoORN/kmQNQWbqZcS5CiwmP8GnWXlfXmnb5fp1CEBmiWS
	jcUuao7UBWjZLeRiWIREhIfcKxlux0TLDVoxutjJpN4qubz3Yc446E4UBQn37+od
	9Wsin2mtVFw8IMq52eLDl3RmQp/VXgVr2wEP0sGvAPYbRneHI1uVzHj+f/Tvvf+3
	h70Z8bKgSVOgWY9iaKbTbEaxjh7zu5LL/rBX6awJEBSFuPQM5Lz1lA1oh0YHgJnp
	EAzWWnUBbwjRVW3DNv7tr8icTKxaEN53C2cED3RHkE3hbU9/2kLSfIUOB6R0esfH
	yC9PFN89FCWJLtqb1DU5z8X3CFDVB8Qcjaw==
X-ME-Sender: <xms:I8lMaOhT2Gvks_ts9EPMwKK_5O03qkHmZ5HIGV2ec8_uMYTAAeHdLg>
    <xme:I8lMaPBFVBhEKz3CPrZ8zmFlcKBu3kN4XKuWAhITHoFIyA0ATzW2auIXZvMzlGRqL
    WSK9Ojz7v3XO8QptvU>
X-ME-Received: <xmr:I8lMaGG_V6NeDpPzcvoBLD0WYsAku5Xmlr6Mv5fqV9awKFUoXBKY9VVCen5_eQ4i-r7YpkcCB7WQUsBKcRM-Eaf1KsjI0uChCp0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduleeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhephfeiudevffelteefteeggfekheeludeffeef
    jedvjeffudeuffdtieejvedukedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpug
    gvsghirghnrdhorhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtth
    hopehorghksehhvghlshhinhhkihhnvghtrdhfihdprhgtphhtthhopehushgvrhhmheej
    seihrghhohhordgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrd
    horhhgpdhrtghpthhtohepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgv
    lhhirdhorhhgpdhrtghpthhtohepphhorhhtqdhmieekkhesnhgvthgsshgurdhorhhgpd
    hrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:I8lMaHQOnTJxUKKueP4n4c04Rp8msGX7qH3Aab1sMSPH-f0jAD7-CQ>
    <xmx:I8lMaLwjD8-XPvhORndadt4zLP827V-M3TR1MBUnXN_Wfq0XATWw2w>
    <xmx:I8lMaF67wz08b5t00NpwZoIJCjQ3QpYzHw6F01-RgHdE9u9AKz85rg>
    <xmx:I8lMaIzM8tdhe_lmM5oLOAo5D2p60NaubdGHX0PpysQqEXHbb7BwqA>
    <xmx:JMlMaK0FG6eHPAkOTrNb-KyTiYMk3pggzFTfLOJ06y6XqRB2rdNMtJ2K>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 20:58:08 -0400 (EDT)
Date: Sat, 14 Jun 2025 10:58:55 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Eero Tamminen <oak@helsinkinet.fi>, Stan Johnson <userm57@yahoo.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <f80022175fe5dfac2ab03b577c887edda0d87326.camel@physik.fu-berlin.de>
Message-ID: <49c2162d-61dd-5c6d-ce11-5ec5d525943e@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> 
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
 <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi> 
 <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de> 
 <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi> 
 <d3a8ab8a-3be5-8f04-8b7c-07ff7e103e35@linux-m68k.org> 
 <241380f5-6c75-423e-829b-400161b020bc@helsinkinet.fi>
 <f80022175fe5dfac2ab03b577c887edda0d87326.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 13 Jun 2025, John Paul Adrian Glaubitz wrote:

> 
> Both you and Finn still seem to miss the point that the current 2 bytes 
> alignment path is a dead end and neither you nor Finn have made any 
> substantial contributions to keep this path alive.
> 
> If you want to keep this path, roll back your sleeves and get to work.
> 

I made the offer to help last year and then followed through. And you know 
it, because you commented on the bug report [1]. Yet you subsequently 
claimed, falsely and repeatedly, that I've done nothing.

Of course, you have to do this in order to try to discredit. Also, your 
stance obliges you to ignore the work of others, because that work 
demonstrates that the bugs in question are not really related to alignment 
or ABI in the first place. They are straight-forward bad code, like 
pointer abuse in Python [1] or over-strict assertions in Linux [2].

Apparently you don't have time to improve all the upstream codebases that 
you want to port -- though you do have time for sniping at that effort [1] 
[2].

Want interests you is a zero-effort port, with no guarantee of ABI 
stability and no history. You want 100% package archive coverage, with no 
regard for the applicability of those packages to Motorola or NXP 
hardware.

So I fail to see how your plans would serve Debian or the wider Linux/m68k 
community. But perhaps that will become clear once you "roll back your 
sleeves" and send patches.

[1]
https://github.com/python/cpython/issues/127545
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1105110

[2]
https://lore.kernel.org/linux-m68k/CAMuHMdWvmwvtA3F3vuYxiDf94Mn2o7TTQ9G-erv-ZfNVjMZrRg@mail.gmail.com/
