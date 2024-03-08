Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98901219FC
	for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Mar 2024 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709889253; cv=none; b=kQo7RhRjXMNagC1z6d4a2KhY8XHhnyiwrqIYtT2c5JJ373RV/9raBbkg0O+UShFziLa+lR6IorNKQjjQKJMN21OoRNmjkdIScz6TB0FprDGbqCj3502Hw6STSWvZaV8DWnqQ3evuX74kWoW8JRPas29md6qvkgvoUE07OC7hZoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709889253; c=relaxed/simple;
	bh=H+WALQkyfo1vnes2a3seC9FEQ8x5gZJKNfldFBzNuKk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZIo/QcBBOpcwsbEajC60jRWI07NyPoVHES2NBwFpRaijj+eCoz/la+JBggg3bPqESlB5j/dp+VB4NTESIA4R4AL3rJz3VqkpGXreS+CrBpANc1tT4vNSXcXOWBadIAn81oHCST7nLpV0qQp5EUm8IWQCxF35g8yqmTJtWTYw1NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hxVoe7Jz; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hxVoe7Jz"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4D0E913800EF;
	Fri,  8 Mar 2024 04:14:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 08 Mar 2024 04:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709889249; x=1709975649; bh=OJgCp9qq0kifVkVkqrGSeucHlNMK
	PIVBmrQ+wnT6lwo=; b=hxVoe7JzWqU0lINoyZnOfe86YnHkL0HNnxyf6PSVOtOT
	PBSAIfg1r498MFUmCI+DhUsb9aNzuApMcTH/Och1phD4inUOocAvdHP5Vi7EbWg9
	FWD8p0TvspnbmFCzWyRT7sm3ugtwihf9C9V1oK+uEg2BqkWhPFU06d72aU+XIZeP
	QdI5uL9sQIqIkEcbLmrzN8c68K5/2pgbw37Dd19h2tu/e11BEmk3+CehqwE7cSAB
	j4l5nd4/wouQO1JHQ+BpNkMxPLARU8EWRZqSmKLVQ4x9gTECLEm0fj8yEe2tQMc2
	0oLaN3Js+whzIeACEGzwY6h4SjwzBAxivcHSP4b4Ww==
X-ME-Sender: <xms:4NbqZdHCybSbXIVWzVQyVi9IuwHbVv70DRApabJzRbm3wM-_SYqbFw>
    <xme:4NbqZSXVkV1IjUysQDB7-Cf0q5kiUouENT5D7yTPBXP21bAwV29EvLG-6hoOamNf1
    JSltoVFy9HUaV8rEV4>
X-ME-Received: <xmr:4NbqZfJWE2h1hrcVbp6hFmMGtOjkSZ6E32_HVuTzIYSex4DkrZ3kTlyu_Y0ftpLirOqT5kPK035yaXmf7raifrXWHMRJbfmRIIY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieehgddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:4NbqZTHdVPgl1AGQXYf6vwXKUkFKrqUeqHWC8TM5845_J1MrmCAa6A>
    <xmx:4NbqZTX4S54Wq0PJ0HUsLctvMe1oJYzfc-YcL8UOfjm47MBAAs78fw>
    <xmx:4NbqZePoGu-VvbvIVHFxe2Yn6ICuVt4BkFM9I1ObTd8Fc4iq_Ph__Q>
    <xmx:4dbqZeRnlBRNAMbIL8mx1TR_EzMAkj013qpRiH-AF_76RoBgyjOSdQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Mar 2024 04:14:06 -0500 (EST)
Date: Fri, 8 Mar 2024 20:15:11 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
Message-ID: <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com> <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org> <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com> <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Mar 2024, Michael Schmitz wrote:

> 
> > IMHO, Gueunter would do better to instrument the spinlock tests on the 
> > assumption that the locking in arch/m68k really is correct.
> 
> I've come to agree - maybe logging any run queue locks taken by the init 
> task with IRQs enabled might help?
> 

If I understood how the spinlock test algorithm worked, I'd be adding 
sanity checks to it to test the assumptions underlying that algorithm.

I would not be surprised if it uses logic that sees irqs_disabled() and 
then assumes that all hard irqs are disabled, or something similar.

I don't think I'd be adding printk() because the BUG is intermittent and 
printk() messes with timing.
