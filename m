Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67721225D6
	for <linux-m68k@vger.kernel.org>; Tue,  4 Mar 2025 04:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741063454; cv=none; b=cuHrbFGiGurj+Gho2LNXwJlleAMWJM6nIFciRbhGXw1P26N1dovGCcTdRYYUQtLTZvtVFGW5r4U8lnwiZqDQPnBdu8A4YI4FHZtHV0vTImEJxEItxCqQCscpYafZkwjQ+8IrOaE1NTlIje8OKLHvos1KQNitoZRO1P26YGt6EDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741063454; c=relaxed/simple;
	bh=HmbhDM9nWZ5XZ08btFJgAqVcaGX9H7tGv6t+2xz9DPE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ModLILiGqPUvT9t6/YU47f2T4XNETsbk1wxdHTR8UDWiWy3phF7ifysoab5QfMqzP5w5xM9a0oR8e5vujWRGdS426egNcAMDrcF2Dcnnl546RS79Qd++4h0cVCU8/9w2DiwTBUW0OPouE6yKKID/c6bPXLYyJcrp7X1Ee/YmpeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FuUMLlwm; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FuUMLlwm"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2C44B11401CA;
	Mon,  3 Mar 2025 23:44:09 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Mon, 03 Mar 2025 23:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741063449; x=1741149849; bh=rUIHurE51T7slETUj2HRlpAH0AZ2jgMky6J
	9zZhCg2I=; b=FuUMLlwmd5AYUcRKWngYaik4O9XRjIsqWjxZaCUt+gmcSTlTlg8
	3l/EVURIm+ZPsw72+5XNniptXn/h3c9OnvFxhbpMIZL9VCnojwkVjMspUaXmTGXA
	CwAuGWfycVkoRiK1b6b9kQWaTIFEmon4axZ5HqkWxPHaRMwnnJXlIFGaiKjh9eMk
	Wn6B+P2nxMsV8Cfyop9fOEfWRkGMcLuIG4TRF2181CZGUhAP5skOdH1cPHGF7+pC
	90ynXneiMxqADJmdHGDb+C5SLlYTTmP15FBHdhuF2LiCp9+5sm6vZPnuAcpCkFWt
	OBOUoXiIuLlvfkgnIvH/gDpx+mITyjCiIpA==
X-ME-Sender: <xms:GIXGZ2lsiMdLx97v-KKRLOytWiTrkYGM9oA5HM2glZ7RjYf5CJHjfQ>
    <xme:GIXGZ92aPs0k85erSQ0gqeSRIb2pr32mbxQ8e7-Bc-VntVcph9lvv_FBqS6kwFGq2
    mD4bCN5APvE5RKdUkc>
X-ME-Received: <xmr:GIXGZ0rW5gMIfk8defAbwTJt-rtcyTiZv91H5imeq3RO8AtsuhR7f2xOM4qJDq3hIk2d3gZ1uUQgVt9YuXeeN66JZbW4BQZ6RQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddutdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddv
    necuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheike
    hkrdhorhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffek
    feffffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhn
    sggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrughmih
    hnsehthhhoqdhothhtohdruggvpdhrtghpthhtohepshgthhhmihhtiihmihgtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:GIXGZ6kl6wolxc5Mc2KX_G0-jPYaFBUqPa4NTi7E0OLAA5FN1ncMdA>
    <xmx:GIXGZ02jBGzmMCzLI3OCJabTJknes3mlkUDPcIgu47Pvh0d2txnoRA>
    <xmx:GIXGZxtSk_rThi1DdGDmn0uj97bCQJNXYtl5tDyMA1IU0VWDA2mSrA>
    <xmx:GIXGZwXJ_5m6TpGs7F-rG1tXa1Rk9BcMqviIqPjaW-_Sh6ZMla2Mxg>
    <xmx:GYXGZyDt8fcqgOIzoM1pW9tJX7lWc7iyLZ76o-QDRw-TzYLNDIHoXQ16>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Mar 2025 23:44:05 -0500 (EST)
Date: Tue, 4 Mar 2025 15:44:00 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Thorsten Otto <admin@tho-otto.de>, Michael Schmitz <schmitzmic@gmail.com>
cc: linux-m68k@vger.kernel.org
Subject: Re: Software FPU emulation in linux kernel
In-Reply-To: <091d25fa-6a79-4685-a920-075611e79626@gmail.com>
Message-ID: <df800264-ca0f-4d49-77fd-520c2224bce7@linux-m68k.org>
References: <3374772.VqM8IeB0Os@earendil> <091d25fa-6a79-4685-a920-075611e79626@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Tue, 4 Mar 2025, Michael Schmitz wrote:

> > However, almost all trigonometric functions are not implemented... 
> > What sense does it then make to use an emulation, when only basic 
> > instructions like fadd/fmul etc. are implemented? 

A good way to answer that question is to disable it and see what breaks 
(assuming you have suitable hardware available).

> > Programs are not even aborted when using one of those functions, 
> > uprint just prints an error message, and the functions just return 
> > with their input arguments as result instead of calculating the 
> > expected value.
> 
> As I recall it, the main purpose was to keep kernel and a few important 
> system utilities from blowing up on 030 machines with no FPU. User space 
> programs that need to use trig functions or other FPU implemented 
> functions can be compiled with -m soft_float (or something along those 
> lines) on those systems.
> 

Back in 2019, when I needed to get 'fio' to work on a 680x0 system with no 
FPU, I had to make a few small changes to the program to avoid floating 
point logarithms. That was sufficient to get it to work. The FPU emulator 
took care of the rest.

From the notes I made at the time: "I tried to build fio with -msoft-float 
but the build failed with a compiler error in the libc header 
mathinline.h. I hacked around that and got it to build but the executable 
didn't work correctly. I don't know why. I gave up on that approach."
