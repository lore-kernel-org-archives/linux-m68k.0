Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACED32E11D2
	for <linux-m68k@vger.kernel.org>; Sun, 15 Jun 2025 01:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749951725; cv=none; b=hCiLS9vHeTiZeUX+TOU5epkcPYZ8GwsOjThAyaB1wj52VPj2AxoQ7XTG9pLzKXj1bD842jNe7h4uYBDXG138p8bdLPboNQAY5MDP50GSqCYobFh2NoVNCJGaxJZtHlEf0TtPEhLVbOuPCmI6Dgkll09/sTSfe/rM6p+WZxPvHA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749951725; c=relaxed/simple;
	bh=kGDqdm47j0WQiZ1owONkoX3tbTUI6eRy4GSkskqqY+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=crNN3lsYJqS2tm1ZPkzH+fuRTDdARnfWMGNXsu0q9YiirjPPLxLX7UfqicJlf0xnCD9iFW7MKWOirnvbPY83hag6veUYjBLZBAGq1e6gJPzYbY1tVCV6ayPiKqbfQojiHdoU9vn8f1YCiYPHsKMUCiSI5MlMyipfanuwmMxwT1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jeZupGvb; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jeZupGvb"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1A296114005F;
	Sat, 14 Jun 2025 21:42:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 14 Jun 2025 21:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749951721; x=1750038121; bh=wdEAegYP5pDMPdxGWmzqM3bOu21DX5y9kqQ
	Nkygge08=; b=jeZupGvbvw2mmXkJE1CNAH4wdzuCjNhHWHwnNSn9vB/K9BXiZgN
	3OQQ+CyUAzr3XJv5Q0uwauiNGPtu1Bl9GSBybsMfcQvr/G1qaT95eyPfBSBDRXEI
	xtRMeubi9Fkcg+ixk27ivOj3GdYVol8tT7U26+ja2QNKbP7DOWMuu/UTHN2x5Nui
	+angNDJErObgAf2/gc+14qpJg++vzabf618Z5tW25L+8TckXWwpO5bfMcF68wgjT
	5mePd9cJXM2mPUazEvb0MpBSitDHW4U9NDntw7OZmBEWc6/dIVD3R9r1IVzWAFbX
	p079pbTQDJDyb5O9n5QQWGJim4JVX7DGSFA==
X-ME-Sender: <xms:5yROaM3ykko7I53NlCu2nXVSPkDGMqK5JupImwyjkB9cjLT8ChEXFw>
    <xme:5yROaHGrp6msa0p2EnS9iP4xGg6edc68hWlpwxl2TYTsDiUI-3jrklRxWek5jIPzV
    pX9-XLI3WCI8vlBi3s>
X-ME-Received: <xmr:5yROaE7d9-EfXNGMlCzHs3WfWJ1O5b4LLw0_P2GunLzBS1b7s4vn3Nqa-iKk6SKuWS4gq43cl_b7LGUVOIIqyMRIZ4MbEhtUX5I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvvdegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepgffhiefhgedvffeukeffteettdejudduledu
    keduuefhfefhjeeivdeggfdutdevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghi
    nheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeekpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggv
    rhhlihhnrdguvgdprhgtphhtthhopehlrghurhgvnhhtsehvihhvihgvrhdrvghupdhrtg
    hpthhtohepohgrkheshhgvlhhsihhnkhhinhgvthdrfhhipdhrtghpthhtohepghgvvghr
    theslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepjhgvrghnmhhitghhvghlrd
    hhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhrtghpthhtohepphhorhhtqdhmieek
    khesnhgvthgsshgurdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsth
    hsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5yROaF26KNQ-FmEVrvw4anqPH-3ndbp2mGFe2Q6RZk4qz5aUwD_J8g>
    <xmx:5yROaPGrxpxwyRGSNBJfY3Y5HJ3GcHf0pRb5IsWVldi3BSlHKPDYjA>
    <xmx:5yROaO9XJEBkXXtzxdZGDRbv6VHJiL2iXAsEGvbaTJUcykiGSmtEcg>
    <xmx:5yROaEm8a7s2usWD8nQZFxOoo6NCZ6-NT5ksbrCuX07O1u3A-J2wrg>
    <xmx:6SROaPbnDKjG8ADwzg091iCqmtn3dNRdUDSm793jkKhAXMvLz8ST_F07>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 21:41:57 -0400 (EDT)
Date: Sun, 15 Jun 2025 11:42:48 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Laurent Vivier <laurent@vivier.eu>, Eero Tamminen <oak@helsinkinet.fi>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
Message-ID: <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> 
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> 
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de> 
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com> 
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de> 
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> 
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de> 
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com> 
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de> 
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com> 
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de> 
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com> 
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de> 
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi> 
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de> 
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Sat, 14 Jun 2025, John Paul Adrian Glaubitz wrote:

> 
> Sure, we can remove Python on m68k. But whether it will still be useful 
> after that remains a different question. I would argue we should rather 
> totally drop the port then because Linux without Python doesn't really 
> work these days.
> 

https://lists.debian.org/debian-68k/2024/10/msg00042.html
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1105110
