Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FAD370
	for <linux-m68k@vger.kernel.org>; Sun, 27 Oct 2024 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730034969; cv=none; b=lURgW+pKDK8LRHiDPDGLOoa0jThZW72oPjwMpEC3CKp0pqfkAAFUUVKks81CR/y4g3fNeV4nkGRXqfdkLiqJruLTE1RMlXjjgvlGCvbR16DlPw7RNio1avFgiUbb2t5LthzPaLkV5XIIg3IRURBfXXzf1rPpb9/GNkgCF7Zk9Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730034969; c=relaxed/simple;
	bh=jnl/aoI0qPj182Q1msqd04TTT2TDJQ88tjwuxr4ZK0Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MQtVgyEJv2cy8Khluuj1W+zJL7RPQjyi0J8l9k6Aal/OUP9vQgBMZmzHoRZka31grFOMJ/DUAUDpU95Yw0y2Lq3aT0KSf0n+tpfjLQ/rs0z2OUCCj7Md9jQUJa/MiKUZoNUu3+QxdMmlaT1rYoUtU3vgohmJpVkyemFPfRLZhso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QVH/sDS6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=INEaNmee; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QVH/sDS6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="INEaNmee"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 1D7981380206;
	Sun, 27 Oct 2024 09:16:04 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sun, 27 Oct 2024 09:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730034964;
	 x=1730121364; bh=OtHjXvVvG3ZuaCjRTEDn4ZAedrmX3N809DMUnbKicu0=; b=
	QVH/sDS6SWkQEEl7SUQJchrixKBCFWd2jPkHr3l50yTZXi0O0yuF+00HFvhDLa5e
	t2kXIIPujlD9Y99paJyJnyYp43EEfXMnY1CpZoGkjX3+bmBJp4sZlttaf9BDuhro
	MCnmIP+KRxfTjIWcDLqxfowoUWXKko3WzpYBCif/EwEY6Bj2zu4emKJO9FQcBAIT
	Tqakb8eGs4vxq3ctBIKTSCr+ukP7XI5KUeZmlbErs0vbyL4Ugjq/DkpVk2bIMn/B
	KEyn9kJ3LKY0YE6Zrk4qdFkZUUKSCFbi7LAPnKQOce46MLbJzJ6MmQXOd/Qg6RW2
	6MhYqSlDvMn8U1xdkFf3HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730034964; x=
	1730121364; bh=OtHjXvVvG3ZuaCjRTEDn4ZAedrmX3N809DMUnbKicu0=; b=I
	NEaNmeehqzKwayYPw168t3jIQ0DQ//koxBAI3ZGMZy0X0TWdT71UrE7ONBkA5gGN
	YhRovPJrJBFEBQ/L3cQ9d4yJnP1VnjjaZaP5kDG87XR1rEbES2qvtZa+1WrrmhgU
	13YwY+STdb4ZvKo8o6/y/o0Tb1jkfwIsRAOLtD2ThtIryeh9NrxfQvA+V2akHM9S
	G6PqP1Fn528yYl/9WYs5l5B/ryvfXDJ4PDMXWUIZLiWTNoQYyh/IVUC9dt5gIO2R
	V5HxsUVffJGhWNhbgiV3PdJo9kbBSGoUWxTkH0dh3pmFbiNJiYDVTyVCYSzftzzt
	wS4vDVDNWBkEvucMHhiJw==
X-ME-Sender: <xms:Ez0eZzaM0ku-eSEJJtwP1zaIVBlvL8MKid1USYCSj4iHaYWgabRtvg>
    <xme:Ez0eZyZTXNBAhr2goLuY4vdjddhWhh6YUknzVB02y4PnqR85R9_tLQU6awCBLEUZ4
    e8GTuCpQlS35TX1KMc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejiedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlih
    hnvgdrtghordhukhdprhgtphhtthhopehtghesuggvsghirghnrdhorhhgpdhrtghpthht
    ohepshgrmhesghgvnhhtohhordhorhhgpdhrtghpthhtohepfhhthhgrihhnsehlihhnuh
    igqdhmieekkhdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdr
    ohhrghdprhgtphhtthhopehstghhfigrsgeslhhinhhugidqmheikehkrdhorhhgpdhrtg
    hpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgt
    phhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprh
    gtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Ez0eZ1_jazy6M6ezNEM2etVev4AVQTv3-O6ljVo_NH9sN3B3bA213w>
    <xmx:Ez0eZ5qVruo4It09uB0gu-v82B4UbKg40ADFVdH8RzHbO1kJ1S5_CQ>
    <xmx:Ez0eZ-rS-XgXMby-uNVONEBS_RnEkVduHfCRgX0NY3gkIRmJnGD1Ew>
    <xmx:Ez0eZ_Sle9LAQS-GfRZ5iVUXZJDxb-vWU1f9BGT23xc4z4__AF8cNw>
    <xmx:FD0eZ6dh5g3P3Fcfie4jMY69OgrRQTdcmnUj-uxl3_ZWGnGPdSoKTI_T>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5CCD52220071; Sun, 27 Oct 2024 09:16:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 27 Oct 2024 13:15:40 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Finn Thain" <fthain@linux-m68k.org>, "Thorsten Glaser" <tg@debian.org>
Cc: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 linux-m68k <linux-m68k@vger.kernel.org>,
 debian-68k <debian-68k@lists.debian.org>,
 "James Le Cuirot" <chewi@aura-online.co.uk>, "Sam James" <sam@gentoo.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Andreas Schwab" <schwab@linux-m68k.org>
Message-Id: <b25dbb5f-6336-4f2d-9d1e-4d5da13a1636@app.fastmail.com>
In-Reply-To: <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>
References: 
 <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
 <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
 <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
 <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
 <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>
 <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
 <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Oct 27, 2024, at 06:16, Finn Thain wrote:
> On Sun, 27 Oct 2024, Thorsten Glaser wrote:
>
>> Finn Thain dixit:
>> 
>> >That would mean __alignof__(foo.b) == sizeof(foo.b) but that's not the
>> >case on my Linux/i686 system. 4 != 8:
>> >
>> >struct baa {
>> >        int a;
>> >        long long b;
>> >} foo;
>> 
>> That struct is just 12 bytes for you then?
>> 
>
> Right. i686 and m68k agree on that.

The other ones that have misaligned 'long long' variables are

arc
arm (OABI only)
csky
microblaze
nios2
openrisc
superh
i386

The 32-bit architectures that use a natural 8-byte
alignment are

arm (EABI)
parisc
mips
powerpc
riscv
s390
sparc
xtensa

m68k is the only architecture supported by linux-6.x that
does 2-byte alignment, otherwise the two seem to be equally
common.

      Arnd
