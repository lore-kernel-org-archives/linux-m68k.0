Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450A128E7
	for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Aug 2024 03:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723174476; cv=none; b=bMKhtgvphQe1qy746GJf7PzqnJVZWRfJgxRw7BEt/4E2Y/v65MGLrsp70Bi1pqXdmsHTbMQMloWpGVl9MXzcOolK5S5ql0Tx7YAknxjj89VTgrKQxJ5lk9JkM8AJ+MwPmdU5fvaVXVnLzUbfMOD/K0ldsYhs0h8Cxh6X1XRCdCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723174476; c=relaxed/simple;
	bh=IXZqk2/u61N/iFq5KBkjKZXHYb/IwDmnzq3np3tL5nE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nhluZoyi1HZZbyLLaSOIhA/9P/iJRcvvjblBoY6JnY7AIO9uXNgxFlby4Nj4X0LlVCE/eg1eC6D687Nh/mUsdVgFjLRTZ8NiKM55GXFp79h4U3N8Y96OPPpHrYFdAO1vcoYMbOGaqOhkP+cYhIGdyI08ItYRKLFiNUEMXENNpv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mZ2OLmGG; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mZ2OLmGG"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 72E95138FC44;
	Thu,  8 Aug 2024 23:34:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Thu, 08 Aug 2024 23:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723174473; x=1723260873; bh=qzCTm+bCPRCW5dTjKi9CdBNRX8cj
	6U9KCgXHtBQp4kA=; b=mZ2OLmGGlQkzwDpNu+razmxmr5tSUOnRLfcceTM/kk6P
	6W2uvB26ibWOQ4avPivxilBMg4j3Rm7d4JWMbPZe+pAGhb8G/PsLLd3Q/IE0BwFg
	9uxeG+GWULgMdFdnhPHh8Vuc3C3NhP1JD5rNVsVI9XAmWbNkaZM893rV3/Tv+7VS
	qBPCmBCoAJJYydsT0/VWC6oQ7PZH1AqfMTDlO7jhiO7lcomgB8zCfwbWti1v8q3X
	gkV7YfCB1k2J7W9r+GK9RT+HG1IjZTBOKhK9J5VqWmnGV+y6SQZ7IyGspMe3lXSm
	h2UfadZBFnX2OyluMXt+hPx0tHP3M+Dg45hyDV02hg==
X-ME-Sender: <xms:SY61ZtGG70SGea04bDG3dU3CgZ20TvltLzTNBwEOOzjvIOy2n0d-0g>
    <xme:SY61ZiVJvltACd7bf1R95dn0ZiASwhgI3sQn4gmDnjUwsyPe5TaWOcit1LccZkngL
    pRKoRUGZsYzr9xX8FA>
X-ME-Received: <xmr:SY61ZvK6OIGOycLP8atP1iK_9wVXEdAT75rqnLkz38qgKSiyoJElBNsbPiW9W_y7MnfcJJ_ltAnMKYQGNmQaaZ16b7wCqkIdsfE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleefgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesmhdtreertddtjeenucfh
    rhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdroh
    hrgheqnecuggftrfgrthhtvghrnhepleefkeelgffgteekudekveffgfdvueehteffkeel
    tdefjeetleeijeetheegleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghr
    tghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgthhhmihhtii
    hmihgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieek
    khdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorh
    hg
X-ME-Proxy: <xmx:SY61ZjFxGHVwk8Lo2rseFUwIeQl0WPYouI-eMR6Lko7LsH9pbb4BMg>
    <xmx:SY61ZjX8ieQYUDHzCMxiw4VdQSp07lHiahdd_a142gMF8priC9KfLg>
    <xmx:SY61ZuOcGj9M8jHj935a1W63u3BEViDR-uQNGX8AWb8LaPl0z-Vb7Q>
    <xmx:SY61Zi1QKrUMtqr8Olb_cNwEh2ge6YdqfBQRqUTjageisTNPt75kkg>
    <xmx:SY61ZpzXsoDbVu0zsmwMb9_8gGKayKTY_peND8Oz_EBcAerRlCI8yicA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Aug 2024 23:34:30 -0400 (EDT)
Date: Fri, 9 Aug 2024 13:34:35 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@vger.kernel.org, 
    geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
