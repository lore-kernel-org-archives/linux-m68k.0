Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDAC8BE7
	for <linux-m68k@lists.linux-m68k.org>; Sat, 30 Mar 2024 06:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711779734; cv=none; b=orN1LzHFlqRMP4jvHtaMQApvq84tDc0HBlFV8LmsdiBwMvzA2JSjzkA8I5kgbuKlSJ1vX98KnGQ6DH92en4wqVRLs4gk7Bg6HpS7+SKwcc2Ue9S+ezdIOYKwoInUgJ0YWA319krFZ60n8unNXRoJ22/ulJD38xvDcNkOc2EZ9OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711779734; c=relaxed/simple;
	bh=zBaHCdy3RS8uAPr5C0Q1ZncEYAvkAbRnIih89bRmEsg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ODaIY0sOsUls1hnuj3vTTCcd5vDAQrZGzTtLy4bVHdINq+7e7Si/YUjybNgK2nKFWjZ5Q/8nHrPGb6FOoxPFluc8Lfy81yIka8drMm0CprXgMDWaCA351mtimT8YUlqeCwpJnXf4oK99ON3C6PQCKtiuLFh4l3QtQlazAasAmhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rd152zHl; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rd152zHl"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6C68B11400CD;
	Sat, 30 Mar 2024 02:22:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 30 Mar 2024 02:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711779730; x=1711866130; bh=aPq/GfWKPG0ZtDw+BaIj3LlHp71v
	XhRPkMgk9KWhMfc=; b=rd152zHlJ2c98X1HUKcd7h3riv68Jv6gqUtKrGXWFEsg
	CiH0rzG8Fi8Rwtm45leOUT+56VTVr+LIfTLlS8BTEEVdPabd7sCFEVeGrkEaBniL
	Ew8GYVuimEJf11yppj6ks4kdwUDdzeeRuACIPq5IKnTLfaUYq9V4Yhq6xXWrF0Jd
	lGoE8Bzl0Iog3XYhoZJbA0MC27XdAyELNdSbsrA/CWMZOpM5hDdx4EaTo+2I0IqA
	ud+jCfL8+K774QHE3+mVOgFAhH82kRm8govmUts+/n97prwtrEBanV9/nSWgoWuN
	oHfh9aHcxVm8+D59/tYzr9s+TsGY80XxQUDo2Z8aWQ==
X-ME-Sender: <xms:ka8HZitqt-koCDw874FSOrIF7pZIE2YFBzYadG4ZRlExVC_7QVvJng>
    <xme:ka8HZnfyFL6N4V8KjZNV6TZffa-roP362kwmUCPCqbqYQKcha6ljLoN5GXMcyWJ2K
    f_6jLCIvvDgFezeoHo>
X-ME-Received: <xmr:ka8HZtx-1m9kt9i-1thiObcIcErabFMtRGdUsRSQ9e11m_l_O-hvvHThp5ujUU3yqg1YhJPk8ni0LCUGaS7pmbYXEIJAaJW5PMs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddvfedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:ka8HZtMXAVTDLDL1KpDWDqlyDAD02QR892WUpVBIEE_OhPIXAdWbIA>
    <xmx:ka8HZi97puxv6ozwY1RAoO6Nn3v6-_fqU5KioMp2tdGTdybyvvubQg>
    <xmx:ka8HZlVJyScUlz0-JAvZnp5WLjNnG_riCddXkeuznEwFAzQXZX3D3A>
    <xmx:ka8HZrcokItd24qqIqoH3ERRa4rEUhxmviF1_E3fc7lOvv-eAXuH2Q>
    <xmx:kq8HZpakb2_sAcOFIgD6rj8_z84HZIbURlnTBN2seKKExO7T296drw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Mar 2024 02:22:08 -0400 (EDT)
Date: Sat, 30 Mar 2024 17:23:38 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: Spinlock debug, was Re: [PATCH RFC] m68k: skip kernel premption
 if interrupts were disabled
In-Reply-To: <fc5ba67e-3d6a-2fef-ca85-6d5039da1af7@gmail.com>
Message-ID: <181ac173-38c9-a502-84d5-4cc1d3ed6335@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com> <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com> <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com> <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org> <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
 <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com> <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org> <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com> <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org> <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
 <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org> <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com> <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org> <3dee11c5-d0dd-b61e-c7e7-bd12841618ba@gmail.com> <e926619a-3b6b-8045-8fe1-59bff5e420db@linux-m68k.org>
 <7aee9fd9-1c0e-4874-bb86-e512a7c0caa6@gmail.com> <d19e3768-7edb-93ac-3993-af12259b7705@linux-m68k.org> <63db5f0b-2a7d-a057-2cfb-fefddc15bc3f@gmail.com> <fc5ba67e-3d6a-2fef-ca85-6d5039da1af7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 30 Mar 2024, Michael Schmitz wrote:

> 
> The MFP timer C is not reentered in 66 boots even though I've seen it 
> appear in the stack trace of 8 recursion warnings.
> 

The spinlock recursion warning gives the address of the spinlock. Did you 
figure out which spinlock it is? Also, did you capture all 8 backtraces?
