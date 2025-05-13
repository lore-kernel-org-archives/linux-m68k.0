Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED93723C4EA
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 May 2025 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130032; cv=none; b=WWvj484eaTy4Dlu29Z32zmOxedtcX72t5s1YYI7TL/TOxiLXoYm7Q+nYI0okQMpod2xnTfzTtuCkEZqrCoND9yjdfOsQ9dVBARTKTMSTJkokthqG2sf3+QcxLZIxs1fRmhBfx+1rBo8m784Uz1uGMNRgjFentLEZ9VuFpx9YvaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130032; c=relaxed/simple;
	bh=0hdsBjSp459tutLJ6ljFU38BGGSJAYEDerkzM9gXgMY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mMBcgO49vnCwal0qPxeU216eXNwlE3imw2GOOapDl0fBrRLwStW3NCouzvLDT90KKcDI+JV/OP05HbbM08PChCz8HR0LIx2WKPkZYN1mxA6KMxKfFQ+BEXZ+tWXJiEbzzCL/jbbtYsJt+jej+SpvJsgcVFMzi8bl2rEGnNUCiZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=WYyUQxoF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AEELkgMT; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="WYyUQxoF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AEELkgMT"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id CA3382001E7;
	Tue, 13 May 2025 05:53:48 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Tue, 13 May 2025 05:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747130028;
	 x=1747137228; bh=2stkMgjnTvYjnZGlIOEgk4TUXFdwLQsjjGMrGxJEng4=; b=
	WYyUQxoFJEJG2TxNUqkYZaozv7ki1sEPfp+e0DgttRWUAEBJ5m/Nulv6wDMgiZFu
	ZXGhV2HX6hLyepP/MCBiwJxQq+gSBm3qkUj2ZcS14XWq7TXU2eGwM1FkhTuYbaTN
	QTdlJYijuyH9psa3/vztyI49EeCMF/rQ1Vw+cT3e4UwKSGPlU5To9+3e6ijlu62G
	qVL2dhk/in2PJGdWeQc/2t1KrlN1b5JtzNgDxxVvhZJZsL8d1722pAFne5WV4YSq
	GUBWE8p6b4Nvck7X7vYCxsmGC9tBy+067SVnaVHRtw4UPu8kv5oMdVUzjlpUAudX
	s9TgoIZ7pe3V7YMmgEyx+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747130028; x=
	1747137228; bh=2stkMgjnTvYjnZGlIOEgk4TUXFdwLQsjjGMrGxJEng4=; b=A
	EELkgMThLE/eZr5z/8Zu380mQpF1U2n4l1J7+89SkHBMoHjU8kAJPnbWZsjGPW0l
	mc+r+7qbaJCA7dj6lwJqoqv0Q2dgX1C9gndhKEfcoutfQmu9g7GVWeu67s3uv0xN
	w1NeNeQlUh6xFP6n/v1SXcnk97uRYsQihn5Js+a57a9bWKvrP/iLDEfxIDNslPFU
	OrZ5b6zqojwm9zriy52n4qA2N2ZBMADPzNhYv8XVxEyN39/YNDTHkHvyqua4Q7lT
	zTTDN8I+UkHJ3SmPI7gU+CyX/0+12P55/OkyZF2Z7v4w0fJkRzn/Jm3pd5wB0Vzh
	kKYxcROkGyAkL+yRJ9BOg==
X-ME-Sender: <xms:pxYjaDuCrtoLCe2TM5AQoECeRzn60vp1TpYjbFh19t2G92KHMjZLCA>
    <xme:pxYjaEeRqGXY6YdP7QViyGSAtpUSLuq_q5nrXJXRuDHodq_37lo0B4qqaEs8y8pdw
    9gaLH-6Gi3iakv3BPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdefkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    hedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhr
    tghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtth
    hopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhi
    shhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegurghvvg
    hmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhitgesughighhikhhougdr
    nhgvthdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtth
    hopegrnhgurhgvrghssehgrghishhlvghrrdgtohhm
X-ME-Proxy: <xmx:qBYjaGz9HzIZcWZ8Rmc6wdWuoEjpS7OgEvVMigKbnaPo4v6JM-M91Q>
    <xmx:qBYjaCNbwaFl5jHdhYW4jdiojQcWJ3NoeqKOsFh5AH0bUcQVyFX9_w>
    <xmx:qBYjaD8EvTGV3vet04PP8Y5sUPlHvpdr-JS265c8P7rLb9pmhu6TGg>
    <xmx:qBYjaCUFRgwjTMe8PR3Dbq-x9nNpk-7hHOiSRy8VZsR-5JLBp-6xuw>
    <xmx:rBYjaOdX2gNw0hxrV2biCIkCy9on4QdHR6GYDc-Mt04O2dJBlCQH_VqO>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D7A291C20068; Tue, 13 May 2025 05:53:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tdb8541d917685bac
Date: Tue, 13 May 2025 11:53:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrey Albershteyn" <aalbersh@redhat.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>, "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Chris Zankel" <chris@zankel.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>,
 "Ondrej Mosnacek" <omosnace@redhat.com>,
 "Tyler Hicks" <code@tyhicks.com>, "Miklos Szeredi" <miklos@szeredi.hu>,
 "Amir Goldstein" <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-api@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
 "Andrey Albershteyn" <aalbersh@kernel.org>
Message-Id: <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
In-Reply-To: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr syscalls
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:

>
> 	long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> 		struct fsxattr *fsx, size_t size, unsigned int at_flags);
> 	long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> 		struct fsxattr *fsx, size_t size, unsigned int at_flags);

I don't think we can have both the "struct fsxattr" from the uapi
headers, and a variable size as an additional argument. I would
still prefer not having the extensible structure at all and just
use fsxattr, but if you want to make it extensible in this way,
it should use a different structure (name). Otherwise adding
fields after fsx_pad[] would break the ioctl interface.

I also find the bit confusing where the argument contains both
"ignored but assumed zero" flags, and "required to be zero"
flags depending on whether it's in the fsx_pad[] field or
after it. This would be fine if it was better documented.


> 		fsx.fsx_xflags |= FS_XFLAG_NODUMP;
> 		error = syscall(468, dfd, "./foo", &fsx, 0);

The example still uses the calling conventions from a previous
version.

       Arnd
