Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBF8132103
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jan 2025 22:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736201666; cv=none; b=b1u678zGkRoiCLvED6wSzaupe9YIPM/HPB5XvO7qSlAMvdKh3hTQHLn9grznLtgHHvie1u2Q7bzjdrPzH53T0lb7UZL7yX8eohogAkuoLjsw0L586d1ACu15HmQe4AHsZXhCo2TxaR3WgryWS4/rmDPb7KnhD9UgjXPoJWIcPH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736201666; c=relaxed/simple;
	bh=yEj/l48wJpxo07gt7kQbggCs9DL+dzi6xPD4tnIY5R4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HR4D9uqKfuShwE64wYYLlIxawailRc7CnNU+ftBbQlRKeFXd75uoWU7BZv6FNjg3M1FK18IcrZ3XRs9iAqhoJc6jsvqC+NCSWBlVIuCi1TkZJCoBVYL1rXyndnTN6bh11iFIw9Asd/kP+TOg05xN93AIPJJZ1WSzuV1+8GO1sDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EvzH6w7x; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EvzH6w7x"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 207B12540194;
	Mon,  6 Jan 2025 17:14:23 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 06 Jan 2025 17:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736201662; x=1736288062; bh=1puZb0XL+owu7jUrBudLEbOMAPUKOIDkjTe
	YIBaYn4w=; b=EvzH6w7xprcOKxfBbJnpLo/mldUSFsfhTI7xc6QsaC2p2fe63Oh
	8nha9ttLkMCNMRvCzg0RMdZqqZuQjGimoWmfOR61vdurCnbFZ69CyqXYANoAlH82
	1hi0DaIlcKFtZiNBRj7qTj3G00JcOkw6eAy6maXELlWSkDuKP0sr2tSntX9u4fXl
	YvRYv+EfaPs3itKI7tJ9mawCeuUiCAdnOuAEDl3/el7zypaDwYUwA/Nubv6ufx5L
	7rtJDWtxWOK0LNNfI/1FXDUbdp9E5dGj7lNUKhtGfP96xyh/mVXW7L3ySj9htnbp
	P2eOJdZXBF6yxl0Wf187Kt8U3MfujLqnM3Q==
X-ME-Sender: <xms:vVV8Z976La0QiQFKk7tz1GIpok1cw86-QnCOXY-_iox9IsSTJDJYrA>
    <xme:vVV8Z65glRzC0dv_zZ7A6fMNVIZ7C2QkEfoKg3i3s9VNH2EktcZqCVzO962r0GUEN
    A5iwZLw3x278kZIF0c>
X-ME-Received: <xmr:vVV8Z0fWPlwFyGq0Id49SwW89cGVLHaogbBhSmzBrGSaopXr0ctMyvTmkJ4bsw63Hr35cp0sVo-ycxwlIM5oXBnDZHn8sIYoEtc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegtddgudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhlrghrse
    grlhhlrghnughrihgrrdgtohhmpdhrtghpthhtohepghgvrhhgsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegurghnihgvlhestdigtdhfrdgtohhmpdhrtghpthhtohepghgvvg
    hrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehk
    sehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:vVV8Z2JynBtG72KBPf9iW7wPWHa7BNuCcO00wmSUGNedoTp9IiLZ-Q>
    <xmx:vVV8ZxKE_Ppfi3ODhqVJjf4f8bdUYxmSBrYNZtGn8M6hv-PNxcj2Jg>
    <xmx:vVV8Z_wDq5nlnn1XK3rmv76QvEwMZK9OrYGVlSljxBHnLl5wI50w4Q>
    <xmx:vVV8Z9KrUrrOvHxUsMV5ybJYrrbj-iXz9TnmktI4EJpJ8MW8WzZpCA>
    <xmx:vlV8Z_j16NS9XEvnRg1Xc19GWGt1UPADJJgHRJUV-9ew8ZPRr9o-cv0H>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jan 2025 17:14:19 -0500 (EST)
Date: Tue, 7 Jan 2025 09:14:30 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Brad Boyer <flar@allandria.com>
cc: Greg Ungerer <gerg@kernel.org>, Daniel Palmer <daniel@0x0f.com>, 
    geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] m68k goes DT
In-Reply-To: <20250106113749.GA32654@allandria.com>
Message-ID: <980f40b3-fd1c-74c7-c651-b85040bbd3fc@linux-m68k.org>
References: <20250105071433.3943289-1-daniel@0x0f.com> <c0428d69-2f18-45d3-8024-a9fe4170b23e@kernel.org> <20250106113749.GA32654@allandria.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 6 Jan 2025, Brad Boyer wrote:

> There are a few drivers where we could eliminate complexity and #ifdef 
> trickery if it was all device tree based.

Ideally, yes. But how would we get there from here?

Should the kernel synthesize a device tree from the bootinfo data, so that 
an ideal no-ifdef pmac_zilog could work? (This seems like a maximum bloat 
solution.)

Or should the mac platform abandon bootinfo, and require a new bootloader 
for all kernel releases after device tree adoption? (This seems maximally 
difficult, since it requires simultaneously merging many patches to many 
subsystems, even if the bootloader changes could be done in advance...)

I wonder whether any other architectures have attempted to retrofit device 
tree support (?)
