Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7760A13BACC
	for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Jan 2025 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736070052; cv=none; b=fkhgQn9kP+1H6IiPftiShQkU5t+MDkK+BnuiemDocWTaARzBPmS9S+ZBgtpL8Wi9A6GUU+SMXCrxRg/VdgRnlDb/s4EywO4CIAzmjQY9fIVr/Dh37vB9BDRNgfRqNQrZykK1CuEXjV9W1iFLBcEvXgoiJd20I//6lWuX4bWRrAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736070052; c=relaxed/simple;
	bh=L6s+RpOaWV0IYfNKLGBmjXCX4TUEuXqD+VQi4tRuyFA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mFlJwvhFHzaCGw1QDUICgOH3LTzSF559oZtBr7R/R/ZjiA3NoBL03JHz1r3IlH6mn5PTrl4KJ8uaSdyEF6rbDeep9g6KGg0WiIJNHkZD/+IsxBOsXjB3FP/51lWiUtgGvI6i+aG0hIeXVIc5dB6/HAt5cIN3TIa5ZAjnrVlc/GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JkBkgv6f; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JkBkgv6f"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 655D413800E9;
	Sun,  5 Jan 2025 04:40:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sun, 05 Jan 2025 04:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736070049; x=1736156449; bh=E+RwgmFrVuroaRTXbBJNySqkKHN9huss3ku
	ZfNAvohc=; b=JkBkgv6fVf1GmNSSSePoSrMuE0eHPhw23d4qUz8EKzOJXwdAHFO
	cjBnFU6oIufJzlU9zOfyI8il82R83JxtXROIL46u/lX5EO8xtcK6Uji9FoIXCfGn
	quYu6LTq7jxh5iQaE3/NmzLSkjFhwkqCD9ScZF5EV8Q953K+jlXBZG25DAcrkd/M
	Xnm7DBYeRWXlpC/MqtJNi4218AHA7wI2ROaw+PqMvu27atOL2LOcUN19FFxNRGID
	HDR+xC/kzJ5o6z8gr7mV2tdB25Z2+tAJPgHVpHk0e5vuVa7n5o8wQDgctxAilvr0
	4pfx5IKuGXsohJVGdBfhu6ELrruzqza7gbQ==
X-ME-Sender: <xms:oFN6Z8AOsONPQQtPupCRivFCTjImv_piXxHYyR4Ay3JUo6mVPqNN5Q>
    <xme:oFN6Z-jjLIDTUUmjKDJj1G66tNyMk9qcERm_EgpWGJ58AtaMc5etEZQI3Tov2CxlH
    0SeaL1D12GhjNX_UZM>
X-ME-Received: <xmr:oFN6Z_nRHykrDVKh-MQ_RqlNYybub_a4WUOl-piBzXj0K_-R4IVPbys7LFeTIiXZzqNxkTgK60_iL-O3H-6Rvd-LMrk2CLupxAY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefkedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghnihgvlh
    estdigtdhfrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmie
    ekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:oFN6ZyyJod1TWsJSLQ64Ue5xZdjvCs-EsOCl6CNlPX5M_4rFjJWH9Q>
    <xmx:oFN6ZxS02FfhzrFHRlcPpEvk7gNVD1F1iw9SRCYGBu297FWBc5xc2w>
    <xmx:oFN6Z9ZAZfRPIe66XClHPHeVHmVXgcM-RiHvgcRFHu6hsBr0zsegwA>
    <xmx:oFN6Z6RwQtM34mp0TgWE2e6PZnlLsqmCCb7CV0vHtC5c5ey5UQlFiQ>
    <xmx:oVN6Zzer6JJ516d-LmGFUKDlDIcl9eS6SnsbibWdhO8-7QKIEI74BdDc>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jan 2025 04:40:46 -0500 (EST)
Date: Sun, 5 Jan 2025 20:40:51 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Daniel Palmer <daniel@0x0f.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] m68k goes DT
In-Reply-To: <20250105071433.3943289-1-daniel@0x0f.com>
Message-ID: <291d1541-e026-cc50-6a55-42c11c64b6eb@linux-m68k.org>
References: <20250105071433.3943289-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sun, 5 Jan 2025, Daniel Palmer wrote:

> 
> What I'm thinking:
> 
> - We initially add passing of an FDT via bootinfo for mmu
> - Add support for a generic machine that can boot almost anything so I 
>   can bring up my new (to Linux) machines.
> - I will migrate MVME147 to device tree.
> - Some like minded person migrates a machine they have to device tree. 
>   :)

Interesting ideas. I gather that you've already done a uboot port for 
MVME147, and I guess uboot could be made to work on other m68k 
platforms... but it may be easier to add your FDT suppor to the 
already-available bootloaders on those platforms (?)

> - Maybe embed a FDT for machines that'll never get a bootloader that 
>   supports this and use the machine type to select the embedded FDT and 
>   move all of that stuff over without needing to mess with bootloaders.
> 

I like this idea. A few weeks back I was recapping a Mac Classic II and 
thinking about how I could boot Linux on it.

Pengiun (the bootloader I've been using) can be expected to fail with 
"68020 has no MMU. Aborting boot...". However, the source code for EMILE 
appears to have ample support for booting a nommu Mac.

Most of the drivers for this logic board are present in Linux. Some are 
platform drivers, most rely on bootinfo to some extent (particularly 
macfb.c and misc.c). And head.S also relies on bootinfo.

Maybe the easiest approach for head.S is to neglect support for both 
bootinfo and FDT in the same binary, so it becomes a build-time choice. 
That way, a first cut could be a new head.S that supports your "generic" 
platform, lacks bootinfo support, but has an embedded FDT.

Then you could get to work on the drivers, and I'm guessing that may be 
where most of the work lies. (I may be wrong, though -- I've never brought 
up a new board.) I don't have much experience with FDT but I am curious 
about the kind of driver changes this would involve.