In-Reply-To: <17d1fcdd-3b25-4401-a98d-3c676abb903d@gmail.com>
Message-ID: <b2c65af6-1aa4-4e4f-fdf5-600e1d48ef72@linux-m68k.org>
References: <20240429030945.22451-1-schmitzmic@gmail.com> <20240429030945.22451-2-schmitzmic@gmail.com> <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org> <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com> <de7c9ac4-cb6f-e2a4-59e4-26fd7e260d4e@linux-m68k.org>
 <ae5facc5-4b10-481b-9f76-f9b007309d8f@linux-m68k.org> <727be0d7-a3ed-d3eb-2a13-c6ac316cd25d@linux-m68k.org> <00ccfc03-9032-435b-8082-905e225c7a0f@linux-m68k.org> <17d1fcdd-3b25-4401-a98d-3c676abb903d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-591156588-1723174475=:18047"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-591156588-1723174475=:18047
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Fri, 9 Aug 2024, Michael Schmitz wrote:

> >
> > I tried out the "stress-ng --sysbadaddr -1" test, and that didn't go=20
> > so well for me:
> >
> > # stress-ng --sysbadaddr -1
> > stress-ng: info:=C2=A0 [37] defaulting to a 86400 second (1 day, 0.00 s=
ecs) run
> > per stressor
> > stress-ng: info:=C2=A0 [37] dispatching hogs: 1 sysbadaddr
> > *** ILLEGAL INSTRUCTION ***=C2=A0=C2=A0 FORMAT=3D4
> > Current process id is 39
> > BAD KERNEL TRAP: 00000000
> > Modules linked in:
> > PC: [<00000000>] 0x0
> > SR: 2004=C2=A0 SP: 6504e563=C2=A0 a2: 008ee380
> > d0: 000000f7=C2=A0=C2=A0=C2=A0 d1: 00000000=C2=A0=C2=A0=C2=A0 d2: 00000=
000=C2=A0=C2=A0=C2=A0 d3: 00000000
> > d4: 00a87b80=C2=A0=C2=A0=C2=A0 d5: bfbf3814=C2=A0=C2=A0=C2=A0 a0: 00000=
000=C2=A0=C2=A0=C2=A0 a1: bfbf3814
> > Process stress-ng-sysba (pid: 39, task=3D4dbb2ec5)
> > Frame format=3D4 eff addr=3D480a2004 pc=3D0002b154
> > Stack from 00adff20:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00ade000 00000000 00000000 0=
00000f7 00000000 00000004 00a87b80
> > 00000000
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000 00000000 00000000 0=
08ee380 0002ab5c 00000100 00000122
> > fffffff6
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bfbf376c 0002b29e 000000f7 b=
fbf3814 00000000 00000000 00ade000
> > 0002b222
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00ae0800 80118988 00000000 0=
0000005 bfbf37a0 00000005 bfbf3814
> > 00adffcc
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00023d2c 00adffcc 00000000 0=
0000000 00000000 00000000 000000f7
> > 00000000
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 80118b46 00021850 00024b00 0=
00000f7 bfbf3814 00000000 00000000
> > bfbf3814
> > Call Trace: [<0002ab5c>] child_wait_callback+0x0/0x24
> > =C2=A0[<0002b29e>] sys_wait4+0x7c/0x8e
> > =C2=A0[<0002b222>] sys_wait4+0x0/0x8e
> > =C2=A0[<00023d2c>] buserr_c+0xb0/0x152
> > =C2=A0[<00021850>] buserr+0x28/0x30
> > =C2=A0[<00024b00>] system_call+0x54/0xa8
> >
> > But that is the same with and without these patches.
>=20
> I wonder if recent signal handling changes (e.g. commit
> 0d4276cfbe6fd4c4a21acdee803b05a3a6192082) have rare unexpected side effec=
ts on
> Coldfire here ... OTOH, signal handling as such works just fine, right?
>=20

That would be commit b845b574f86d ("m68k: Move signal frame following=20
exception on 68020/030") on mainline. If it caused a regression, that=20
would have first appeared in v6.4. I can't imagine how that commit could=20
affect Coldfire but that's no reason not to test an older kernel.
FWIW, my hunch is that the other stressors which call wait4() will=20
probably crash too (regardless of kernel version).
---1463811774-591156588-1723174475=:18047--
