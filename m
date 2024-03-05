Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEC42581
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Mar 2024 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709598816; cv=none; b=nIgvvsMXQHNZE5Jk6MYD68cnI+n3XdvmYucfG3wW5AbsEYq/FFTUGEkLRIZN+HtN3l/kcZR85vqZ/3reb/AkOH0Aisy0bQEnfmnXoNtut9lDaGtb9AVYkPSE9wS2B9Oap1RX7VNzRnaMEINJtReFb2CtDb2vqa7dsqvlx6zj/Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709598816; c=relaxed/simple;
	bh=wjGIcVc3vavrxlhX08Fb/7Yrq9VCCrmO/ud6gjoTe1Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CGTfKlDwGMrP6pl8nEdnqCgkQ87TBoHJSJdZHh2n3fJdRJs8myFdG53czhneWeMCpVAfAXYosFHtG1g5uh/8i3LSqM6VqXtYzCOGwfiyzIHKP6i8e9MHkyb7WYIalCGNBj0kkbEb+NqC/VG5REz8sYRknv4J2lsJbsW977wMg4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZTKfrP9F; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZTKfrP9F"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 63D3111400CB;
	Mon,  4 Mar 2024 19:33:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 04 Mar 2024 19:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709598812; x=1709685212; bh=R+520akRRhnx8NYYA3acX0ipeASg
	0WT9yuMfF6vP/9M=; b=ZTKfrP9FIbh4V/ngF6zZcLDF67rcR7NUhVIX3ibaZLJg
	ksF8BW8E3BXgBdByWWe8IAI94YBrSYLkHbgyBvXZ5hr4z9gZUSSVhINnTILPdxzh
	n/qMXhAx0rBkAFb2lZiY7JAA/45LpfhsBo+3+QOZEVjtanTmlXYshdtqkx4nfftS
	iHhJDlN3IlM0MqjrSiJeF7bGsQprfmzMwoJ7Kg0hkKfaZthuY4zRVXU18zbNyvO2
	CSs5hawoUVOR820v98EuSZGtt5NR2PFXzsBbkhjW/FDI7lE/yw6PNThgJrPseWCc
	JoxfweHYeLI2pR7TOHo0D4nLSprb4/TfqwY5EV34EQ==
X-ME-Sender: <xms:W2jmZTRXK3iUEwl0x9MLhAiXnFFjAjyYKngOApFUF9xrMMda9Zxwcg>
    <xme:W2jmZUz1st4UE2deppNK9yV6f3FpKTEPqVfZFGg_JjcUkQJNAT2GemgRRYGSqY8YU
    lkUp8Kxz_3cBzlzUzk>
X-ME-Received: <xmr:W2jmZY0RBZxwKDxrrJN1DBxtuPyV_Jh_5fD1Gm7vUtKY3Kpgt8uayWOevofB6A_i217KVECt6PDJJX8tuHnHbvChh_d2PdBe140>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheekgddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:W2jmZTCTzLTbAF_nJF_U6QXYbdttZf5s21WanbAtG48SBaIW1uQONA>
    <xmx:W2jmZciP21PkdIFDoInhSbvrlkLRnv2nGq_3h1Q6V2rPqNRpR0owMQ>
    <xmx:W2jmZXqE8HSjLsYMVtp86xf5o_jCL9AvO_lQQPWXTrszVIDMWxwRMA>
    <xmx:XGjmZfvNTerMxxO53J6t7VOBOkQMGBJWCNy-n3FdetUeTjQByvE8ow>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Mar 2024 19:33:29 -0500 (EST)
Date: Tue, 5 Mar 2024 11:33:24 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Guenter Roeck <linux@roeck-us.net>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
Message-ID: <2ec644e8-f0e0-ee4b-f866-c27ff531aa3a@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 4 Mar 2024, Guenter Roeck wrote:

> when running the q800 qemu emulation, am seeing random "spinlock 
> recursion" messages every few test runs. Some examples are below. This 
> is not a new problem, but it keeps popping up.
> 

You have to enable CONFIG_DEBUG_SPINLOCK to see it. I have logs from 10 
years ago that show it. Those logs have the VIA timer driver in the 
backtrace, like yours. That was v3.17 running on a PowerBook 180.

> Is this a potential problem or just noise ?

Maybe the locking validation is not compatible with nested interrupts (?)

Does "spinlock recursion" show up in Aranym as well? I would check for 
that myself but I don't have a reproducer.
