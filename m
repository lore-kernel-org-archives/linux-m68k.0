Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E80A18B484
	for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2024 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729850139; cv=none; b=Vqa6FV0E5VuI3fiQ0VPzfnTwT3hflA/sFMDrUlACDKEv0dAC2F2pwQF5r4hnT6vr27l6GuihrpXkB1RGDKM7OableOYSQqsVttM555s9T4Z5UeSHP+2tuJ7GUj7zKPQiNAj7y43tcpLHFvtoQWtaFppFmDOfy0yIBzcphDHuTd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729850139; c=relaxed/simple;
	bh=PzNOp0rY7HcJNCv5KkYNcVbIO+odX0ZEPG+p/+WByIk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CNcw4kBYUE1LWAGK2ra5ZXLfG8SrC1CAhBmave3VDWPqvlMeo2ewqV4leRNeNtfqEXTWGE6tZPrOQSXxqXZsivxFPyPlnLAewqnxu2ha8wLU/+zTB/dBiQ8Is0Y5CPrzQLZHV+1wnx2MT1rbQU6BbMRR/9d8NodfywqlWZCTgNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=JTXONwFR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cZoSe6uh; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="JTXONwFR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cZoSe6uh"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3F5202540118;
	Fri, 25 Oct 2024 05:55:34 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 25 Oct 2024 05:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729850134;
	 x=1729936534; bh=lV9POkkWTCPUXroJshNjOpg0CvU3CcDRofoQOm0eRz4=; b=
	JTXONwFRsTOV+/zDintMJwSwzQp+Pp4opynvCmSfkQd1zSR+zbz1N/Nm9wVXtiXl
	L+PDu0nPjnAGpkBkVGAxO8CvdAebKQvXveeOtTDBdmUIaSwhrO4bZYUzH5cLLdaT
	TSKcTUmqiA5aYmF6gvzy9g982ZatGEUqEFZWjvoepezLcUke/7wirndgktRD6xib
	MfxzAKUuvT0f4WkwOsSDrKxZ546Q90ZnGFoiVhgZxlIQv0xkqnV11jlCj4MLcP3+
	Zsg0Xft31/YhWCqSqev5fG5+Sd/XECr55eSycSzwIoYiZgwNHcsfsF3mLkoUif9Q
	A4dTrLd9JFR3FB+PabqSNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729850134; x=
	1729936534; bh=lV9POkkWTCPUXroJshNjOpg0CvU3CcDRofoQOm0eRz4=; b=c
	ZoSe6uhullObFhYLlPcHDkQWUMKNuDSsJZRMGvt3POWDsSJ5eVeaweIB1Ea2jfs+
	oCduOzxmsF3d+tzRWO11w53r551L+IMj/o3hgfzxC52252iyF6J4i1hD8xl14/gk
	+yyhIs25eG8yiArRcTvxK6w82VLSQivhcdBTYeOOxYCZAvz7AN7NtrwjuWEpippj
	xOIZKhAZPi9sVdnGWV4xqwuP1BgskJ+S4cjlCR5+RIONLUynkm4ivp5v3jVr0WW7
	yR4F9CFc96IWqSd8r4HXW4hXMovywV+Fk6HCfLiyomsIsikR93+FqDVer9TevoJM
	CWSkQleXX2eOlfHT6HBKA==
X-ME-Sender: <xms:FWsbZxGTKi-dz4QxL3KkccdYWXRuAfJgxEe_H7cOC_wMLIvSKn-piw>
    <xme:FWsbZ2UA5O4Wj6q5zt6YAUMRs1v7lkHM1pCi3NuGT17xQNFtCIVzu5G4-ZOhyVGyY
    2-iTv_WMly_Qz7JvHM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejvddgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlih
    hnvgdrtghordhukhdprhgtphhtthhopehsrghmsehgvghnthhoohdrohhrghdprhgtphht
    thhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehstghhfi
    grsgeslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehk
    sehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehtghesmhhirhgsshgurd
    guvgdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhn
    rdguvgdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:FWsbZzJB63ntB1hiFDlXTckud1RNljVN-AmD6VKm1hZeayqLp7ztIA>
    <xmx:FWsbZ3EauQDCfjx7Q7PhB6aCuvC1nT8S1xFxGg_5JvbMlY2VKUvrEQ>
    <xmx:FWsbZ3WMATchhL2pTFEYm-xR8nIeMb8iKQUYdTDtx4GxrbDod9VHQA>
    <xmx:FWsbZyOInELCDZIC4i8izkEqZ2Yl_xlJ_a8iRMV_frfXM1u-NGP5-g>
    <xmx:FmsbZ-FtEnCJnVbX3_-rhsweVWlvL25RkeVqTLZ5aWqrsCobfXGyqnci>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4F1F82220071; Fri, 25 Oct 2024 05:55:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 09:55:12 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 linux-m68k <linux-m68k@vger.kernel.org>
