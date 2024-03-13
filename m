Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7EE134AD
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Mar 2024 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710304756; cv=none; b=nC6QZVPX5KAvv9XhoiDE1ccTQ+z2Ep6O2KAdif4OnRceEqvnjAlFLefwUYl+LLmhzxcLDGec2qsMfulZ2hHETw66zdnAZIo2prIiAq504/fePNYjmEsxEvJnWdJ4dhZjBe4N7TaP5A1QGBp3T9hDSQ8Hc40M1ILmVtC9OmNiu44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710304756; c=relaxed/simple;
	bh=9Wv2K0P3OUJZZuQdBD5xvTYVvN9ClBwYoHXYIw4NjtM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DtTCjm8qKx57cVO5rRm60d8RleT3bu2JqodFHSy77URavI9eu78U7+u/6QuZ/J5A8rVH16fsV+A4mV6B6to17iij8SdrcqCZwshh9l2GUjHH5pELkxFi2lzktQX6eiJeTI4ZMq5N6BSp6M5uAuflkdEkfWJyOCzumPAaoMsfbUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ips8ZbWw; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ips8ZbWw"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id A14EF1380106;
	Wed, 13 Mar 2024 00:39:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 13 Mar 2024 00:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710304752; x=1710391152; bh=6LpLgjn0IT2dP4U/X+yRSdUulbLo
	OIayZ6KyKK1uWsY=; b=Ips8ZbWwf2EcMGxzDiu+d9wd3tOLX47piRSYSe3rc5Fv
	E7B1r+1PM41AcpqYVflD99bEx4Zfia765rZ59eajFa5FeM9uHlGoprkrfABgBp52
	zp+jO/nEBqrt4QhufbRcYco1OUKTYLAn5PpcjbvVFqdb0ES94IPcmLm6XvOENwuw
	/W0u+CJWEBGDykXICI4awbWLwmQqnjdKa9PjadOPSaqhRy9Bu8MpsRH/nSuCrLXT
	VgZvXVYhYF5IAthkl0Xc1EirSlrw8B1X9xu5fRJuaneD3sleCcu5BS7mJF1sbRHE
	QlCmCEn3fC087q1dv+d6bfEAN6oqCwi0QqD7nSVeXA==
X-ME-Sender: <xms:8C3xZUdKSBatj3GADqi-XQhmHC4ujD92sy7LnvMNPvAhH01HW2vbJw>
    <xme:8C3xZWOG7cJgIWTMYk5GK7yI9dWUtl1lRZ5tElH5kiKNEtZRO36150NmgO7y7vKqD
    ECQwSuMiFXkh-3nhEM>
X-ME-Received: <xmr:8C3xZViCgxrpZY6LLCtUfkMz_63Pz3RnlJGDnFYcIA_gWyFWT2SuoJlcfJ_9tmRnPbkQrd5bb9b1csiPxXuFEbQM91u7pG8rpHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeeggdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:8C3xZZ_7HC_vKbfaf03dkdazBsAMtUsy2M7-QGVAS_YmGE6j3-bwxw>
    <xmx:8C3xZQvBPy4IxnFD2V5CzI6c1Tn8cthREULrkMlXrUvTvjSu_qFxWg>
    <xmx:8C3xZQGwn_mO4nfc0AdXbGfbCgi4FVp6VnXhbTD2afrJ3mmEG4fW7g>
    <xmx:8C3xZfNnqFLJnVeV-1i7_OUOiZSUIdpWq9IE2Ce8L2H3u6Nkjcp9qw>
    <xmx:8C3xZSLiVYh-Xla2rDPUMyZm-fdjNOFrI_ieuKuw7wzyHgv0T87v9w>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Mar 2024 00:39:11 -0400 (EDT)
Date: Wed, 13 Mar 2024 15:40:23 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <0c7b96d2-1cf1-4fc1-876e-8e3bc859a1c5@gmail.com>
Message-ID: <028f8edc-a08f-571a-0985-275394b60986@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com> <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org> <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com> <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com> <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org> <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org> <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com> <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
 <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com> <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org> <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com> <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org> <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
 <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com> <0c7b96d2-1cf1-4fc1-876e-8e3bc859a1c5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Mar 2024, Michael Schmitz wrote:

> 
> Running a stack-ng stack-fill stressor triggered the panic, too. I'll 
> see how reliable that is.
> 

I see an immediate failure with full preemption in QEMU when I run
stress-ng -t 60 --zombie -1 
