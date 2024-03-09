Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FB316423
	for <linux-m68k@lists.linux-m68k.org>; Sat,  9 Mar 2024 05:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709960561; cv=none; b=uq/IKipfemCEVSrSZ9b15q5t+Tljz5n3uMyIdbh0LnwtEl0jdHcWKbTLm9fMcWWyeI4G02Id1KoxGcWqA7W1ILy6cNS16mWDmG6s7ZHNEUXs6B+4trqgLS+KEuwX1eZRrdnK2Jjf66OY9Smx0+Ux9pWY3YsbkLePiOfYot7rvaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709960561; c=relaxed/simple;
	bh=4M/Ogwfg+lUlYDngWLaMbA35tJeEu//QEymy199ySyA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JbZjGL5tuOJqOK1JxpRUn23Ua9f0GJ0lvJe1kY/VZn5mfUYw1IjTBcsWBfF8AprnuKgkCKOsUojFT+Y72n8eYtqPXk6VgFuFpTI4O4wEijwRHWXH5zrIEHLLor5D1IxtSsBDQ+6KroSHlPPJYLE+71NR3LaXQuIGWaHUAu+r1CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=O8z6Qbb/; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="O8z6Qbb/"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id EBB8213800D8;
	Sat,  9 Mar 2024 00:02:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 09 Mar 2024 00:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709960557; x=1710046957; bh=V4xpKUqRaYfbL/l9SeLE5gSQmK6n
	E8/NRrtdgiPZXJQ=; b=O8z6Qbb/t0U0rHrTt67XOCZUhFWlzx4Bz+nCwuB+/pTp
	jHqCHDCxO/h3X2vsFVYuUAVd6mcPpSVgNb1o+HfLZey6Nu7RwxfDkdzbfPMGhzKP
	SjStaWJTKD+Lk3T5Ymbvl2g50b4sggUTT/uIyohwbhHNYwGNnJrbq2K5odh7xEdf
	JzZhGY4FEAqtCGwlEVKwV0vYx2pXytKVX94r9OCAS79BlFxPnjnIYubbCH89SFGm
	eKmBZf3PLfHbdeSiFZoLpfS0hEuw/Op2S+WR9ayW4zm9E/GarmrFjSZXzxh2r+lS
	O02RIxBoae8uT8kWvVOdfqpKv47dWXXUK5XI8A3z8Q==
X-ME-Sender: <xms:be3rZb_EhsQmbdpRfzgr0Uh0KTLOycO1K0cCQi3IS3Q6-5hYlUx0pA>
    <xme:be3rZXt7Lwxtu5X1rR9CN3f2QMw7SuGeNZA91B0QCR3PhTC8T1fnGuwCpFckXgYpf
    XXEPPbQKvattByVz38>
X-ME-Received: <xmr:be3rZZBt7E8-s-R33HMloz5bwpaChiXxGRVWGHE3cBbEeh5EhjDTsO3IOTgCn8mUc9TIDmAlt4ddfztyDQZ-FQayVdFnQEVYIWc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieeigdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:be3rZXdyvZepikTloGOuayNvxFQY9RYlrh4ros_UVn-wjKSzA0C1jw>
    <xmx:be3rZQNreMRPE8z6g-NZmYM2QV3cAivowk3RtuWvHGpfBg4g2W06rQ>
    <xmx:be3rZZneFJlxKPIO5bjP4cc1HBzXrynNgelsfZ8Sc5FoDxrc5gsd2w>
    <xmx:be3rZVoet8pmwsdVJ5rNGCcgAoMHJe2IFwAZcow--C1-5BwjUTB3Dg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Mar 2024 00:02:35 -0500 (EST)
Date: Sat, 9 Mar 2024 16:02:52 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
Message-ID: <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com> <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org> <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com> <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com> <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org> <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org> <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sat, 9 Mar 2024, Michael Schmitz wrote:

> 
> I notice legacy_timer_tick() states it must be called with interrupts 
> disabled. We do not explicitly do that in via_timer_handler(), but rely 
> on the IPL remaining high. Maybe adding local_irq_save(flags) / 
> local_irq_restore(flags) around the legacy_timer_tick() call would help 
> debug this?
> 

If legacy_timer_tick() is sensitive to execution context, why not test the 
IPL with an assertion? That way you can catch that problem on Aranym as 
well as Qemu.
