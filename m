Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145DC18E1E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Mar 2024 00:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711413653; cv=none; b=qWeMwH4h3WO/W12diri/upUzWEr3HYL5ORVXRyXiv8QC7mgm18yyp3EFle31v36DRFrF4WE4EbkUU9ZvHjZt0vlr3E7aY/5OMdcJptu1a8n7Y/eZwM2baPBhlh4gVUMIy+AvLI9uR0sVmTEuY07v6sZcXolcPY1IinDIyROot/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711413653; c=relaxed/simple;
	bh=9cB+QxPm1yub+N8mS0MXlOIUtizNtDa7nRP2qLrN4cc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O1riA7RAEMuguTtTsFxhh+X4xtGb74iFH//VZrBec8Zg9NQDy/AxmOcP2uhX6ohm6z3npR9sFXiGqp/YmdwIcB1oUm2UgDl1lINaI2oE4rwqLvgRPeDoHUoXVswItzUDnE1EfwVx47ukfjxuJafxgD2DydMVS4thAyY8tlYtVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XMqBtvem; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XMqBtvem"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 22997138012F;
	Mon, 25 Mar 2024 20:40:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 25 Mar 2024 20:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711413650; x=1711500050; bh=HpOIVA7MH7RvrGb8VLDu1jWho7vc
	YGXQKSGpqZO0iYA=; b=XMqBtvemD3/eu/oi0zZ9WwU9n8c6n2xShCE386ktD3At
	CDTmnMpEeewWx8SmNrbA5pHRDPb6HarNwGvF4FEdsdCKGzFD4mwam3q0xuRTM4gA
	jA2UZ7JCgOZvEaai6z0/WzxexzAKSzuov6VuPa5CvJt+KAh4oqjclUdhx5KXoyuk
	5XzN4V9HhgIW1E2H98PkDHncph8z6b4efihXgDF2Xls7gpgn9qF7AumV+n1EPUHn
	RIa26n0EBwkBxFlvde+d9nxruTw4VjSky8PhKF6WAcpAhcYMwjLsvfX+BnFzc6d0
	/RYzqTUaGRv81te+K/K6WEPlIuw97wqU3hOpK69n4A==
X-ME-Sender: <xms:kRkCZlTLJRvc27tiV_Is2O8UGUFtmZ0HwGb0ptTJWZTNbk2ZgWnfmg>
    <xme:kRkCZuwmKxXRjrvxK7ssSX5iGbHWOqIdYTXDG6vTkszF7x4MyntsCPk__cuhd7hrZ
    JpnSeCNczgVj73wDfU>
X-ME-Received: <xmr:kRkCZq3yR0kQ3ErIZSZ52rc-aSgAeheB_hKCC6CUreiw7r2nm3zVRKc9Vq8zEqix0xkOZOdnJZ_7v6aCiWu4137lXrOb7uEP8RY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduvddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:kRkCZtAtCdqUJRztYNZu85yPbfgV6oQ65FOvNk8W9M9Mmmo43j9PMg>
    <xmx:kRkCZuglFe2h0uktSZkHa_EpE_C2dcNzURrxMpHamIuPPbnRKJA3OQ>
    <xmx:kRkCZhow1pSjCdBAqHM2rpOyRG36MdPD4B6IOk2COUegTxSkVQY44g>
    <xmx:kRkCZpho_ySH4rma9mJuWRfSG3ukzFlEQODs_MHBP_8uepYxE16MUg>
    <xmx:khkCZvu-5jYg6Qs0EfbnRERmJRS2bcIsWS3Zm12mSCs0iLVP7v2e4Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Mar 2024 20:40:47 -0400 (EDT)
Date: Tue, 26 Mar 2024 11:41:59 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
In-Reply-To: <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com>
Message-ID: <b8792dcc-eb0e-936c-965c-87725be0cd33@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com> <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org> <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com> <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com> <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com> <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com> <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org> <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Mar 2024, Michael Schmitz wrote:

> The set_fc warning is specific to 040 but the bad kernel buserror (null 
> pointer) causing it isn't. 

I'm curious as to what happens if we just ignore the error and continue 
stress testing. You're right though -- we don't need an '030 for that 
(it's a non-fatal error).

> But testing on 030 would be a good idea if you have one with enough RAM.

My LC III has 36 MB which is sufficient for stress-ng. I will try it.
