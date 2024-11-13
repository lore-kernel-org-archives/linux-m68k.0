Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A2D18C021
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731540843; cv=none; b=r9wrLF/JNIR6+C/31U/wDNBcbmvP80HUIBvDX+Z/KaeJWnzFbpQ53icRORRIC0/IXlTMgM8NNPn63hEBhyAPuk7DzkdArlLTUXfgdhsGZMJQ0prqAX2wKnHDp3SitmFFfSJKZJHY5x7r2HbA6ixCBRrXWKvGeNcYbcxfbGZUtZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731540843; c=relaxed/simple;
	bh=sSUB4TRo0wBEawgtvCEgB4OYwes3gDhuvqcQFzEW4/o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rnEA2iglMN9ob6Ix5WLYPwqu14duPKUSgZDhVOtPKwuTH7+h3NQRB6ZITva7vNp3Y7uhMTe/ZmZ7TvbyuIEvk8AEqGoHg7LF/TaU+zTZLQbir2dy7uAjYZVeYLHNSY+A2mO91sEog6L2qzwe3KGaGi3i+hSsmV+07IfBazAEu/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CR6ESlxZ; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CR6ESlxZ"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EBA701140195;
	Wed, 13 Nov 2024 18:33:59 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 13 Nov 2024 18:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1731540839; x=1731627239; bh=0t4kB+lDyc90hbofoj/7nly9/44P/llp2hC
	6nN3QEgY=; b=CR6ESlxZVSK4oBb6LdIThC4N4vUljbTkyyZHRR2DzBunGtFNWB5
	kc2Z+euy3A9CfH1tvYhAEo8WkeOhwW8GGOXQOy3dvvF/jomPM5UTZ4VoenXShW+t
	sNfvZLF1p3grVDk4GAmza0wdcZRkkgV0U/voMNC1cSl1KbWFW2nWbeZ/rvdY+JAZ
	T0t+84+Eg+ls7fQxoY2EmkIJ7Mve3bkryhIwh+ILAM6v/e+DpHeX8qd2D3L/rf+Y
	gi3L/IG2AySGFjN8drYc5mhEjAMRIJVwvDl33/y9d95HDSUxMQ4TOHGud+C2SDcW
	RFq3KB1WY7jWj5N2olbl5WZGXOHemcVocQg==
X-ME-Sender: <xms:Zzc1Z2sfkeIK_PpMKJMeThJ03tRyW9a7nuSu5jcx7YBtqvctMZtJCg>
    <xme:Zzc1Z7eenuJ90ABvsAi4wlvtRT26I9kW-TzfMSgubZCWdHXD599q5K5Fe-oGv3IcM
    vCgqZtuLbzcdf0PGqM>
X-ME-Received: <xmr:Zzc1ZxxWNvo9MFcorvHue2xnrMl-iYphQrs66YXbxasT0AMTeYiCw30dzv4yhBFgqVYtxNT-ITIoHk1SX1a_uqfoTdNsmGfyfH8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddugdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesmhdtreertddtjeenucfh
    rhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdroh
    hrgheqnecuggftrfgrthhtvghrnhepffdvgeejgfevvdefgffhffdvgeefhfegleeigffh
    veekkeevieettdefudetfeeinecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinhes
    lhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepthhgseguvggsihgrnhdrohhrghdprhgtphhtthhopehg
    lhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhope
    hstghhmhhithiimhhitgesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhnugesrghr
    nhgusgdruggvpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgr
    nhdrohhrghdprhgtphhtthhopegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgtohdruh
    hkpdhrtghpthhtohepshgrmhesghgvnhhtohhordhorhhgpdhrtghpthhtohepghgvvghr
    theslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Zzc1ZxM-M0mUsYPtTyjhq15rjnYSz4wguJj90FYAa4u-dYHlIBIrXg>
    <xmx:Zzc1Z29EXiStgQexR_wetrh5MlDBdMnvL2YbUFvPXyaaRbedFizeeQ>
    <xmx:Zzc1Z5V52QYbyZkgEH-3T4vsammlEZdcMQaP6plNINkmsyLh424RUQ>
    <xmx:Zzc1Z_czzguX-Oq9YdOrVoV6Tum--DBy8xnv2-04ud4LafEriRtJkg>
    <xmx:Zzc1Z5YJMFp8riOQeDdLdGMJz8Hp8YBgibdx73wZG78ANeFCmoMDmbFd>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Nov 2024 18:33:57 -0500 (EST)
Date: Thu, 14 Nov 2024 10:34:20 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Thorsten Glaser <tg@debian.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <a600d9a7-f068-2d5e-8e81-116127e61dc4@mirbsd.de>
Message-ID: <8b6f9e17-2897-7187-5f56-e751314b7755@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>  <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>  <8ca13b4b1a3c2d8d2e6d99c29b901659bb4108e1.camel@physik.fu-berlin.de>
  <f87a85b2-809a-44dc-9a61-24698d7888eb@gmail.com> <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de> <a600d9a7-f068-2d5e-8e81-116127e61dc4@mirbsd.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-973963082-1731540860=:29"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-973963082-1731540860=:29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Wed, 13 Nov 2024, Thorsten Glaser wrote:

>=20
> But, as has been pointed out, if we make the current alignment explicit=
=20
> everywhere, the kernel ABI does not have to change=C2=B9. And new syscall=
s,=20
> ioctls, structs, etc. can just be made with natural alignment in mind (I=
=20
> bet most are already anyway) and with padding assumptions made expli=E2=
=80=90=20
> cit (which again probably is done already anyway).
>=20

Yes, upstream developers can be expected accept patches that make explicit=
=20
the alignment of struct members. That's what I've been saying for years.=20

Luckily, that doesn't require a new ABI. It does require volunteers who=20
are willing to write and submit patches for those packages that matter to=
=20
users.

And that is the real problem: the manpower shortage. The only solution I=20
proposed for that problem was better collaboration and better allocation=20
of resources. But his straight-forward request for assistance was an=20
excellent idea of Adrian's:
https://lists.debian.org/debian-68k/2024/11/msg00007.html
---1463811774-973963082-1731540860=:29--