Cc: debian-68k <debian-68k@lists.debian.org>,
 "James Le Cuirot" <chewi@aura-online.co.uk>, "Sam James" <sam@gentoo.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Andreas Schwab" <schwab@linux-m68k.org>, "Thorsten Glaser" <tg@mirbsd.de>
Message-Id: <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
In-Reply-To: 
 <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
References: 
 <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 25, 2024, at 06:48, John Paul Adrian Glaubitz wrote:
> Hello,
>
> the m68k port has reached the point where switching the default alignment
> from 16-bit to 32-bit is inevitable as the number of packages affected by
> alignment issues have become too large. It even includes Python 3.13 these
> days.
>
> Since I don't think the situation is getting better by postponing action here
> in the future, I suggest that we have a virtual meetup soonish to discuss a
> strategy for switching the port over.
>
> Maybe a page could be created either on the Debian or Gentoo Wiki to 
> draft a design
> for switching over. Geert also mentioned that we should use this 
> transition to clean
> up the kernel ABI by removing old syscalls and switch the kernel to 
> asm-generic which
> is why I have included Arnd Bergmann in the CC list.
>
> Please join #gentoo-m68k on Libera if you want to discuss this issue.

Hi Adrian,

I think the idea of using the generic syscall ABI (in particular
the time64-only variant) makes sense if there is going to be a
new ABI, and I can help figure out what needs to be done in the
kernel for that.

The question is really if it's already too late to do it now,
given the scope of the project and the limited developer
resources. Maintaining two ABIs in the kernel and toolchain
longterm is likely going to make things harder, and phasing
out the existing ABI completely will likely take more than
a decade. I expect that this is the same timeframe (mid-2030s)
by which we will be debating the removal of any 32-bit
targets from the kernel, in particular if we also want to
add 128-bit targets.

Examples of other ABI changes we had in the kernel are:

- ARM EABI was added before the architecture became
  dominant, and ended up as a success. The structure
  alignment differences between OABI and EABI were part of
  it, but it was mostly pushed because of Thumb
  instruction support, and with a huge investment of
  development resources.

- PowerPC ELFv2 was a similar success, this one was driven
  by a strong desire to allow little-endian distros, and
  again was done with a very significant investment.
  
- MIPS/n32 and x86/x32 never took off despite the effort
  put into them and the advantages for both the ABI and
  performance compared to running traditional 32-bit
  binaries on 64-bit kernels. As I understand, gentoo
  still supports both, so clearly someone likes these, but
  from a kernel perspective they still cause us headache
  and were clearly a mistake. Attempts to do the same
  on powerpc/arm64/riscv64 were rejected for these reasons.

- The big-endian ABIs for arm and arm64 were mostly a
  complete failure, having been pushed for by network
  SoC makers (Intel IXP mainly) before that industry moved
  to little-endian. Adding these made a lot of sense at
  the time when big-endian powerpc and mips owned that
  market but has since turned into a liability. Nowadays
  it's mainly used for regression-testing big-endian mode
  on widely available hardware (arm64 VM guests).

Based on those experiences, I think there is a significant
chance that adding a new ABI is going to make things harder
to maintain for both distro and kernel maintainers rather
than easier, regardless of how much better the new ABI is.

I also expect that a lot of users (of m68k kernels) are
never going to get the benefits as they are already stuck on
older userspace because of added bloat in new software
releases. I assume you have better understanding than me
of what m68k hardware is commonly used these days, and
how constrained that is in practice.

       Arnd
