Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8082E275845
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243857; cv=none; b=dMx0ATyHSS9fgGwDUcLVTUSqhC70aEcwJ1+W6BZTS2ClJouTDNj06R4w0lWe6PlQ9+sceIX57KHyb+j0zcdTAZf6+7ttgaBqc+1dJLnGMsulNJCQ7LEvpVo5dk4GbMhgU5PRE+DgYwZI7sNoGte3Ic/+bvoRvEOyFq6gF29Exyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243857; c=relaxed/simple;
	bh=MRKW1DD32kjHpm26KRhZ4z94VlLV1h6HEyjweD6e99k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mwbsyWUOh8G7RVcZY/bZnJZwtxXIXRRZmS3vsP+lveNTjUH8VxBRdhn6klwz2rqRHH3C3SlfBxcPrlFGs0OeW0bL4bi+9A6OYkQPMNX6LHG+xjSdKDZ+4igvv881/ghFRJAikt3M4tkHPmVTGz8sYSZa85NxJ1a/LOvKtixEVUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OQb3PAdX; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OQb3PAdX"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 81400138044D;
	Wed, 18 Jun 2025 06:50:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 18 Jun 2025 06:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750243853; x=1750330253; bh=Lf3N6hxsJsNUZqu1JhJ2bITV/0GyrLz0h6w
	KipcvxbY=; b=OQb3PAdXbIOLmgn33Y+sUr0Kjg9oAxI6ckcgUCOFUUS+6y4eywJ
	9xJadW3WFtAFIEIXNkjUW5bsWW7N8QI/JfjunYDsSHtsKcqbDYM/c1cYC5qzdqSb
	i1QdvLcgDx0Ml8obtZ+/i0rd44bNDkpAKG9t3aCesrwS0U1Ruuypfn7QQ9DJABk4
	jxiMcWnBNVWpnM1sEPu98ZniPvnJn0zKlBmdYGduW22Zg160vZ4FnbAD9UrcvBsc
	b9lPCt4QAyU7s2uNnI3C8fbyZ/SjgYyI0u0eT6khSMhX3Ivlfw/OmNt6U90lyQB5
	+wb+Xh3CAbYXQv7i91K6G0/15LtxSPE9qFw==
X-ME-Sender: <xms:DJpSaJmsmhWkzj_6v1rvbuHM9XoDuyDdkGpwRnhw8g1wTQpha-ur-w>
    <xme:DJpSaE0P7zzgRgVJwuPB7kjVPgRSqQSyY8S9KaIOcO2cIBkF5iFgU2yWqrC1bNGJv
    w4eFuhydjjhF1N_O_A>
X-ME-Received: <xmr:DJpSaPoJ5ZFsxb4Nkj0tGpSofojGxvN9AN--FunAlFsthbpIOTmVepwj0BuT-sdVKVOPzvVPdZOA2MDydvBvV0FAuncTpWnW_Tk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvgeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehglhgruhgsih
    htiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehgvggvrhht
    sehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehpohhrthdqmheikehksehnvg
    htsghsugdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggv
    sghirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:DJpSaJlH1yiyzVHfSLcFv4r9pZvoT8hOAcX6sYVjQrb61_AwfcIYpg>
    <xmx:DJpSaH22TLlAFOLHjlTTz9rGduIzFP-BSNnHuSNhGgUQcr3Ty8OWsw>
    <xmx:DJpSaIudwPPYxEOQS9v4Xtep6eYa1rMVRV68-wywaCnkeAzzvo49tw>
    <xmx:DJpSaLWHTw_VaCjudwGJZezEtHMkGtbCQxXwzS8SLhhinRopnuAdkg>
    <xmx:DZpSaNHhK035mBzdJt7i1Uw4qxStb1Rb-2F1beqnELD7IXJlYb7HSIsn>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 06:50:50 -0400 (EDT)
Date: Wed, 18 Jun 2025 20:51:45 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
Message-ID: <ad0e5bde-ec65-f03d-2c0e-ebcec8729117@linux-m68k.org>
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
 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org> 
 <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de> 
 <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com> 
 <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de> 
 <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
 <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 18 Jun 2025, John Paul Adrian Glaubitz wrote:

> 
> I would like to lead a discussion ...
> 

I would like to read a patch ...
