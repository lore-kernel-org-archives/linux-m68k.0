Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5504CA47
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 04:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730091084; cv=none; b=ADmzo1D6C9CCk+aHd2xoZ5qqfdM+K3xJhUeZZXVbBm9iEDKVry5Coww6o1XDIgiQNhYiXrnLXgHANLW+79TEmFSqjSez/mP5Hzb2oFGyIeMkbeX9Sn2dlvtA4jFHx3s2lr7/ZG/KUk/C+00QyLM0BMqbchpZQhOxGTFtxYYY6bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730091084; c=relaxed/simple;
	bh=eqRnTelZ2saN6Z3B3i5gqHvcbaGOMcT7uFyAw5BvQjc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P5ocqVPkVZK8xlxS8/OTJH7aNwBxhga2OvSxnxfPsEzu6G8eSQ/eW+iKQ3vO/pPZrBLfqvWDo3Gr49vVVHUPlmQj/P+vpEUvWGiHEfpJIrXdFOQ7gORX4/Vw17+vFZ0dqdILaey2OARam4yZA6J59z/ibSGBH+p3Cx2X59B99Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OwmGPkRS; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OwmGPkRS"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F0C1225400F2;
	Mon, 28 Oct 2024 00:51:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 28 Oct 2024 00:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730091078; x=1730177478; bh=KNQO25W6eqWCggEEbgzF2M6tSGEH
	L54U23Juv5ViAxQ=; b=OwmGPkRS5pJtpUIPEgBkCYpqVdUYsldp9ykyIEB88iHD
	lZSZkiUbVlJUU9xZVEdgsDIcgAnzWM/wg+AaT3iYIdPEx8ZphpA7ivUo+D5kggbB
	3ig9eQd3DSuteCPieOANkIJsv7VSO7orKgK/4jFMxwdKazLeUi7Z28Ee9S4fIMae
	UPlrSXvIHS+TbTZrvDaidH7M1qCwLIBaRHVPVudZ4GERhTGIC3xvrpGXKKcST8iY
	/TYxYU2lFR1nsftgxxN2kHiK7746+7yCJ+S4ga3QXeFFe02Rs63Xj60zCmV7I+vS
	DU5PAO1pCH4B28lYmB4CS0vWeY/fvl5EBJ5igae0lA==
X-ME-Sender: <xms:RRgfZzqXZvrzUwmgoKHQSa436RnBXrmlmd0rpDwdOMa0h7N-qUJl0Q>
    <xme:RRgfZ9qb-sYMD6q1O6usraA6sORGqWfBF0G8Sw9xwOMdvfLouvQ4jKL6g5KsREwEb
    8VJ4ItKiKSL1FvoPQM>
X-ME-Received: <xmr:RRgfZwOQEpGxl3r_y7ESie-jVW9vo73Y_gmEcaY3Z2mVNsm-ioDLuZwNSFdlt8zrn2GCJQQXtVezI9a2prLxlYb4ge631Z4M3eM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejjedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelfeeklefggfetkedukeevfffgvdeuheetffek
    ledtfeejteelieejteehgeelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtghesuggvsg
    hirghnrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthho
    pehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtth
    hopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    peguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoh
    eptghhvgifihesrghurhgrqdhonhhlihhnvgdrtghordhukhdprhgtphhtthhopehsrghm
    sehgvghnthhoohdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkh
    drohhrghdprhgtphhtthhopehstghhfigrsgeslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:RRgfZ25v8RNbON4yTQG8S1yiV5ejNnMH05jLBNoOa5IIH8pvDxJy7A>
    <xmx:RRgfZy4KlcG2UYxP7hh8fRWYUqECyeQ8QiWk81mufuGHKdSGo2hZQw>
    <xmx:RRgfZ-hF6RqCNfesReaVsb6-S_agUeS7VjyX4iJ71tjFRXUDfPFa6g>
    <xmx:RRgfZ07Fnh57ObZukAAJqOEc_Q6oFVliIHhWsH6jw4sI3eosBXmBxg>
    <xmx:RhgfZ0t_4ZOyFo6f_bnjt0G81HfnsbDE3GN8dZ5gLDuVr-9CpXIlj7XT>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 00:51:14 -0400 (EDT)
Date: Mon, 28 Oct 2024 15:51:10 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Thorsten Glaser <tg@debian.org>
cc: Arnd Bergmann <arnd@arndb.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <0c34ba23-5256-0140-59b1-6a5283f6b763@debian.org>
Message-ID: <f2377db5-2b39-0e58-4d22-1caee7e8e6a3@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de> <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de> <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de> <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org> <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org> <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org> <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
 <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org> <b25dbb5f-6336-4f2d-9d1e-4d5da13a1636@app.fastmail.com> <0c34ba23-5256-0140-59b1-6a5283f6b763@debian.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-179033891-1730091070=:29"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-179033891-1730091070=:29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Mon, 28 Oct 2024, Thorsten Glaser wrote:

> ... You don=E2=80=99t understand the problem: applications are being writ=
ten=20
> that require natural alignment for at least 32-bit and smaller=20
> quantities, some possibly for all quantities even. We need these=20
> applications to work, and we cannot redesign them (it=E2=80=99s common fo=
r them=20
> to store flags in the lowest pointer bits and do other awful things).
>=20
> Could you please, if you cannot believe it yourself, accept the word of=
=20
> those actually doing the porting that it is direly needed in the current=
=20
> Linux ecosystem. Thank you.
>=20

Do I misunderstand or disbelieve? Or have you forgotten what I wrote two=20
days ago?

You talk about "applications ... being written". Well, two days ago I=20
mentioned several groups of applications: (1) core packages that accept=20
alignment patches, (2) packages whose developers shouldn't worry about=20
small systems anyway, and (3) packags I am concerned about i.e. the ones=20
actually required by Debian/m68k users (which will presumably lead to=20
disto bug reports, if they didn't already -- hence my question about bug=20
reports which remains unanswered).

> For Debian, we have superh and i386, out of these.

Is your concern merely for Debian's package archive stats?

What interests me is portability and code reuse in general. That is the=20
basis on which I would send alignment patches to upstream projects.
---1463811774-179033891-1730091070=:29--
