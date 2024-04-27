Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F76A8488
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Apr 2024 01:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714182260; cv=none; b=R6nMdQSXZtOgpp6L1UajJVdYLwlnpMIIw6+zxRzX6faRzHgLAnZZbbAcd1Nbm5dMhSNJbYkiv4iRVCp7xWeSNQpLqTJiZLqG8zZTB3tTwdO1KUDhegCjCvn0ZfcA6TqMi4bCHQ5qy9UyX4phkywaRFSAZrnw+NRhV0pTw8hzdwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714182260; c=relaxed/simple;
	bh=kTT9ijCcysGzPxHxLjZM9eurMMfEyNqfOD+cc/iw9FI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=csOkhtm9Ob/u3s7aYnC2eOiwS89fWHk2hW/6Zd34Z8SjnHw5FAX0mxIakng3Fm47T4dlLBNwbCHYtvHCyJn+p/oy3BX43IFV+NWwkWl2LwjigUue7sMVKTvu6tYSaQV2hiTM1vdwgGuyfRZJPrnVFazp0Hv/31IPV0ec7uDt6Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Euwf04Kc; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Euwf04Kc"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 000C918000F8;
	Fri, 26 Apr 2024 21:44:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 26 Apr 2024 21:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714182255; x=1714268655; bh=oPOq/2RALu4brCXQZjfu4PsrBp4b
	BE/8+zRoGejeZ00=; b=Euwf04KcnnceVl1eyuXNnkW+i5p/THtKASMPp3pbE/g+
	hSL5qoC7dj7YjR+iuXbf1rzIfYx+GAxULUdYuuFfrYCMhEo9W6Clnh/L7nnF+d+K
	9CpCiGW4XIIE2ZZ9VYS7OyYnHf43+HeUfSR7ECiAGbI3pLiSSU+0pj1BDNElkgHT
	pUFosmI6A1YEqmELl8aa+upmMgGGu+YoSjhes3SAGmFG/3dK97Sqcu1+nLTGA7X/
	KScZpbJ0QUxLuJHPsk7aR5XKRYWL3e9IgXrVaE7K2vybN8kYccHfzEfek3NLvCpq
	rvIYmILMbDSlaldtAi0PDE+hw23P5tYnZ008ThTFRw==
X-ME-Sender: <xms:blgsZi7nCa5DK8ZOKk7ECC5ppYXIGzLIxuJI-dcjRto8FXmjjFbcRQ>
    <xme:blgsZr7eSErG7pAbonwVasXUE0NhtZtDKr8Jp9N6Ma61BxvXJwFYF4QjjnPRQrmKe
    Hv5sOGVgdazABzgxZo>
X-ME-Received: <xmr:blgsZhfjrSsK0ZPnyMqjpDmxqB8HpwBk85sgira7_SU5M5yaiM3vgvT9RKbL18CXHS0uPV6kmD2GQ0VnT0N2yjW6_nNFMC83jH8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddttddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:b1gsZvLGJ2MH2CfKc2GZAhV3b_9WS1oP2rMqetSpoqk38HIWfXti3g>
    <xmx:b1gsZmLlCHSYCN5OeNlPzipoGDjj8JJVaHATZXKyzmhcwHoAbI31BQ>
    <xmx:b1gsZgxTHlkCXbw-d1wNWmY9T67bHR-Mb5fK22Nst83agN4AdwsNHw>
    <xmx:b1gsZqK1M5qWDLeO1tXgCXeCOIM1FxefKWPQn1Pulyz95fhcWn0qcQ>
    <xmx:b1gsZtV8kj2sEzyMATfZAKzKjbuN__XRTjNZsfKhnr3TWvPeRdZk9ukP>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 21:44:12 -0400 (EDT)
Date: Sat, 27 Apr 2024 11:44:34 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
In-Reply-To: <ef3430ab-4dbb-954b-8bc3-7abf046d134c@linux-m68k.org>
Message-ID: <77b94911-a58c-6f44-7c92-dbfdbb403bd3@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com> <20240422022943.13775-2-schmitzmic@gmail.com> <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org> <57b70e03-2672-4f27-87f9-481208173a20@gmail.com> <b9d281db-c06e-0eb3-0f49-b95f576a9891@linux-m68k.org>
 <1b49c8a1-c753-428d-b526-06b6eb3e551c@gmail.com> <fbaaf75c-c4e9-7fee-bb8d-9fd0fd25b197@gmail.com> <ef3430ab-4dbb-954b-8bc3-7abf046d134c@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Fri, 26 Apr 2024, I wrote:

> I will test it tomorrow. I expect that a NOP is needed at the end of 
> __clear_user.
> 

Everything seems to work now.

I tested this series together with my own RFC patch on a Quadra (68040) 
and IIci (68030). My tests covered getcwd and llseek syscalls. I tried a 
build with the extra call to __clear_user() and a build without it. And I 
covered a range of working directory names.

Tested-by: Finn Thain <fthain@linux-m68k.org>

So apparently there'e no need for a NOP at the end of __clear_user() -- on 
'040 and '030 at least.

