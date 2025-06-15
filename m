Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B87845945
	for <linux-m68k@vger.kernel.org>; Sun, 15 Jun 2025 09:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749979799; cv=none; b=ffRT2YL6jBUvhXR130+dwzsPEoJ5JxOTKw0FBLdUgsRrtWPq4xxo1S1wlJkvX8Q5rbWW7derPF28hdEbafalSbyd3ntcjMlZ8pkUPryNrYba94Q5PVft5qJJMfu1rUEtu3JfYC0ImzF99l7tkGcH1IKHWBohah8bAgzg6K9SWKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749979799; c=relaxed/simple;
	bh=CsZRgFWhKkACceSMpMyM8Fa+YAhfeL2VzX03HXAbp3o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i6a22Re+5pxDngpGxfL86is4iTpIbzMSaIRvMtUIfWNIZZbbdENn0RNd54kvLtWfxSStUpzkSpPa+F2yfaj1uPrfg3RXIPVI0OPT3/BM9dJE/NWQfMb87WVdLh+FQWOWy7b/XyIWNvc2qo6nxHrkVX6auHiHOmQWNlcxkaPgIP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l38OyuvL; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l38OyuvL"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id DA22D11400AB;
	Sun, 15 Jun 2025 05:29:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 15 Jun 2025 05:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749979795; x=1750066195; bh=7I1fLumi9RMPHfBWGAnx9N+r1dVdj50OCaJ
	h8FEcbys=; b=l38OyuvLGsJjoHsTKiEJfoNuInqXB5YXMPlpvr+6tx/DcITaI5l
	+ZZgpWT3ZVPPKF/A9Slt8bKDz15mLo0snEU6ewBcvQCx0skX7SJxB5QBjUPY6ybA
	Z3ynJ1M+/3H4SQ6tRCCnoht99abdOauA1/0MYIRLBw+ZqPZy0+DMxT+6lZbs+EZz
	erCnEee7u8E6OoaY9IscvwZB43IvarEwpsZzqwi5VtL5xy9e+DY5PP6g0DLN2/Ub
	9zwjzhLokmG6GsieMfTTJhWLsnFXj/2E5io9yJFDs/vHodElCMFgaWe3XRqVkaBd
	0Sq2S6bKFu85IUnSvBJ6ot8gP9uxaQEsxvQ==
X-ME-Sender: <xms:k5JOaLD1OsCM9XWNZMPSI6IAw05TsX3LODOpTsktrp0au0IMT6bdgw>
    <xme:k5JOaBjYDDgRHCkihJZho_VS2yyBnA9hcR_EwLUkmdD4sRDJGI3SsV9PmwuuPwYT2
    RADDa_WF4z7ESF5lLw>
X-ME-Received: <xmr:k5JOaGnqHWWxJa-4HbiF9tbXOJ-wZ0ZrNXjKTEu1UmgBQ6pSBPm81eH3Z4f75u6rKIf3-2bNqirjic6SVRFUU-SNpb0VkIYiOP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvfeefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusg
    hithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepphhorhht
    qdhmieekkhesnhgvthgsshgurdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehkse
    hlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhes
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:k5JOaNyQBlqF4UE5l57rsuAz-F9TschXtYacyicXQuGfvH2oHy2Ybg>
    <xmx:k5JOaAQaBcrl1NgkcTEgPZfnMHcPJzIHuW53rWwgRXPoPOC5vfHfZA>
    <xmx:k5JOaAZIIo7_VLqAqRtuAZpn4uw4ahiZA_7ghCEuEwKMemy-6CdwNw>
    <xmx:k5JOaBSgc12A0wXYJGmF3qNIdHxHRyr785kvI4s9hAvDUR974jHFDw>
    <xmx:k5JOaIJ2ZU-OhPVuIBd3N0YKx029UZFLqasRP_dtaVc6qlNTgsDs6SDs>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Jun 2025 05:29:52 -0400 (EDT)
Date: Sun, 15 Jun 2025 19:30:43 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
Message-ID: <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org>
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
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Sun, 15 Jun 2025, John Paul Adrian Glaubitz wrote:

> 
> Honest question, Finn: Why are you even participating in this discussion 
> when you're neither willing to acknowledge the problem nor willing to 
> help address it?
> 

You and I don't discuss much; you ignore most of what I've said, then tell 
me that what I said is off-topic. LOL.

> Do you think that you just need to bombard me with repeated statements 
> that I am going to change my mind over something that I have chewed over 
> for so long?
> 

You're quite right, I need to stop responding to repeated nonsense -- I 
will quit it.

> I think everyone in this thread has now understood that you are neither 
> willing to help resolve these issues nor are you willing to accept my 
> preferred solution that Gentoo and I are already working on.
> 

I've no idea who "everyone" is... but I'm speaking both to those 
participating in this thread and to those who know better.

As for "unwilling to help", I help where I see a need.

As for solutions, well, you have one, but you'd create more problems than 
you'd solve.

> So, what's the deal with your continued engagement?
> 

I'm not here to stop you exercising whatever power you've garnered over 
whatever domain you've claimed. (No wonder you're baffled by my presence.)

I'm here to bell the cat. What you're doing is harmful. Forking the 
packages that make up your distribution is harmful and so is fragmenting 
the ABI.

You can't improve Debian by refusing to acknowledge it's limitations. You 
can't improve the Debian experience by railroading users. You can't 
improve upstream codebases by papering over their mistakes. You can't 
improve collaboration by ignoring the advice of upstream toolchain and 
kernel developers. You can't have a stable ABI without consensus. You 
can't improve the long term prospects for the Linux/m68k project until you 
understood how it got to where it was when you arrived.

So to answer your fine question, Adrian, I continue to engage out of hope 
that you will finally realize that there are better ways to serve the 
community than the path you're on.
