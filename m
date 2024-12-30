Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F517838C
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735547459; cv=none; b=iYcVXwISPgrJvmkEbmJtLOBhgJIDWG7qUXXF4KR8gVv+z/YRnF2AEMY4ZPRi8t6S/YsTzYUX8nj7lEqlAzDjTpB2FQHQsViwdCw98yzhLaTFAyQMIhUMzWAd2AQ/hqd/weeRcOIwAwaxvFlrcmUIj1yvUlIL3aaccvQWp5TbCyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735547459; c=relaxed/simple;
	bh=Y2pDxs2uzemlpWQn28Jfio2qdwDW/GXDcSm+mvIvJZM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dGmHOeIZpJILlhkZbmj9XQY94c1DG6ox3JhEjOnjp1nyKQvF7bndtNaesA8tUU00/uKN0WvovPwTNz44Am3RBqMHwynV7k/0/WCwkBCvbJLvBRWLes/B4Gmh38CLmcDgeCpiZVw2gXkCbNWMOLY0kQfTws/Zfm17FNl6bsksFI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hod8nfF8; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hod8nfF8"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 27572114019F;
	Mon, 30 Dec 2024 03:30:55 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 30 Dec 2024 03:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735547455; x=1735633855; bh=v8dDzq4r5XCINbIwv7QGgWeHMfnbTjzM2XP
	KYFUv98g=; b=hod8nfF8UnSskpMewxdyEHec9VlnkNYQ/DYFo7JpLE88yTqQjAx
	XKoJfmEWGMQXTBg/7pOK3l0TqdhM5l9LvLuJ6HNeBN6ABAWQ7xsuaudFQ+Qjr5cL
	lDsaNgIGkI9+PKCpl44kessfrYyrD245FOXuIepPnX3mJPylFdvhkMt2b2TALdyZ
	K0EswT5zHtcNQEvPSyZTBhAB/vbFWBmtNFmjN0OVOTfNXACe25z0aiHK0je6LoW0
	D1PvmpNpJuyVLN1H9/alSO3aOdUobw6tQph7Wb5heGHcnQgSquWf+orUWd4PW5vu
	C4EVpU/YkhH/X1FFS0VojIe5tmsXO/XG1fA==
X-ME-Sender: <xms:PlpyZwnrtTC7JlVB3dTEvv2NG9CZlULrw2rO62koelg_fqeY6eSwaQ>
    <xme:PlpyZ_1E4fDFBhBr7a-ouhmY0cS7fdatgulbYYw8htwA5xkBmN4UXwCKp6cpH-D4L
    zoYaZIw876JFcrG5Wg>
X-ME-Received: <xmr:PlpyZ-oFguolLyDTYUP3IYPFrFmQVuSyvZgYzrpcim24t4cwzY10OPMbf0xITtyjCtPMjif49OivHHHzWe227cahUog19pKOa8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddvhedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhmrg
    hsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvvghr
    theslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehkse
    hlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:PlpyZ8ksSE_OqcYOwZBKYnZ7wX2RzcquR3Lny9nmN6TB7WyZpLNUIA>
    <xmx:PlpyZ-1rh23F-m39DyI2-MK3XavuBs_cOdOZhBrmrxH9AUYIJUbncQ>
    <xmx:PlpyZzt-AtPVTfFAo_iJTPyC6s_jTxT8a-GV_cHNt9P_Cc04QxJIew>
    <xmx:PlpyZ6VSehBVVBDxIArVz2ZljzPxBrcCrIuqGSQFMQc7GYlMnRtYug>
    <xmx:PlpyZ8ApicNKsNsIN0ftHhk5CuFqIr2J0HWb3n5XiIT3kJ1GjF8-n90m>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Dec 2024 03:30:51 -0500 (EST)
Date: Mon, 30 Dec 2024 19:30:49 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: Build issue "Error: operands mismatch -- statement `movec
 %d2,%caar' ignored" on m68k
In-Reply-To: <CAMuHMdU-DB1kOymg3-E4nRN_8R8N_R3wVZq7MNYUGsQWLa3hrg@mail.gmail.com>
Message-ID: <e30ab951-bdb6-09f1-0d3b-9a09220babe7@linux-m68k.org>
References: <20241229134848.0a1d9719@windsurf> <CAMuHMdU-DB1kOymg3-E4nRN_8R8N_R3wVZq7MNYUGsQWLa3hrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sun, 29 Dec 2024, Geert Uytterhoeven wrote:

>     output/host/bin/m68k-buildroot-linux-gnu-as /tmp/a.s
> 
> does build.
> 
>     output/host/bin/m68k-buildroot-linux-gnu-gcc -c /tmp/a.s
> 
> does not.
> 

You may want to try,

$ output/host/bin/m68k-buildroot-linux-gnu-gcc -v -c /tmp/a.s

As that will print the full assembler command line, among other things. 
E.g.

...
/usr/libexec/gcc/m68k-unknown-linux-musl/as -v -mcpu=68020 --pcrel -o a.o a.s
