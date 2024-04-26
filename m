Received: from flow3-smtp.messagingengine.com (flow3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A10416D9D9
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714153131; cv=none; b=AJK9haEYpt2H4FhFsgdOTBoCNsz07JwC+2SmVilTkCGFMPBrI6yqeCA52yPk72qvUlYIu9+veR+Z9y0k7t795aQeAfDqM6agIUomxUoQ8B9PegRCLRY61H6VhYxEPBQoyQV5h6MKnRBLxq69tlkEJV2TYgHllYmR5GKCd/52TYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714153131; c=relaxed/simple;
	bh=wl2WeNXK9401gewnNEkP62crFh93PXjbpWk6KFoepOg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=KNjrJDKWMYzyQMhF+DKxZg+HhsOQl70nL+M7nzxmdaPT7dVywLzWZDMyMDERb14jtWRCSlkvCYz7IWKWFJaw8/oGKGToBEObGkkUGChWoqRLJm1KLOYRI6YE8wg0GcSsezTuBpiIAtd8iNHyCVP09bLdYXKZZGAhM2m/Mdm/4ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fghU94ch; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YNcbk7Lb; arc=none smtp.client-ip=103.168.172.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fghU94ch";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YNcbk7Lb"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id E8F9B200569;
	Fri, 26 Apr 2024 13:38:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 26 Apr 2024 13:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714153127;
	 x=1714160327; bh=LvCKd10h8SxIpHH2VnKSem369EuCERsZx0vTF5ejpQk=; b=
	fghU94ch+kw2ZuohIgvUpuC7VVClQDJBilAiOlj5BDY+fjudFMBcDTAB7N01hvbn
	OQCPSfafmorkVmaA4fk0KMKEG4ggQZjF7sjgAkwhKPd01avbe3YP+yk0UcbLwU0h
	uAdX3Q6c7NuFHu0VlwQ+xwplD7oAhly0i5KgP3sO6E3b+Rz378b4mU3n4MWnDA9K
	y5e1rxlCgt2/upGSkwGFka+U4sLGacyQEpw5ZHF75lURalofPBr4V88yhxm43NZx
	inVj1S46mwU6OD3vpDFNumfH5SANQf1GD7soNFpGzE47AdQjVh99+mPKAMi6wwwq
	lo0RhaNfOyLtmZz/wwGksQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714153127; x=
	1714160327; bh=LvCKd10h8SxIpHH2VnKSem369EuCERsZx0vTF5ejpQk=; b=Y
	Ncbk7Lb+0iYLjTbQi54oAnvQ4BDt3H2OsTOrUiMRXTg96mXxQF6PJ5LqwrmZbK8F
	PHpA+bDLHotHe/9NBkqqNC/YAHtwNNR2OLpjYEFV0ghSAL25FjGCuUn8UG/8QB2B
	f2ZkRa0uP874nTjnn2UKAkf4OgxDUDbJzpNbQ3P7ebtgR6Kd6mJe1qnKAbuIuYYe
	WScAKDO+KPNaNSWVUMOcTkfHAroyws7ZMOe2TF13PdqOD62KMXJNsb7LtVdLnEPW
	+jZGlNDqV6bTs8j03XB8V/941Ob/a3J9oYeqI+yraB57y8L1aWKIXEtAO2ba70OM
	eBOJ/u+BcBBTHzSwQ/DEw==
X-ME-Sender: <xms:ouYrZpXbyLu-XhJvHmE6BfV7VJ-xl-wU3AO1z5GOo20iMmm600Bgnw>
    <xme:ouYrZpl4H1WMmm1Jv6OI7U_GcrJdX5zSyODt_6euEkIBWEUQWwSp8gnXQinhEv4Y8
    2mY48O-WyAI_r-MfW0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ouYrZlYnLFe11goqkvkAjutRp9_RkXDNdbSFSxKP6Jkf9CragMOe-A>
    <xmx:ouYrZsVvT-VRpcBB7xR6-PTgUaVp8pqzakHyLqnCsC0WB5YNlY7Ufw>
    <xmx:ouYrZjlZHR2bJfaUhdmNc4NWRCEbUpvZxshXa0WtLSjua_ChwXnHZA>
    <xmx:ouYrZpfPGvPoycWMcfI_iPhbC_MsLjlNAAUzeUOpR7EZjb4JPR3wGg>
    <xmx:p-YrZk150j43KHJ6B-PEMWZVIb5NmNzRATUMf3whfheqi68R1qrNPDSS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 324F9B60099; Fri, 26 Apr 2024 13:38:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <63ae53af-023d-444c-9571-8aef9e87ebc0@app.fastmail.com>
In-Reply-To: <20240426162042.191916-1-cgoettsche@seltendoof.de>
References: <20240426162042.191916-1-cgoettsche@seltendoof.de>
Date: Fri, 26 Apr 2024 19:38:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: cgzones@googlemail.com
Cc: x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, audit@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-api@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
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
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Chris Zankel" <chris@zankel.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>,
 "Paul Moore" <paul@paul-moore.com>, "Eric Paris" <eparis@redhat.com>,
 "Jens Axboe" <axboe@kernel.dk>,
 "Pavel Begunkov" <asml.silence@gmail.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Sohil Mehta" <sohil.mehta@intel.com>,
 "Palmer Dabbelt" <palmer@sifive.com>,
 "Miklos Szeredi" <mszeredi@redhat.com>, "Nhat Pham" <nphamcs@gmail.com>,
 "Casey Schaufler" <casey@schaufler-ca.com>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Rick Edgecombe" <rick.p.edgecombe@intel.com>,
 "Mark Rutland" <mark.rutland@arm.com>, io-uring@vger.kernel.org
Subject: Re: [PATCH v3 2/2] fs/xattr: add *at family syscalls
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024, at 18:20, Christian G=C3=B6ttsche wrote:
> From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> Add the four syscalls setxattrat(), getxattrat(), listxattrat() and
> removexattrat().  Those can be used to operate on extended attributes,
> especially security related ones, either relative to a pinned directory
> or on a file descriptor without read access, avoiding a
> /proc/<pid>/fd/<fd> detour, requiring a mounted procfs.
>
> One use case will be setfiles(8) setting SELinux file contexts
> ("security.selinux") without race conditions and without a file
> descriptor opened with read access requiring SELinux read permission.
>
> Use the do_{name}at() pattern from fs/open.c.
>
> Pass the value of the extended attribute, its length, and for
> setxattrat(2) the command (XATTR_CREATE or XATTR_REPLACE) via an added
> struct xattr_args to not exceed six syscall arguments and not
> merging the AT_* and XATTR_* flags.
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> CC: x86@kernel.org
> CC: linux-alpha@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-ia64@vger.kernel.org
> CC: linux-m68k@lists.linux-m68k.org
> CC: linux-mips@vger.kernel.org
> CC: linux-parisc@vger.kernel.org
> CC: linuxppc-dev@lists.ozlabs.org
> CC: linux-s390@vger.kernel.org
> CC: linux-sh@vger.kernel.org
> CC: sparclinux@vger.kernel.org
> CC: linux-fsdevel@vger.kernel.org
> CC: audit@vger.kernel.org
> CC: linux-arch@vger.kernel.org
> CC: linux-api@vger.kernel.org
> CC: linux-security-module@vger.kernel.org
> CC: selinux@vger.kernel.org

I checked that the syscalls are all well-formed regarding
argument types, number of arguments and (absence of)
compat handling, and that they are wired up correctly
across architectures

I did not look at the actual implementation in detail.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
