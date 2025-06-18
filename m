Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB451362
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 03:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218559; cv=none; b=aLxKzFSC0ryAl03KOeqCd3jMLt+Qz77xlJyC87ATWQ9CkanTk+yDAzoUgbLnap4eoQ5OH39Zagi9VWHkcxkfx4LJUObUW2acPjdm+9TPCsPOfhoeaAvCNnWHQiFYQFeXd7UOmIdbEygv7nr5fY8hy7KXT8J78ggjBKNjcaCbtgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218559; c=relaxed/simple;
	bh=B+GF2eu+/nY9hFG4QMqe5TwFhyaqgwMqIXyAjuLHZGY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s9LJ3Al44fb5eKs/a0ZD3IduskmjBb46TQoNOse/miEL9+V1dLRbtFCiWNwjNZqoQVKDcxzuzoMhN53uFwSeB2ZOpMUoIHR6lqfL1mH+8bZMtXJPLsHDTnQ7XqEZl2nVv2s9grT8TATReBG+TqdZh7ye+NbF9xzJCh7Hr4IpT64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S140SSCL; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S140SSCL"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CE0EF254017A;
	Tue, 17 Jun 2025 23:49:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 17 Jun 2025 23:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750218553; x=1750304953; bh=hNf8gdXaMfxP3LH2SI7KVLzRRKNPzBeBJVM
	meg2c2f8=; b=S140SSCLFItA2lOUNq2XyP+ydfJDQR5jjuohsBeqqDi0TP2AQt7
	xHjfEnRhmPi12v8KE9X9tBJQMyVxHXGm7ifSmnkoOVSEqAhSFr2F+blnrML9NfWX
	ZC6FUC1Vf4vuy4c/oV1Wvj+dqJH4L92gijXWVbWk2oe16+KA98pET4OJEwtPHC+Q
	xWQ+LMtNBrgvvJaSrNsBmQ6q6iAIwwo/dp+SuQiLX0WRqHomASWG7pnaiBVSyKEZ
	ZcZmi0Xk2gmdA6HLGpch9nzz8UsHxo64Bxdk1S34wAh2gjWac5F5Qq//N2/Rii+2
	hf7s48SptQK4PUBA/jqLh1sAqdQBbDcQRFQ==
X-ME-Sender: <xms:OTdSaMkgrMjyVDPvfnfxGCCn8SliKxEBeNJwVHNn71QT3a4J2JmvEQ>
    <xme:OTdSaL2nAOYu_QdlpQYnZTE4W34tsuaLRBCxvVzAEiNHT8BY3_leudVR1t5Mb5PIf
    1Omkh96rEW25raMzZE>
X-ME-Received: <xmr:OTdSaKqRlwTIGCfCdSZXUEv_FGLyjuXX18bkIW5n6rOhTFFz_XZv70AwPblrClWBEXJUUAfJIx1bT4zxyrwerFlTQ5Hz2i3bkBY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehglhgruhgsih
    htiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehpohhrthdq
    mheikehksehnvghtsghsugdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslh
    hishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:OTdSaIktAxue2iTXDZeM5lK9tB1PBKzqZRwKBWTe3AqBWR2iA_x-Dg>
    <xmx:OTdSaK09018ANODM9o2CIxwqJzy2UAdHgjn37x5aoW6Y28QVUAaxJQ>
    <xmx:OTdSaPtMvfg2IVnkYiEeZCziCyY9aoDI0111JKeyHZUhmQLowcWYOQ>
    <xmx:OTdSaGXaxA9728rcrPjRUxuW9quIz1ER3XndhJEUkMG5kD7OK9difQ>
    <xmx:OTdSaH8TJLY_no4D7SoIraZr9zVMFn47_dKv36nZXQ1nD60-XRjAuZcy>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 23:49:11 -0400 (EDT)
Date: Wed, 18 Jun 2025 13:50:07 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
Message-ID: <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org>
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
 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org> 
 <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de> 
 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org>
 <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Mon, 16 Jun 2025, John Paul Adrian Glaubitz wrote:

[repeated falacies snipped]

> 
> How is messing with a hobbyist project "harmful" in any way? That makes 
> no sense.
> 

If your port was a pure hobbyist project, you would never have brought 
your complaint to the upstream mailing lists, where developers have to 
work with ALL interested parties and make the necessary compromises.

But, as usual, you're trying to have it both ways. You pretend that wiping 
wiping your slate clean and starting over doesn't impact anyone else. But 
then you complain when the upstream projects don't care to invest effort 
into your scheme.

The way to find a compromise is to build the thing you need, and then, if 
any of it is found to be useful upstream, send patches! That's how this 
process has always worked, has it not?

Moreover, to the extent that those patches get merged, we will have the 
beginnings of a second ABI with a second tuple. To the extend that those 
patches get rejected, you will have a fork on your hands.

So, some upstream developers will have to support both ABIs (for them, 
you've just created work). Other developers will have to choose between 
either one (for them, you've just make collaboration more difficult).

This is a lose/lose proposition. And if you think I'm wrong about that, 
please just send patches and demonstrate why.
