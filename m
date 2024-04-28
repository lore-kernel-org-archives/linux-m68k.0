Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE22F25
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Apr 2024 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714291410; cv=none; b=Pr+Ndc6o+ZIZ42vyVxl3+e+pqY+mEI8aX6n8JRyuiJcwxGQZWZsVkP8lVeFL2VFdua5q2EMD/mbhI7hksv1XLLl9WO8y5i1EiUePnzjOIiC411hLqHUfIW5W1R5PU5tXCQ82gpwjUbm/wiFiS9cR2REdno/QzbP7NwlF5ZfpMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714291410; c=relaxed/simple;
	bh=R/crlinGYYFpjUXVTPnNqGly92f0r/7VQ9a5oyLNI5U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s20YdWQici3xzdjfbTybMXOq5FmJdzWxHKkhbS6sgCp/3L/HI5AEvvO1iCbeWJPaJTgFsFRMEB5R02VXmyibhx0vUy7M4kiR2q/Bj3LYcc7RjZsJnklFxt8UnJNQeaeJIlaOdnLxajaH1kgY40Whn2wHOih6BBmxmEd+QQnUGZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=evmz511r; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="evmz511r"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1285A1140094;
	Sun, 28 Apr 2024 04:03:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Sun, 28 Apr 2024 04:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714291407; x=1714377807; bh=rgMRi+gi2a4xwlJIynM0OSRWfzQL
	1ZpbmqXkkOoR+aI=; b=evmz511r2hIp1JJfJcuFouzXHNEPQUb5N1y5XMnPh5R9
	AXsvDNNmWN7R7HBprDUofd4vwWEisyKjxzBTZe45L98JukzdfFsRKwUZuqSAiEiY
	FPwGkKA0VckOWgLGtWOIiMzKGv/0KIqWHZKrXkm/MVB+9ngA74qhDWCD/L7DtRRS
	csjSIauJPDsUwC4oqgwc8rhMDuyDDv3S+5WxnjgS7U9/4OtMS/OsqG0fUKBqWxtF
	QNYK5s70QY/+VpAM9zngNvmEWXrDnJLyjfr/0k9i5Kt/eE7mcet/C4l6F829dKOA
	p9YNcD5joHfLK6V/dlM2wMJ8qObWFmgYGQjcet+CvQ==
X-ME-Sender: <xms:zgIuZhcEg-v3mU-JkMw6NOEBE3w0PYeRhij7b5vWFatWECYQU5gX7w>
    <xme:zgIuZvODn_u0ftFzcTta6qzUNff-AEoeKXXUGnPqDVAUk_VS7dnnMxdoLTJaZZ7Gc
    C5Ar4tNHA_dWHDZ-p4>
X-ME-Received: <xmr:zgIuZqjY28jTghg4mOrX5uwToYaJX8O3ERIQ3GO1R4sPzc5QZy16yRpKmu_B038ezgEFUlqdH1OhIE7OL3kl6gkZY_TrrQGCMBo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddtgedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:zgIuZq-bBbpoEERMsh_X-7kFTZwpgZpLGA19kzX3R2S0haIB1HB6zg>
    <xmx:zgIuZttH2sGwNV5bm1lDpHChzc9Um1r8PXwzXjXeoEbTVvmeiSH-xA>
    <xmx:zgIuZpH2SU9dpzPyL1ZxCc923mVjQslvHh1HW8CG_rRPVlndEzdIVQ>
    <xmx:zgIuZkPTTbTZ08rZqrY7M_xcQAQrFHIc57D3GVK8c74ZB8EO0MX8Lg>
    <xmx:zwIuZnJn3w6cnynJU1Co4HF268pDNLE6hn0x6sCRIAIQE5JeqGCrwqBR>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Apr 2024 04:03:23 -0400 (EDT)
Date: Sun, 28 Apr 2024 18:03:19 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, gerg@linux-m68k.org, 
    linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v3 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
In-Reply-To: <314aaa18-e28c-851c-d746-10ecc46eed04@gmail.com>
Message-ID: <400c6b26-29c3-9bb5-9516-26b5752e64a3@linux-m68k.org>
References: <20240427084815.1449-1-schmitzmic@gmail.com> <20240427084815.1449-2-schmitzmic@gmail.com> <fdbe029b-1df0-3e8d-fced-64cc719397fa@linux-m68k.org> <f88ad8f7-4fd9-45b2-a52c-cee3217083bf@gmail.com> <95677826-e3cb-9c1d-7d03-253a88aff3eb@linux-m68k.org>
 <314aaa18-e28c-851c-d746-10ecc46eed04@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sun, 28 Apr 2024, Michael Schmitz wrote:

> >
> > All I'm saying is that, since you're adding the NOP anyway, you could 
> > make better use of it.
> 
> I already am, in __generic_copy_to_user - there is no exception table 
> entry for the jump label at the end, so no loop.
> 

Right you are. I did get __generic_copy_to_user and __clear_user mixed up 
there.

> Since I have to fix patch 1 anyway, I'll add the NOP at the end of 
> __clear_user and have the exception table end with that NOP.
> 

Well, I'll leave that up to you and Geert. I'm ambivalent about that one.
