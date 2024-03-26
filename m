Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E651D54F
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Mar 2024 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711490537; cv=none; b=gE+6h58q6/f5qjwrTexpmI/IKYMOjthYYLDLvh5NWEsZ/0eXzNLjWSB2IuYmnGpQ1C8TrE4pn7qAF6gvYRGRfVBFGvBlLFZnwEZ+ueE1k63WWX8rg/N6d6u4RoA6DFQ2/O6CV7lOKiTA01HSUkJfsSnuxtoNR4NKR9OayV8nf4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711490537; c=relaxed/simple;
	bh=FP33Ls3Qa4ucsVUI8TV9ZFEIlMPNb2ozWfN5Lzu+wgc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hNiPiWxnS/Ya7H0Ggq6jQUKu+QH1pV0+ejfevwhkEeTEhVcTJorBjVyeykaJC2ClPROD553NKVT78IBSG+I/atYrje/CGgYmkbqmU5y3I/b8QiQBIO9OHWnjtXT9hRWAxm2PwmCBqvFX8wVwbIWEct0/yXI4z6ve+kGyCqEqJj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NC1zmE9K; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NC1zmE9K"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id CE7801C000B3;
	Tue, 26 Mar 2024 18:02:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 26 Mar 2024 18:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711490533; x=1711576933; bh=0foaivRlbblqPM+6X9UePl1AAt3J
	ZT3SjHcKU3UL+CM=; b=NC1zmE9KZ28Y8Q2mHwfNAA+M98xYsVysZmSqZUwuBceH
	gXa4BzHJn1HcqSODrfEs+6NmYH/SoZcM2AMO6Z06QvT9asFVxRhZFNi32BdWGpGr
	420GN5FjgelSflCdNw/Fxf3mrz9l7nd6qW5Qp/FVNjwAFPhosPvxIiPW6I6kJ8YE
	Bdyd8lN1P2Nb0ooe/b82RUFxCWUQ2Tu/wKbTBUwfoSRGBoEtRDzXfQJ1USEvtwEq
	CSPLjZhPw/iYMfjfqTt0akdnsxY+9AZhkQTCIIARHmVFpNWBHkiVXN1XdWDpxDGS
	5rg9TCpB/UEIbKnODyCctDMs2wrY1UFgcv3D+F8eQw==
X-ME-Sender: <xms:5EUDZre8LuOGBjJ2rrE3zsgxECEvZcho7hhWdlt6UFohPbaIqlKb9w>
    <xme:5EUDZhPgHKtyNtbVme6Uh_CYhpuVsuemMcBMoNDLIA2qzEN5kNetQSCGH6UdNoRJW
    KYAq4D14g3MzGEFrkw>
X-ME-Received: <xmr:5EUDZkjSgM8hCm6FkrlbTLnTlU7ZKj2vQ131wy7rGdnVPCPDKPWyu4qg0DSWwqadHshwE_J-KZSzyx33ol162JaCm0oibLxxYLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddufedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:5EUDZs-kCaYdf6IwIOHl4mmzF4DLE9MfPSiN0b66ezBP_8wW-YTb6A>
    <xmx:5EUDZnvqRAkMYxFbeRwKyIbIo1mmmtPg3QORBrIDEcKyBfv1XOy8yg>
    <xmx:5EUDZrH0TDHtGk-L0y-H2VkzCz2vOgHJr6khOPpU2-SauBoflWuaKg>
    <xmx:5EUDZuPGZKUFjrhepQu6XdspAJxEcuNwndhit0zUljc4fxEXG3TPrQ>
    <xmx:5UUDZnLfIllIOLQngbUJtOv1MRpiGmSngOepS-ot0S2BAu0vssuVvHJfNVE>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 18:02:08 -0400 (EDT)
Date: Wed, 27 Mar 2024 09:03:03 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
In-Reply-To: <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
Message-ID: <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com> <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org> <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com> <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com> <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com> <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com> <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org> <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com> <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 27 Mar 2024, Michael Schmitz wrote:

> thanks - I'm pretty sure tried that early on but botched it by excessive 
> locking (i.e., keeping preemption disabled when calling 
> get_zeroed_page()!).
> 
> So I don't think you do use too much locking here.
> 
> I'm running stress tests for a while now, without any trouble so far. 
> Need to add a few other stressors back in, and repeat all that on a 
> slower ARAnyM instance but I'm quite confident you found the solution.
> 
> Geert: with this data race fixed, it does appear my RFC patch is no 
> longer needed. Finn or I probably ought to prepare a new RFC patch to go 
> on top of your preemption patch. There is no commit ID to use in a 
> Fixes: tag for that one, correct?
> 

I don't think we need a formal fix. I'd be content for Geert to simply 
roll your free_pointer_table() changes and my get_pointer_table() changes 
into his own commit. That way, bisection won't produce an unstable build.
