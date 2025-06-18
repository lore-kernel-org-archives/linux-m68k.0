Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDD91B3923
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 22:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750284915; cv=none; b=VL9REwtZBS+Q6y+nE+Q8292ARv/1+5TqdVSRt8rDnMXavB+dRViQfX+OcUFfWLxjSoi8Ht47ED4EBDkY24eU+Fx7wSCVRivCylIgG+vLKVu6leOkh021MNAx9gUq0lOYHrkz9MmzxMCA8+DLbYvPOsdMW7iXlAL1Nf4Cu+Jqu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750284915; c=relaxed/simple;
	bh=j8ysJ9wq05IwLDiKQYsd3kS3ZfHj5qh8bbk71v0CUDs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sAK92Hc+7NqzdYDOFecHHAjkxdfCBXOp2cI86vPXgwTFSqkKwiSzljSK+96B5QSXSR48d3D4OkhMD1bGqbiJnYUnlLJIO98Kniz51hnajTncBh1Tm4YDy75PsA7pcE+aRZtYCGpY29bKP51mOCwEY6tq8JzHQ9JnkRebjRmLU00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oVD+zek4; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oVD+zek4"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 513941380478;
	Wed, 18 Jun 2025 18:15:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 18 Jun 2025 18:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750284911; x=1750371311; bh=jU0nNChvTvu3e2Gg6B85IN5Vq5G+Dza8Scc
	+XdzNX1M=; b=oVD+zek4Y0GrjvkFeSPlk+/cLOEruZJDc8KNdIbQenHBo8hKCsE
	loQi+hDcmlbz38DGr5vYGF8+Owz++lpfUGARA00s65hjHhBOrNmdevgQAlkdOwNi
	oL2IACWajsY/NrTISsXJRawrVo/APtPA7B8cvIcRKQg+kL6zDfdLRlWp3aVTlggt
	pu1w+D51jRlxJGVWj5zwPVKMNFxaGbNzUe0bgVlJ1W2AblZwsT0YcxAI5yz9AN3c
	uPBTnR+r8y4BYmM5awAvg5r3++bFUC+onhKTjRs/vtdSNmgu1P7192IEhnqDRqb/
	kaGQXCLxQQmnTuqUJP8w1CNUVnlQ1RhceBg==
X-ME-Sender: <xms:bjpTaC-bqOPPYmMrEQhnxrU6_X36HrP7Oh8x65mTlZ-r8C-tolqOlQ>
    <xme:bjpTaCtpgIPQkv17cYvlbqi8g653oQKm9HQs12MTd6lg_zQ-o0TFGTX-nZj6kS9Ov
    Ddn-Uz3gmkpKOv0OYs>
X-ME-Received: <xmr:bjpTaIDBLZHWpUc38C6oyfjOt4gXPqaWXqANPf_a7dtheUdF93jKwp6uEFi_1eQiJTFD_3k99QPe9xB0J_JIDH7JazqbFI3m-NA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeffjefhjeefudfgffdujeelieejffduffevkeet
    udeiiefhledvfeehgeehhfdufeenucffohhmrghinhepshhouhhrtggvfigrrhgvrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhht
    hhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepiedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhu
    qdgsvghrlhhinhdruggvpdhrtghpthhtohepthhhohhrphgvjhesmhgvrdgtohhmpdhrtg
    hpthhtoheplhgruhhrvghnthesvhhivhhivghrrdgvuhdprhgtphhtthhopehpohhrthdq
    mheikehksehnvghtsghsugdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslh
    hishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:bjpTaKfPN5O3WCTZ3hJXAQJZKDrDN-9RUeHnnSrGJM3B6Bo9N_vH_Q>
    <xmx:bjpTaHM4i09s_UUiQTTRrkKr-wNFvYBhTuGziXY82RfsWw27xjz3Yw>
    <xmx:bjpTaEn36DeamfVafSgnJKj1v7YR9G4yF46auGlPvKzj-f-2AB4JsA>
    <xmx:bjpTaJtxRtQefCgz9GmhO2jd2BsTlpsuGZpAU594hXn8ZYfXJ2iAxQ>
    <xmx:bzpTaMVQWxp6CQqNiU-UGWeGP2jB-LfuZwE9QmV52jJ6pw8oqDP_2d8D>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 18:15:07 -0400 (EDT)
Date: Thu, 19 Jun 2025 08:16:01 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Jason Thorpe <thorpej@me.com>, Laurent Vivier <laurent@vivier.eu>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <1d14a2d7a1adc165fe77d25b1f8611beab14cf9c.camel@physik.fu-berlin.de>
Message-ID: <3c1b218c-7513-3974-e2c8-ff9902f04b48@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> 
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de> 
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com> 
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de> 
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi> 
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de> 
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu> 
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de> 
 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu> 
 <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de> 
 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu> 
 <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de> 
 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu> 
 <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de> 
 <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu> 
 <758E94EA-113D-4FB4-B5EF-1203FB67F520@me.com> 
 <daeee4ff-ff27-27ef-7e6f-71ccd556f6d2@linux-m68k.org>
 <1d14a2d7a1adc165fe77d25b1f8611beab14cf9c.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 18 Jun 2025, John Paul Adrian Glaubitz wrote:

> On Wed, 2025-06-18 at 13:19 +1000, Finn Thain wrote:
> 
> > Do you know of a good solution for this open bug?
> > https://sourceware.org/bugzilla/show_bug.cgi?id=30273
> 
> The proper solution would be to actually adhere to the official SVR4 ABI 
> when declaring elfosabi == GDB_OSABI_SVR4 and using GDB_OSABI_LINUX for 
> the old Linux ABI.
> 
> This bug is another example why it was not a good idea to ignore the 
> official AT&T System V ABI ELF specification as it proves that 
> independent upstream projects look at the actual official specification 
> when implementing code.
> 

I think what you meant to say was, "no".

Interesting how, after a year or two of agitating and bloviating, you 
don't actually have a solution that would permit two co-existent 
m68k-linux ELF ABIs. I wonder what you real aim was?
