Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C13EA4
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 00:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714093193; cv=none; b=N54oIKrdbORYoZ+3Mlw/yrahTgKY6bas0ereamFYTlIzCAgfnMDp5n8EPaWUdnzhqNNXyEurGpQa3mSaYbBM/MKZkmzeD6TrddCYE0bBBEjfw++tlre6/JVvDXUlWeKiZAU055UK9ekW3MGt5BTBCtoMyxyGAxojJGsttNtc5/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714093193; c=relaxed/simple;
	bh=1ubUoKPcLjfbdLrHCLaq4yFfNtcj0yxVLQaSf63WEsU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RmHkPyIYlrW+/nFwWwWupkxyXQHto7VTwIkrY9pN8+gZhzs2ABB/LiWa1rzco2dTMpsWS5nWR7O3YUvatZd5xp519x+7eIQH5WHMfZvrgzTjBB5S7eEyU9nkt7o97e2vuuRDt8Hh4Y//TgPrEKqRpIjWKcXHDXrAj7KTWW6+bYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W26omsc0; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W26omsc0"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 1ADC01C000D3;
	Thu, 25 Apr 2024 20:59:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 25 Apr 2024 20:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714093187; x=1714179587; bh=rhK11vDNI5oiuZp9ced+FUbWo5ZB
	MGe3oodt/HT9np4=; b=W26omsc0rVDD5fwH+onsStzNaxC+4ZOW7itu2yBpCyqK
	ydGuEKW248qHuV/n9M9lB/PmmWQtrYhq3pfwX+p+dQnc/k8ZUl1Suw1ctDUDkoz2
	6qYAt7f/UR6R4A+4CRwO4q4FaFPr5XXNRCJ3uZSBKVcwae0bChc6HYcz3XiDpzJU
	KXvF5SWizYU9qr0PWpKQZ30bWHJqNa1x7LGbEtpEIi0Fo4WE9efAkSCg0zgV8ytn
	ENyeRSTmXFq8TLwocwhBc2/9o545L3KN3nqkb53CU0nSJUJJdLfD22v4gSIvgd07
	vs3Ak23avafBRD1GtA7FG6Git/gAXn6KiYOfLaf9KQ==
X-ME-Sender: <xms:g_wqZig_fYXIaqtHXm9IVNTDu69Xn1tHnQy6JYBQ32NSNa5wOPlQBQ>
    <xme:g_wqZjDw542rNf7bvzqbM3A6fWEWoQk1PpHOYBNNdqa7bqwqTG1GS5SPerkbVP4Cl
    -j7RGre49yIXo95BK8>
X-ME-Received: <xmr:g_wqZqG8LNHbyCfGHQE-u_motKOuxrE1S9wF-tnrM4u--FIc2wXR9hdkjBSjJr_EZ-o22fNMHbCmeVTPsGwy_4Ggkx7dA3le2oY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelkedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:g_wqZrRi1AiIERX7ng_spIQqKYED0z1vdjg7nhapsRjHY7_imgjQpQ>
    <xmx:g_wqZvyCT-WjojrnsWmR6WJUoS-9q8vGe7y4RSMaygz4O0OHkxZXXw>
    <xmx:g_wqZp7Jv9uFR4MQGHVihZg9Zx3RWSXV3MDa6yKnQhamadyLxWMvDQ>
    <xmx:g_wqZsxdEjQetsH4BtR1rFbPy6RdROWmDyyTCvUv8T3J0ldRS9tyjA>
    <xmx:g_wqZq9z0SC0dQ2yyuj4nxGC6bfrbNXQz49sIi26u_0pSlGQZtJMqa5P>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Apr 2024 20:59:45 -0400 (EDT)
Date: Fri, 26 Apr 2024 11:00:07 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
In-Reply-To: <57b70e03-2672-4f27-87f9-481208173a20@gmail.com>
Message-ID: <b9d281db-c06e-0eb3-0f49-b95f576a9891@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com> <20240422022943.13775-2-schmitzmic@gmail.com> <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org> <57b70e03-2672-4f27-87f9-481208173a20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Fri, 26 Apr 2024, Michael Schmitz wrote:

> Not sure you noticed this - the 040 passed __clear_user without fault. 
> We managed to test this one without meaning to. Exception handling in 
> there appears to work OK (for the cases we're testing).
> 
> No idea why you have the __clear_user call occur within 
> __generic_copy_to_user - it does not appear in my disassembly.
> 

I'm afraid I neglected to mention that I added the patch below in order to 
exercise that code path.

diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
index ef761fc10981..1c9a24a0b554 100644
--- a/arch/m68k/lib/uaccess.c
+++ b/arch/m68k/lib/uaccess.c
@@ -58,6 +58,8 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
 {
 	unsigned long tmp, res;
 
+	__clear_user(to, n);
+
 	asm volatile ("\n"
 		"	tst.l	%0\n"
 		"	jeq	5f\n"
