Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2008C2CA9
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 01:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749864506; cv=none; b=s41kbK2Dsu++y8FTB+8+FjqZtyCUXfLzg4eI4Lw5fu6qC0C8jZavwK8/Uc/8J5mfPljzSX65Wrj52bbPivo2z6Dg1ruoxUu1zga4CAkMLwu8gfqw8tO6WKvfV2cfGjhOXYmUmOhTKjAN/1pbWHI7UrRD2xQO0PKofc7HZycS8ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749864506; c=relaxed/simple;
	bh=oTCW7G/ddZJVJI5/74wVjzgw6keP6gBky/nToIv4m7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UYR4SU11t52NmQAZcXWg+dl/OHMX9MKLVfCDi5Q/EM1OCQMcS1Xi8cd2pae3ng5HICqrN9ggIF+SEvqV6O9aFt/w4PQWy96G2BmOlCoxzK6I/t+TLDQA0+Qe9/jraSb4HBloU5SdnkDOJgSTv8fpotBKSv+yTIZai9GdTZYIUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G9Yx8NHx; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G9Yx8NHx"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1C431114016B;
	Fri, 13 Jun 2025 21:28:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 13 Jun 2025 21:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749864503; x=1749950903; bh=7EpKOYRwAtUHcgxj16BxrlW5iTYB72DtnHd
	Wo+ul+tk=; b=G9Yx8NHxpKAhZJrtBd3/JPFKTNwgUYvp53o/lznnrtnQanJ2tlw
	xpZBifvDXaZCDcVCsFib4L3iviV63AyMmxVOjJya49hCjp+KGbEcfB6mP8LOfgHo
	9sJSD+axNT7R3topqq+q7/LTDO4MfRaU0mczvpIAbgitOY+vpgrZH+zWinxEmhAy
	9Q0tLEhUPyUHzWivWSzLS9mXFXeH/zGuBADhiNDGZPe2C+puo6RPpmL0GPdQpnkF
	WfLxPGNSZXuAbA8eLKJSTCtgDRWu5HhKI9N1txlJjNepM1SoIz9I6g8tfzXcRQQf
	uDwK0KNgEUkGddrjDdOxYS2h9oJ4NKRCw3w==
X-ME-Sender: <xms:NtBMaOxnih_y0GEOVY47cJGBFUitjvdnXWcWqbg4tsSZREePsmYhTw>
    <xme:NtBMaKRj0oSTtVhD9hvKrSx7dF0TCSJVrv28Lr71JeDUYYTJ2WF89EeuKjMRXhsi0
    6ZV2Nr_TUEWGbTm7Gw>
X-ME-Received: <xmr:NtBMaAUdqp1hi92scDkTJn0UgIoIU269it9rLPQHONsQfbfGznCTpp0dCwAz8o4n3qkgQTXTOh8LnQ401H_uKDXBlJEBx9cJ91s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduleehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusg
    hithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepghgvvghr
    theslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepjhgvrghnmhhitghhvghlrd
    hhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhrtghpthhtohepphhorhhtqdhmieek
    khesnhgvthgsshgurdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsth
    hsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:NtBMaEhFAFMsPqDzBj_URe0i_0syzDznd7cTohEDElqqUCNZioggfQ>
    <xmx:NtBMaAD0_x--deyq_6YaqAbkRXc6ouLl9SqXXiNQz1aCyZWA4TgHrQ>
    <xmx:NtBMaFKAGQY_Yx4g4euOessapGA7YrMBnVR1PNSYIzfcZ-7g88p3Rw>
    <xmx:NtBMaHDgWlwd_OFfw05y5cLQX1q986a6i9pHWwpsV6waH_ScFhrzmA>
    <xmx:N9BMaGpsQGOE9jWD4jy7D4Qj7-Wil-sW0mlccL-rxPyQhVGm0ROR4bfx>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 21:28:19 -0400 (EDT)
Date: Sat, 14 Jun 2025 11:29:08 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
Message-ID: <bde11e6f-923b-6c29-67b2-5474dd5b2401@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>  <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>  <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>  <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> 
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>  <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>  <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>  <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
  <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>  <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com> <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 13 Jun 2025, John Paul Adrian Glaubitz wrote:

> 
> Do you expect me to patch broken packages into all eternity?

Some volunteers go looking for bugs to fix and problems to solve, but 
no-one expects them to do it. Others are getting paid to do it. Most 
people simply don't have time for that -- nothing to be ashamed of.

FWIW, I'm not getting paid. Nor am I trying to get hired in the future.
