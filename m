Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184633DF
	for <linux-m68k@vger.kernel.org>; Mon, 26 May 2025 05:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748237088; cv=none; b=Cpy1HNryq+GCdB4ODWb5ks6M+3bLTjrbe1Cb4T1U/ZhakhWemljlfKwwppIe/UBoJ3aXrIMg08hRxSduJF6PR7i01jL1nsxpKM+MX7zjKj0OPOy1iim9Ww1td6TSmEZXb5pEI74icqP4IkF1qSX0ol136HFVxND7KG5a1QqgvWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748237088; c=relaxed/simple;
	bh=5v3+G4HhJrD59l2qDdRifjTl0FDYBWzgskPnfwpbggk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZlvCKrvxKZ3g5DBBJkwUHwkI2VpNgkGhnbZ42/KOoExifZRKruZcz+mHfufb63p+qauCrgPRIASv2ctfjo2h48NZbj9y8WMXlL5RO0efxyAiwSTDzu7OZIytWUSCtuRZaj1E2BK9QkYJ1omnmEMJxwz9UbGzq8Xxq4zteodutg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DUkdMDrF; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DUkdMDrF"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 92A3D1140110;
	Mon, 26 May 2025 01:24:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 26 May 2025 01:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748237084; x=1748323484; bh=whqSE1/j1iFyOkHa+9c1HZgqz5rhcaJ0lg+
	oB7JF+8g=; b=DUkdMDrFnbDCutgjcKs477CqypAzTK4rpsXLPA3EfejQ5wq51DY
	Hq04Uv5+Wj+Tqh+ej5mQ+xxTbO7oxaXSakyFeany/lgy7+Exg+JJWg1X/O68wAnQ
	ZhqkqKn/PqSomlBVjKQaGRvKgrUIkyTCpmQwkt8xnijyG5yfW0w6QUH/2ldUt9pq
	GiLOWj9nijNWPIjKXq5NEYCxu2qIlIrcuuqXeClqcf3u06hyxZ9wBWwEDQskH4bO
	fBIr2G/fKliDVXMt0fAFJurPzmtPOXORtGNvQkgGsbmdVQ1ejCzvLENFfXL/tY6Y
	Qhcd2FNa9jjgGMfeCNRLTr+gumkWBclYf2g==
X-ME-Sender: <xms:G_szaOWCUZjP5sfSDIbRxIkG5ITBTXqj4_zc60HxYmXWtJAn84hyRQ>
    <xme:G_szaKmVYJ8wGQKS6c7ERwRT5ZnQlUAPi00G0y7jlXeRj7EfwwEhR54xK1X_ByeqU
    BGstDxhtwSeqinQR_4>
X-ME-Received: <xmr:G_szaCbnwR_S5_sFDxpMBC_Ily2qQ0pbgkaQK1InAGUFar015LdkcFcEVninr9t0OY8Wm-St7IffFf0jtr9VV59wWM6PaPkKLFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieeikeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfk
    fhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrih
    hnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheek
    gfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhig
    qdhmieekkhdrohhrghdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepjhhohhhnsehklhhoshdrtghomhdprhgtphhtthhopeguvggsihgrnhdq
    ieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmh
    eikehksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhisggtqdhhvghl
    phesshhouhhrtggvfigrrhgvrdhorhhg
X-ME-Proxy: <xmx:G_szaFX7JgtYshzgTvifAWi80KBYSoNMCoR2M0DGvmbPSc22god-mg>
    <xmx:G_szaIklB2pB_hp15UWGkme2c30eE5UDyx2eDQXPBijmexkOzxqRpg>
    <xmx:G_szaKet9nn1qVmpZ3v5AJ9kPUTeVvCYPYLpQr6P7Di0kEhtzGwLUw>
    <xmx:G_szaKGLnej8SVLUhFv8b1cev4fjR3OdUXWpmKne89k2qiOlT1hUiw>
    <xmx:HPszaPEap_3lk2tvBGLr5LV2JA-QCEFBoLRVccietVMV0mtIFpSQvJBy>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 May 2025 01:24:41 -0400 (EDT)
Date: Mon, 26 May 2025 15:25:21 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Klos <john@klos.com>
cc: debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <f1128cf9-cd26-9182-f9f2-89c9a0b3d4bf@linux-m68k.org>
Message-ID: <ba0a8ae0-1973-f850-de81-690870f03499@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>  <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>  <8734d1kofn.fsf@oldenburg.str.redhat.com>  <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
  <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>  <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>  <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com> <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
 <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org> <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io> <f1128cf9-cd26-9182-f9f2-89c9a0b3d4bf@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 21 May 2025, I wrote:

> 
> On Wed, 21 May 2025, John Klos wrote:
> 
> > Likewise, do you really think that the overhead of unaligned access is 
> > outweighed by the fact that more stuff fits in the cache? Seriously?
> > 
> 
> Yes, some of my 68030 systems have 16-bit data busses.
> 

For the record, the user manuals say the entries in the 68020 and 68030 
caches are long-words. So a 16-bit data bus would be a liability for 
accesses involving the caches, and John's probably right about overhead.
