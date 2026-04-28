Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE29D3CBE91
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361084; cv=none; b=uo5wtwluavItLBgCK4701rPOFN0dsJWJ59R+eUBA/Zk66AKE1gf1O3zhwrCrU1KmAadyaosa8emc7zRrZJfW/xdaLytsanR+ZVk8HuaB0/QaeO1xwZ15e7IqVg/IaLVfCe4OW5LLjC1xu3Ct8gQ0QXjz92Dnux6tPB0aHL8/whE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361084; c=relaxed/simple;
	bh=T012Lg/LretUy5zEU9UqTvSjNKVcRz55VykcAznJp3Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CygTkKakpDdqleddUHwlVWnZvpLYVzYUTlFjCZRqcqqJqlUX+0dx0mmGgAMKolxxdy4JYD9zz60EPSpJGxnWRbgE2JzwHhAYRMclELr9z5YKsT6lhLLGdWfd8N0DLUyy22HgVSoB8cK/KzCv6iJdszdQIuSxUQzFuuvgK1+qly8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZXmmbzXa; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZXmmbzXa"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 1AABC1D00279;
	Tue, 28 Apr 2026 03:24:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 28 Apr 2026 03:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777361081; x=1777447481; bh=fSxf3RRCV2WQhkfCi9gqMhnDflF22fIbX4z
	L/+c8Z+c=; b=ZXmmbzXaQqcSV+fuMSnFGgsCHsvzi1GXOn1kxkj2btxjfs0JlGZ
	1RU4HZINaLAF1Kauu8SIQfUumzVDv/cdktNbqOOPB23rqpGL/Oo2cedtKTJz58p/
	xudqAMTNHA+jUtqKpq1rjHsNGuTuw4RLT6UhuSKxmXLVheP0NzW77HggXdSWvBPg
	tgZ9c5ru7FLXgT5krTm2S2XY6Bu7JYlxX9gYhJDVqaUUlESDI2TdqpPXFgeKDSZ/
	CcnciHudiMLwqg/+Rch7fSVF7MgdOISvZdSvQahJq8d42ohCi/ZCP6NMUkUgrQJ9
	srLfTsW7as6+3jn7So9GYbaycy26/CwJr5g==
X-ME-Sender: <xms:uWDwaTSBCWianerFEAHAhgoFUzgqwoolI64GrS3flui_gaCjzC8CnQ>
    <xme:uWDwacg-2_IRCvYpTZgTQDD66dOsRRG_YgNp7wiSxHZu5hCghHzyieqQ41hJMvuHp
    CYYHt8TZBrWkdc5SoKPtwwNbqdcAvh3wQSaI40zZhJt7NnwQ5XgnwE>
X-ME-Received: <xmr:uWDwab7mghytGkGGK4dl4ygYR_aYUHl86heVKsIvdJ6GQy4bX8cp1V3RECGZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdektdelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfvhhgr
    ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueehueel
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
    grihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepfedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepjhhohhgrnheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:uWDwaRB0xEQ7fin-BOJ9KY3A3SPe_OnXG1mZw5nLtiLVSggRag6S2Q>
    <xmx:uWDwaabUfhSDy28HrPaVsNapuXbMuz4l4SoOKMVNgcmeS8tDjRCKuA>
    <xmx:uWDwaUZvRA3y9vzsqy08rGZXyhm4ARmI2-nqzRVTTHEaYjwWsZfQhA>
    <xmx:uWDwaZ9Sjti97DD3LUZ5A1qfiA7p3vxse0ROw4S5eyZMKPaTbPUdxQ>
    <xmx:uWDwaYmCPM831vezPXJSJphQUL91UhlelgRP4yYkYB4oMoDz2maVhKOL>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Apr 2026 03:24:39 -0400 (EDT)
Date: Tue, 28 Apr 2026 17:24:31 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Johan Hovold <johan@kernel.org>
cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nubus: switch to dynamic root device
In-Reply-To: <ae-BCxxLFkzEvw63@hovoldconsulting.com>
Message-ID: <a05b0f75-87b8-5478-3480-be545c905c83@linux-m68k.org>
References: <20260424104011.2616970-1-johan@kernel.org> <92e2b920-041a-78a4-e4b6-c5a7c579ade7@linux-m68k.org> <ae-BCxxLFkzEvw63@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Mon, 27 Apr 2026, Johan Hovold wrote:

> On Sat, Apr 25, 2026 at 02:07:10PM +1000, Finn Thain wrote:
> > On Fri, 24 Apr 2026, Johan Hovold wrote:
> > 
> > > Driver core expects devices to be dynamically allocated and will, 
> > > for example, complain loudly if a device that lacks a release 
> > > function is ever freed.
> > > 
> > 
> > Yes, in drivers/base/core.c, there is a warning in device_release().
> > 
> > WARN(1, KERN_ERR "Device '%s' does not have a release()
> > 	function, it is broken and must be fixed. See 
> > 	Documentation/core-api/kobject.rst.\n",
> > 
> > But there's no way for the refcount for the nubus parent device to 
> > reach zero that I can see. Did I miss something?
> 
> It will if registration ever fails (e.g. due to fault injection or name 
> collision):
> 
> 	err = device_register(&nubus_parent);
> 	if (err) {
> 		put_device(&nubus_parent);
> 		return err;
> 	}
> 

In that situation the kernel error message would say the device "is broken 
and must be fixed" when it was deliberately broken by fault injection.
I think the commit log should state that the aim of your patch is to avoid 
that error message for that use-case.
Aside from that quibble, the patch looks fine to me.

Acked-by: Finn Thain <fthain@linux-m68k.org>
