Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A435F2A1C9
	for <linux-m68k@vger.kernel.org>; Thu, 12 Jun 2025 01:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749693250; cv=none; b=VmuOVXHFafVAyHl7VKLs+ii8m8LpZD+cbO9lVgI7+MSfkQ8J0HfHK8FHrZycnAe8x/8v6YtxeccKeFAQe1y3zNE9Ftqih+Ynm3LUkoxrCLbgn209jKfMIvzbKiOvi6KrqkxkMhOj5lmLKNvkR5gsBPZJdi9irMo780YqTTRfuRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749693250; c=relaxed/simple;
	bh=z02WzgjrK8JFjJbbOAtsah2ls010MDw1uFDuxt6z5tA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XMVvdl5buer9ks2qK2Gc2pQr1BjhIq1gK1QMkWLGEJ9xYson0jqOb2NG0QlF7m4Yo4taHzSlXfAk2yoKXq8mvZTifnV6Q+0YHRyffaArEaGmVA8z/VV7fJU6k72dauSszzUNkzsJ49eueVYbfZ7pycvDDqQ8M1FJgjJbe/7vMG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ViVUgwTF; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ViVUgwTF"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4720D1140216;
	Wed, 11 Jun 2025 21:54:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 11 Jun 2025 21:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749693246; x=1749779646; bh=LcLZbnx4518Mt+y2PJBZO38L4UmSDhRlmpJ
	xHuLv2bU=; b=ViVUgwTFGAFdDmZOVsvlHyQ0+nvhhT1GrnqgAZ7b0xj0ZRo1ySX
	WsK/ogIwy+gdfG4Xgg81NNWi3aYfyFCMH9lW8JYzE2m+nf9jDaTgECYQj8DDEsWO
	MTEiyYYqq9GFPHc5udXEVxjHXeRqwCnbUGrpxWd4yzR6CDT/kW1FCV5uALljAJqV
	AdtgWaYrNI4oR9FxyjmnLdXcVzg2OUgMQeqJORZeYC/sQU6Rejq4tjvzCYjlxylT
	3u62MvRBdLZ7FhyG9F9JSqeGBVWIHrJIOouQipmi+bF5rncgeV19127mUzuKHNjf
	CAcTfYV1XIhhTjUWztYQr0wqboNCvEVoAXw==
X-ME-Sender: <xms:PTNKaH0Us8f8StimsY7EacQjWIiUOF4g3aVD9m9hcGJEgEiNpHPFpA>
    <xme:PTNKaGEj2nz75Q-q3ixbyMLpHQjb6zBSszfUF2DqkkzTvvgpwe8S6wKK3N-VdpkR6
    zePr7YpiSvlquyVBkE>
X-ME-Received: <xmr:PTNKaH6OdteDCChEBPKvBvYCkjsNWk1cYlsB6SRG2npkxTAx7ddK7kC-GCF-jorWv95Df7OpcF6ozcEUBHryQ19IixOZlWCFqk8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddufeektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepgffhiefhgedvffeukeffteettdejudduledu
    keduuefhfefhjeeivdeggfdutdevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghi
    nheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggv
    rhhlihhnrdguvgdprhgtphhtthhopehushgvrhhmheejseihrghhohhordgtohhmpdhrtg
    hpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepjhgv
    rghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhrtghpthhtoh
    epphhorhhtqdhmieekkhesnhgvthgsshgurdhorhhgpdhrtghpthhtohepuggvsghirghn
    qdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PTNKaM1Liyajd3LBAIgLuS27s2jZ1p8dzCerRHqjaYhmHWRe_vRDuQ>
    <xmx:PTNKaKE4qXJ7dTlrHxlg0GP4mdYvysbR58Q9jqQ5rllq0BIyU2_ofg>
    <xmx:PTNKaN9eQC4sc-_XkpoQk2w2tpPcHuMJ_2ZDrN1vxYLLHSk2rfamSg>
    <xmx:PTNKaHlQ1tCKErbAgVeTqkxhBItyETgcg4V0WGlhYUIh3FTCAaJatQ>
    <xmx:PjNKaLy4ZxeQ6CRP11PBTpMUj2iMVEGAi0bDUCbmjDH9ToZZ3utottSW>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 21:54:02 -0400 (EDT)
Date: Thu, 12 Jun 2025 11:54:49 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Stan Johnson <userm57@yahoo.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
Message-ID: <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>  <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>  <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>  <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> 
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>  <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>  <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>  <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
  <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>  <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>  <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>  <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 11 Jun 2025, John Paul Adrian Glaubitz wrote:

> 
> I'm not sure what you are trying to say here. The fact that your 
> computer is too slow for modern Linux distributions is unrelated to the 
> alignment discussion.
> 

Sorry, Adrian, but you can't have it both ways. Either you support small 
systems or you don't. Debian's documentation says of m68k:

    This architecture covers Amigas and ATARIs having a Motorola 680x0 
    processor for x>=2; with MMU. However, the port is still active and 
    available for installation even if not a part of this official stable 
    release and might be reactivated for future releases.

https://www.debian.org/doc/manuals/debian-faq/compatibility.en.html#arches

There is no mention of fast emulators. Yet that's all you're targeting 
now.

Debian needs to fix this, so that those users/developers who are 
interested in small systems can colaborate effectively without being 
mislead.
