Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B8A27A455
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 22:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750285734; cv=none; b=eAAvi8JJpDjHjIGPruiYjPEAJokyXY8xhVFWx23tpQeEO3KrpiyG96cRAUgQpCBlVkig9jQ1RaDVerd4LCKU3PZ6q/Kl1myMlHfRHyivoFCk8c7N6OJPMnTMRbT6PAfnlK3cOriAr/eociEkfMjxNKUs+F5kcDRPMGyPKeYL9U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750285734; c=relaxed/simple;
	bh=y64zMhn3K2LjTqAExytBUeso2buYMlgrir83qZz84Dg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t88eIgeqoRHn8BouhXuh/dxG/PjjCKB+SLLadiLduAp6z25O8zIY0tMO07gE4fn1+2XdYQWcPHH4swAUXRLefgJxKNFldcbJHc9b6q1+nA2cEaPQDVM8e8v9C3I77JE5M5HuAm86H9b+B97hVwI/PVYIVCFACZVT8MV9JEgWZQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IlAmx8ZE; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IlAmx8ZE"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id BAF681380403;
	Wed, 18 Jun 2025 18:28:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 18 Jun 2025 18:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750285731; x=1750372131; bh=ZJzjb4XSm7KpvRNeci6UUeFhnQF8R5feWcb
	qK48EaKo=; b=IlAmx8ZEsT7kQtI+vr8ZhYJs6xtGR6ZsIjP5KBXsHjKy0y/nQ1L
	03vNmd1+qp9/kVJkXizrFsfJZDyADVSo8+egVIoYsts+NZzNclriQcUWtT3TEP6v
	5HkFcT8/psidP7yQZshULzzD061+dA6gXkK15NqEoNtqpTjjQb0XDM2/XjXO3AG2
	TVPCSfSxbHYmpT/VG/z4azA7gbb+A41QPjrNvgBSUT3fil1JAJfKjgqLqpFn/ABN
	W8a2+eBk//kndWkCObnJ8Cj1UEbQRJjhtNlL/6nSPldwcVEe6qlt/7Q9dJIIXg7v
	hLNmxmwfQlxOcMRwfaBEQMYCTGsDykitH4Q==
X-ME-Sender: <xms:oz1TaL_Ecki0OxzN4weUVAXqqgakyNzv7oj0tMFarkePUFjf470L7g>
    <xme:oz1TaHt7qz-DTcfuXVLmJc2coZU_zlLx4mHw-HpxdoV-91zfIHls4CmcD4vmYvrKw
    RhwIlXSoUyQZXGQNwU>
X-ME-Received: <xmr:oz1TaJBtuKNSp6-7v9jfqEJ9wZWfIkLijG48AY0I6m7Fa7wNWz1FjnPT8fHM8PDzCHBCcAWD-FC79IZIgTZNlVIejloz8qXh3cc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvghrgheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhu
    qdgsvghrlhhinhdruggvpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrd
    horhhgpdhrtghpthhtohepphhorhhtqdhmieekkhesnhgvthgsshgurdhorhhgpdhrtghp
    thhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:oz1TaHdymY3t7u9VwNKw_1oPG0hqNXxn9RakO3d-Dywox79GAEbshA>
    <xmx:oz1TaANrJBu5qxOJkjNWYeEzzUIkC3jy1bzsvcKPWDHFndqC2AnC9Q>
    <xmx:oz1TaJneUAhLq21UEs_XEzPscqlna7cPiqhXvVvKl02nqeyh7s7p_w>
    <xmx:oz1TaKvOFYgQj4ca2kuaizGJdXsM7qGmYiXt9U9PeYpiMbHDvbN4aQ>
    <xmx:oz1TaLvoR76H9K7b0FgkohJh97i0H-ows7qn-oi479tLBazCRs12sl_X>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 18:28:49 -0400 (EDT)
Date: Thu, 19 Jun 2025 08:29:43 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Greg Ungerer <gerg@kernel.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <38c670cc-6169-4720-a883-c34df26e1a4f@kernel.org>
Message-ID: <fc9dd771-b010-e593-d8e4-2cdad57722ed@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de> <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu> <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org> <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de> <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org> <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org> <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de> <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com> <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de>
 <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com> <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de> <38c670cc-6169-4720-a883-c34df26e1a4f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 18 Jun 2025, Greg Ungerer wrote:

> 
> > It's not really necessary to enforce this on Coldfire. However, since 
> > buildroot builds completely from source, it wouldn't even be a problem 
> > to change the alignment there as well.
> 
> Yes, that is totally right in my experience. Certainly in my ColdFire 
> work it is pretty much always a build-everything approach via buildroot 
> or similar. I wouldn't think an ABI change would actually worry too many 
> ColdFire uses, they don't use distributions like debian on them. (I 
> would love to hear from anyone who does!).
> 

That may work for end-users with a vendor BSP. But upstream developers 
need to be able to swap components. In general, when debugging I often 
have to run old binaries to find out whether I'm dealing with a deeper 
regression or not. Also, there is the bisection problem. It's not just a 
couple of distros who get to pay for an ABI break. It's the entire 
ecosystem.
