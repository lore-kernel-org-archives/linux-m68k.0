Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322391E0DE8
	for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Apr 2026 16:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443824; cv=none; b=hFqWH/q+qC7WnrcRQlUvWySJDe9EbQrzGIuvWZ46aNFdZZLu/Bi087jU0q7kx2wgBNgAWtn3rHFzrYr/hdCJ0ZOuEvqpiovHHhLhfj4t/6kCsJZ09PwLsHOjjAHs/dZsx2He2zm7nfvXdkSbTpkQrPM2RA/MEiPB52yQ2rPUqrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443824; c=relaxed/simple;
	bh=RMcixTISFlhYZCQho5uTHeI1d3sBgL4paWNdoeSkCsY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Az9NcFTU48MvULyGZTfytykgpLuopwAFEaq5DfQ70kVvXIS8cjaxWlQrxvEb89rJ5eyfEHtUKdwRpcaaXO7tB6pIG7bDMEmUXXsEWVGA0FGxU2B9AMoksyjOVRU5q+9Z8Og5gzrYzX548rXhoxXVxvWl0dpLEnXAkarEQl+zpA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APGlZdkE; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APGlZdkE"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F69E60138;
	Fri, 17 Apr 2026 16:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D132FC19425;
	Fri, 17 Apr 2026 16:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776443822;
	bh=RMcixTISFlhYZCQho5uTHeI1d3sBgL4paWNdoeSkCsY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=APGlZdkE9SEbfV4fb4SgAtbhKr3GWkreHu/ZL0W+AEw5P2xPhtWBq69rvpnER4ogp
	 ZZFYB22YpqcSJuZxtksozhLmK+ievF0djc4rrgKAJZ9WcEXJG1TK114NXdWnKoBqEe
	 2WQkDccQftpBXjE9YXuN99bcPQMQQdGQM/mk7BrtzpMERTAnX8vS6QRzisjDim9EDI
	 n1Qw7dDkPg//k2sNtpBmtJ5MAo/4SavOat9aRWu9Tk3cx967waUhsv0yEaLV85CamZ
	 0UBJKFZNylUVdyKuNoZ5tNwfrls5eQM+0vwS5xFPeADJq/Y9QF9PI38k2FmSVFmOMX
	 AsYdDDtphXEhA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D3560F4006C;
	Fri, 17 Apr 2026 12:37:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 17 Apr 2026 12:37:00 -0400
X-ME-Sender: <xms:rGHiaePNMHafJNUDl2zteap36I0khVb7JeQv9qUuk6x657DfnhYOTw>
    <xme:rGHiaXxvlK5kbLNLQ29aoDBLnTLymmHW-3ZjYJ0K2GCOTmmClEvuXcX1Y4MJqQO03
    hshfzRMWqbr9Jg4nHMMHbGZCey9aOEXrGqiTM5HyKEu3XgHaR7gsAI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehtdefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghn
    ihgvlhestdigtdhfrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhdrphhlrghtth
    hnvghrsehgmhigrdgrthdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdr
    ohhrghdprhgtphhtthhopehgvghrgheslhhinhhugidqmheikehkrdhorhhgpdhrtghpth
    htoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rGHiaVsBKkK-ZINFs8yy1Z6BR20ZZ35jPm3s3FS5kzA8WzxN_KwzKA>
    <xmx:rGHiaZZ0LqIFA370RWfUERlHNdLg2mEHy_vxB_P5n6SKi_DI2uWJGg>
    <xmx:rGHiaXze1mYIiNZcPlMtXSCn_kdJwDMN2Nw1l6JpcunRzF8Oo8FfGg>
    <xmx:rGHiaRgnfnYPxyQzfDbsmrklISaARxO9K46tIb8e-1poPb6AnFSdTg>
    <xmx:rGHiaTkROpC5N5LZYdKnu7evROhSBUET7Y8u4x4bitX4BscDO-XIv9Ca>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A8868700065; Fri, 17 Apr 2026 12:37:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbTBWCF3eo87
Date: Fri, 17 Apr 2026 18:36:20 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Greg Ungerer" <gerg@linux-m68k.org>, "Daniel Palmer" <daniel@0x0f.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, christoph.plattner@gmx.at,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Message-Id: <a93c448f-32fd-48aa-b4be-124278ca0a02@app.fastmail.com>
In-Reply-To: <e1871e42-6d1f-4753-a830-9c7dda99f75b@linux-m68k.org>
References: <20260404024658.2496519-1-daniel@0x0f.com>
 <ec4945ec-84fd-4462-b35d-79a04673107d@linux-m68k.org>
 <CAFr9PXnfh6p_ajGSGX-MnKgToEdAW-3rPgOLKgaDXziKXNGfFQ@mail.gmail.com>
 <0ca82015-820d-4002-a65d-0888804db3cc@app.fastmail.com>
 <25448303-a816-429d-851b-d827fc8f26fb@linux-m68k.org>
 <4ec2b9f3-8420-4f77-9373-7ae4df83404d@app.fastmail.com>
 <e1871e42-6d1f-4753-a830-9c7dda99f75b@linux-m68k.org>
Subject: Re: [RFC PATCH] m68k: nommu: Fix behaviour of io macros on non-CF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 17, 2026, at 16:11, Greg Ungerer wrote:
>
> I have some changes I am testing to do a blanket change of the arch 
> specific code to use newly create IO access functions too. Simple
> enough (like your example patch) but of course it does cause of
> bit of churn.

Sounds good, yes. The hardest part I think is going to be the
shared drivers that currently rely on the flipped meaning of
readl()/ioread32be() like the regmap. These may need to get an
atomic patch that flips around the users at the same time
as removing the flipped readl().

     Arnd
